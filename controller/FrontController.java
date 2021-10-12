package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.LoginMoveAction;
import action.RegistAction;
import action.RegistMoveAction;
import action.SignInAction;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward=null; 
		String spath = request.getServletPath();
		
		//System.out.println(spath);
		
		if(spath.equals("/view/login.do")) {
			Action action = new LoginMoveAction();
			forward = action.execute(request, response);   
		}else if(spath.equals("/view/signIn.do")) {
			Action action = new SignInAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/view/regist.do")) {
			Action action = new RegistMoveAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/view/registSave.do")) {
			Action action = new RegistAction();
			forward = action.execute(request, response);
		}
		
		if(forward.isRedirect()) {
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}
		
	}//service end
	
}//FrontController end
