package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward foward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		// 입력을 안해거나 초기 상태
		if(id == null) {
			request.setAttribute("result", null);
		} else {
			UsersDao dao = UsersDao.getInstance();
			if(dao.idCheck(id) == 0) {//중복 아이디 없음
				request.setAttribute("id", id);
				request.setAttribute("result", 0);
			}else { //중복아이디 있음
				request.setAttribute("result", 1);
			}
		}
		
		foward.setRedirect(false);
		foward.setUrl("/view/idCheck.jsp");
		return foward;
	}

}