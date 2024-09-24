<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyInfo</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.container.my .content_area {
	min-height: 380px;
	overflow: hidden;
}

.content_area {
	overflow: hidden;
}

.my-page-content {
	flex: 1;
}

.my_profile {
	padding: 0 24px 80px;
}

.content_title {
	display: flex;
}

.content_title.border {
	border-bottom: 3px solid #222;
	padding-bottom: 16px;
}

.title {
	font-size: 24px;
	letter-spacing: -.36px
}

.title>h3 {
	font-size: inherit;
	line-height: 29px
}

/*user 사진관리 start */
.user_profile {
	align-items: center;
	background-color: #fff;
	display: flex;
	padding: 38px 0
}

.lg .user_profile {
	border-bottom: 1px solid #ebebeb
}

.profile_thumb {
	border-radius: 100%;
	flex: none;
	height: 80px;
	margin-right: 12px;
	overflow: hidden;
	width: 80px
}

.lg .profile_thumb {
	height: 90px;
	width: 90px
}

.profile_thumb .thumb_img {
	height: 100%;
	-o-object-fit: cover;
	object-fit: cover;
	width: 100%
}

.profile_detail .name {
	margin-top: 3px;
	color: #000;
	font-size: 18px;
	letter-spacing: -.27px;
	line-height: 1.2222222222
}

.profile_detail .div_user {
	color: #ebebeb;;
	font-size: 16px;
	letter-spacing: -.27px;
	line-height: 1.2222222222
}

.profile_btn_box {
	font-size: 0;
	margin-top: 12px
}

.profile_btn_box .btn+.btn {
	margin-left: 8px
}

.btn {
	align-items: center;
	background-color: #fff;
	color: rgba(34, 34, 34, .8);
	cursor: pointer;
	display: inline-flex;
	justify-content: center;
	text-align: center;
	vertical-align: middle
}

.btn:hover {
	background-color: #f1f3f5;
}

.outlinegrey {
	border: 1px solid #d3d3d3;
	color: rgba(34, 34, 34, .8)
}

.outlinegrey:active {
	background-color: #f4f4f4;
	border-color: #ebebeb;
	color: rgba(34, 34, 34, .5)
}

.small {
	border-radius: 10px;
	font-size: 12px;
	height: 34px;
	letter-spacing: -.06px;
	padding: 0 14px
}
/*user 사진관리 End */

/*개인계정,개인정보 Start*/
.profile_info {
	padding-top: 38px;
}

.lg .profile_group {
	padding-top: 58px;
}

.profile_group {
	padding-top: 48px
}

.profile_group:first-of-type {
	padding-top: 0
}

.group_title {
	font-size: 18px;
	letter-spacing: -.27px
}

.modify.name {
	padding-top: 25px
}

.unit {
	border-bottom: 1px solid #ebebeb;
	display: flex;
	flex-direction: column;
	padding: 25px 0 8px;
	position: relative;
}

.unit+.unit {
	padding-top: 23px;
	margin-bottom: 20px;
}

.title {
	color: rgba(34, 34, 34, .5);
	font-size: 13px;
	font-weight: 400;
	letter-spacing: -.07px
}

.unit_content {
	align-items: center;
	display: flex;
	justify-content: center;
	width: 100%;
	margin-top: 2px;
}

.desc {
	flex: 1;
	font-size: 16px;
	letter-spacing: -.16px;
	overflow: hidden;
	padding-bottom: 8px;
	padding-top: 8px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc_modify {
	padding-right: 58px
}

.btn_withdrawal {
	color: rgba(34, 34, 34, .5);
	display: inline-block;
	font-size: 13px;
	letter-spacing: -.07px;
	margin-top: 55px;
	padding: 5px 0
}

.empty_area {
	padding: 81px 0 45px;
	text-align: center
}

.wrap {
	margin-top: 121px;
}

.edit-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 6px 12px;
	cursor: pointer;
	font-size: 12px;
	border-radius: 0;
	margin-left: 10px;
	display: inline-block;
	font-family: inherit;
	transition: background-color 0.3s ease;
}

.edit-button:hover {
	background-color: #0056b3;
}

.unit_content {
	display: flex;
	align-items: center;
}

input[readonly] {
	border: none;
	background-color: transparent; /* 투명한 배경 */
	color: #000; /* 텍스트는 표시되도록 설정 */
	pointer-events: none; /* 클릭 불가능 */
}

/* placeholder 색상 그대로 유지 */
input::placeholder {
	color: #888888;
	opacity: 0.7;
}

.editable-input {
	padding-left: 8px;
	border: 1px solid #d3d3d3;
	border-radius: 8px; /* 여기에서 border-radius 추가 */
	transition: border-color 0.3s ease;
	border: 1px solid #d3d3d3;
}

.editable-input:focus {
	border-color: #000000;
	outline: none;
}

#passwordError {
	color: red;
	font-size: 12px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<!-- Header Start -->
	<%@ include file="./inc/header.jsp"%>
	<!-- Header End-->

	<div class="container my">
		<%@ include file="./inc/comSideNav.jsp"%>
		<!-- 로그인 정보 Start -->
		<div class="content_area my-page-content">
			<div class="my_profile">
				<div class="content_title border">
					<div class="title">
						<h2>기업 정보</h2>
					</div>
				</div>
				
				<div style="margin-left: 10%;">
				<form action="${pageContext.request.contextPath}/companyInfoUpdate"
						method="post" accept-charset="UTF-8" enctype="multipart/form-data">
					<!-- user 사진관리 start -->
					<div class="user_profile">
						<input id="profileImageInput" type="file" accept="image/*" name="companyImageFile" hidden>
						
						<div class="profile_thumb">
							<!-- <img id="profileImage" src="./img/user2.png" alt="사용자 이미지" class="thumb_img"> -->
							
							
							<img id="profileImage" src="image?file=${company.companyImage}" alt="사용자 이미지" class="thumb_img" >
						</div>
						<div class="profile_detail">
							<p class="div_user">
								<strong>[기업회원]</strong>
							</p>
							<p class="name">
								<strong>${company.id}</strong>
							</p>
							<!-- js로 사진 업로드 구현해야 함 -->
							<div class="profile_btn_box">
								<button id="changeImageButton" type="button" class="btn outlinegrey small" style="display: none;">이미지변경</button>
								<button id="deleteImageButton" type="button" class="btn outlinegrey small" style="display: none;">삭제</button>
								<input type="hidden" id="deleteImageHidden" name="deleteImage" value="false">
							</div>
						</div>
					</div>
					
					<!-- user 사진관리 end-->

					<!-- f	orm 태그로 감싸서 서버로 데이터를 전송할 수 있도록 수정 -->
				
						<!-- 개인계정,개인정보 start -->
						<input type="hidden" name="companyId" value="${company.id}">
						<div class="profile_info">
							<div class="profile_group">
								<h4 class="group_title">기업 계정</h4>

								<div class="unit">
									<h5 class="title">이메일 주소</h5>
									<div class="unit_content">
										<input type="email" name="email" class="desc editable-input"
											value="${company.email}" readonly />
									</div>
								</div>

								<div class="unit">
									<h5 class="title">비밀번호</h5>
									<div class="unit_content">
										<input type="password" name="password"
											class="desc editable-input" value="${company.password}"
											readonly />
									</div>
								</div>

								<div class="unit" id="passwordConfirmSection"
									style="display: none;">
									<h5 class="title">비밀번호 확인</h5>
									<div class="unit_content">
										<input type="password" id="passwordConfirm"
											class="desc editable-input" placeholder="비밀번호 확인을 입력하세요" /> 
										<span id="passwordError" style="color: red; display: none;">비밀번호가
											일치하지 않습니다.</span>
									</div>
								</div>

								<h4 class="group_title">기업 정보</h4>

								<div class="unit">
									<h5 class="title">회사명</h5>
									<div class="unit_content">
										<input type="text" name="companyName"
											class="desc editable-input" value="${company.companyName}"
											readonly />
									</div>
								</div>

								<div class="unit">
									<h5 class="title">사업장주소</h5>
									<div class="unit_content">
										<input type="text" name="address" class="desc editable-input"
											value="${company.address}" readonly />
									</div>
								</div>

							</div>
						</div>
						<!-- 개인계정,개인정보 End -->

						<div class="empty_area">
							<button type="button" id="editButton"
								class="btn outlinegrey small">수정하기</button>
							<button type="submit" class="btn outlinegrey small"
								id="saveButton" style="display: none;">저장하기</button>
						</div>
					</form>

					<script>
					document.addEventListener("DOMContentLoaded", function () {
					    const inputs = document.querySelectorAll('.editable-input');
					    const editButton = document.getElementById('editButton');
					    const saveButton = document.getElementById('saveButton');
					    const passwordConfirmSection = document.getElementById('passwordConfirmSection');
					    const passwordConfirmInput = document.getElementById('passwordConfirm');
					    const passwordError = document.getElementById('passwordError');
					    const passwordInput = document.querySelector('input[name="password"]');

					    const changeImageButton = document.getElementById('changeImageButton');
					    const deleteImageButton = document.getElementById('deleteImageButton');
					    
					    // 수정 버튼 클릭 시
					    editButton.addEventListener('click', function () {
					        inputs.forEach(input => {
					            input.removeAttribute('readonly'); // 읽기 전용 속성 제거
					        });
					        passwordConfirmSection.style.display = 'block'; // 비밀번호 확인 필드 보이기
					        saveButton.style.display = 'inline-block'; // 저장 버튼 표시
					        editButton.style.display = 'none'; // 수정 버튼 숨기기

					        // 이미지 관련 버튼들 보이게 하기
					        changeImageButton.style.display = 'inline-block'; 
					        deleteImageButton.style.display = 'inline-block'; 
					    });

					    // 저장 버튼 클릭 시 비밀번호 확인
					    saveButton.addEventListener('click', function (event) {
					        const originalPassword = passwordInput.value;
					        const confirmPassword = passwordConfirmInput.value;

					        if (originalPassword !== confirmPassword) {
					            event.preventDefault(); // 제출 방지
					            passwordError.style.display = 'inline'; // 에러 메시지 보이기
					        } else {
					            passwordError.style.display = 'none'; // 에러 메시지 숨기기
					            alert('수정이 완료되었습니다.');
					        }
					    });
					});
					</script>
					<script>
					$(document).ready(function() {
					    // 이미지 변경 버튼 클릭 시 파일 선택창 열기
					    $('#changeImageButton').click(function() {
					        $('#profileImageInput').click();
					    });

					    // 파일 선택 시 이미지 미리보기 업데이트
					    $('#profileImageInput').change(function(event) {
					        var reader = new FileReader();
					        reader.onload = function(e) {
					            $('#profileImage').attr('src', e.target.result);

					            // 이미지가 변경되었으므로 삭제 여부를 false로 설정
					            $('#deleteImageHidden').val('false');
					        };
					        reader.readAsDataURL(event.target.files[0]);
					    });

					    // 이미지 삭제 버튼 클릭 시 기본 이미지로 변경 및 삭제 여부 표시
					    $('#deleteImageButton').click(function() {
					        $('#profileImage').attr('src', './img/user2.png');

					        // 삭제 여부를 true로 설정하여 서버로 전송
					        $('#deleteImageHidden').val('true');
					    });
					});

					</script>
					
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 정보 End -->

</body>
</html>