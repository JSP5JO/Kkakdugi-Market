package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.GalleryDao;
import dao.WritingDao;
import dto.Gallery;
import dto.Writing;

public class WriteSaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GalleryDao gdao = GalleryDao.getInstance();
		String path = "d:\\desktop\\upload"; 

		int size = 10 * 1024 * 1024; // 10MByte, 최대파일크기
		try {
			// 업로드된 파일을 받을 수 있는 MultipartRequest타입의 request 객체 생성
			MultipartRequest multi_request = new MultipartRequest(request, path, size, "UTF-8",
					new DefaultFileRenamePolicy());

			String title = multi_request.getParameter("title");
			String filename = multi_request.getFilesystemName("pic");	
			String categoryIdx = multi_request.getParameter("Category");
			String subject = multi_request.getParameter("subject");
			String userId = multi_request.getParameter("userId");
			String content = multi_request.getParameter("content");
			
			WritingDao wdao = WritingDao.getInstance();
			Writing wdto = new Writing();
			
			wdto.setCategoryIdx(categoryIdx);
			wdto.setSubject(subject);
			wdto.setUserId(userId);
			wdto.setContent(content);
			
			wdao.insert(wdto);
			
			Gallery vo = new Gallery(0, title, filename);
			gdao.insert(vo); // 업로드한 파일을 테이블 컬럼 값으로 저장.
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("gallery 오류 : " + e.getMessage());
		}

		return new ActionForward(true, "index.do");
	}

}