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

public class SignInAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		UsersDao dao = UsersDao.getInstance();

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		SessionDto userSession = dao.login(map);

		if (userSession != null) {// 로그인 성공
			session.setAttribute("user", userSession); // 로그인 유저 세션
			forward.setUrl("index.do");
		} else {// 로그인 실패
			request.setAttribute("message", "아이디나 비밀번호가 올바르지 않습니다.");
			request.setAttribute("url", "login.do");
			forward.setUrl("error/alert.jsp");
		}
		return forward;
	}

}