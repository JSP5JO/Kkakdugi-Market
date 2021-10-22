package dao;

import dto.Jjim;
import dto.Writing;
import java.util.List;

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
		List<Jjim> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("jjim.selectById",userId);
		mapper.close();
		return list;
	}
	
	public void userJjim(Jjim dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("jjim.userJjim",dto);
		mapper.commit();
		mapper.close();
	}

}