package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import controller.action.ActionForward;
import controller.action.IdCheckAction;
import controller.action.IndexActioin;
import controller.action.LoginMoveAction;
import controller.action.LogoutAction;
import controller.action.MyFieldAction;
import controller.action.MyFieldRegistAction;
import controller.action.MypageAction;
import controller.action.RegistAction;
import controller.action.SearchAction;
import controller.action.SignInAction;

/**
 * Servlet implementation class controller
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String spath = request.getServletPath();

		// url Action
		if (spath.equals("/index.do")) {
			Action action = new IndexActioin();
			forward = action.execute(request, response);
		} else if (spath.equals("/myField.do")) {
			Action action = new MyFieldAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/myFieldRegist.do")) {
			Action action = new MyFieldRegistAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/mypage.do")) {
			Action action = new MypageAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/search.do")) {
			Action action = new SearchAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/login.do")) {
			Action action = new LoginMoveAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/signIn.do")) {
			Action action = new SignInAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/regist.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/regist.jsp");
		} else if(spath.equals("/idCheck.do")) {
			Action action = new IdCheckAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/registSave.do")) {
			Action action = new RegistAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/logout.do")) {
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/help.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/help.jsp");
		}else if (spath.equals("/helpWrite.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/helpWrite.jsp");
		}else if (spath.equals("/write.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/write.jsp");
		}else if (spath.equals("/save.do")) {
		}

		
		// request 변경 여부
		if (!forward.isRedirect()) {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		} else {
			response.sendRedirect(forward.getUrl());
		}

	}

}
