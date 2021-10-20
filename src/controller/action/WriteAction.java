package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WritingDao;
import dto.Writing;

public class WriteAction implements Action  {
	public WriteAction() {}
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Writing dto = new Writing();
		dto.setCategoryIdx(request.getParameter("categoryIdx"));
		dto.setUserId(request.getParameter("userId"));
		dto.setSubject( request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		WritingDao dao = WritingDao.getInstance();
		dao.insert(dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setUrl("list.do");;
		return forward;
	}
		
}