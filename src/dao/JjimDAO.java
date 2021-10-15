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
		SqlSession mapper = factory.openSession();
		List<Jjim> jjimList = mapper.selectList("Jjim.selectById", userId);
		mapper.close();
		return jjimList;
	}

}