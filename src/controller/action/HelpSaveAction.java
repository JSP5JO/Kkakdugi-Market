package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WritingDao;
import dto.Writing;

public class HelpSaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		WritingDao dao = WritingDao.getInstance();
		Writing dto = new Writing();
		
		dto.setUserId(request.getParameter("userId"));
		dto.setCategoryIdx(request.getParameter("categoryIdx"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));

		dao.insert(dto);
		
		return new ActionForward(true, "mypage.do");
	}

}
