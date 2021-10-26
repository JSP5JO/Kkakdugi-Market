package dao;

import dto.Jjim;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class JjimDao {

	private JjimDao() {}


	private static JjimDao dao = new JjimDao();

	public static JjimDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();

	public List<Jjim> selectById(String userId) {
		SqlSession mapper = factory.openSession();
		List<Jjim> jjimList = mapper.selectList("jjim.selectById", userId);
		mapper.close();
		return jjimList;
	}
	public Jjim selectByIdAndIdx(Map<String, Object> map) {
		SqlSession mapper = factory.openSession();
		Jjim dto = mapper.selectOne("jjim.selectByIdAndIdx", map);
		mapper.close();
		return dto;
	}
	
	public void insert(Jjim dto){ //유저가 찜버튼 누른 것 테이블 삽입
		SqlSession mapper = factory.openSession();
		mapper.insert("jjim.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void delete(Jjim dto){ //유저가 찜버튼 누른 것 테이블 삽입
		SqlSession mapper = factory.openSession();
		mapper.insert("jjim.delete",dto);
		mapper.commit();
		mapper.close();
	}
	
	

}