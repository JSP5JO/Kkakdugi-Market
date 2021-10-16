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
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		request.setAttribute("message", "로그인아웃 되었습니다.");
		request.setAttribute("url", "./");
		
	    // 세션 끊기
	    session.invalidate();
	    forward.isRedirect = false;
	    forward.url = "error/alert.jsp";
	    
		return forward;
	}

}
