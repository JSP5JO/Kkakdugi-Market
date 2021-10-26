package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDao;
import dao.GalleryDao;
import dao.JjimDao;
import dao.WritingDao;
import dto.Comment;
import dto.Gallery;
import dto.SessionDto;
import dto.Writing;

public class DetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		SessionDto user = (SessionDto) session.getAttribute("user");

		int idx = Integer.parseInt(request.getParameter("idx"));
		int page;

		// 페이지가 null 인 경우,
		if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}

		WritingDao dao = WritingDao.getInstance();
		CommentDao cdao = CommentDao.getInstance();
		GalleryDao gdao = GalleryDao.getInstance();
		JjimDao jdao = JjimDao.getInstance();

		// 조회수 증가
		if (session.getAttribute("readCount") != null) {
			StringBuilder readCount = (StringBuilder) session.getAttribute("readCount");
			boolean status = readCount.toString().contains("/" + idx + "/");
			if (!status) {
				dao.readCount(idx);
				readCount.append(idx + "/");
			}
		} else {
			StringBuilder readCount = new StringBuilder("/");
			session.setAttribute("readCount", readCount);
		}

		// 글 가져오기
		Writing bean = dao.getOne(idx);

		// 댓글 리스트 가져오기
		List<Comment> cmts = cdao.getList(idx);

		// 첨부파일 가져오기
		List<Gallery> gList = gdao.getList(idx);

		// 찜 여부 확인
		boolean jjim = false;
		
		if (user != null) {
			Map<String, Object> jmap = new HashMap<String, Object>();
			jmap.put("idx", idx);
			jmap.put("userId", user.getId());
			
			if (jdao.selectByIdAndIdx(jmap) != null) {
				jjim = true;
			}
		}

		// 요청 전달
		request.setAttribute("page", page);
		request.setAttribute("bean", bean);
		request.setAttribute("cmtList", cmts);
		request.setAttribute("gList", gList);
		request.setAttribute("jjim", jjim);

		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "view/detail.jsp";
		return forward;

	}
}