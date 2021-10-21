package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.JjimDao;
import dao.UsersDao;
import dao.WritingDao;
import dto.Writing;
import dto.Comment;
import dto.Jjim;
import dto.Users;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
//		String userId = "user1";
		WritingDao wdao = WritingDao.getInstance();
		List<Writing> wlist = wdao.selectById(userId);
		request.setAttribute("wlist", wlist);
		
		CommentDao cdao = CommentDao.getInstance();
		List<Comment> clist = cdao.selectById(userId);
		request.setAttribute("clist", clist);
		
		JjimDao jdao = JjimDao.getInstance();
		List<Jjim> jlist = jdao.selectById(userId);
		request.setAttribute("jlist", jlist);
		
		UsersDao udao = UsersDao.getInstance();
		List<Users> ulist = udao.proIdxInfo(userId);
		request.setAttribute("ulist", ulist);
		
		WritingDao hdao = WritingDao.getInstance();
		List<Writing> hlist = hdao.selectHelpById(userId);
		request.setAttribute("hlist", hlist);
		
		request.setAttribute("userId", userId);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/mypage.jsp?userId="+userId;
		return forward;
	}

}