<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 개인, 기업|판매내역조회|경매등록내역조회|상세보기 -->
<link href="${pageContext.request.contextPath}/css/details.css"	rel="stylesheet">
<style>
.bid-history>h3 {
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

			<!-- title -->
			<div class="title">거래 상세 보기</div>
			<div class="transaction-id">AB123-CD5678-${auctionNum }</div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="image?file=${sellerImage}" alt="SellerImg">
						<p class="user_type">[개인회원]</p>
						<p class="bold">${sellerId }</p>
						<p class="title">${auction.title }</p>
						<div class="minmax">
							<span class="bold">희망 최소 금액</span>
							<div>
								<span><fmt:formatNumber value="${auction.minSalary }"
										type="Number" />원</span>
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 금액</span>
							<div>
								<span><fmt:formatNumber value="${auction.maxSalary }"
										type="Number" />원</span>
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


			<div class="prices">
				<div class="price_type">
					<p>즉시 구매가</p>
					<span class="bold"><fmt:formatNumber
							value="${auction.maxSalary }" type="Number" />원</span>
				</div>
				<div class="price_type">
					<p>현재 최고 입찰가</p>
					<span class="final-bid"><fmt:formatNumber
							value="${auction.bidMaxPrice }" type="Number" />원</span>
				</div>
			</div>


			<div class="detail_bind"
				style="background-color: rgb(250, 250, 250); margin-bottom: 0px;">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">경매 종료일</span>
					</div>
					<div class="detail_text" style="font-weight: bold;">${auction.endDate }</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>남은 기간</span>
					</div>
					<c:if test="${dDays>=0}">
						<div class="detail_text">D&nbsp;&nbsp;-&nbsp;&nbsp;${dDays}일&nbsp;&nbsp;${dHours}시간&nbsp;&nbsp;${dMinutes}분</div>
					</c:if>
					<c:if test="${dDays<0}">
						<div class="detail_text">종료</div>
					</c:if>
				</div>
			</div>

			<!-- Bid History -->
			<div class="bid-history">
				<c:choose>
					<c:when test="${empty allBuyers }">
						<h3>입찰 정보가 존재하지 않습니다.</h3>
					</c:when>
					<c:otherwise>
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
								<c:forEach items="${allBuyers }" var="buyer">
									<c:choose>
										<c:when test="${buyer.bidState == 2 || buyer.bidState == 3 }">
											<tr style="background-color: rgba(128, 128, 128, 0.2);">
												<td class="table_td"><span class="status final-bid">낙찰</span></td>
												<td class="table_td">[${buyer.memType == 'C' ? '기업' : '개인'}회원]
													${buyer.memType == 'C' ? buyer.buyerId : buyer.buyPersonId}</td>
												<td class="table_td align_right"><fmt:formatNumber
														value="${buyer.bidPrice }" type="number" />원</td>
												<td class="table_td align_right">${buyer.bidDate }</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="table_td"><span class="status">입찰</span></td>
												<td class="table_td">[${buyer.memType == 'C' ? '기업' : '개인'}회원]
													${buyer.memType == 'C' ? buyer.buyerId : buyer.buyPersonId }</td>
												<td class="table_td align_right"><fmt:formatNumber
														value="${buyer.bidPrice }" type="number" />원</td>
												<td class="table_td align_right">${buyer.bidDate }</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			
			
			
		</div>
	</div>
</body>
</html>