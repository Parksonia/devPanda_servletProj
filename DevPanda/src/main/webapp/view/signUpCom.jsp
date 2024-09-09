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
                } else {
                    errorMessageContainer.textContent = '사용 가능한 아이디입니다.';
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
						<button type="button" id="checkButton" class="check-button">확인</button>
						<div class="input-error-title-2" id="idMessage"></div>
					</div>
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
							<div class="check-button" id="checkPasswords">확인</div>
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

</body>
</html>