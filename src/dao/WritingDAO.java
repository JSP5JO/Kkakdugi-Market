package dao;

import dto.Writing;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class WritingDao {

	private WritingDao() {
	}

	public static WritingDao getInstance() {
		return dao;
	}

	private static WritingDao dao = new WritingDao();

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();

	// 글 저장
	public void insert(Writing dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("writing.insert", dto);
		mapper.commit();
		mapper.close();
	}

	// 모든 글 리스트 가져오기
	public List<Writing> selectAll(Map<String, Object> map) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.selectAll", map);
		mapper.close();
		return list;
	}
	
	// user id를 인자로 user가 쓴 글 목록을 가져오는 메소드
	public List<Writing> selectById(String userId) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.selectById", userId);
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
	public List<Writing> selectByCategoryIdx(Map<String, Object> map) {
		SqlSession mapper = factory.openSession();
		List<Writing> list = mapper.selectList("writing.selectByCategoryIdx", map);
		mapper.close();
		return list;
	}

	// 글 제목을 인자로 글 목록 리턴
	public List<Writing> searchBySubject(String subject) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.searchBySubject", subject);
		mapper.close();
		return list;
	}

	// 글쓴이를 인자로 글 목록 리턴
	public List<Writing> searchById(String userId) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.searchById", userId);
		mapper.close();
		return list;
	}

	// 글 내용을 인자로 글 목록 리턴
	public List<Writing> searchByContent(String content) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.searchByContent", content);
		mapper.close();
		return list;
	}

	// 글 전체 개수 리턴
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int result = mapper.selectOne("writing.getCount");
		mapper.close();
		return result;
	}
	
	// 카테고리별 글 전체 개수 리턴
	public int getCountByCategory(String idx) {
		SqlSession mapper = factory.openSession();
		int result = mapper.selectOne("writing.getCountByCategory", idx);
		mapper.close();
		return result;
	}

	// 1:1문의 - 아이디를 인자로 글 목록 리턴
	public List<Writing> selectHelpById(String userId) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.selectHelpById", userId);
		mapper.close();
		return list;
	}

	public List<Writing> selectJjimById(String userId) {
		SqlSession mapper = factory.openSession();
		List<Writing> jjimList = mapper.selectList("writing.selectJjimById", userId);
		mapper.close();
		return jjimList;
	}

	// 조회수 증가
	public void readCount(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("writing.readCount", idx);
		mapper.commit();
		mapper.close();
	}

	// 글 리스트
	public List<Writing> getList(Map<String, Integer> map) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList", map);
		mapper.close();
		return list;
	}
	// 인기 글 리스트
	public List<Writing> getHotList(int count) {
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("writing.getHotList", count);
		mapper.close();
		return list;
	}
	
	// 1개 행 조회
	public Writing getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Writing dto = mapper.selectOne("writing.selectByIdx", idx);
		mapper.close();
		return dto;
	}

	// 글 삭제
	public int delete(int idx) {
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("writing.delete", idx);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	// 카테고리 이름 가져오기
	public String getCategoryName(String idx) {
		SqlSession mapper = factory.openSession();
		String name = mapper.selectOne("writing.getCategoryName", idx);
		mapper.close();
		return name;
	}
}