<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입|기업</title>

<style>
.error-message {
	color: red;
}

.success-message {
	color: green;
}

.input-2-container {
	display: flex;
	align-items: center;
}

.check-button {
	margin-left: 10px;
	cursor: pointer;
	
	 background-color: #4CAF50; /* 초록색 배경 */
    color: white; /* 흰색 글자 */
    border: none; /* 테두리 없앰 */
    border-radius: 5px; /* 모서리 둥글게 */
    padding: 10px 20px; /* 상하 여백 10px, 좌우 여백 20px */
    cursor: pointer; /* 마우스 포인터 변경 */
    font-size: 16px; /* 글자 크기 */
    height: 50px; /* 버튼 높이 설정 */
    display: flex; /* Flexbox 사용 */
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: center; /* 가로 중앙 정렬 */
    transition: background-color 0.3s; /* 배경색 변화 효과 */
}

.input-error-title-2 {
	margin-left: 10px;
}
</style>

<link href="../css/signUp.css" rel="stylesheet">

<script>
document.addEventListener('DOMContentLoaded', function() {
    const checkPasswordsButton = document.querySelector('#checkPasswords');
    const passwordInput = document.querySelector('#password');
    const confirmPasswordInput = document.querySelector('#confirmPassword');
    const passwordMessageContainer = document.querySelector('#passwordMessage');

    checkPasswordsButton.onclick = function() {
        const passwordValue = passwordInput.value;
        const confirmPasswordValue = confirmPasswordInput.value;

        if (passwordValue === '') {
            passwordMessageContainer.textContent = '비밀번호를 입력해 주세요.';
            return;
        }

        if (confirmPasswordValue === '') {
            passwordMessageContainer.textContent = '비밀번호 확인을 입력해 주세요.';
            return;
        }

        if (passwordValue === confirmPasswordValue) {
            passwordMessageContainer.textContent = '비밀번호가 동일합니다.';
            passwordMessageContainer.style.color = 'green';
        } else {
            passwordMessageContainer.textContent = '비밀번호가 일치하지 않습니다.';
            passwordMessageContainer.style.color = 'red';
        }
    };
});
</script>


<script>
document.addEventListener('DOMContentLoaded', function() {
    const checkButton = document.querySelector('#checkButton');
    const idInput = document.querySelector('input[name="id"]');
    const errorMessageContainer = document.querySelector('#idMessage');
    
    checkButton.onclick = function() {
        const idValue = idInput.value;
        
        if (idValue.trim() === '') {
            errorMessageContainer.textContent = '아이디를 입력해 주세요.';
            return;
        }

        fetch(`/DevPanda/checkCompanyId?id=${encodeURIComponent(idValue)}`)

        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.text();  // 텍스트 응답 처리
        })
        .then(result => {
            console.log('Server response:', result);
            console.log(result);
            if (result === 'error') {
                errorMessageContainer.textContent = '아이디 중복 확인 중 오류가 발생했습니다.';
            } else {
                const isExists = result === 'true';  // 응답을 boolean으로 변환
                if (isExists) {
                    errorMessageContainer.textContent = '중복된 아이디입니다.';
                    errorMessageContainer.style.color = 'red'; // 빨간색으로 표시

                } else {
                    errorMessageContainer.textContent = '사용 가능한 아이디입니다.';
                    errorMessageContainer.style.color = 'green'; 

                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            errorMessageContainer.textContent = '아이디 중복 확인 중 오류가 발생했습니다.';
        });
    };
});


</script>


</head>
<body>


	<div class="entire-container">
		<div class="container" style="margin-top: 70px;">
			<div class="title">DevPanda</div>
		</div>
		<div class="container">
			<div class="sub-title">기업 회원가입</div>
		</div>
		<form class="form" method="post" action="/DevPanda/signUpCom"
			enctype="multipart/form-data">

			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">회사명*</div>
					<input class="input-1" name="companyName"
						placeholder="회사명을 입력해 주세요">
				</div>
			</div>
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-2">아이디*</div>
					<div class="input-2-container">
						<input class="input-2" id="id" name="id"
							placeholder="아이디를 입력해 주세요">
						<button type="button" id="checkButton" class="check-button">V</button>
					</div>
						<div class="input-error-title-2" id="idMessage"></div>
				</div>
			</div>
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">이메일*</div>
					<input class="input-1" name="email" placeholder="이메일을 입력해 주세요">
				</div>
			</div>

			<!-- 비밀번호 입력 -->
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">비밀번호*</div>
					<input class="input-1" id="password" name="password"
						type="password" placeholder="비밀번호를 입력해 주세요">
				</div>
			</div>

			<!-- 비밀번호 확인 입력 -->
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-2">비밀번호 확인*</div>
					<div class="input-2-container">
						<input class="input-2" id="confirmPassword" name="confirmPassword"
							type="password" placeholder="비밀번호를 입력해 주세요">
						<div class="check-button-container">
							<div class="check-button" id="checkPasswords">V</div>
						</div>
					</div>
					<div class="input-error-title-2" id="passwordMessage"></div>
				</div>
			</div>

			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">주소*</div>
					<input class="input-1" name="address" placeholder="주소를 입력해 주세요">
				</div>
			</div>
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">사업자등록번호*</div>
					<input class="input-1" name="companyNum"
						placeholder="사업자 등록번호를 입력해 주세요">
				</div>
			</div>

			<div class="form-container">
				<div class="input-container">
					<div class="input-title-2">사진*</div>
					<div class="input-2-container">
						<input type="file" name="companyImage" class="input-2">
					</div>
				</div>
			</div>

			<div class="form-container">
				<button class="sign-in">회원가입</button>
			</div>
		</form>
	</div>
	<style>
@charset "UTF-8";

body {
	background-color: rgb(255, 254, 247);
}

.entire-container {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	row-gap: 70px;
}

.container {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.title {
	color: rgb(78, 78, 78);
	font-size: 60px;
	font-weight: bolder;
}

.sub-title {
	font-size: 24px;
}

.form {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	row-gap: 30px;
}

.form-container {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.input-container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 500px;
	row-gap: 10px;
}

.input-title-1 {
	
}

.input-1 {
	width: 500px;
	height: 50px;
	border-radius: 10px;
	padding-left: 15px; /* 왼쪽에 15px 공간 추가 */
}

.input-error-title-1 {
	color: rgba(255, 5, 5, 0.8);
}

.input-title-2 {
	
}

.input-2-container {
	display: flex;
	flex-direction: row;
	width: 500px;
	column-gap: 10px;
}

.input-2 {
	width: 440px;
	height: 50px;
	border-radius: 10px;
	padding-left: 15px; /* 왼쪽에 15px 공간 추가 */
}

.check-button-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.check-button {
	background-color: rgb(165, 232, 176);
	border-radius: 5px;
	padding-top: 3px;
	padding-bottom: 3px;
}

.input-error-title-2 {
	color: rgba(255, 5, 5, 0.8);
}

.sign-in {
	width: 500px;
	height: 50px;
	background-color: rgb(98, 98, 98);
	color: aliceblue;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 50px;
}

.input-1::placeholder {
	font-size: 20px;
	padding-left: 10px;
}

.input-2::placeholder {
	font-size: 20px;
	padding-left: 10px;
}
</style>
</body>
</html>