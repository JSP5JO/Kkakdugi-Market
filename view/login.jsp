<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��α⸶�� �α���</title>
<!-- īī�� ��ũ��Ʈ -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<div>
	<form action="loginAction.do" method="post">
		ID : <input type="text" name="id" placeholder="id�� �Է����ּ���."><br>
		PW : <input type="password" name="pw" placeholder="��й�ȣ�� �Է����ּ���.">
		<input type="submit" value="�α���">
		<input type="button" value="ȸ������" onclick="location.href='regist.do'">
		<input type="button" value="ID/PW ã��" onclick="location.href='??'"><!-- id/pwã�� jsp,do,action ����� ��μ��� �ʿ��� -->
	</form>
</div>
<ul><!-- īī�� api �̿ϼ� -->
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>īī�� �α���</span>
      </a>
	</li>
<!-- 	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>īī�� �α׾ƿ�</span>
      </a>
	</li>
</ul> -->
<script>
Kakao.init('2c5411db0d0516f5e9b440357100e504'); //�߱޹��� Ű �� javascriptŰ�� ������ش�.
console.log(Kakao.isInitialized()); // sdk�ʱ�ȭ�����Ǵ�
	//īī���α���
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//īī���α׾ƿ�  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
</script>
</body>
</html>