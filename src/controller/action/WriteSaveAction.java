package controller.action;

import java.io.File;
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
		ActionForward forward = new ActionForward();

		GalleryDao gdao = GalleryDao.getInstance();
		String path = "d:\\desktop\\upload";

		int size = 10 * 1024 * 1024; // 10MByte, 최대파일크기
		try {
			// 업로드된 파일을 받을 수 있는 MultipartRequest타입의 request 객체 생성
			MultipartRequest multi_request = new MultipartRequest(request, path, size, "UTF-8",
					new DefaultFileRenamePolicy());

			String categoryIdx = multi_request.getParameter("Category");
			String subject = multi_request.getParameter("subject");
			String userId = multi_request.getParameter("userId");
			String content = multi_request.getParameter("content");

			WritingDao wdao = WritingDao.getInstance();
			Writing wdto = new Writing();

			// 글 저장
			wdto.setCategoryIdx(categoryIdx);
			wdto.setSubject(subject);
			wdto.setUserId(userId);
			wdto.setContent(content);
			wdao.insert(wdto);


			// 파일 이름 변경
			int idx = wdto.getIdx();
			String fileName = multi_request.getFilesystemName("fileName");
			String newFileName = idx + "_" + fileName;
			
			File originFile = new File(path + "/" + fileName);
			File newFile = new File(path + "/" + newFileName);
			originFile.renameTo(newFile);

			// 갤러리 테이블에 저장
			Gallery vo = new Gallery(0, idx, newFileName);
			gdao.insert(vo);
			
			forward.setRedirect(true);
			forward.setUrl("detail.do?page=1&idx=" + wdto.getIdx());
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("gallery 오류 : " + e.getMessage());
		}

		return forward;
	}

}