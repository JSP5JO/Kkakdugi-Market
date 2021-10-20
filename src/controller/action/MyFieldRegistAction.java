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

public class MyFieldRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		String field = request.getParameter("field");
		
		// 전문가 번호가 "기타"로 들어올 경우, 기타입력 input의 value 받기
		if(field.equals("기타")) {
			field = request.getParameter("etc");
		}

		// DB update
		HttpSession session = request.getSession();
		SessionDto dto = (SessionDto) session.getAttribute("user");
		dto.setProIdx(field);
		
		UsersDao dao = UsersDao.getInstance();
		int result = dao.registMyField(dto);
		
		// update 실패 시, 경고
		if(result == 0) {
			request.setAttribute("message", "잘못된 입력 입니다.");
			request.setAttribute("url", "myField.do");
			forward.setRedirect(false);
			forward.setUrl("/error/alert.jsp");   
			return forward;
		} 
		
		// update 성공 시, index로 이동
		forward.setRedirect(false);
		forward.setUrl("/index.do");
		return forward;
	}

}
