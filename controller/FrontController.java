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
import controller.action.MypageAction;
import controller.action.SearchAction;


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
		//String userId = session.getAttribute("userId");
		String searchOption = "subject";
		String subject = "subject";
		String userId = "user1";
		String content = "content";
		
		//System.out.println(spath);
		
		if(spath.equals("/view/mypage.do")) {
			Action action = new MypageAction();
			forward = action.execute(request, response);
			forward.setUrl("/view/mypage.jsp?userId="+userId);
		}else if(spath.equals("/view/search.do")) {
			Action action = new SearchAction();
			forward = action.execute(request, response);
			forward.setUrl("/view/search.jsp?searchOption"+searchOption+"&userId="+userId+"&subject="+subject+"&content="+content);
		}
		
		if(forward.isRedirect()) {
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}
		
	}//service end
	
}//FrontController end
