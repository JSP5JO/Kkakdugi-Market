package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dto.Comment;


public class CommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		CommentDao dao = CommentDao.getInstance();
		
		int pageNo = Integer.parseInt(request.getParameter("page"));
		int writingIdx = Integer.parseInt(request.getParameter("writingIdx"));

		// 댓글 삭제
		if (request.getParameter("del") != null) {
			int cmtIdx = Integer.parseInt(request.getParameter("cmtIdx"));
			dao.delete(cmtIdx);
		} else { // 댓글 삽입
			String userId = request.getParameter("userId");
			String content = request.getParameter("content");

			Comment dto = new Comment(0, writingIdx, userId, content);
			dao.insert(dto);
		}

		dao.updateCountAll(writingIdx);
		
		forward.isRedirect = true;
		forward.url = "detail.do?idx=" + writingIdx + "&page=" + pageNo;
		
		return forward;
	}

}
