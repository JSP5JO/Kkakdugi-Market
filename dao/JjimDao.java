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

	public void userJjim(Jjim dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("jjim.userJjim",dto);
		mapper.commit();
		mapper.close();
	}

}