package dao;

import dto.Jjim;
import dto.Writing;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class JjimDAO {

	private JjimDAO() {}

	public static JjimDAO getInstance() {
		return dao;
	}

	private static JjimDAO dao = new JjimDAO();

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();

	public List<Jjim> selectById(String userId) {
		SqlSession mapper = factory.openSession();
		List<Jjim> jjimList = mapper.selectList("Jjim.selectById", userId);
		mapper.close();
		return jjimList;
	}

}