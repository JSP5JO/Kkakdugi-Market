package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.lang.Object;

import java.util.HashMap;
import java.lang.Integer;
import java.util.Map;
import java.lang.String;
import dto.PageDto;
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
		WritingDao wdao = null;
		List<Writing> list = null;
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
			
			int pageNo;
			int pageSize =15;
			int totalCount;
			
			if(request.getParameter("page")==null) 
				pageNo=1;
			else 
				pageNo = Integer.parseInt(request.getParameter("page"));   //page=1,2,3,4,.....
			
			wdao = WritingDao.getInstance();
			totalCount = 0;
			
			PageDto pageDto = new PageDto(pageNo,totalCount,pageSize);  //페이지처리에 필요한객체(값) 생성
			
			Map<String,Object> map = new HashMap<>();
			map.put("pageSize",(Object)pageSize);
			map.put("startNo",(Object)pageDto.getStartNo());
			

			if (searchOption.equals("subject")) {
				
				map.put("subject",(Object)subject);
				list = wdao.searchBySubject(map);

			} else if (searchOption.equals("userId")) {

				map.put("userId",(Object)userId);
				list = wdao.searchById(map);

			} else if (searchOption.equals("content")) {
				
				map.put("content",(Object)content);
				list = wdao.searchByContent(map);

			}
			
			totalCount = list.size();
			PageDto page = new PageDto(pageNo,totalCount,pageSize);
			
			request.setAttribute("page", page); 
			request.setAttribute("list", list);
		}
		

		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.setUrl("view/search.jsp");
		return forward;
	}

}