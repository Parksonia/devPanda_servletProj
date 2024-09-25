<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 기업|구매내역조회|낙찰내역조회| 상세보기 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/details.css">

<style>
.report-button:hover {
	background-color: #ff4c4c; /* 호버 시 더 진한 빨간색 */
}

/* 진행상황 start */
.progress-container {
	margin-top: 20px;
	background-color: #f6f8fe;
	padding: 24px 20px; /* 추가 */
}

.progress-bar {
	width: 50%;
	height: 10px;
	background-color: #6D6D6D;
	border-radius: 5px;
}

.modal-profile-image {
	width: 80px;
	height: 80px;
	border-radius: 10px;
	background: url('https://via.placeholder.com/60') no-repeat center
		center;
	background-size: cover;
	margin-right: 20px;
}

.modal-submit-button:hover { /* @@@@@@@추가 */
	background: #ff6b6b;
	color: #FFFFFF;
	transform: scale(1.05);
}

.modal-submit-button:active { /* @@@@@@@추가 */
	background-color: #D3D3D3;
	transform: scale(0.95);
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
/*모달end */
</style>
</head>
<body style="margin:0;">

	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<!-- side+contents container -->
	<div class="container my">

		<!-- Side Navigation -->
		<%@ include file="../inc/comSideNav.jsp"%>

		<!-- Content Area -->
		<div class="container">

			<!-- Title -->
			<div class="title">거래 상세 보기</div>
			<div class="transaction-id"><b>A-No ${auction.auctionNum}</b></div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="image?file=${person.personImage}" alt="User Icon">
						<p class="user_type">[개인회원]</p>
						<p class="bold">${person.nickName}</p>
						<p class="title">${auction.title}</p>
						<div class="minmax">
							<span class="bold">희망 최소 연봉</span>
							<div>
								<span> <fmt:formatNumber value="${auction.minSalary}"
										type="number" pattern="#,###" />원
								</span>
								<!-- 수정된 금액 -->
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 연봉</span>
							<div>

								<span> <fmt:formatNumber value="${auction.maxSalary}"
										type="number" pattern="#,###" />원
								</span>

							</div>
						</div>
						<div class="filter_bind">
							<div class="column">
								<dl>
									<dt>직무</dt>
									<dd>${!empty auction.occupation ? auction.occupation : "-"}</dd>
								</dl>
								<dl>
									<dt>경력</dt>
									<dd>${!empty auction.period ? auction.period: "-"}</dd>
								</dl>
								<dl>
									<dt>학력</dt>
									<dd>${!empty auction.education ? auction.education : "-"}</dd>
								</dl>
							</div>
							<div class="column">
								<dl>
									<dt>근무형태</dt>
									<dd>${!empty auction.employmentType ? auction.employmentType : "-"}</dd>
								</dl>
								<dl>
									<dt>보유기술</dt>
									<dd>${!empty auction.stack ? auction.stack : "-"}</dd>
								</dl>
								<dl>
									<dt>자격증</dt>
									<dd>${!empty auction.certification ? auction.certification : "-"}</dd>
								</dl>
								<dl>
									<dt>근무지역</dt>
									<dd>${!empty auction.location ? auction.location : "-" }</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Profile Section -->
			<div class="profile-container">
				<h2>프로필</h2>
				<hr class="gray-line">
				<div style="display: flex; justify-content: space-between;">
					<!-- 구매자 프로필(Company) -->
					<div class="profile">
						<img src="image?file=${company.companyImage}" alt="User Icon">
						<p style="color: #888; font-weight: bold;">[기업회원]</p>
						<p style="font-weight: bold;">${company.name}</p>
						<p>아이디: ${company.id}</p>
						<p>이메일: ${company.email}</p>
						<p>주소: ${company.address}</p>
					</div>
					<!-- 판매자 프로필(Person) -->
					<div class="profile">
						<img src="image?file=${person.personImage}" alt="User Icon">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">${person.nickName}</p>
						<p>아이디: ${person.id}</p>
						<p>이메일: ${person.email}</p>
						<p>주소: ${person.address}</p>
						<c:choose>
							<c:when test="${isAlreadyReported}">
								<button class="report-button" disabled
									style="background-color: #ccc; cursor: not-allowed;">이미
									신고됨</button>
							</c:when>
							<c:otherwise>
								<button class="report-button">블랙리스트 등록</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>


			<!-- Transaction Details -->
			<hr class="gray-line">
			<div class="prices">
				<div class="price_type">
					<p>판매자 판매 희망금액</p>
					<span class="bold"> <fmt:formatNumber
							value="${auction.maxSalary}" type="number" pattern="#,###" />원
					</span>
				</div>
				<div class="price_type">
					<p>최종 낙찰 금액</p>
					<span class="final-bid"><fmt:formatNumber
							value="${transaction.price}" type="number" pattern="#,###" />원</span>
				</div>
			</div>

			<div class="detail_bind"
				style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">최종 거래일시</span>
					</div>
					<div class="detail_text">${transaction.date}</div>
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
						<c:forEach var="buyer" items="${allBuyer}">
							<tr
								<c:if test="${buyer.bidState == 2 or buyer.bidState == 3}">style="background-color: rgba(128, 128, 128, 0.2);" </c:if>>
								<!-- 입찰 상태 -->
								<td class="table_td"><span class="status"> <c:out
											value="${(buyer.bidState == 2 or buyer.bidState == 3) ? '낙찰' : '입찰'}" />
								</span></td>
								<!-- 구매자 ID (기업회원 또는 개인회원 구분) -->
								<td class="table_td"><c:choose>
										<c:when test="${not empty buyer.buyerId}">
                            [기업회원] <c:out value="${buyer.buyerId}" />
										</c:when>
										<c:otherwise>
                            [개인회원] <c:out value="${buyer.buyPersonId}" />
										</c:otherwise>
									</c:choose></td>
								<!-- 입찰 가격 -->
								<td class="table_td align_right"><fmt:formatNumber
										value="${buyer.bidPrice}" type="number" pattern="#,###" />원</td>
								<!-- 입찰 날짜 -->
								<td class="table_td align_right"><c:out
										value="${buyer.bidDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="progress-container">
				<p class="progress_title">진행 상황</p>
				<div class="progress-bar-background">
					<div class="progress-bar"></div>
				</div>

				<div class="progress-status">
					<span class="progress_item_title">낙찰 완료</span>
					<div style="display: flex; flex-direction: column;">
						<span class="progress_item_title">계약서 검토중</span>
					</div>
					<span class=" progress_item_title completed">계약 완료</span>
				</div>
			</div>


			<!-- Modal  start-->
			<div class="modal">
				<div class="modal-container">
					<a href="#" class="modal-close"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24">
                    <path
								d="M20.5 3.1L12 11.6 3.5 3.1 2.1 4.5l8.6 8.5-8.6 8.5 1.4 1.4 8.5-8.6 8.5 8.6 1.4-1.4-8.6-8.5 8.6-8.5z" />
                </svg>
					</a>
					<div class="modal-header">신고하기</div>

					<div class="modal-profile">
						<div class="modal-profile-image"></div>
						<div class="modal-profile-info">
							<div class="user-type">[개인회원]</div>
							<div class="user-id">${person.nickName}</div>
							<div class="user-email">${person.email}</div>
						</div>
					</div>

					<div class="modal-divider"></div>

					<div class="modal-transaction-info">
						<div>거래 내역</div>
						<div>거래 일자</div>
					</div>
					<div class="modal-transaction-info">
						<div class="modal-transaction-id">T-No ${transaction.transactionNum}</div>
						<div class="modal-transaction-date">${transaction.date}</div>
					</div>

					<div class="modal-divider"></div>

					<div class="modal-report-title">신고 내용</div>

					<form
						action="${pageContext.request.contextPath}/sellerCompanyBlack"
						method="post">
						<input type="hidden" name="auctionNum"
							value="${transaction.auctionNum}"> <input type="text"
							class="modal-input-title" name="title" placeholder="제목을 입력하세요"
							required>
						<textarea name="content" class="modal-input-content"
							style="min-height: 350px;" placeholder="신고 내용을 입력하세요" required></textarea>
						<button type="submit" class="modal-submit-button">제출하기</button>
					</form>


				</div>
			</div>

			<script>
				$(document)
						.ready(
								function() { //ajax 요청 보내기
									$('form')
											.on(
													'submit',
													function(event) {
														event.preventDefault();
														$
																.ajax({
																	url : "${pageContext.request.contextPath}/sellerCompanyBlack",
																	type : "POST",
																	data : {
																		auctionNum : $(
																				'input[name="auctionNum"]')
																				.val(),
																		title : $(
																				'input[name="title"]')
																				.val(),
																		content : $(
																				'textarea[name="content"]')
																				.val()
																	},
																	success : function(
																			response) {
																		$(
																				'.modal')
																				.hide();
																		$(
																				'.report-button')
																				.text(
																						'신고 됨')
																				// 텍스트 변경
																				.css(
																						{
																							'border' : '2px solid red',
																							'color' : 'red',
																							'background-color' : '#fff'
																						})
																				.prop(
																						'disabled',
																						true);
																	},
																	error : function(
																			xhr,
																			status,
																			error) {
																		console
																				.log(
																						"오류 :",
																						status,
																						error); // 에러 발생 시 메시지 출력
																	}
																});
													});
								});

				document
						.addEventListener(
								"DOMContentLoaded",
								function() { //모달 여는 스크립트 수정!
									const modal = document
											.querySelector('.modal');
									const modalCloseButton = document
											.querySelector('.modal-close');
									const reportButton = document
											.querySelector('.report-button');
									const titleInput = document
											.querySelector('input[name="title"]');
									const contentTextarea = document
											.querySelector('textarea[name="content"]');

									reportButton.addEventListener('click',
											function() { // 모달 열기
												modal.style.display = 'flex';
											});

									modalCloseButton
											.addEventListener(
													'click',
													function(event) { // 모달 닫을 때 경고 메시지
														if (titleInput.value !== ""
																|| contentTextarea.value !== "") {
															const confirmation = confirm("작성 중인 내용이 있습니다. 창을 닫으시겠습니까?");
															if (!confirmation) {
																event
																		.preventDefault();
																return;
															}
														}
														modal.style.display = 'none';
													});

									window
											.addEventListener(
													'click',
													function(event) { // 클릭이 발생할 때 모달 밖을 누를 경우 경고 메시지
														if (event.target == modal) {
															if (titleInput.value !== ""
																	|| contentTextarea.value !== "") {
																const confirmation = confirm("작성 중인 내용이 있습니다. 창을 닫으시겠습니까?");
																if (!confirmation) {
																	event
																			.preventDefault();
																	return;
																}
															}
															modal.style.display = 'none';
														}
													});

									titleInput
											.addEventListener(
													"invalid",
													function() { // 신고 title, content 값 비어 있을 때 작동할 메시지
														if (titleInput.value === "") {
															titleInput
																	.setCustomValidity("제목을 입력해주세요.");
														} else {
															titleInput
																	.setCustomValidity(""); // 기본 메시지 초기화
														}
													});

									contentTextarea
											.addEventListener(
													"invalid",
													function() {
														if (contentTextarea.value === "") {
															contentTextarea
																	.setCustomValidity("신고내용을 입력해주세요.");
														} else {
															contentTextarea
																	.setCustomValidity("");
														}
													});

									titleInput.addEventListener("input",
											function() { // 입력이 발생할 때마다 유효성 검사 메시지 초기화
												titleInput
														.setCustomValidity("");
											});

									contentTextarea.addEventListener("input",
											function() {
												contentTextarea
														.setCustomValidity("");
											});
								});
			</script>
		</div>
	</div>

</body>
</html>