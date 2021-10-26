package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JjimDao;
import dto.Jjim;
import dto.SessionDto;

public class JjimAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		SessionDto user = (SessionDto) session.getAttribute("user");
		int writingIdx = Integer.parseInt(request.getParameter("idx"));

		// user session이 없을 때,(로그인 되어있지 않을 때,) 경고 리턴
		if (user == null) {
			request.setAttribute("message", "로그인 후 이용 가능 합니다.");
			request.setAttribute("url", "detail.do?idx=" + writingIdx);
			return new ActionForward(false, "error/alert.jsp");
		} else {
			// 로그인이 되어있는 경우,
			String userId = user.getId();
			String categoryIdx = request.getParameter("categoryIdx");
			String jjim = request.getParameter("jjim");

			Jjim dto = new Jjim(userId, writingIdx, categoryIdx);
			JjimDao dao = JjimDao.getInstance();
			
			// 여부부에 따른 찜 변경
			if (jjim.equals("false")) {
				dao.insert(dto);
				request.setAttribute("jjim", true);
			} else {
				dao.delete(dto);
				request.setAttribute("jjim", false);
			}

			forward.setRedirect(true);
			forward.setUrl("detail.do?idx=" + writingIdx);

			return forward;
		}

	}

}