<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 개인|판매내역조회|낙찰내역조회|거래성공 |상세보기 -->
<link href="${pageContext.request.contextPath }/css/details.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/personAuctionSellerSuc.css" rel="stylesheet">
</head>
<body>
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
			<div class="transaction-id">AB123-CD5678-${auctionNum }</div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="https://via.placeholder.com/80" alt="User Icon">
						<p class="user_type">[개인회원]</p>
						<p class="bold">${auction.id }</p>
						<p class="title">${auction.title }</p>
						<div class="minmax">
							<span class="bold">희망 최소 연봉</span>
							<div>
								<span><fmt:formatNumber value="${auction.minSalary}" type="number" />원</span>
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 연봉</span>
							<div>
								<span><fmt:formatNumber value="${auction.maxSalary}" type="number" />원</span>
							</div>
						</div>
						<div class="filter_bind">
							<div class="column">
								<dl>
									<dt>직무</dt>
									<dd></dd>
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
				<hr class="gray-line">
				<div style="display: flex; justify-content: space-between;">
					<!-- 첫 번째 프로필 -->
					<div class="profile">
						<img src="https://via.placeholder.com/80" alt="User Icon">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">구매자이름</p>
						<p>아이디: kgvrfah2</p>
						<p>이메일: kgvrfah2@naver.com</p>
						<p>주소: 서울특별시 금천구 독산동</p>
						<button class="report-button">블랙리스트 등록</button>
					</div>
					<!-- 두 번째 프로필 -->
					<div class="profile">
						<img src="https://via.placeholder.com/80" alt="User Icon">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">판매자이름</p>
						<p>아이디: kgvrfah1</p>
						<p>이메일: kgvrfah1@naver.com</p>
						<p>주소: 서울특별시 금천구 독산동</p>
					</div>
				</div>
			</div>


			<!-- Transaction Details -->
			<hr class="gray-line">
			<div class="prices">
				<div class="price_type">
					<p>나의 판매 희망금액</p>
					<span class="bold">1,000,000,000원</span>
				</div>
				<div class="price_type">
					<p>최종 낙찰 금액</p>
					<span class="final-bid">900,000원</span>
				</div>
			</div>

			<div class="detail_bind"
				style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">최종 거래일시</span>
					</div>
					<div class="detail_text">24/08/10</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>낙찰 유형</span>
					</div>
					<div class="detail_text">기간 종료</div>
				</div>
				<!-- 	<div class="detail_addition">
					<div class="detail_title">
						<span>낙찰유형</span>
					</div>
					<div class="detail_text" style="color: red;">성공</div>
				</div> -->
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

			<div class="progress-container">
				<p class="progress_title">진행 상황</p>
				<div class="progress-bar-background">
					<div class="progress-bar"></div>
				</div>

				<div class="progress-status">
					<span class="progress_item_title">낙찰 완료</span>
					<div style="display: flex; flex-direction: column;">
						<span class="progress_item_title">계약서 검토중</span> <a href="#"
							class="progress_item_description">메일보내기</a>
					</div>
					<span class=" progress_item_title completed">계약서 전송 완료</span>
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
						<input type="text" class="modal-input-title"
							placeholder="제목을 입력하세요">
						<textarea class="modal-input-content" style="min-height: 350px;"
							placeholder="신고 내용을 입력하세요"></textarea>
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