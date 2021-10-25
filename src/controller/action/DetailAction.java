package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDao;
import dao.GalleryDao;
import dao.WritingDao;
import dto.Comment;
import dto.Gallery;
import dto.Writing;

public class DetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		WritingDao dao = WritingDao.getInstance();
		CommentDao cdao = CommentDao.getInstance();
		GalleryDao gdao = GalleryDao.getInstance();
		
		// 조회수 증가
		if(session.getAttribute("readCount") != null) {
			StringBuilder readCount = (StringBuilder)session.getAttribute("readCount");
			boolean status = readCount.toString().contains("/"+idx+"/");
			if(!status) {
				dao.readCount(idx);  
				readCount.append(idx + "/");
			}
		}else {
			StringBuilder readCount = new StringBuilder("/");
			session.setAttribute("readCount", readCount);
		}
		
		// 글 가져오기
		Writing bean = dao.getOne(idx);
		
		// 댓글 리스트 가져오기
		List<Comment> cmts = cdao.getList(idx);
		
		// 첨부파일 가져오기
		List<Gallery> gList = gdao.getList(idx);
		
		// 요청 전달
		request.setAttribute("page", page);
		request.setAttribute("bean", bean);
		request.setAttribute("cmtList", cmts);
		request.setAttribute("gList", gList);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "view/detail.jsp";
		return forward;

	}
}