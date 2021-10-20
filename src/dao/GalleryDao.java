package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Gallery;
import mybatis.SqlSessionBean;


public class GalleryDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static GalleryDao dao = new GalleryDao();
		
	private GalleryDao() {  }
		public static GalleryDao getInstance() {
				return dao;
		}
		public List<Gallery> getList(){
			List<Gallery> list=null;
			SqlSession mapper = factory.openSession();
			list = mapper.selectList("gallery.getAll");
			mapper.close();
			return list;
		}
			
		public void insert(Gallery g) {
			SqlSession mapper = factory.openSession();
			mapper.insert("comment.gallery",g);
			mapper.commit();
			mapper.close();
		}
			
	}

	

