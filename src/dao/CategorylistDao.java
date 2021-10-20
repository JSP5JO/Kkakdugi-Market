 package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Categorylist;
import mybatis.SqlSessionBean;

public class CategorylistDao {
	
	private CategorylistDao() { }
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CategorylistDao dao = new CategorylistDao();
	
	public static CategorylistDao getInstance() {
		return dao;
	}
	
	//getList
	public List<Categorylist> getList(Map<String, Integer> map){   
		List<Categorylist> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("categorylist.getList",map);
		mapper.close();
		return list;
	}
	//getListAll
	public List<Categorylist> getListAll(){   
		SqlSession mapper = factory.openSession();
		List<Categorylist> list = mapper.selectList("categorylist.getListAll");
		mapper.close();
		return list;
	}
	
	
	public Categorylist getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Categorylist dto = mapper.selectOne("selectByIdx", idx);  
		mapper.close();
		return dto;
	}
	

	public int getCount() {
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("getCount");  
		mapper.close();     
		return cnt;
	}
	
	public void insert(Categorylist dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("categorylist.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Categorylist dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("update",dto);
		mapper.commit();
		mapper.close();
	}
	
	public int delete(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("categorylist.delete",map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public Categorylist passwordCheck(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		Categorylist dto = mapper.selectOne("passwordCheck", map);
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