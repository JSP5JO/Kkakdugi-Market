package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private int idx; //유저 번호
	private String name; //이름
	private String id; //아이디
	private String pw; //패스워드
	private String email; //이메일
	private String proIdx; //전문가 번호(카테고리 번호)
}
