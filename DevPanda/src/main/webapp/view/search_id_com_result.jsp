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
			<div class="sub-title">기업회원 아이디 조회 결과</div>
		</div>
		<div class="hr-container">
			<div class="hr-content-container">
				<hr style="width: 100%;">
				<div>
					등록된 이메일 : ${email}에 대한 아이디 목록
				</div>
			</div>
		</div>
		<form class="form" id="form" method="get" action="/DevPanda/Company/SearchPassword" >
			
			<div class="form-container" >
				<div class="input-container">
					
					
					
					<c:if test="${size eq 0}">
					
						<div class="input-2-container">
						
						<div style=" text-align : center; display:flex; align-items : center; font-size:20px;">조회된 아이디가 없습니다</div>
						</div>
				
					</c:if> 
					
					
					<c:if test="${size ne 0}">
					
						<c:forEach items="${list}" var="item" varStatus="status">
						    <div class="input-2-container">
							<input class="input-2" style="width:50px" type='radio' id='email'name = 'email' >
							<div style=" text-align : center; display:flex; align-items : center; font-size:20px;">${item.id}</div>
							</div>
						</c:forEach>
					
					
					</c:if>
					
									
					
					
					
					
					
					
				</div>
			</div>
			
			
			
			
			
			
			
			<div class="form-container" name='password'id='password'>
				<c:if test="${size ne 0}">
					
					<button  class="sign-in"  >비밀번호 찾기</button>
				
				</c:if> 
				
				<c:if test="${size eq 0}">
					
					<button type="button" class="sign-in"  >비밀번호 찾기</button>
				
				</c:if>
				
				
			</div>
		</form>
	</div>
</body>
</html>