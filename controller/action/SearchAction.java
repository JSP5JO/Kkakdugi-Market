package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
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
		if (searchOption.equals("subject")) {
			if(!subject.equals("")) { 
				WritingDao wdao = WritingDao.getInstance();
				List<Writing> list = wdao.searchBySubject(subject);
				request.setAttribute("list", list);
			}else {
				request.setAttribute("message", "제목을 입력해주세요");
				request.setAttribute("url", request.getHeader("REFERER")); 
				ActionForward foward = new ActionForward();
				foward.isRedirect = false;
				foward.url="/error/alert.jsp";
				return foward;
			}
		} else if (searchOption.equals("userId")) {
			if(!userId.equals("")) { 
				WritingDao wdao = WritingDao.getInstance();
				List<Writing> list = wdao.searchById(userId);
				request.setAttribute("list", list);
			}else {
				request.setAttribute("message", "작성자를 입력해주세요");
				request.setAttribute("url", request.getHeader("REFERER")); 
				ActionForward foward = new ActionForward();
				foward.isRedirect = false;
				foward.url="/error/alert.jsp";
				return foward;
			}
		} else if (searchOption.equals("content")) {
			if(!content.equals("")) {
				WritingDao wdao = WritingDao.getInstance();
				List<Writing> list = wdao.searchByContent(content);
				request.setAttribute("list", list);
			}else {
				request.setAttribute("message", "내용을 입력해주세요");
				request.setAttribute("url", request.getHeader("REFERER")); 
				ActionForward foward = new ActionForward();
				foward.isRedirect = false;
				foward.url="/error/alert.jsp";
				return foward;
			}
		}
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.setUrl("view/search.jsp");
		return forward;
	}
}
