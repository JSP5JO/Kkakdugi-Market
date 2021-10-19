package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFieldAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		
		// 비 로그인 시 경고 후 돌아가기
		if(user == null) {
			request.setAttribute("message", "로그인 후 이용해주세요");
			request.setAttribute("url", "index.do");
			return new ActionForward(false, "/error/alert.jsp");
		} else { // 로그인 되어있다면 정상 요청 전달
			return new ActionForward(false, "/view/myField.jsp");
		}
		
	}

}
