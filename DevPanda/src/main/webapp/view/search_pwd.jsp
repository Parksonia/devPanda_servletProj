<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="../css/search.css" rel="stylesheet">
</head>
<body>
	<!-- Header Start -->
	<!-- <%@ include file="./inc/header.jsp"%> -->
	<!-- Header End-->


	<div class="entire-container">
		<div class="container" style="margin-top: 70px;">
			<div class="title">DevPanda</div>
		</div>
		<div class="container">
			<div class="sub-title">비밀번호찾기</div>
		</div>
		<div class="hr-container">
			<div class="hr-content-container">
				<hr style="width: 100%;">
				<div>
					아이디와 등록된 이메일을 입력하시면 <br>이메일로 인증번호를 발송합니다
				</div>
			</div>
		</div>
		<form class="form" method="post" action="">
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">아이디*</div>
					<input class="input-1" placeholder="아이디를 입력해 주세요">
					<div class="input-error-title-1">에러메세지</div>
				</div>
			</div>
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-2">이메일*</div>
					<div class="input-2-container">
						<input class="input-2" placeholder="이메일을 입력해 주세요">
						<div class="check-button-container">
							<div class="check-button">인증번호 발송</div>
						</div>
					</div>
					<div class="input-error-title-2">에러메세지</div>
				</div>
			</div>
			<div class="form-container">
				<button class="sign-in">비밀번호 찾기</button>
			</div>
		</form>
	</div>
</body>
</html>