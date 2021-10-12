package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginMoveAction implements Action { 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { //login.jsp로 리다이렉트하기 위한 action
		ActionForward foward = new ActionForward(); 
		foward.isRedirect = false; //true로 놓으면 url창에 login.jsp로 나옴
		foward.url="login.jsp";   
		return foward;
	}

}
