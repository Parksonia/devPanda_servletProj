<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>personAuctionSuc</title>
<!-- 개인,기업|구매내역조회|입찰내역조회|입찰진행중|상세보기 -->

<style>
.container {
	padding: 0px 20px 20px 20px;
	border-radius: 10px;
	margin: 0 50px 50px 50px;
}

.title {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.transaction-id {
	text-align: center;
	color: #aaa;
	margin-bottom: 20px;
}

.user-info-container {
	background-color: #f9f9f9;
	border-radius: 30px;
	padding: 20px;
	margin-bottom: 20px;
}

.user-info {
	width: 100%;
	height: auto;
}


.user-info .user {
	/* width: 48%; */
	text-align: center;
	line-height: 30px;
}

.user_type {
	color: #cccccc; /* 수정 */
	font-size: 18px;
	font-weight: 400;
}

.user img {
	width: 80px;
	height: 80px;
	border-radius: 10px; /* 수정 */
	margin-bottom: 10px;
	margin-top: 10px;
}

/* .user p 삭제 */
.bold {
	font-weight: bold;
}

.minmax {
	padding: 0;
	width: 30%;
	text-align: left;
	display: flex;
	justify-content: space-between;
}

.filter_bind {
	display: flex;
	justify-content: space-between;
	padding-top: 10px;
	border-top: 1px solid #ddd;
	margin-top: 20px;
	font-size: 14px;
	position: relative;
}

.filter_bind  .column {
	width: 48%;
}

.filter_bind  dl {
	display: flex;
	margin: 10px 0;
	align-items: center; /* dt와 dd를 수직 정렬 */
}

.filter_bind  dt {
	font-weight: bold;
	color: #555;
	flex-shrink: 0; /* dt의 크기를 고정하여 공백 문제 해결 */
	margin-right: 10px; /* dt와 dd 사이의 간격 */
	white-space: nowrap; /* dt가 줄 바꿈 없이 한 줄로 유지되도록 설정 */
}

.filter_bind  dd {
	margin: 0;
	color: #2D65F2;
	text-align: right; /* dd의 텍스트를 오른쪽 정렬 */
	flex-grow: 1; /* dd가 남은 공간을 채우도록 설정 */
}

.user .quote {
	color: #666;
	font-size: 14px;
}

/*  price start */
.prices {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	align-items: center;
}

.prices .price_type {
	flex: 1;
	text-align: center;
	line-height: 30px;
	position: relative;
}

/* 첫 번째 price_type에는 :before를 추가하지 않음 */
.prices .price_type:not(:first-child):before {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	width: 1px;
	height: 100%;
	background-color: #ddd;
}

/* 세 번째 price_type에는 :after를 추가하지 않음 */
.prices .price_type:not(:last-child):after {
	content: "";
	position: absolute;
	right: 0;
	top: 0;
	width: 1px;
	height: 100%;
	background-color: #ddd;
}

.price_type>p {
	font-size: 18px;
	color: #22222280;
}

.price_type>span {
	font-size: 26px;
}

/*  price end */

/* button start  */

.button-container {
	display: flex;
	justify-content: space-around;
	margin: 40px;
}

.button-wrapper {
	box-sizing: border-box;
	position: relative;
	width: 266px;
	height: 100px;
	background: #FF7575;
	border: 1px solid #D3D3D3;
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* 첫 번째 버튼 래퍼에만 적용될 스타일 */
.button-wrapper.white-background {
	background: #FFFFFF;
}

.custom-button {

	background: none;
	border: none;
	color: white;
	font-size: 24px;
	cursor: pointer;
	width: 100%;
	height: 100%;
	border-radius: 10px;
}

/* 첫 번째 버튼에만 적용될 스타일 */
.custom-button.black-text {
	color: black;
}

.custom-button:hover {
	/* background: rgba(255, 255, 255, 0.3); */
	background: rgba(0, 0, 0, 0.1);
}

/* button end */


.final-bid {
	color: red;
	font-weight: bold;
}

/* 추가 */
.detail_bind {
	border-top: 1px solid black;
	font-size: 14px;
	padding: 10px;
	margin-bottom: 20px;
}

.detail_addition {
	align-items: center;
	display: flex;
	font-size: 13px;
	justify-content: space-between;
	min-height: 20px;
}

.detail_addition+.detail_addition {
	margin-top: 10px;
}

.detail_title {
	color: #22222280;
}

.detail_text {
	color: #222;
	font-size: 14px;
	letter-spacing: -.21px;
	text-align: right;
	white-space: nowrap;
}

.line-separator {
	border-top: 1px solid #ddd;
	margin: 20px 0;
}

.bid-history {
	margin-bottom: 20px;
}

.bid-history table {
	width: 100%;
	border: 0;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.table_th {
	border-bottom: 1px solid #ebebeb;
	color: rgba(34, 34, 34, .5);
	font-size: 16px;
	font-weight: 400;
	letter-spacing: -.06px;
	line-height: 14px;
	padding: 10px;
	text-align: left
}

.align_right {
	text-align: right
}

.table_td {
	padding: 10px;
	border-bottom: 1px solid #f0f0f0;
	/* 추가 */
	font-size: 14px;
	line-height: 17px;
	padding-top: 9px;
}

.bid-history .final-bid {
	color: red;
	font-weight: bold;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 15px;
    width: 599px;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
.modal-header {

    font-weight: 700;
    font-size: 32px;
    color: #000000;
    text-align: center;
    margin-bottom: 40px;
}



.modal .price-info {
    margin: 10px 0;
    font-size: 16px;
    display: flex;
    justify-content: space-between;
    padding: 0 10px;
}

.modal .register-bid {
    margin: 40px 0;
}

.modal .register-bid input[type="text"] {
    font-size: 22px;
    padding: 8px;
    width: calc(100% - 20px);
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    text-align: right;
}

.modal .register-bid input[type="text"]:focus {
    outline: none;
    border-color: #ccc;
}

.modal .register-bid button {
	height:35px;
    background-color: #ff6b6b;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
}

.modal .register-bid button:hover {
    background-color: #ff5252;
}

.modal .info-text {
    font-size: 12px;
    color: #777;
}

.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>

</head>
<body>
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<!-- side+contents container  -->
	<div class="container my">

	<%@ include file="../inc/comSideNav.jsp"%>
		<!--personAuctionSuc Start  -->
		<div class="container">
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


			<div class="prices">
				<div class="price_type">
					<p>즉시 구매가</p>
					<span class="bold">1,000,000,000원</span>
				</div>
				<div class="price_type">
					<p>현재 최고 입찰가</p>
					<span class="final-bid">900,000원</span>
				</div>
				<div class="price_type">
					<p>내 입찰 금액</p>
					<span class="extra-info final-bid">900,000원</span>
				</div>
			</div>

			<div class="button-container">
				<div class="button-wrapper white-background">
					<button class="custom-button black-text open-modal-btn">입찰 변경하기</button>
				</div>
				<div class="button-wrapper">
					<button class="custom-button open-modal-btn">즉시 구매하기</button>
				</div>
			</div>


			<div class="detail_bind" style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span>경매 종료일</span>
					</div>
					<div class="detail_text">24/08/10</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>남은 기간</span>
					</div>
					<div class="detail_text">d-5</div>
				</div>
			</div>




			<div class="bid-history">
				<table>
					<thead>
						<tr>
							<th class="table_th">참여자</th>
							<th class="table_th align_right">입찰가</th>
							<th class="table_th align_right">입찰일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="table_td">[기업회원] kgvrfah2</td>
							<td class="table_td align_right">700,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr>
							<td class="table_td">[기업회원] kgvrfah2</td>
							<td class="table_td align_right">800,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr>
							<td class="table_td">[기업회원] kgvrfah2</td>
							<td class="table_td align_right">880,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr>
							<td class="table_td final-bid">[기업회원] kgvrfah2</td>
							<td class="table_td align_right final-bid">900,000원</td>
							<td class="table_td align_right final-bid">24/04/05</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>

	<!-- Modal structure -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
         	<div class="modal-header">입찰 금액 변경</div>
            <div class="price-info">
                <span>나의 입찰가</span>
                <span>800,000원</span>
            </div>
            <div class="price-info">
                <span>현재 최고 입찰가</span>
                <span class="final-bid">900,000원</span>
            </div>
            <div class="register-bid">
                <input type="text" placeholder="가격을 입력해주세요">
            </div>
            <div class="info-text">새로운 가격으로 등록합니다</div>
            <div class="register-bid">
                <button>등록하기</button>
            </div>
        </div>
    </div>

    <script>
        var modal = document.getElementById("myModal");
        var btns = document.querySelectorAll(".open-modal-btn");
        var span = document.querySelector(".modal .close");
        btns.forEach(function(btn) {
            btn.onclick = function() {
                modal.style.display = "flex";
            }
        });
        span.onclick = function() {
            modal.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

</body>
</html>
