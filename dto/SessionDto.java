package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class SessionDto { //세션에 저장하고 싶은 데이터
	private int idx;
	private String name;
	private String email;
}
