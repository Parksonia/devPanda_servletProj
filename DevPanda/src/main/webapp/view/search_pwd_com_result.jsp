<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="../css/search.css" rel="stylesheet">




</head>
<body>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- Header Start -->
	
	<!-- Header End-->


	<div class="entire-container">
		<div class="container" style="margin-top: 70px;">
			<div class="title">DevPanda</div>
		</div>
		<div class="container">
			<div class="sub-title">기업회원 패스워드 조회 결과</div>
		</div>
		<div class="hr-container">
			<div class="hr-content-container">
				<hr style="width: 100%;">
				<div>
					등록된 아이디 : ${id}에 대한 패스워드
				</div>
			</div>
		</div>
		<form class="form" id="form" method="get" action="/DevPanda/Company/login" >
			
			<div class="form-container" >
				<div class="input-container">
					
					
					
					
					<c:if test="${exist eq true}">
						<div class="input-2-container">
					
						<div style=" text-align : center; display:flex; align-items : center; font-size:20px;">패스워드 : ${password}</div>
					
						</div>
						
				
					</c:if> 
					
					
					
					<c:if test="${exist eq false}">
						<div class="input-2-container">
					
						<div style=" text-align : center; display:flex; align-items : center; font-size:20px;">해당하는 계정이 없습니다</div>
					
						</div>
						
				
					</c:if> 
					
					
			
			
				
				
			
				    
			
					
									
					
					
					
					
					
					
				</div>
			</div>
			
			
			
			
			
			
			
			<div class="form-container" name='password'id='password'>
				
					
					<button  class="sign-in"  >로그인</button>
				
				
				
				
				
				
			</div>
		</form>
	</div>
</body>
</html>