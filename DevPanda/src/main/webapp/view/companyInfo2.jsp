<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>personInfo</title>
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
	padding: 25px 0 12px;
	position: relative;
}

.unit+.unit {
	padding-top: 23px
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
	width: 100%
}

.desc {
	flex: 1;
	font-size: 16px;
	letter-spacing: -.16px;
	overflow: hidden;
	padding-bottom: 8px;
	padding-top: 8px;
	text-overflow: ellipsis;
	white-space: nowrap
}

.desc_modify {
	padding-right: 58px
}
/*개인계정,개인정보 End*/
.btn_withdrawal {
	color: rgba(34, 34, 34, .5);
	display: inline-block;
	font-size: 13px;
	letter-spacing: -.07px;
	margin-top: 55px;
	padding: 5px 0
}

/*empty_area Start  */
.empty_area {
	padding: 81px 0 45px;
	text-align: center
}
/*empty_area End  */
.wrap {
	margin-top: 121px;
}
</style>
</head>
<body>
	<!-- Header Start -->
	<%@ include file="./inc/header.jsp"%>
	<!-- Header End-->

	<div class="container my">
		<%@ include file="./inc/personSideNav.jsp"%>
		<!-- 로그인 정보 Start -->
		<div class="content_area my-page-content">
			<div class="my_profile">

				<div class="content_title border">
					<div class="title">
						<h2>로그인 정보</h2>
					</div>
				</div>

				<div style="margin-left: 10%;">
					<!-- user 사진관리 start -->
					<div class="user_profile">
						<input id="profileImageInput" type="file" accept="image/*" hidden>
						<div class="profile_thumb">
							<img id="profileImage" src="./img/user2.png" alt="사용자 이미지"
								class="thumb_img">
						</div>
						<div class="profile_detail">
							<p class="div_user">
								<strong>[기업회원]</strong>
							</p>
							<p class="name">
								<strong>회사이름</strong>
							</p>
							<!-- js로 사진 업로드 구현해야 함 -->
							<div class="profile_btn_box">
								<button id="changeImageButton" type="button"
									class="btn outlinegrey small">이미지변경</button>
								<button id="deleteImageButton" type="button"
									class="btn outlinegrey small">삭제</button>
							</div>
						</div>
					</div>
					<script>
						$(document)
								.ready(
										function() {
											// 이미지 변경 버튼 클릭 시 파일 선택창 열기
											$('#changeImageButton').click(
													function() {
														$('#profileImageInput')
																.click();
													});

											// 파일 선택 시 이미지 미리보기 업데이트
											$('#profileImageInput')
													.change(
															function(event) {
																var reader = new FileReader();
																reader.onload = function(
																		e) {
																	$(
																			'#profileImage')
																			.attr(
																					'src',
																					e.target.result);// 여기서 이미지를 업데이트
																}
																reader
																		.readAsDataURL(event.target.files[0]);
															});

											// 이미지 삭제 버튼 클릭 시 기본 이미지로 변경
											$('#deleteImageButton')
													.click(
															function() {
																$(
																		'#profileImage')
																		.attr(
																				'src',
																				'./img/user2.png'); // 기본 이미지로 변경
															});
										});
					</script>
					<!-- user 사진관리 end-->

					<!-- 개인계정,개인정보 start -->
					<div class="profile_info">
						<div class="profile_group">
							<h4 class="group_title">기업 계정</h4>
							<div class="unit">
								<h5 class="title">이메일 주소</h5>
								<div class="unit_content">
									<p class="desc email">kimjava@gmail.com</p>
								</div>
							</div>

							<div class="unit">
								<h5 class="title">비밀번호</h5>
								<div class="unit_content">
									<p class="desc password">●●●●●●●●●</p>
								</div>
							</div>

							<div class="profile_group">
								<h4 class="group_title">기업 정보</h4>

								<div class="unit">
									<h5 class="title">회사명</h5>
									<div class="unit_content">
										<p class="desc">kosta</p>
									</div>
								</div>

								<div class="unit">
									<h5 class="title">사업장주소</h5>
									<div class="unit_content">
										<p class="desc">서울특별시 금천구 독산동</p>
									</div>
								</div>
								<div class="unit">
									<h5 class="title">사업자 번호</h5>
									<div class="unit_content">
										<p class="desc">12-456-789</p>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- 기업계정,기업정보 End -->
					<div class="empty_area">
						<a href="#" data-v-420a5cda="" class="btn outlinegrey small">변경하기</a>
					</div>
					<a href="#" class="btn_withdrawal">회원 탈퇴</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 정보 End -->

</body>
</html>