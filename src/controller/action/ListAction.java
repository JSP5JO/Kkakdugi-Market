package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WritingDao;
import dto.PageDto;
import dto.Writing;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 페이지 설정을 담을 변수
		int pageSize = 10;
		int pageNo;
		int totalCount;
		
		// page 인자에 따른 보여줄 페이지 설정
		if (request.getParameter("page") == null)
			pageNo = 1;
		else
			pageNo = Integer.parseInt(request.getParameter("page")); // page = 1, 2, 3, 4 ...

		// 카테고리 인자 가져오기
		String categoryIdx = request.getParameter("cate");
		WritingDao dao = WritingDao.getInstance();
	
		// 카테고리에 따른 리스트 가져오기
		PageDto pageDto;
		List<Writing> list;
		Map<String, Object> map = new HashMap<>();
		// 모든 리스트 가져오기
		if (categoryIdx.equals("all")) {
			// 페이지 설정
			totalCount = dao.getCount();
			pageDto = new PageDto(pageNo, totalCount, pageSize); 
			int startNo = pageDto.getStartNo();

			// 모든 리스트 가져오기
			map.put("startNo", startNo);
			map.put("pageSize", pageSize);
			list = dao.selectAll(map);
		} else {
			// 카테고리별 리스트 가져오기
			// 페이지 설정
			totalCount = dao.getCountByCategory(categoryIdx);
			pageDto = new PageDto(pageNo, totalCount, pageSize); 
			int startNo = pageDto.getStartNo();
			
			// 카테고리별 리스트 가져오기
			map.put("idx", categoryIdx);
			map.put("startNo", startNo);
			map.put("pageSize", pageSize);

			// 인자로 전달 받은 카테고리 번호로 리스트 리턴
			list = dao.selectByCategoryIdx(map);
		}
		
		// 리스트 및 페이지 객체 전달
		request.setAttribute("list", list);
		request.setAttribute("pageDto", pageDto);
		request.setAttribute("categoryIdx", categoryIdx);

		ActionForward forward = new ActionForward();
		forward.setUrl("view/list.jsp");

		return forward;
	}

}