package com.gaon.security.db;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@MapperScan(value="com.gaon.security.db.mapper2" , sqlSessionFactoryRef="db2SqlSessionFactory")
@EnableTransactionManagement
public class MysqlDatabaseConfig {
	    
	    
	    @Bean(name = "db2DataSource" , destroyMethod = "close")
	 	@ConfigurationProperties(prefix ="spring.db2.datasource")
	 	public DataSource db2DataSource() throws SQLException, FileNotFoundException, IOException{
	 		return DataSourceBuilder.create().build();
	 	}
	 	
	 	@Bean(name ="db2SqlSessionFactory")
	 	 public SqlSessionFactory db2SqlSessionFactory(@Qualifier("db2DataSource") DataSource db2DataSource, ApplicationContext applicationContext)throws Exception {
	        SqlSessionFactoryBean sqlSessionFactoryBean =new SqlSessionFactoryBean();
	        sqlSessionFactoryBean.setDataSource(db2DataSource);
	        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/mysql/*.xml"));
	        return sqlSessionFactoryBean.getObject();
	    }
	 
	    @Bean(name ="db2SqlSession")
	    public SqlSessionTemplate db2SqlSessionTemplate(SqlSessionFactory db2SqlSessionFactory)throws Exception {
	 
	        return new SqlSessionTemplate(db2SqlSessionFactory);
	    }
	    
	    @Bean(name="transactionManager2")
	    public DataSourceTransactionManager transactionManager2(@Autowired @Qualifier("db2DataSource") DataSource db2DataSource) {
	        return new DataSourceTransactionManager(db2DataSource);
	    }
	
}
