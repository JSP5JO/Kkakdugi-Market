package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JjimDao;
import dao.WritingDao;
import dto.Jjim;
import dto.Writing;

public class IndexActioin implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();

		/* 내가 쓴 글 리스트 가져와서 요청 넘기기
		 * String userId = "user1"; // // WritingDAO wdao = WritingDAO.getInstance();
		 * List<Writing> myList = wdao.selectById(userId); // //
		 * request.setAttribute("myList", myList);
		 */
		
		String userId = "user1"; // user(dto)에서 받기로 수정
		JjimDao jjimDao = JjimDao.getInstance(); 
		WritingDao wdao = WritingDao.getInstance();
		
		
		// 찜 리스트 전달 로직
		List<Jjim> jjimList = jjimDao.selectById(userId);
		List<Writing> jjimWritingList = new ArrayList<Writing>();
		for(Jjim jList: jjimList) {
			int idx = jList.getWritingIdx();
			jjimWritingList.add(wdao.selectByIdx(idx));
		}
		
		
		// 내 전문분야의 글 가져오기
		String myFieldIdx = "CATE20"; 	// user(dto)에서 받기로 수정
		List<Writing> myFieldList = wdao.selectByCategoryIdx(myFieldIdx);
		
		// 요청 넘겨주기
		request.setAttribute("jjimWritingList", jjimWritingList);
		request.setAttribute("myFieldList", myFieldList);
		
		
		forward.setRedirect(false);
		forward.setUrl("/index.jsp");
		return forward;
	}

}
