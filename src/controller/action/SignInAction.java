package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;
import dto.SessionDto;
import dto.Users;

public class SignInAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");  
		
		//request 받을거 있으면 놓는자리
		Map<String,String> map = new HashMap<>();
		map.put("id",id);
		map.put("pw",pw);

		UsersDao dao = UsersDao.getInstance();
		Users userDto = dao.userInfo(id); 
		SessionDto userSession = dao.login(map);
		
		if(userSession !=null) {//로그인 성공
			session.setAttribute("user", userSession); //로그인 유저 세션
			request.setAttribute("userDto",userDto); //로그인한 유저 정보
			request.setAttribute("message", "로그인 되었습니다.");
			request.setAttribute("url", "index.do");  
		}else {//로그인 실패
			request.setAttribute("message", "아이디나 비밀번호가 올바르지 않습니다..");
			request.setAttribute("url", "login.do");
		}
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="/error/alert.jsp";   
		return foward;
	}

}