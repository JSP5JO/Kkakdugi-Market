package dao;

import dto.Comment;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class CommentDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CommentDao dao = new CommentDao();

	private CommentDao() {
	}

	public static CommentDao getInstance() {
		return dao;
	}

	// getList
	public List<Comment> getList(Map<String, Integer> map) {
		// key(변수명처럼 이해) String, value 는 int
		List<Comment> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList", map);
		mapper.close();
		return list;
	}

	public List<Comment> selectById(String userId) {
		List<Comment> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("comment.selectById", userId);
		mapper.close();
		return list;
	}

	// idx로 한개 행 조회
	public Comment getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Comment dto = mapper.selectOne("comment.selectByIdx", idx);
		mapper.close();
		return dto;
	}

	// 테이블 데이터 행의 개수 조회
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("comment.getCount");
		mapper.close();
		return cnt;
	}

	public void insert(Comment dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("comment.insert", dto);
		mapper.commit();
		mapper.close();
	}

	public void update(Comment dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("update", dto);
		mapper.commit();
		mapper.close();
	}

	public void delete(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.delete("comment.delete", idx);
		mapper.commit();
		mapper.close();
	}

	public void updateCountAll(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("comment.updateCountAll", idx);
		mapper.commit();
		mapper.close();
	}

	public List<Comment> getList(int idx) {
		// key(변수명처럼 이해) String, value 는 int
		List<Comment> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("comment.getList", idx);
		mapper.close();
		return list;
	}

}