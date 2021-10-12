package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Writing {
	private int idx; //글번호
	private String categoryIdx; //카테고리 번호
	private String userId; //유저 아이디
	private String subject; //글 제목
	private String content; //글 내용
}
