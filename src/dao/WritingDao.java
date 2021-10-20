package dao;
import dto.Writing;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class WritingDao {
	
	private WritingDao() {}
	public static WritingDao getInstance() {
		return dao;
	}
	private static WritingDao dao = new WritingDao();
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	//글 저장
	public void insert(Writing dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("writing.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	
	// user id를 인자로 user가 쓴 글 목록을 가져오는 메소드
	public List<Writing> selectById(String userId) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.selectById",userId);
		mapper.close();
		return list;
	}
	
	// 글 번호를 이용해서 글 하나를 가져오는 메소드 => 유저가 찜한 글을 가져올 때 사용
	public Writing selectByIdx(int idx) {
		Writing dto = null;
		SqlSession mapper = factory.openSession();
		dto = mapper.selectOne("writing.selectByIdx", idx);
		mapper.close();
		return dto;
	}
	
	// 카테고리 번호인자로 해당 카테고리의 글의 리스트를 가져오는 메소드 => 내 전문분야의 글을 가져올 때 사용
	public List<Writing> selectByCategoryIdx(String idx) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.selectByCategoryIdx", idx);
		mapper.close();
		return list;
	}
	
	// 글 제목을 인자로 글 목록 리턴
	public List<Writing> searchBySubject(String subject) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.searchBySubject",subject);
		mapper.close();
		return list;
	}

	// 글쓴이를 인자로 글 목록 리턴
	public List<Writing> searchById(String userId) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.searchById",userId);
		mapper.close();
		return list;
	}
	
	// 글 내용을 인자로 글 목록 리턴
	public List<Writing> searchByContent(String content) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.searchByContent",content);
		mapper.close();
		return list;
	}
	
	
}