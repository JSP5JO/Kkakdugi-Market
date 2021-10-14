package dao;
import dto.Comment;
import dto.Writing;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class CommentDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CommentDao dao = new CommentDao();
	
	private CommentDao() { }
	public static CommentDao getInstance() {
		return dao;
	}
	//getList
	public List<Comment> getList(Map<String, Integer> map){   
							//key(변수명처럼 이해) String, value  는 int
		List<Comment> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList",map);
		return list;
	}
	
	public List<Comment> selectById(String userId) {
		List<Comment> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("comment.selectById",userId);
		mapper.close();
		return list;
	}
	
	//idx로 한개 행 조회
	public Comment getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Comment dto = mapper.selectOne("selectByIdx", idx);  
		mapper.close();
		return dto;
	}
	
	//테이블 데이터 행의 개수 조회
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("getCount");  
		mapper.close();     
		return cnt;
	}
	
	public void insert(Comment dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("freeboard.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Comment dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("update",dto);
		mapper.commit();
		mapper.close();
	}
	
	public int delete(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("freeboard.delete",map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public Comment passwordCheck(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		Comment dto = mapper.selectOne("passwordCheck", map);
		mapper.close();
		return dto;
	}
	
	public void readCount(int idx) {
		SqlSession mapper =factory.openSession();
		mapper.update("readCount", idx);
		mapper.commit();
		mapper.close();
	}
	
}