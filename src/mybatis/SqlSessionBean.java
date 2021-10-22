package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionBean {

	
	public static SqlSessionFactory sqlSessionFactory;
	   static { 
	      String resource = "mybatis/mybatis-config.xml"; //경로 확인
	      InputStream inputStream=null;	
	   
	   
	      try {
	         inputStream = Resources.getResourceAsStream(resource); 
	      }catch(IOException e) {
	      
	      }
	      sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream); 
	   }
	   
	   public static SqlSessionFactory getSessionFactory() {
	      return sqlSessionFactory;
	   }
}

