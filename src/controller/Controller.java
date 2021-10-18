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
import controller.action.DetailAction;
import controller.action.WriteAction;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//콘솔 출력- 테스트용
	//	System.out.println(request.getServletPath());
		ActionForward forward=null; 
		String spath = request.getServletPath();
		String path="index.jsp";
		String url ="./";
	System.out.println(spath);
		
		if(spath.equals("/list.do")) {
	//		Action action = new ListAction();
	//		forward = action.execute(request, response);      
	//		forward.setUrl("view/list.jsp");
		}else if(spath.equals("/write.do")) {
			path ="view/write.jsp";
			forward = new ActionForward(false,path);  
		}else if(spath.equals("/detail.do")) {
			Action action = new DetailAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/save.do")) {
			Action action = new WriteAction();
			forward = action.execute(request, response);
			url = "list.do";
			forward.setUrl(url);
		}

		if(forward.isRedirect()) {   
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd 
			= request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}
	}
}