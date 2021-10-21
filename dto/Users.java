package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private int idx; 
	private String name;
	private String id; 
	private String pw; 
	private String email;
	private String proIdx;
	private long kakaoId;
	
	public Users(String name, String id, String pw, String email) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
	}
}