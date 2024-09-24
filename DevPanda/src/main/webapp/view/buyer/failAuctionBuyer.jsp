<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 개인,기업|구매내역조회|입찰내역조회|입찰 거래실패 |상세보기 -->
<link href="${pageContext.request.contextPath}/css/details.css" rel="stylesheet">
</head>
<body  style="margin:0;">
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<!-- side+contents container  -->
	<div class="container my">

		<c:choose>
			<c:when test="${userType == 'person'}">
				<%@ include file="../inc/personSideNav.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../inc/comSideNav.jsp"%>
			</c:otherwise>
		</c:choose>
		<!--personAuctionSuc Start  -->
		<div class="container">
			<div class="title">거래 상세 보기</div>
			<div class="transaction-id"><b>Auction-No ${auctionNum}</b></div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="image?file=${sellerImage}" alt="SellerImg">
						<p class="user_type">[개인회원]</p>
						<p class="bold">${auction.id}</p>
						<p class="title">${auction.title}</p>
						<div class="minmax">
							<span class="bold">희망 최소 연봉</span>
							<div>
								<span><fmt:formatNumber value="${auction.minSalary}" pattern="#,###" />원</span>
								
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 연봉</span>
							<div>
								<span><fmt:formatNumber value="${auction.maxSalary}" pattern="#,###" />원</span>
								
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
					<p>판매자 판매 희망금액</p>
					<span class="bold"><fmt:formatNumber value="${auction.maxSalary}" pattern="#,###" />원</span>
				</div>
				<div class="price_type">
					<p>최종 낙찰 금액</p>
					<span class="final-bid"><fmt:formatNumber value="${auction.bidMaxPrice}" pattern="#,###" />원</span>
				</div>
					<div class="price_type">
					<p>내 입찰 금액</p>
					<span class="extra-info final-bid"><fmt:formatNumber
							value="${bidPrice}" pattern="#,###" />원</span>
				</div>
			</div>



			<div class="detail_bind" style="background-color: rgb(250, 250, 250); margin-bottom: 0px;">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">나의 최종 입찰가</span>
					</div>
					<div class="detail_text" style="font-weight: bold;"><fmt:formatNumber value="${bidPrice}" pattern="#,###" />원</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>나의 입찰일</span>
					</div>
					<div class="detail_text">${bidDate}</div> <!--  -->
				</div>
			</div>

			<div class="detail_bind">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">입찰 마감 기한</span>
					</div>
					<div class="detail_text">${auction.endDate}</div>
				</div>

				<div class="detail_addition">
					<div class="detail_title">
						<span>내 입찰 결과</span>
					</div>
					<div class="detail_text" style="color:red;">실패</div>
				</div>
			</div>


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
						<c:forEach items="${allBuyers}" var="buyer">
						<c:choose>
						<c:when test="${auction.bidMaxPrice == buyer.bidPrice}">
						<tr>
							<td class="table_td"><span class="status final-bid">낙찰</span></td>
							<td class="table_td final-bid">${buyer.buyPersonId == null?buyer.buyerId:buyer.buyPersonId}</td>
							<td class="table_td align_right final-bid"><fmt:formatNumber value="${buyer.bidPrice}" pattern="#,###" />원</td>
							<td class="table_td align_right final-bid">${buyer.bidDate}</td>
						</tr>
						</c:when>
						<c:otherwise>
							<tr>
							<td class="table_td"><span class="status">입찰</span></td>
							<td class="table_td">${buyer.buyPersonId == null?buyer.buyerId:buyer.buyPersonId}</td>
							<td class="table_td align_right"><fmt:formatNumber value="${buyer.bidPrice}" pattern="#,###" />원</td>
							<td class="table_td align_right">${buyer.bidDate}</td>
						</tr>
						</c:otherwise>
						</c:choose>
						</c:forEach>
	
					</tbody>
				</table>
			</div>

		</div>
	</div>
</body>
</html>
