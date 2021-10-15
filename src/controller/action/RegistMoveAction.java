package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistMoveAction implements Action { 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { //regist.jsp로 리다이렉트하기 위한 action
		ActionForward foward = new ActionForward(); 
		foward.isRedirect = false;
		foward.url="/view/regist.jsp";   
		return foward;
	}
}