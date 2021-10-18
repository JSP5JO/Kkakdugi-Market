package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import dto.KkakdugiMarket;
import mybatis.SqlSessionBean;

public class KkakdugiMarketDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static KkakdugiMarketDao dao = new KkakdugiMarketDao();
	
	private KkakdugiMarketDao() {}
		public static KkakdugiMarketDao getInstance() {
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
	public List<KkakdugiMarket> getList(Map<String, Integer>map){
		List<KkakdugiMarket> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList",map);
		mapper.close();
		return list;
	}
	//1개 행 조회
		public KkakdugiMarket getOne(int idx) {
			SqlSession mapper = factory.openSession();
			KkakdugiMarket dto = mapper.selectOne("selectByIdx", idx);
			mapper.close();
			return dto;
		}
	//insert문 추가
	public void insert(KkakdugiMarket dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("writing.insert",dto);
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
