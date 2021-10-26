package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDao;
import dao.UsersDao;
import dao.WritingDao;
import dto.Writing;
import dto.Comment;
import dto.SessionDto;
import dto.Users;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		SessionDto sdto = (SessionDto) session.getAttribute("user");

		if (sdto == null) {
			request.setAttribute("message", "로그인을 해주세요");
			request.setAttribute("url", "index.do");
			return new ActionForward(false, "error/alert.jsp");
		} else {
			String userId = sdto.getId();

			// 내가 쓴 글 리스트 가져오기
			WritingDao wdao = WritingDao.getInstance();
			List<Writing> wlist = wdao.selectById(userId);
			request.setAttribute("wlist", wlist);

			// 내가 쓴 댓글 리스트 가져오기
			CommentDao cdao = CommentDao.getInstance();
			List<Comment> clist = cdao.selectById(userId);
			request.setAttribute("clist", clist);

			// 내가 찜한 글 리스트 가져오기
			List<Writing> jlist = wdao.selectJjimById(userId);
			request.setAttribute("jlist", jlist);

			// user 전문가 등록 정보 가져오기
			UsersDao udao = UsersDao.getInstance();
			Users udto = new Users();
			
			// pro 정보가 존재할 경우
			if(udao.proIdxInfo(userId) != null) {
				udto = udao.proIdxInfo(userId);
				udto.setId(userId);
			}
			request.setAttribute("userProInfo", udto);

			// 내가 쓴 1:1상담 글 가져오기
			WritingDao hdao = WritingDao.getInstance();
			List<Writing> hlist = hdao.selectHelpById(userId);
			request.setAttribute("hlist", hlist);

			ActionForward forward = new ActionForward();
			forward.isRedirect = false;
			forward.url = "view/mypage.jsp?userId=" + userId;
			return forward;
		}
	}

}