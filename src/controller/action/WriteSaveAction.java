package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WritingDao;

public class WriteSaveAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		
		WritingDao dao = WritingDao.getInstance();
		
		if(session.getAttribute("userId") != null) {
			userId=session.getAttribute("userId").toString();
		}else {
			request.setAttribute("message", "로그인 후 이용해주세요");
			request.setAttribute("url", "login.do");
		}
		
		return null;
	}
	
}
