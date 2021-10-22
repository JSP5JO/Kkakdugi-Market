package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setAttribute("message", "로그아웃 되었습니다.");
		request.setAttribute("url", "login.do");
		session.invalidate();	
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="/util/alert.jsp";
		return foward;
	}
}
