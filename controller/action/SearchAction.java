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

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchOption = request.getParameter("searchOption");
		String subject = request.getParameter("subject");
		String userId = request.getParameter("userId");
		String content = request.getParameter("content");
		
		if(searchOption.equals("subject")) {
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> slist = wdao.searchBySubject(subject);
			request.setAttribute("slist", slist);
		}else if(searchOption.equals("userId")) {
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> dlist = wdao.searchById(userId);
			request.setAttribute("dlist", dlist);
		}else if(searchOption.equals("content")) {
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> clist = wdao.searchByContent(content);
			request.setAttribute("clist", clist);
		}
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="/view/search.jsp?searchOption"+searchOption+"&subject="+subject+"&userId="+userId+"&content="+content;
		return forward;
	}

}