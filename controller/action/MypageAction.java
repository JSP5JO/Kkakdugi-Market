package controller.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.WritingDao;
import dto.Writing;
import dto.Comment;
import dto.PageDto;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		WritingDao wdao = WritingDao.getInstance();
		List<Writing> wlist = wdao.selectById(userId);//질문
		request.setAttribute("wlist", wlist);
		
		CommentDao cdao = CommentDao.getInstance();
		List<Comment> clist = cdao.selectById(userId);//질문
		request.setAttribute("clist", clist);
		
		/*WritingDAO wdao = WritingDAO.getInstance();
		List<Writing> wlist = wdao.selectById(userId);//질문
		request.setAttribute("wlist", wlist);*/
		
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="/view/mypage.jsp?userId="+userId;
		return forward;
	}

}