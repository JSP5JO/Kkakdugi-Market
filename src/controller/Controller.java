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
import controller.action.MyFieldAction;

/**
 * Servlet implementation class controller
 */
@WebServlet("*.do") 
public class Controller extends HttpServlet {  
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String spath = request.getServletPath();
		
		System.out.println(spath);
		
		// url Action
		if(spath.equals("/index.do")) {
			Action action = new IndexActioin();
			forward = action.execute(request, response);
		} else if(spath.equals("/myField.do")) {
			Action action = new MyFieldAction();
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

