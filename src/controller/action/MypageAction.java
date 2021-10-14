package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import dao.WritingDAO;
import dto.Writing;
import dto.Comment;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
//		String userId = request.getParameter("userId");
		String userId = "user1";
		WritingDAO wdao = WritingDAO.getInstance();
		List<Writing> wlist = wdao.selectById(userId);//질문
		request.setAttribute("wlist", wlist);
		
		CommentDAO cdao = CommentDAO.getInstance();
		List<Comment> clist = cdao.selectById(userId);//질문
		request.setAttribute("clist", clist);
		
		/*WritingDAO wdao = WritingDAO.getInstance();
		List<Writing> wlist = wdao.selectById(userId);//질문
		request.setAttribute("wlist", wlist);*/
		
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/mypage.jsp?userId="+userId;
		return forward;
	}

}