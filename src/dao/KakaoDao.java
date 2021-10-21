package dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dto.KakaoDto;
import dto.KakaoUser;
import dto.Users;
import mybatis.SqlSessionBean;

public class KakaoDao {
	private static KakaoDao dao = new KakaoDao();
	private KakaoDao() {}
	public static KakaoDao getInstance() {
		return dao;
	}
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	/*
	 * 토큰으로 받은 
	 * Gson 라이브러리는 json으로 받은 데이터를 내가 만든 객체에 자동으로 set 해주는 기능을
	 * 제공한다.
	 */
	
	public KakaoUser getUserInfo (String access_token) throws IOException {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		String result = "";
		String line = "";
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		//System.out.println(access_token); //토큰값 넘어옴 
		conn.setRequestProperty("Authorization", "Bearer " + access_token);		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while ((line = br.readLine()) != null) {
			result += line;
		}
		
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);//문자열 Json으로 파싱
        
        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();//필수 제공항목 카카오 닉네임(이름)필요
        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();//선택 제공항목
        
        KakaoUser kakaoUser = gson.fromJson(properties, KakaoUser.class); //kakaoUser객체에 nicName 추가
        int id = element.getAsJsonObject().get("id").getAsInt();
        kakaoUser.setId(id);
        if(kakao_account.get("email").getAsString() != null) {//유저가 이메일 제공시
        	String email = kakao_account.get("email").getAsString();
        	kakaoUser.setEmail(email);
        }
        
        //System.out.println("카카오 유저에 담긴 값"+ kakaoUser);
        
        return kakaoUser;
	}
	



	//토큰값 넣기
	public KakaoDto getDto (String authorize_code, HttpServletRequest request, HttpServletResponse response) throws IOException {
		BufferedReader br;
		
	if (request.getParameter("error") != null) {//토큰이 제대로 안들어왔을 경우
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print("<script>alert('에러발생');history.back();</script>");
		return null;
	}
		
		String client_id = "d2b3ba824e744e5c470824907863b20b"; //Rest api방식 키
		String redirect_uri = "http://localhost:8087/backup/kakaoLogin.do"; //리다이렉트할 주소 등록해야함
		String code = authorize_code;

		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id="+client_id);
		sb.append("&redirect_uri="+redirect_uri);
		sb.append("&code="+code);
		
		final String AUTH_HOST = "https://kauth.kakao.com";
		final String tokenRequestURL = AUTH_HOST + "/oauth/token";
		
		URL url = new URL(tokenRequestURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		writer.write(sb.toString());
		writer.flush();
		
		int respCode = conn.getResponseCode();
		
		if (respCode == 200) {//정상실행
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		Gson gson = new Gson();
		KakaoDto kakaoDto = gson.fromJson(br.readLine(), KakaoDto.class);
		return kakaoDto;
	}
	
	//카카오톡id(고유번호)로 기존유저인지 확인
	public Users findKakaoId(long kakaoId) {
		Users dto = null;
		SqlSession mapper = sqlFactory.openSession();
		System.out.println(kakaoId);
		dto = mapper.selectOne("users.findKakaoId", kakaoId);
		mapper.commit();
		mapper.close();
		return dto;
	}
}

