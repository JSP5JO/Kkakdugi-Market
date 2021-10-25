package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;

public class FindPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward foward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		UsersDao dao = UsersDao.getInstance();

		Map<String,String> map = new HashMap<>();
		map.put("id",id);
		map.put("name",name);
		map.put("email",email);
		String pw = dao.findPw(map);
		
		if(id != null) {//비밀번호 찾기 성공
			request.setAttribute("pw", pw);
			request.setAttribute("result", 0);
		}else {//비밀번호 찾기 실패
			request.setAttribute("result", 1);
		}
		foward.setRedirect(false);
		foward.setUrl("/view/findPw.jsp");
		return foward;
	}

}