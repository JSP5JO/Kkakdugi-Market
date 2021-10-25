package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDto {
	private int currentPage; // 현재 페이지
	private int totalCount; // 글의 전체 갯수
	private int pageSize; // 한개페이지에 보여줄 글 갯수

	private int totalPage; // 전체 페이지 갯수
	private int startPage;
	private int endPage; // 꼭 필요하지 않습니다.
	private int startNo;
	

	public PageDto(int currentPage, int totalCount, int pageSize) {
		this.totalCount = totalCount;
		this.pageSize = pageSize;

		totalPage = (totalCount - 1) / pageSize + 1;

		// 현재페이지 범위(1~totalPage) 의 유효성을 체크
		this.currentPage = currentPage > totalPage ? totalPage : currentPage;
		this.currentPage = currentPage < 1 ? 1 : currentPage;

		startNo = (this.currentPage - 1) * pageSize;

		startPage = (this.currentPage - 1) / 10 * 10 + 1;

		endPage = startPage + pageSize - 1;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
}