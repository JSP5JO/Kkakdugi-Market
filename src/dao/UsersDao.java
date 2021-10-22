package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.SessionDto;
import dto.Users;
import mybatis.SqlSessionBean;

public class UsersDao {
	private static UsersDao dao = new UsersDao();
	private UsersDao() {}
	public static UsersDao getInstance() {
		return dao;
	}
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public SessionDto login(Map<String, String> map) {
		SessionDto dto = null;
		SqlSession mapper = sqlFactory.openSession();
		dto = mapper.selectOne("users.loginCheck", map);
		mapper.commit();
		mapper.close();
		return dto;
	}
	
	public void regist(Users dto) { //회원 등록
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("users.regist", dto);
		mapper.commit();
		mapper.close();
	}
	
	public Users userInfo(String id) { //로그인한 유저정보 받기
		SqlSession mapper = sqlFactory.openSession();
		Users dto = mapper.selectOne("users.loginUserInfo", id);
		mapper.commit();
		mapper.close();
		return dto;
	}
	
	public int idCheck(String id) { //회원가입 아이디 중복체크
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.selectOne("users.idCheck", id);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public String findId(Map<String, String> map) { //회원가입 아이디 중복체크
		SqlSession mapper = sqlFactory.openSession();
		String id = mapper.selectOne("users.findId", map);
		mapper.commit();
		mapper.close();
		return id;
	}
	
	public String findPw(Map<String, String> map) { //회원가입 아이디 중복체크
		SqlSession mapper = sqlFactory.openSession();
		String pw = mapper.selectOne("users.findPw", map);
		mapper.commit();
		mapper.close();
		return pw;
	}
	// 전문가번호 등록
	public int registMyField(SessionDto dto) {
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.update("users.registMyField", dto);
		mapper.commit();
		mapper.close();
		return result;
	}
}