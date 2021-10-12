package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Jjim {
	private String userId; //유저 아이디
	private int writingIdx; //글 번호
	private String categoryIdx; // 카테고리 번호
}
