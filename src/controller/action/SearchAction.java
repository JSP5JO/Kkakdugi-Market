package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WritingDao;
import dto.Writing;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		String searchOption = "subject";
		String searchOption = request.getParameter("searchOption");
//		String subject = "subject";
		String subject = request.getParameter("subject");
//		String userId = "user1";
		String userId = request.getParameter("userId");
//		String content = "content";
		String content = request.getParameter("content");

		if (searchOption.equals("subject")) {
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> slist = wdao.searchBySubject(subject);
			request.setAttribute("slist", slist);
		} else if (searchOption.equals("userId")) {
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> dlist = wdao.searchById(userId);
			request.setAttribute("dlist", dlist);
		} else if (searchOption.equals("content")) {
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> clist = wdao.searchByContent(content);
			request.setAttribute("clist", clist);
		}

		ActionForward forward = new ActionForward();

		forward.isRedirect = false;
		forward.setUrl("view/search.jsp?searchOption"+searchOption+"&userId="+userId+"&subject="+subject+"&content="+content);

		return forward;
	}

}
