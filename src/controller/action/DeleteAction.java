package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WritingDao;

public class DeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));
		String categoryIdx = request.getParameter("cate");
		
		WritingDao dao = WritingDao.getInstance();
		
		int n = dao.delete(idx);

		out.print("<script>");
		String message=null;
		String href=null;
		if(n==1){  
			message ="글 삭제가 완료되었습니다.";
			href="category.do?cate="+categoryIdx+"&page="+pageNo;
		}
		out.print("alert('"+message+"');");
		out.print("location.href='"+href+"';");
		out.print("</script>");
		
		return null;
		
		
		
	}
}