<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!-- List, dto 임포트 -->
<%@ page import="dto.Transaction"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Buy Transaction List</title>
<!-- 기업|구매내역조회|낙찰내역조회-->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style>
.container.my .content_area {
	min-height: 380px;
}

.container {
	background-color: #fff;
	padding: 0px 20px 20px 20px;
	border-radius: 10px;
	box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);
}

.my_bidlist {
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

.title>h3, h2 {
	font-size: inherit;
	line-height: 29px
}

.list_header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.list_header input {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	width: 60%;
}

.list_header select, .header button {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.searchBtn {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.filters {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
	margin-top: 20px;
}

.filters button {
	flex: 1;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	background-color: #f0f0f0;
	cursor: pointer;
}

button {
	width: 200px; /* 여기 수정함@@@@@@@@@@@@@@ */
	height: 40px;
	padding: 10px 20px;
	font-size: 16px;
	box-sizing: border-box;
}

.filters button:hover {
	background-color: #e0e0e0;
}

.item_container {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.item {
	display: flex;
	align-items: center;
	position: relative;
	margin-left: 20px;
}

.item span {
	font-size: 14px;
	font-weight: bold;
	margin-right: 5px;
	margin-bottom: 10px;
}

.history-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 10px;
	background-color: #fafafa;
	transition: transform 0.3s ease, background-color 0.3s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transform-origin: center; /* 확대될 때 중심을 기준으로 확대되도록 설정 */
}

.history-item:hover {
	background-color: #f5f5f5;
	transform: scale(1.02);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* 확대 효과에 따른 그림자 */
}

.history-item img {
	border-radius: 10px;
	width: 80px;
	height: 80px;
	margin-right: 10px;
}

.history-content {
	margin-left: 20px;
	display: flex;
	flex-direction: column;
	flex: 1;
}

.history-content .tags { /* java 경력7년이상 백엔드개발 */
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.history-content .tags span {
	padding: 5px 10px;
	background-color: #e0e0e0;
	border-radius: 20px;
	font-size: 12px;
}

.prices {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 20px;
}

.prices span {
	font-size: 14px;
	font-weight: bold;
}

.pagination {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 20px;
}

.pagination a {
	text-decoration: none;
	color: blue;
}
</style>
</head>
<body>
	<%@ page import="dto.Transaction"%>
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<div class="container my">
		<%@ include file="../inc/comSideNav.jsp"%>

		<!-- list 정보 start -->
		<div class="content_area my-page-content">
			<div class="my_bidlist">

				<div class="content_title border">
					<div class="title">
						<h2>낙찰 내역</h2>
					</div>
				</div>


				<!-- 필터 -->
				<div class="filters">
					<form id="SearchMonth"
						action="${pageContext.request.contextPath}/CompanyBuyBidSucList"
						method="GET">
						<input type="hidden" name="companyId" value="comp001">
						<!-- startDate와 endDate 필드를 숨김으로써 서버로 전송 -->
						<input type="hidden" id="startDate" name="startDate"> <input
							type="hidden" id="endDate" name="endDate">

						<!-- 버튼을 클릭하면 각 기간에 맞는 날짜 범위를 서버로 전송 -->
						<button type="button" id="oneMonthBtn">최근 1개월</button>
						<button type="button" id="threeMonthBtn">최근 3개월</button>
						<button type="button" id="sixMonthBtn">최근 6개월</button>
					</form>

					<!-- 날짜 범위 선택기 -->
					<input type="text" name="daterange" value="" placeholder="날짜 범위 선택" />
					<script>
						$(function() {
							$('input[name="daterange"]')
									.daterangepicker(
											{
												opens : 'left',
												autoUpdateInput : false
											},
											function(start, end) {
												// 선택된 날짜 범위를 hidden input에 설정
												document
														.getElementById('startDate').value = start
														.format('YYYY-MM-DD');
												document
														.getElementById('endDate').value = end
														.format('YYYY-MM-DD');

												// 선택한 날짜 범위로 폼을 자동으로 제출
												document.getElementById(
														'SearchMonth').submit();
											});
						});

						// 날짜 형식을 yyyy-mm-dd로 변환하는 함수
						function formatDate(date) {
							let year = date.getFullYear();
							let month = ('0' + (date.getMonth() + 1)).slice(-2);
							let day = ('0' + date.getDate()).slice(-2);
							return year + '-' + month + '-' + day;
						}

						// 기간을 계산하는 함수
						function calculateDateRange(months) {
							const today = new Date();
							const pastDate = new Date();
							pastDate.setMonth(today.getMonth() - months);

							return {
								startDate : formatDate(pastDate),
								endDate : formatDate(today)
							};
						}

						// 버튼을 클릭했을 때 호출될 함수
						function sendDateRange(months) {
							const dateRange = calculateDateRange(months);
							document.getElementById('startDate').value = dateRange.startDate;
							document.getElementById('endDate').value = dateRange.endDate;

							// 폼 제출
							document.getElementById('SearchMonth').submit();
						}

						// 버튼 클릭 이벤트 리스너
						document.getElementById('oneMonthBtn')
								.addEventListener('click', function() {
									sendDateRange(1); // 최근 1개월
								});

						document.getElementById('threeMonthBtn')
								.addEventListener('click', function() {
									sendDateRange(3); // 최근 3개월
								});

						document.getElementById('sixMonthBtn')
								.addEventListener('click', function() {
									sendDateRange(6); // 최근 6개월
								});
					</script>

					<!-- 조회 눌렀을 때 서블릿 실행 -->
					<form
						action="${pageContext.request.contextPath}/CompanyBuyBidSucList"
						method="GET">
						<input type="hidden" name="companyId" value="comp001">
						<button type="submit">조회</button>
					</form>
				</div>


				<div class="item_container">
					<div class="item">
						<span>판매 희망가 &nbsp;&nbsp;&nbsp;</span>
					</div>

					<div class="item">
						<span>최종낙찰가 &nbsp;&nbsp;&nbsp;</span>
					</div>

					<div class="item">
						<span>거래일 &nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>



				<!-- 목록들 나열 -->
				<c:forEach var="transaction" items="${transactionList}">
					<a
						href="${pageContext.request.contextPath}/CompanyAuctionBuyerSuc?auctionNum=${transaction.auctionNum}"
						style="text-decoration: none; color: inherit;">
						<div class="history-item"
							data-auction-num="${transaction.auctionNum}">
							<img src="https://via.placeholder.com/50" alt="User">
							<div class="history-content">
								<span>${transaction.auctionTitle}</span>
							</div>
							<div class="prices">
								<span> <fmt:formatNumber value="${transaction.maxSalary}"
										type="number" pattern="#,###" />원
								</span>

								<!-- price에 3자리 콤마 추가 -->
								<span> <fmt:formatNumber value="${transaction.price}"
										type="number" pattern="#,###" />원
								</span> <span>${transaction.date}</span>
							</div>
						</div>
					</a>
				</c:forEach>


				<!-- pagination end -->
			</div>
		</div>
	</div>
	<script>
		/* 리스트 눌렀을 때 서블릿 호출 */
		/*     const linkOpen = document.querySelectorAll('.history-item');
		 linkOpen.forEach(item => {
		 item.addEventListener('click', function() {
		 // 각 history-item에서 auctionNum 값 가져오기
		 const auctionNum = this.getAttribute('data-auction-num');
		
		 // auctionNum을 URL에 포함해서 서블릿으로 이동
		 window.location.href = `${pageContext.request.contextPath}/CompanyAuctionBuyerSuc?auctionNum=${auctionNum}`;
		 });
		 });
		 */
	</script>

	<!-- <script>
		// 날짜 형식을 yyyy-mm-dd로 변환하는 함수
		function formatDate(date) {
			let year = date.getFullYear();
			let month = ('0' + (date.getMonth() + 1)).slice(-2);
			let day = ('0' + date.getDate()).slice(-2);
			return year + '-' + month + '-' + day;
		}

		// 기간을 계산하는 함수
		function calculateDateRange(months) {
			const today = new Date();
			const pastDate = new Date();
			pastDate.setMonth(today.getMonth() - months);

			return {
				startDate : formatDate(pastDate),
				endDate : formatDate(today)
			};
		}

		// 버튼을 클릭했을 때 호출될 함수
		function sendDateRange(months) {
			const form = document.getElementById('SearchMonth'); // 폼 ID가 맞는지 확인
			if (form) {
				document.getElementById('startDate').value = '2023-09-01'; // 예시로 입력한 날짜 값
				document.getElementById('endDate').value = '2023-09-30'; // 예시로 입력한 날짜 값
				form.submit(); // 폼을 제출
			} else {
				console.error('폼을 찾을 수 없습니다');
			}
		}

		// 버튼 클릭 이벤트
		document.getElementById('oneMonthBtn').addEventListener('click',
				function() {
					sendDateRange(1); // 1개월
				});

		document.getElementById('threeMonthBtn').addEventListener('click',
				function() {
					sendDateRange(3); // 3개월
				});

		document.getElementById('sixMonthBtn').addEventListener('click',
				function() {
					sendDateRange(6); // 6개월
				});
	</script> -->

</body>
</html>
