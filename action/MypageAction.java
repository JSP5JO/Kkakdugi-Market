package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { //login.jsp�� �����̷�Ʈ���ִ� �׼�
		ActionForward foward = new ActionForward(); //��Ʈ�ѷ����� �̵��ʿ���
		foward.isRedirect = true;
		foward.url="mypage.jsp";   
		return foward;
	}
}
