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
import controller.action.IndexActioin;
import controller.action.LoginMoveAction;
import controller.action.MyFieldAction;
import controller.action.MypageAction;
import controller.action.RegistAction;
import controller.action.RegistMoveAction;
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
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String spath = request.getServletPath();
		
		// url Action
		if(spath.equals("/index.do")) {
			Action action = new IndexActioin();
			forward = action.execute(request, response);
		} else if(spath.equals("/myField.do")) {
			Action action = new MyFieldAction();
			forward = action.execute(request, response);
		}  else if(spath.equals("/mypage.do")) {
			Action action = new MypageAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/search.do")) {
			Action action = new SearchAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/login.do")) {
			Action action = new LoginMoveAction();
			forward = action.execute(request, response);   
		}else if(spath.equals("/signIn.do")) {
			Action action = new SignInAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/regist.do")) {
			Action action = new RegistMoveAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/registSave.do")) {
			Action action = new RegistAction();
			forward = action.execute(request, response);
		}

		
		// request 변경 여부
		if(!forward.isRedirect()) { // 타입이 boolean이면 getter가 isXXX
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		} else {
			response.sendRedirect(forward.getUrl());
		} 
		
	}
	
}

