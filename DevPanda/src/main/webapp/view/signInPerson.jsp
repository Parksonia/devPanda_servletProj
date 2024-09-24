<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인|개인</title>
<!--  <link href="../css/signIn.css" rel="stylesheet"> -->
<style>
a,a:active,a:focus,a:hover {
    -webkit-text-decoration: none;
    text-decoration: none
}


body{
    background-color: rgb(255,254,247);
}
.entire-container{
    width: 100%;
    height: 100%;
    display : flex;
    flex-direction : column;
    justify-content : center;
    row-gap: 70px;
    
}

.form{
    width: 100%;
    height: 100%;
    display : flex;
    flex-direction : column;
    justify-content : center;
    row-gap: 90px;
}

.container{
    display : flex;
    flex-direction: row;
    justify-content: center;
}


.title{
    color : rgb(78,78,78);
    font-size : 60px;
    font-weight: bolder;
}

.sub-title{
    font-size:24px;
}


.sign-in{
    
    width: 500px;
    height: 50px;
    background-color: rgb(98,98,98);
    color:aliceblue;
    border-radius: 5px;
    cursor:pointer;
    
    font-size: 20px;
    
}


.id-container{
    width: 500px;
    display : flex;
    flex-direction : column;
}

.input-id-container{
    display : flex;
    flex-direction : row;
}

.password-option-container{
    display : flex;
    flex-direction : row;
    justify-content: space-around;
    margin-top : 10px;

}


.input-id-title{
    font-size : 15px;
    margin-bottom : 8px;
}


.id-input{
    width: 450px;
    height: 50px;
    border-radius: 10px;
    
}

.id-input::placeholder{
    font-size: 20px;
    padding-left: 10px;
}


.id-text{
    
    text-align : center;
    line-height : 46px;
    padding: 5px;
    height:46px;
    display: inline;
    justify-content: center;
    color : rgba(0,0,0,0.3);
}

.password-container{
    width: 500px;
    display : flex;
    flex-direction : column;
}

.input-password-title{
    font-size : 15px;
    margin-bottom : 8px;
}

.input-password-container{
    display : flex;
    flex-direction : row;
}

.password-input{
    width: 500px;
    height: 50px;
    border-radius: 10px;
}


.password-input::placeholder{
    font-size: 20px;
    padding-left: 10px;
}


.password-option-container-item{
    
    border-radius: 10px;
}

.password-option-container-item:hover{
    background-color: rgb(242,242,242);
}
</style>
</head>
<body>
	<!-- Header Start -->
	
	<!-- Header End-->


	<div class="entire-container">
		<div class="container" style="margin-top: 70px;">
			<div class="title">DevPanda</div>
		</div>
		<div class="container">
			<div class="sub-title">개인 로그인</div>
		</div>
		<form class="form" action="/DevPanda/Person/login" method="post">
			<div class="container">
				<div class="id-container">
					<div class="input-id-title">아이디</div>
					<div class="input-id-container">
						<input class="id-input" name="id" placeholder="아이디를 입력해 주세요" required="required">
						<div class="id-text">개인</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="password-container">
					<div class="input-password-title">비밀번호</div>
					<div class="input-password-container">
						<input placeholder="비밀번호를 입력해 주세요" type="password" name="password" class="password-input" required="required">
					</div>
					<div class="password-option-container">
						<div class="password-option-container-item"><a href="/DevPanda/signUpPerson">회원가입</a></div>
						<div class="password-option-container-item"><a href="/DevPanda/Person/SearchId">아이디 찾기</a></div>
						<div class="password-option-container-item"><a href="/DevPanda/Person/SearchPassword">비밀번호 찾기</a></div>
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