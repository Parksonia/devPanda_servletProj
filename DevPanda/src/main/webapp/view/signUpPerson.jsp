<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입|개인</title>
<link href="./css/signUp.css" rel="stylesheet">
</head>
<body>
	<div class = "entire-container">
        <div class="container" style="margin-top: 70px;">
            <div class = "title">DevPanda</div>
        </div>
        <div class="container">
            <div class = "sub-title">개인 회원가입</div>
        </div>
        <form class="form" method="post" action="">
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-1">닉네임*</div>
                    <input class = "input-1" placeholder="닉네임을 입력해 주세요">
                    <div class = "input-error-title-1">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-2">아이디*</div>
                    <div class = "input-2-container">
                        <input class = "input-2" placeholder="아이디를 입력해 주세요">
                        <div class = "check-button-container">
                            <div class = "check-button">확인</div>
                        </div>
                    </div>
                    <div class = "input-error-title-2">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-1">이메일*</div>
                    <input class = "input-1" placeholder="이메일을 입력해 주세요">
                    <div class = "input-error-title-1">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-1">비밀번호*</div>
                    <input class = "input-1" placeholder="비밀번호를 입력해 주세요">
                    <div class = "input-error-title-1">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-2">비밀번호 확인*</div>
                    <div class = "input-2-container">
                        <input class = "input-2" placeholder="비밀번호를 입력해 주세요">
                        <div class = "check-button-container">
                            <div class = "check-button">확인</div>
                        </div>
                    </div>
                    <div class = "input-error-title-2">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-1">주소*</div>
                    <input class = "input-1" placeholder="주소를 입력해 주세요">
                    <div class = "input-error-title-1">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-1">성별*</div>
                    <input class = "input-1" placeholder="성별을 입력해 주세요">
                    <div class = "input-error-title-1">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-1">나이*</div>
                    <input class = "input-1" placeholder="나이를 입력해 주세요">
                    <div class = "input-error-title-1">에러메세지</div>
                </div>
            </div>
            <div class = "form-container">
                <div class = "input-container">
                    <div class = "input-title-2">사진*</div>
                    <div class = "input-2-container">
                        <input class = "input-2" placeholder="사진을 첨부해 주세요">
                        <div class = "check-button-container">
                            <div class = "check-button">첨부</div>
                        </div>
                    </div>
                    <div class = "input-error-title-2">에러메세지</div>
                </div>
            </div>
            <div class="form-container">
                <button class = "sign-in">회원가입</button>
            </div>
        </form>
    </div>
</body>
</html>