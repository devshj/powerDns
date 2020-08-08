package com.dns.security.db.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dns.security.db.service.FilecheckService;

/**
 * @author hj
 * @desc Dns Insert Process 
 * 2020. 6. 15.
 */
@RestController
@ControllerAdvice
public class FilecheckController {

	@Autowired
	FilecheckService filecheckService; 
			
	/**
	 * @param request
	 * @throws Exception
	 * @desc : powerdns 서버에서 만든 유저의 접속 로그를 분석 접속 정보를 발췌 비인가 사인트인경우 nonsite에 로그 저장 한다  (curl을 이용해 1분마다 한번씩 호출)
	 */
	@ResponseBody
    @GetMapping("/filechecker.do")
    public Map<String,String> file_chk(HttpServletRequest request) throws Exception{
    
		Map<String,String> map = new HashMap<String,String>();
    	request.setCharacterEncoding("utf-8");    	
		map = filecheckService.file_chk_service(request);
		
		return map;
    }

}
