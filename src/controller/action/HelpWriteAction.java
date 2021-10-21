package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelpWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		
		// user session이 없을 때,(로그인 되어있지 않을 때,) 경고 리턴
		if(user == null) {
			request.setAttribute("message", "로그인 후 이용 가능 합니다.");
			request.setAttribute("url", "index.do");
			return new ActionForward(false, "error/alert.jsp");
		}
		
		ActionForward forward = new ActionForward();
		forward.setUrl("view/helpWrite.jsp");
		return forward;
		
	}

}
