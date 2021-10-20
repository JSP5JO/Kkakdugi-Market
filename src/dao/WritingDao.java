package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import dto.Writing;
import mybatis.SqlSessionBean;

public class WritingDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static WritingDao dao = new WritingDao();
	
	private WritingDao() {}
		public static WritingDao getInstance() {
			return dao;
		}
		
	//테이블 데이터 행의 개수 조회
		public int getCount() {
			SqlSession mapper = factory.openSession();
			int cnt = mapper.selectOne("getCount");  
			mapper.close();     
			return cnt;
		}
	//getList
	public List<Writing> getList(Map<String, Integer>map){
		List<Writing> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList",map);
		mapper.close();
		return list;
	}
	//1개 행 조회
		public Writing getOne(int idx) {
			SqlSession mapper = factory.openSession();
			Writing dto = mapper.selectOne("selectByIdx", idx);
			mapper.close();
			return dto;
		}
	//insert문 추가
	public void insert(Writing dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("comment.insert",dto);
		mapper.commit();
		mapper.close();
	}
	//조회수
		public void readCount(int idx) {
			SqlSession mapper = factory.openSession();
			mapper.update("readCount",idx);
			mapper.commit();
			mapper.close();
		}
		
}
