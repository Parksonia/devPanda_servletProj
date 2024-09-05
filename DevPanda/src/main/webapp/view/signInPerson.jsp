<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인|개인</title>
<link href="../css/signIn.css" rel="stylesheet">
<style>
a,a:active,a:focus,a:hover {
    -webkit-text-decoration: none;
    text-decoration: none
}
</style>
</head>
<body>
	<!-- Header Start -->
	<%@ include file="./inc/header.jsp"%>
	<!-- Header End-->


	<div class="entire-container">
		<div class="container" style="margin-top: 70px;">
			<div class="title">DevPanda</div>
		</div>
		<div class="container">
			<div class="sub-title">개인 로그인</div>
		</div>
		<form class="form">
			<div class="container">
				<div class="id-container">
					<div class="input-id-title">아이디</div>
					<div class="input-id-container">
						<input class="id-input" placeholder="아이디를 입력해 주세요">
						<div class="id-text">개인</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="password-container">
					<div class="input-password-title">비밀번호</div>
					<div class="input-password-container">
						<input placeholder="비밀번호를 입력해 주세요" class="password-input">
					</div>
					<div class="password-option-container">
						<div class="password-option-container-item"><a href="./signUpPerson.jsp">회원가입</a></div>
						<div class="password-option-container-item"><a href="./search_id.jsp">아이디 찾기</a></div>
						<div class="password-option-container-item"><a href="./search_pwd.jsp">비밀번호 찾기</a></div>
					</div>
				</div>
			</div>
			<div class="container">
				<input class="sign-in" type="submit" value="로그인">
			</div>
		</form>
	</div>

</body>
</html>