package dao;
import dto.Writing;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class WritingDAO {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static WritingDAO dao = new WritingDAO();
	
	private WritingDAO() { }
	public static WritingDAO getInstance() {
		return dao;
	}
	//getList
	public List<Writing> getList(Map<String, Integer> map){   
							//key(변수명처럼 이해) String, value  는 int
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList",map);
		return list;
	}
	
	public List<Writing> getListById(Map<String, Integer> map){   
		//key(변수명처럼 이해) String, value  는 int
	List<Writing> list = null;
	SqlSession mapper = factory.openSession();
	list = mapper.selectList("getList",map);
	return list;
	}
	
	//idx로 한개 행 조회
	public Writing getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Writing dto = mapper.selectOne("selectByIdx", idx);  
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
	
	public void insert(Writing dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("freeboard.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Writing dto) {
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
	
	public Writing passwordCheck(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		Writing dto = mapper.selectOne("passwordCheck", map);
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
