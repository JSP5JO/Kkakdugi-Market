package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;

public class FindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward foward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		UsersDao dao = UsersDao.getInstance();
		
		Map<String,String> map = new HashMap<>();
		map.put("name",name);
		map.put("email",email);
		String id = dao.findId(map);
		
		if(id != null) {//아이디 찾기 성공
			request.setAttribute("id", id);
			request.setAttribute("result", 0);
		}else {//아이디 찾기 실패
			request.setAttribute("result", 1);
		}
		foward.setRedirect(false);
		foward.setUrl("/view/findId.jsp");
		return foward;
	}

}