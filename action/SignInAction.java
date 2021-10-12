package action;

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
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");  
		
		//�ε����� �ٸ������� �Ѿ�� ������ request �����ڸ� 
		
		Map<String,String> map = new HashMap<>();
		map.put("id",id);
		map.put("pw",pw);

		UsersDAO dao = UsersDAO.getInstance();
		SessionDto user = dao.login(map);
		
		if(user !=null) {//�α��� ����
			session.setAttribute("user", user);
			request.setAttribute("message", "�α��� �Ǿ����ϴ�.");
			request.setAttribute("url", "index.html"); // index(����) �������� ��μ��� 
		}else {//�α��� ����
			request.setAttribute("message", "���̵� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
			request.setAttribute("url", "login.do");
		}
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="error/alert.jsp";   
		return foward;
	}

}
