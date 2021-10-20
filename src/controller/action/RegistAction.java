package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import dto.Users;

public class RegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String email = request.getParameter("email");
			
			Users dto = new Users(name,id,pw,email);
			UsersDao dao = UsersDao.getInstance();
			dao.regist(dto);
			
			request.setAttribute("message", name+"님 회원가입을 축하드립니다!");
			request.setAttribute("url", "login.do"); //alert띄우고 login페이지로 다시 이동  
			
			ActionForward foward = new ActionForward();
			foward.isRedirect = false;
			foward.url="/error/alert.jsp";
			return foward;
			
	}

}