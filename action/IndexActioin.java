package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class IndexActioin implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		//차후 Dao를 통해서 list 가져오기
		
		
		 List<String> hotList = null; 
		 List<String> myFieldList = null; 
		 List<String> jjimList = null;
		 
		 
		 request.setAttribute("hotList", hotList);
		 request.setAttribute("myFieldList",myFieldList);
		 request.setAttribute("jjimList", jjimList);
		 
		

		forward.setRedirect(false);
		forward.setUrl("./index.jsp");
		return forward;
	}

}
