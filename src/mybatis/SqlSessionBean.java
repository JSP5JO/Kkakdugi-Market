package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionBean {
	/*
	 * Mybatis 라이브러리의 SqlSession 클래스가 SQL 실행 메소드 제공
	 * SqlSessionFactoryBuilder --> SqlSessionFactory 객체 생성--> SqlSession 객체 생성 : 클래스 의존 관계
	 * */
	
	public static SqlSessionFactory sqlSessionFactory;
	   
	   static { // 변수들을 static 영역에 저장
	      String resource = "mybatis/mybatis-config.xml";
	      InputStream inputStream=null;
	   
	      try {
	         inputStream = Resources.getResourceAsStream(resource);   //파일 읽어오기
	      }catch(IOException e) {
	      
	      }
	      sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);   //읽어온 파일로 factory 생성
	   }
	   
	   public static SqlSessionFactory getSessionFactory() { // 생성된 SqlSessionFactory 리턴  메소드
	      return sqlSessionFactory;
	   }
}