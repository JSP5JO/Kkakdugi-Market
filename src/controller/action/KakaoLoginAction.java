package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KakaoDao;
import dao.UsersDao;
import dto.KakaoDto;
import dto.KakaoUser;
import dto.SessionDto;
import dto.Users;

public class KakaoLoginAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		KakaoDao kDao = KakaoDao.getInstance();
		KakaoDto kakaoDto = kDao.getDto(request.getParameter("code"), request, response);//토큰값 받아오는 dto
		KakaoUser kakaoUser = kDao.getUserInfo(kakaoDto.getAccess_token());//카카오 유저정보 받아오기
		//session.setAttribute("kakao_token", kakaoDto.getAccess_token());//받아온 토큰값 세션에 저장
		
		long kakaoId = kakaoUser.getId();//카카오 유저 id(고유번호)
		System.out.println(kakaoId);
		Users userDto = kDao.findKakaoId(kakaoId); //카카오 유저 id(고유번호)로 유저 정보 가져오기
		System.out.println("유저정보 : "+userDto);
		if (userDto == null) {//카카오톡 로그인 후 가입된 아이디가 없는경우 (카카오 id(고유번호) 가지고 회원가입)
			session.setAttribute("kakaoUser", kakaoUser);//받아온 토큰값 세션에 저장
			request.setAttribute("message", "회원정보가 없으므로 회원가입 페이지로 이동합니다.");
			request.setAttribute("url", "regist.do");//테스트 후 index.do로 수정  
			forward.setRedirect(false);
			forward.setUrl("/util/alert.jsp");
		} else {// 이미 가입한 아이디가 있는경우 (바로 로그인) 세션값 추가
			UsersDao uDao = UsersDao.getInstance();
			Map<String,String> map = new HashMap<>();
			map.put("id",userDto.getId());
			map.put("pw",userDto.getPw());
			SessionDto userSession = uDao.login(map);//id pw에맞는 유저 찾아서 세션dto 객체생성 
			
			session.setAttribute("user", userSession);
			forward.setRedirect(false);
			forward.setUrl("index.do");
		}
		
		return forward;
	}
}

