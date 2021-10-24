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

public class DetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		// 글 상세
		int idx = Integer.parseInt(request.getParameter("idx"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		WritingDao dao = WritingDao.getInstance();
		
		// 글 가져오기
		Writing bean = dao.getOne(idx);
		
		CommentDao cdao = CommentDao.getInstance();
		
		// 댓글 리스트 가져오기
		List<Comment> cmts = cdao.getList(idx);

		// 요청 전달
		request.setAttribute("cmtlist", cmts);
		request.setAttribute("bean", bean);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "view/detail.jsp";
		return forward;

	}
}