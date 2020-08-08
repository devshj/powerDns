package com.dns.security.db.mapper2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface FilechkMysqlMapper {
	
	public void insertMysql(HashMap<String,String> map) throws Exception;
	public ArrayList<Map<String,String>> selectNonsiteExcept() throws Exception;
}
