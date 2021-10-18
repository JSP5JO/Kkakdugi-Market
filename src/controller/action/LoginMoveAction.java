package controller.action;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginMoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward foward = new ActionForward(); 
		
		foward.setRedirect(false); 
		foward.setUrl("view/login.jsp");
		return foward;
		
	}

}
