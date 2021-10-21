package dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class KakaoDto { //카카오톡로그인하면 넘어오는 토큰값 받는 Dto
	private String token_type;
	private String access_token;
	private Integer expires_in;
	private String refresh_token;
	private Integer refresh_token_expires_in;
	private String scope;
}