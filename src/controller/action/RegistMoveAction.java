package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.KakaoUser;

public class RegistMoveAction implements Action { 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { //regist.jsp로 리다이렉트하기 위한 action
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward(); 
		Object kakaoUser = session.getAttribute("kakaoUser");
		KakaoUser kakaoUserDto = (KakaoUser)kakaoUser;
		//System.out.println("레지스트 세션" + session);
		if(kakaoUserDto != null) {//카카오로 회원가입할때
			request.setAttribute("kakaoId", kakaoUserDto.getId());
			request.setAttribute("kakaoName", kakaoUserDto.getNickname());
			request.setAttribute("kakaoEmail",kakaoUserDto.getEmail());
		}
		forward.setRedirect(false);;
		forward.setUrl("/view/regist.jsp");   
		return forward;
	}
}