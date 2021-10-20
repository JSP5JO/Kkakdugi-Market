package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WritingDao;
import dto.Writing;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 검색 조건에 따른 파라미터 가져오기
		String searchOption = request.getParameter("searchOption");
		String subject = request.getParameter("subject");
		String userId = request.getParameter("userId");
		String content = request.getParameter("content");

		// 검색 주제 별 글 리스트 생성 후 요청 전달
		if ((subject==null || subject.equals("")) && 
				(userId==null || userId.equals("")) &&
				(content==null || content.equals(""))) {
			request.setAttribute("message", "검색창을 입력해주세요.");
			request.setAttribute("url", request.getHeader("REFERER"));
			ActionForward foward = new ActionForward();
			foward.isRedirect = false;
			foward.url = "error/alert.jsp";
			return foward;
		} else {
			List<Writing> list = null;
			if (searchOption.equals("subject")) {
				WritingDao wdao = WritingDao.getInstance();
				list = wdao.searchBySubject(subject);
			} else if (searchOption.equals("userId")) {
				WritingDao wdao = WritingDao.getInstance();
				list = wdao.searchById(userId);
			} else if (searchOption.equals("content")) {
				WritingDao wdao = WritingDao.getInstance();
				list = wdao.searchByContent(content);
			}
			request.setAttribute("list", list);
		}

		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.setUrl("view/search.jsp");
		return forward;
	}

}