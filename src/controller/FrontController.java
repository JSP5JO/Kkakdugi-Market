package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import controller.action.ActionForward;
import controller.action.FindIdAction;
import controller.action.FindPwAction;
import controller.action.IdCheckAction;
import controller.action.IndexActioin;
import controller.action.JjimAction;
import controller.action.KakaoLoginAction;
import controller.action.ListAction;
import controller.action.LogoutAction;
import controller.action.MyFieldAction;
import controller.action.MyFieldRegistAction;
import controller.action.MypageAction;
import controller.action.RegistAction;
import controller.action.RegistMoveAction;
import controller.action.SearchAction;
import controller.action.SignInAction;
import controller.action.WriteSaveAction;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }
    
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward= new ActionForward(); 
		String spath = request.getServletPath();
		
		//System.out.println(spath);
		
		if(spath.equals("/login.do")) { //로그인 jsp 파일로 이동
			forward.setRedirect(false);
			forward.setUrl("view/login.jsp");
		}else if(spath.equals("/signIn.do")) { //로그인시 id,pw 체크
			Action action = new SignInAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/regist.do")) { //회원가입 jsp 파일로 이동
			Action action = new RegistMoveAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/registSave.do")) { //유저입력 form db저장
			Action action = new RegistAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/kakaoLogin.do")) { //카카오 로그인
			Action action = new KakaoLoginAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/logout.do")) { //로그아웃
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/idCheck.do")) { //아이디 중복체크
			Action action = new IdCheckAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/findId.do")) { //아이디찾기
			Action action = new FindIdAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/findPw.do")) { //비밀번호 찾기
			Action action = new FindPwAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/myField.do")) {
			Action action = new MyFieldAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/index.do")) {
			Action action = new IndexActioin();
			forward = action.execute(request, response);
		} else if (spath.equals("/myFieldRegist.do")) {
			Action action = new MyFieldRegistAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/mypage.do")) {
			Action action = new MypageAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/search.do")) {
			Action action = new SearchAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/help.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/help.jsp");
		} else if (spath.equals("/helpWrite.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/helpWrite.jsp");
		} else if (spath.equals("/write.do")) {
			forward.setRedirect(false);
			forward.setUrl("view/write.jsp");
		}else if (spath.equals("/save.do")) {
			Action action = new WriteSaveAction();
			forward = action.execute(request, response);
		}else if (spath.equals("/category.do")) {
			Action action = new ListAction();
			forward = action.execute(request, response);
		}else if (spath.equals("/jjim.do")) { // 찜버튼 클릭시 찜 테이블에 삽입
			Action action = new JjimAction();
			forward = action.execute(request, response);
		}

		if(forward.isRedirect()) {
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}
		
		
	}//service end
	
}//FrontController end
