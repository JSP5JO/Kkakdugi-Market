package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action { 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { //login.jsp로 리다이렉트해주는 액션
		ActionForward foward = new ActionForward(); //컨트롤러에서 이동필요함
		foward.isRedirect = true;
		foward.url="login.jsp";   
		return foward;
	}

}
