package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JjimDao;
import dao.WritingDao;
import dto.Jjim;
import dto.SessionDto;
import dto.Writing;

public class IndexActioin implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		SessionDto user = (SessionDto) session.getAttribute("user");

		// 로그인이 되어 session이 not null 일때만 작용
		if (user != null) {
			String userId = user.getId();
			JjimDao jjimDao = JjimDao.getInstance();
			WritingDao wdao = WritingDao.getInstance();

			// 찜 리스트 전달 로직
			List<Jjim> jjimList = jjimDao.selectById(userId);
			List<Writing> jjimWritingList = new ArrayList<Writing>();
			for (Jjim jList : jjimList) {
				int idx = jList.getWritingIdx();
				jjimWritingList.add(wdao.selectByIdx(idx));
			}

			// 내 전문분야의 글 가져오기
			String myFieldIdx = user.getProIdx(); // user(dto)에서 받기로 수정
			Map<String, Object> map = new HashMap<>();
			map.put("idx", myFieldIdx);
			map.put("startNo", 0);
			map.put("pageSize", 15);
			List<Writing> myFieldList = wdao.selectByCategoryIdx(map);

			// 요청 넘겨주기
			session.setAttribute("user", user);
			request.setAttribute("jjimWritingList", jjimWritingList);
			request.setAttribute("myFieldList", myFieldList);
		}
		
		forward.setRedirect(false);
		forward.setUrl("/index.jsp");
		return forward;
	}

}
