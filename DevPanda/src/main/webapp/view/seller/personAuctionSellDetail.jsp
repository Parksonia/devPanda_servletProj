<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 개인, 기업|판매내역조회|경매등록내역조회|상세보기 -->
<link href="${pageContext.request.contextPath}/css/details.css" rel="stylesheet">
<style>
.bid-history >h3{
    margin: 20%;
    text-align: center;
}
</style>
</head>
<body style="margin:0;">
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>	
	<!-- Header End-->

	<!-- side+contents container  -->
	<div class="container my">

	<%@ include file="../inc/personSideNav.jsp"%>

		<!--personAuctionSuc Start  -->
		<div class="container">
			<div class="title">거래 상세 보기</div>
			<div class="transaction-id">AB123-CD5678-90</div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="../img/woman.jpg" alt="User Icon">
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
					<span class="final-bid">-</span>
				</div>
			</div>


			<div class="detail_bind" style="background-color: rgb(250, 250, 250); margin-bottom: 0px;">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">경매 종료일</span>
					</div>
					<div class="detail_text" style="font-weight: bold;">24/08/10</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>남은 기간</span>
					</div>
					<div class="detail_text">D-5</div>
				</div>
			</div>


			<div class="bid-history">
			<h3>구매자가 존재하지 않습니다. </h3>
			<!-- 	<table>
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
						<tr style="background-color: rgba(128, 128, 128, 0.2);">
							<td class="table_td"><span class="status">입찰</span></td>
							<td class="table_td">[기업회원] mycompany</td>
							<td class="table_td align_right">880,000원</td>
							<td class="table_td align_right">24/04/04</td>
						</tr>
						<tr>
							<td class="table_td"><span class="status final-bid">낙찰</span></td>
							<td class="table_td final-bid">[개인회원] company3</td>
							<td class="table_td align_right final-bid">900,000원</td>
							<td class="table_td align_right final-bid">24/04/05</td>
						</tr>
					</tbody>
				</table> -->
			</div>

		</div>
	</div>
</body>
</html>