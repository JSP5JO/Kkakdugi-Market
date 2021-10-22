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
		
		String userId = user.getId();
		int writingIdx = Integer.parseInt(request.getParameter("writingIdx"));
		String categoryIdx = request.getParameter("categoryIdx");
		Jjim dto = new Jjim(userId,writingIdx,categoryIdx);
		JjimDao dao = JjimDao.getInstance();
		dao.userJjimInsert(dto);
		forward.setRedirect(false);
		forward.setUrl("view/detail.jsp");
		
		return forward;
	}

}
