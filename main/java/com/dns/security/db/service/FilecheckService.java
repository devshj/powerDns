package com.dns.security.db.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dns.security.db.mapper2.FilechkMysqlMapper;


/**
 * @author hj
 * @desc 비허가 사이트 로그 저장 로직
 * 2020. 6. 12.
 */
@Service("filecheckService")
@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor =Exception.class)
public class FilecheckService {
	
	@Autowired
	FilechkMysqlMapper filechkMysqlMapper; 
	
	static ArrayList<String> domainFilterList = new ArrayList<>();
	static int FLAG = 999;
	
	public Map<String,String> file_chk_service(HttpServletRequest request) throws Exception{
		
		Map<String,String> rtnMap = new HashMap<String,String>();
		
		try {
			
			Calendar cld = Calendar.getInstance();
			cld.add(Calendar.MINUTE, -1);//1분 전 파일 처리
			
			String YYYY = String.valueOf(cld.get(Calendar.YEAR));
			String MON  = String.valueOf(cld.get(Calendar.MONTH)+1);
			String DAY  = String.valueOf(cld.get(Calendar.DAY_OF_MONTH));
			String hour = String.valueOf(cld.get(Calendar.HOUR_OF_DAY));
			String minute = String.valueOf(cld.get(Calendar.MINUTE));
			
			String new_mon = "";
			if(Integer.parseInt(MON) < 10) {
				new_mon = "0" + MON;
			}else{
				new_mon = MON;
			}
			
			String new_day = "";
			if(Integer.parseInt(DAY) < 10) {
				new_day = "0" + DAY;
			}else {
				new_day = DAY;
			}
			
			String new_hour = "";
			if(Integer.parseInt(hour) < 10) {
				new_hour = "0" + hour;
			}else {
				new_hour = hour;
			}
			
			String new_minute = "";
			if(Integer.parseInt(minute) < 10) {
				new_minute = "0" + minute;
			}else {
				new_minute = minute;
			}
			
			String delm = System.getProperty("file.separator");
			String new_date = YYYY+"-"+new_mon+"-"+new_day+"-"+new_hour+"-"+new_minute;
			String request_date = YYYY+"-"+new_mon+"-"+new_day+" "+new_hour+":"+new_minute+":00";			

			File f = null; 
			
			//f = new File("D:\\textTest\\pdns-"+"2020-06-12-13-48"+".log");			
			//f = new File(delm+"var"+delm+"log"+delm+"pdns"+delm+"pdns-"+"2020-06-12-13-48"+".log");
			f = new File(delm+"var"+delm+"log"+delm+"pdns"+delm+"pdns-"+new_date+".log");
			
			//파일명
			new_date = "pdns-"+ new_date+".log";
	
			FileReader fr = new FileReader(f);
			BufferedReader br = new BufferedReader(fr);
			
			//Insert용 매개 ArrayList
			ArrayList<String []> insertList = new ArrayList<String []>();
			
			//비인가 HashMap
			HashMap<String, String> Unauthorative = new HashMap<String, String>();
			
			//RemoteIp HashMap
			HashMap<String, String> Remote = new HashMap<String, String>();
						
			//비인가 필터 조회(조회 후 Static에 저장) : FLAG값이 다른 경우 data update
			if(FLAG == 999) {
				ArrayList<Map<String,String>> nonsiteExceptMap = this.selectNonsiteExcept();
								
				for(int i=0;i<nonsiteExceptMap.size();i++) {
					domainFilterList.add(nonsiteExceptMap.get(i).get("domain"));
				}
				
				FLAG = Integer.parseInt(hour);
			}else{
				if(FLAG != Integer.parseInt(hour)) {
					ArrayList<Map<String,String>> nonsiteExceptMap = this.selectNonsiteExcept();
					
					ArrayList<String> temp = new ArrayList<>();
					
					for(int i=0;i<nonsiteExceptMap.size();i++) {
						temp.add(nonsiteExceptMap.get(i).get("domain"));
					}
					
					domainFilterList = (ArrayList<String>) temp.clone();
					
					FLAG = Integer.parseInt(hour);
				}
			}
			
			/*
			 * log 파일 처리(필요한 데이터만 HashMap에 대입) 
			 */
			
			//log 파일 line 읽기
			String line = "";
			while((line = br.readLine()) != null) {
				
				String domain = "";
				String reqIp = "";
				
				//PTR, AAAA(Ipv6), HIT를 제외
				if(line.indexOf("PTR") == -1 && line.indexOf("AAAA") == -1 && line.indexOf("HIT") == -1) {
					
					//비인가 사이트 (Domain 추출)
					if(line.indexOf("Unauthorative") != -1) {
						domain = line.substring(line.indexOf("=")+1);
						domain = domain.substring(0, domain.length()-1);
						
						//도메인 필터링
						if(!domainFilterList.contains(domain)) {
							Unauthorative.put(domain, "0");
						}
					}
					
					//Remote Ip(Domain, Ip 추출)
					if(line.indexOf("Remote") !=-1) {
						//ip 정규식
						String IPADDRESS_PATTERN = "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)";
						Pattern pattern = Pattern.compile(IPADDRESS_PATTERN);
						Matcher matcher = pattern.matcher(line);
						
						if (matcher.find()) reqIp = matcher.group();
						else reqIp = "not found ip";
						
						//'naver.com| ( 'domain| )
						domain = line.substring(line.indexOf("'")+1, line.indexOf("|"));
						
						/*
						 * Remote HashMap -> naver.com : 192.168.0.12
						 * 같은 도메인에 접속한 IP가 여러개 일 경우 처리(구분자 ",") (동일한 IP일 경우 무시)
						 */
						if(Remote.containsKey(domain)) {
							String temp = "";
							
							if(!Remote.get(domain).contains(reqIp)) {
								temp = Remote.get(domain)+","+reqIp;
								Remote.put(domain, temp);
							}
							
						}else {
							Remote.put(domain, reqIp);
						}
					}
					
				}
			}//end of while
			
			br.close();
		
	        Iterator<String> mapIter = Unauthorative.keySet().iterator();
	        
	        /*
	         * INSERT 처리를 위한 ArrayList 작업
	         * 여러 아이피가 존재 하는 경우 split으로 처리 
	         */
	        while(mapIter.hasNext()){
	        	
	        	//비인가 접속 도메인
	        	String UnauthorativeDomain = mapIter.next();
	            //접속시도 IP(remoteIp)
	        	String RemoteIp = Remote.get(UnauthorativeDomain);
	            
	        	if(RemoteIp.indexOf(",") !=-1) {

	        		String[] temp = RemoteIp.split(",");
	    			
	        		for(int i=0;i<temp.length;i++) {
	        			
	        			String [] arr = new String[2];
	        			
			            arr[0] = String.valueOf(UnauthorativeDomain);
			            arr[1] = String.valueOf(temp[i]);
			            insertList.add(arr);
	    			}
	        		
	        	}else {
	        		String [] arr = new String[2];
	        		
		            arr[0] = String.valueOf(UnauthorativeDomain);
		            arr[1] = String.valueOf(RemoteIp);
		            insertList.add(arr);
	        	}	            
	        }
	        
			String rtnval = DB_ins_non_process(insertList, request_date);
			
			if(rtnval == "OK") {
				rtnMap.put("db_insert","success");
			}else {
				rtnMap.put("db_insert","fail");
			}
			
//			rtnMap.put("file_chk_service","success");
			
		} catch (Exception e) {
//			e.printStackTrace();
//			rtnMap.put(e.toString(),"fail");
			rtnMap.put("file_chk_service","fail");
		}
		
		return rtnMap;
	}
	
    /*
     * 비인가 사이트 접속정보 로그 저장
     */
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor =Exception.class)
    public String DB_ins_non_process(ArrayList<String []> firstList, String request_date) throws Exception {
    	
    	String rtnval = "";
    	
    	for(int i=0;i<firstList.size();i++) {
				
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("requrl", String.valueOf(firstList.get(i)[0]).trim());
			map.put("reqip", String.valueOf(firstList.get(i)[1]).trim());
			map.put("reqdate", request_date);
			//2020-06-15 11:31:01
			try {
				insertMysql(map);
				rtnval = "OK";
				
			}catch (Exception e) {
				rtnval = "FAIL";
				e.printStackTrace();
				throw new Exception();
			}
			
		}
    	
    	return rtnval;
    }
		
	public void insertMysql(HashMap<String,String> map) throws Exception{		
		filechkMysqlMapper.insertMysql(map);
	}
	
	public ArrayList<Map<String,String>> selectNonsiteExcept() throws Exception{		
		return filechkMysqlMapper.selectNonsiteExcept();
	}
		
}
