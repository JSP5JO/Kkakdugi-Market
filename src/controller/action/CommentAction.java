package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.UsersDao;
import dto.Comment;
import dto.Users;

public class CommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		CommentDao dao = CommentDao.getInstance();
		
		int pageNo = Integer.parseInt(request.getParameter("page"));
		int writingIdx = Integer.parseInt(request.getParameter("writingIdx"));
		String categoryIdx = request.getParameter("categoryIdx");

		// 댓글 삭제
		if (request.getParameter("del") != null) {
			int cmtIdx = Integer.parseInt(request.getParameter("cmtIdx"));
			dao.delete(cmtIdx);
		} else { // 댓글 삽입
			String userId = request.getParameter("userId");
			String content = request.getParameter("content");
			
			// 전문가 등록 여부 확인
			UsersDao udao = UsersDao.getInstance();
			Users user = udao.proIdxInfo(userId);

			// 전문가의 경우 / 아닌 경우
			if(user != null) { // 전문번호가 존재할 경우, 해당 카테고리와 일치여부 확인
				String proIdx = user.getProIdx();
				if(categoryIdx.equals(proIdx)) {
					proIdx = user.getProIdx();
					Comment dto = new Comment(0, writingIdx, userId, content, (short) 1);
					dao.insert(dto);
				} else {
					Comment dto = new Comment(0, writingIdx, userId, content, (short) 0);
					dao.insert(dto);
				}
			} else { // 전문번호가 존재하지 않을 경우,
				Comment dto = new Comment(0, writingIdx, userId, content, (short) 0);
				dao.insert(dto);
			}
		}

	dao.updateCountAll(writingIdx);

	forward.isRedirect=true;forward.url="detail.do?idx="+writingIdx+"&page="+pageNo;

	return forward;
}

}
