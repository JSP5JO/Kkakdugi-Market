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
		mapper.close();
		return dto;
	}
	
	public void regist(Users dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("users.regist", dto);
		mapper.commit();
		mapper.close();
	}
	
	// 회원가입 시 id 중복 검사
	public int idCheck(String id) { 
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.selectOne("users.idCheck", id);
		mapper.close();
		return result;
	}
	
	public Users userInfo(String id) { //로그인한 유저정보 받기
		SqlSession mapper = sqlFactory.openSession();
		Users dto = mapper.selectOne("users.loginUserInfo", id);
		mapper.commit();
		mapper.close();
		return dto;
	}
	
	// 전문가번호 등록
	public int registMyField(SessionDto dto) {
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.update("users.registMyField", dto);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	// 유저 전문가 번호 가져오기
	public Users proIdxInfo(String userId) {
		Users dto = new Users();
		SqlSession mapper = sqlFactory.openSession();
		dto = mapper.selectOne("users.proIdxInfo", userId);
		mapper.close();
		return dto;
	}
	
	// 아이디 찾기
	public String findId(Map<String, String> map) { 
		SqlSession mapper = sqlFactory.openSession();
		String id = mapper.selectOne("users.findId", map);
		mapper.commit();
		mapper.close();
		return id;
	}
	
	// 비밀번호 찾기
	public String findPw(Map<String, String> map) { 
		SqlSession mapper = sqlFactory.openSession();
		String pw = mapper.selectOne("users.findPw", map);
		mapper.commit();
		mapper.close();
		return pw;
	}
}