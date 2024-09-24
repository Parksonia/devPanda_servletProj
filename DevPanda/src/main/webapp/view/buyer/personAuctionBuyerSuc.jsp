<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 개인|구매내역조회|낙찰내역조회|입찰 거래성공 |상세보기 -->
<link href="../css/details.css" rel="stylesheet">
<style>
.profile-container {
	margin-bottom: 40px;
}

.profile-container h2 {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}

.profile-container .profile {
	flex: 1;
	text-align: center;
	padding: 20px;
}

.profile-container .profile img {
	border-radius: 50%;
	margin-bottom: 10px;
}

.profile-container .profile p {
	margin-bottom: 10px;
}

.profile-container .profile:nth-child(1) {
	border-right: 1px solid #ddd;
}

.report-button {
	background-color: #ff6b6b;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	margin-top: 10px;
	cursor: pointer;
}

/* 진행상황 start */
.progress-container {
	margin-top: 20px;
	background-color: rgb(254, 247, 246); /* 추가 */
	padding: 24px 20px;/* 추가 */
}

.progress_title {  /* 추가 */
    font-size: 16px;
    font-weight: 700;
    line-height: 24px;
    margin-bottom: 12px
}

.progress-bar-background {
	width: 100%;
	background-color: rgb(34, 34, 34,0.1); /*  #f3f3f3; */
	padding: 5px 0;
	border-radius: 5px;
}

.progress-bar {
	width: 50%;
	height: 10px;
	background-color: #6D6D6D;
	border-radius: 5px;
}

.progress-status {
	display: flex;
	justify-content: space-between;
	margin-top: 5px;
}


.progress-status span {
	/* font-weight: normal; */
    font-size: 14px;
    line-height: 17px
}
.progress_item_description {
    font-size: 13px;
    overflow: hidden;
    word-break: keep-all;
    color: rgba(34, 34, 34, 0.8);
}

.progress-status .completed {
	color: red;
	font-weight: bold;
}
/* 진행상황 end */

.gray-line {
	border: 0;
	height: 1px;
	background-color: #ddd;
	margin-bottom: 20px;
}

.prices {
	padding: 20px;
	margin: 20px 0;

}

/* 모달 */
.modal {
    display: none;
    justify-content: center;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(34, 34, 34, 0.5);
    z-index: 1010;
}

.modal-container {
    position: relative;
    width: 599px;
    height: auto;
    background: #FFFFFF;
    border-radius: 20px;
    padding: 40px 20px;
    box-sizing: border-box;
}

.modal-close {
    position: absolute;
    top: 20px;
    right: 20px;
    width: 24px;
    height: 24px;
    cursor: pointer;
}

.modal-header {
  
    font-weight: 700;
    font-size: 32px;
    color: #000000;
    text-align: center;
    margin-bottom: 40px;
}

.modal-profile {
    display: flex;
    align-items: center;
    margin-bottom: 40px;
}

.modal-profile-image {
    width: 80px;
    height: 80px;
    border-radius: 10px;
    background: url('https://via.placeholder.com/60') no-repeat center center;
    background-size: cover;
    margin-right: 20px;
}


.modal-profile-info .user-type {
    font-weight: 600;
    font-size: 18px;
    color: rgba(0, 0, 0, 0.27);
}

.modal-profile-info .user-id {
    font-weight: 600;
    font-size: 18px;
    color: #000000;
}

.modal-profile-info .user-email {
    font-weight: 400;
    font-size: 14px;
    color: rgba(34, 34, 34, 0.5);
}

.modal-divider {
    width: 100%;
    height: 1px;
    background: #D9D9D9;
    margin: 20px 0;
}

.modal-transaction-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.modal-transaction-info div {
   
    font-weight: 600;
    font-size: 18px;
    color: #D3D3D3;
}

.modal-transaction-info .modal-transaction-id,.modal-transaction-info  .modal-transaction-date {
   
    font-weight: 400;
    font-size: 18px;
    color: #000000;
}

.modal-report-title {
   
    font-weight: 600;
    font-size: 23px;
    color: #000000;
    margin-bottom: 20px;
}

.modal-input-title,
.modal-input-content {
    width: 100%;
    padding: 15px;
    margin-bottom: 20px;
    background: #FAFAFA;
    border: 1px solid #EBEBEB;
    border-radius: 20px;
    
    font-size: 18px;
    color: #D3D3D3;
    box-sizing: border-box;
    resize: none; /* textarea 크기 조절 제거 */
}

.modal-submit-button {
    display: block;
    width: 180px;
    height: 35px;
    margin: 0 auto;
    background: #FFFFFF;
    border: 1px solid #D3D3D3;
    border-radius: 10px;
    text-align: center;
    line-height: 35px;
    cursor: pointer;
    
    font-weight: 400;
    font-size: 16px;
    color: rgba(34, 34, 34, 0.8);
}


</style>
</head>
<body style="margin:0;">
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<!-- side+contents container -->
	<div class="container my">

		<!-- Side Navigation -->
		<%@ include file="../inc/personSideNav.jsp"%>

		<!-- Content Area -->
		<div class="container">

			<!-- Title -->
			<div class="title">거래 상세 보기</div>
			<div class="transaction-id">AB123-CD5678-90</div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="https://via.placeholder.com/80" alt="User Icon">
						<p class="user_type">[개인회원]</p>
						<p class="bold">김땡땡</p>
						<p class="title">자바 백엔드 일자리 구합니다.</p>
						<div class="minmax">
							<span class="bold">희망 최소 연봉</span>
							<div>
								<span> 30만원</span>
								<!-- 수정된 금액 -->
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 연봉</span>
							<div>
								<span> 3000만원</span>
								<!-- 수정된 금액 -->
							</div>
						</div>
						<div class="filter_bind">
							<div class="column">
								<dl>
									<dt>직무</dt>
									<dd>백엔드</dd>
								</dl>
								<dl>
									<dt>경력</dt>
									<dd>신입</dd>
								</dl>
								<dl>
									<dt>학력</dt>
									<dd>대졸</dd>
								</dl>
							</div>
							<div class="column">
								<dl>
									<dt>근무형태</dt>
									<dd>프리랜서</dd>
								</dl>
								<dl>
									<dt>보유기술</dt>
									<dd>JAVA, SQL</dd>
								</dl>
								<dl>
									<dt>자격증</dt>
									<dd>정보처리기사</dd>
								</dl>
								<dl>
									<dt>근무지역</dt>
									<dd>서울, 경기, 인천</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Profile Section -->
			<div class="profile-container">
				<h2>프로필</h2>
				<h	r class="gray-line">
				<div style="display: flex; justify-content: space-between;">
					<!-- 첫 번째 프로필 -->
					<div class="profile">
						<img src="https://via.placeholder.com/80" alt="User Icon">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">구매자이름</p>
						<p>아이디: kgvrfah2</p>
						<p>이메일: kgvrfah2@naver.com</p>
						<p>휴대폰 번호: 010-1111-1111</p>
						<p>주소: 서울특별시 금천구 독산동</p>
					</div>
					<!-- 두 번째 프로필 -->
					<div class="profile">
						<img src="https://via.placeholder.com/80" alt="User Icon">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">판매자이름</p>
						<p>아이디: kgvrfah1</p>
						<p>이메일: kgvrfah1@naver.com</p>
						<p>휴대폰 번호: 010-1111-1111</p>
						<p>주소: 서울특별시 금천구 독산동</p>
						<button class="report-button">블랙리스트 등록</button>
					</div>
				</div>
			</div>


			<!-- Transaction Details -->
			<hr class="gray-line">
			<div class="prices">
				<div class="price_type">
					<p>판매자 판매 희망금액</p>
					<span class="bold">1,000,000,000원</span>
				</div>
				<div class="price_type">
					<p>최종 낙찰 금액</p>
					<span class="final-bid">900,000원</span>
				</div>
			</div>

			<div class="detail_bind" style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">최종 거래일시</span>
					</div>
					<div class="detail_text">24/08/10</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>입찰 시도 횟수</span>
					</div>
					<div class="detail_text">3번</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>낙찰유형</span>
					</div>
					<div class="detail_text" style="color: red;">성공</div>
				</div>
			</div>

			<!-- Bid History -->
			<div class="bid-history">
				<table>
					<thead>
						<tr>
							<th class="table_th">상태</th>
							<th class="table_th">참여자</th>
							<th class="table_th align_right">입찰가</th>
							<th class="table_th align_right">입찰일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="table_td"><span class="status">입찰</span></td>
							<td class="table_td">[기업회원] company1</td>
							<td class="table_td align_right">700,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr>
							<td class="table_td"><span class="status">입찰</span></td>
							<td class="table_td">[기업회원] company2</td>
							<td class="table_td align_right">800,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr>
							<td class="table_td"><span class="status">입찰</span></td>
							<td class="table_td">[기업회원] mycompany</td>
							<td class="table_td align_right">880,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr style="background-color: rgba(128, 128, 128, 0.2);">
							<td class="table_td"><span class="status final-bid">낙찰</span></td>
							<td class="table_td final-bid">[개인회원] company3</td>
							<td class="table_td align_right final-bid">900,000원</td>
							<td class="table_td align_right final-bid">24/04/05</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="progress-container" >
				<p  class="progress_title">진행 상황</p>
				<div class="progress-bar-background">
					<div class="progress-bar"></div>
				</div>
				
				<div class="progress-status">
					<span class="progress_item_title">낙찰 완료</span> 
					<div style="display:flex; flex-direction: column;">
					<span class="progress_item_title">계약서 검토중</span>
					<!-- <a href="#" class="progress_item_description">계약서확인</a> -->
					</div>
					<span class=" progress_item_title completed">계약서 수신 완료</span>
				</div>
			</div>


   <!-- Modal  start-->
    <div class="modal">
        <div class="modal-container">
            <a href="#" class="modal-close">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M20.5 3.1L12 11.6 3.5 3.1 2.1 4.5l8.6 8.5-8.6 8.5 1.4 1.4 8.5-8.6 8.5 8.6 1.4-1.4-8.6-8.5 8.6-8.5z"/>
                </svg>
            </a>
            <div class="modal-header">신고하기</div>
            
            <div class="modal-profile">
                <div class="modal-profile-image"></div>
                <div class="modal-profile-info">
                    <div class="user-type">[개인회원]</div>
                    <div class="user-id">kgvrfah2</div>
                    <div class="user-email">po****@naver.com</div>
                </div>
            </div>
            
            <div class="modal-divider"></div>
            
            <div class="modal-transaction-info">
                <div>거래 내역</div>
                <div>거래 일자</div>
            </div>
            <div class="modal-transaction-info">
                <div class="modal-transaction-id">AB123-CD5678-90</div>
                <div class="modal-transaction-date">24/04/05</div>
            </div>

            <div class="modal-divider"></div>
            
            <div class="modal-report-title">신고 내용</div>
            
            <form>
                <input type="text" class="modal-input-title" placeholder="제목을 입력하세요">
                <textarea class="modal-input-content" style=" min-height:350px;" placeholder="신고 내용을 입력하세요"></textarea>
                <button type="submit" class="modal-submit-button">제출하기</button>
            </form>
        </div>
    </div>

    <script>
        const modal = document.querySelector('.modal');
        const modalCloseButton = document.querySelector('.modal-close');
        const reportButton = document.querySelector('.report-button');

        reportButton.addEventListener('click', function() {
            modal.style.display = 'flex';
        });

        modalCloseButton.addEventListener('click', function() {
            modal.style.display = 'none';
        });
    </script>
<!-- Modal  end-->

		</div>
	</div>
</body>
</html>