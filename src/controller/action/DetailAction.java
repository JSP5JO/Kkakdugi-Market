package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDao;
import dao.WritingDao;
import dto.Comment;
import dto.Writing;


public class DetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//글 상세
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));
		
		WritingDao dao = WritingDao.getInstance();
		if(session.getAttribute("readCount")!=null) {
			StringBuilder Idx = (StringBuilder)session.getAttribute("readCount");
			boolean status = Idx.toString().contains("/"+idx+"/");
			if(!status) {
				dao.readCount(idx);
				Idx.append(idx + "/");
			}
			}else {
				StringBuilder Idx = new StringBuilder("/");
				session.setAttribute("Idx", Idx);
			}
		Writing bean = dao.selectByIdx(idx);
		
		CommentDao cdao = CommentDao.getInstance();
		cdao.updateCountAll(idx);
		List<Comment> cmts = cdao.getList(idx);
		request.setAttribute("cmtlist", cmts);
		request.setAttribute("page", pageNo);
		
		request.setAttribute("bean", bean);
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.setUrl("view/detail.jsp");
		return forward;
		
	}
}
