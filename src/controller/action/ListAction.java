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
		WritingDao dao = WritingDao.getInstance();

		// 카테고리 인자 가져오기
		String categoryIdx = request.getParameter("cate");

		// page 설정
		int pageSize = 10;
		int pageNo;
		if (request.getParameter("page") == null)
			pageNo = 1;
		else
			pageNo = Integer.parseInt(request.getParameter("page")); // page = 1, 2, 3, 4 ...
		PageDto pageDto = new PageDto(pageNo, dao.getCount(), pageSize); // 페이지 처리에 필요한 객체
		int startNo = pageDto.getStartNo();

		// 인자 map에 추가
		Map<String, Object> map = new HashMap<>();
		map.put("idx", categoryIdx);
		map.put("startNo", startNo);
		map.put("pageSize", pageSize);

		// 인자로 전달 받은 카테고리 번호로 리스트 리턴
		List<Writing> list = dao.selectByCategoryIdx(map);

		// 리스트 및 페이지 객체 전달
		request.setAttribute("list", list);
		request.setAttribute("pageDto", pageDto);

		ActionForward forward = new ActionForward();
		forward.setUrl("view/list.jsp");

		return forward;
	}

}
