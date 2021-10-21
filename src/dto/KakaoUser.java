package dto;

import lombok.Data;

@Data
public class KakaoUser { //카카오톡으로 회원가입한적있는지 확인하기 위한 Dto
	private long id; // 유저 id(번호) 값. int 표현범위 벗어날수도 있어서 long타입으로 설정
	private String nickname; // 이름
	private String email;
}