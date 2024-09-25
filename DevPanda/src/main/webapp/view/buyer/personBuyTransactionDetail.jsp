<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 개인|구매내역조회|낙찰내역조회|입찰 거래성공 |상세보기 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/css/details.css" rel="stylesheet">
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
			<div class="transaction-id">A-No ${auctionNum}</div>

			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="image?file=${sellerImage}" alt="SellerImg">
						<p class="user_type">[개인회원]</p>
						<p class="bold">${sellerId}</p>
						<p class="title">${auction.title }</p>
						<div class="minmax">
							<span class="bold">희망 최소 금액</span>
							<div>
								<span><fmt:formatNumber value="${auction.minSalary }" type="Number" />원</span>
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 금액</span>
							<div>
								<span><fmt:formatNumber value="${auction.maxSalary }" type="Number" />원</span>
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
					<!-- 구매자 프로필 -->
					<div class="profile">
						<img src="image?file=${bperson.personImage}" alt="BuyerImg">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">구매자: ${bperson.nickName }</p>
						<p>아이디: ${bperson.id }</p>
						<p>이메일: ${bperson.email }</p>
						<p>주소: ${bperson.address }</p>
					</div>
					<!-- 판매자 프로필 -->
					<div class="profile">
						<img src="image?file=${sperson.personImage}" alt="SellerImg">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">판매자: ${sperson.nickName }</p>
						<p>아이디: ${sperson.id }</p>
						<p>이메일: ${sperson.email }</p>
						<p>주소: ${sperson.address }</p>
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
					<span class="bold"><fmt:formatNumber
							value="${auction.maxSalary }" type="Number" />원</span>
				</div>
				<div class="price_type">
					<p>최종 낙찰 금액</p>
					<span class="final-bid"><fmt:formatNumber value="${price }" type="Number" />원</span>
				</div>
			</div>

			<div class="detail_bind"
				style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">최종 낙찰일</span>
					</div>
					<div class="detail_text">${date}</div>
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
						<c:forEach items="${allBuyers }" var="buyer">
							<c:choose>
								<c:when test="${buyer.bidState == 2 || buyer.bidState == 3 }">
									<tr style="background-color: rgba(128, 128, 128, 0.2);">
										<td class="table_td"><span class="status final-bid">낙찰</span></td>
										<td class="table_td">[${buyer.memType == 'C' ? '기업' : '개인'}회원]
										${buyer.memType == 'C' ? buyer.buyerId : buyer.buyPersonId}</td>
										<td class="table_td align_right"><fmt:formatNumber value="${buyer.bidPrice }" type="number"/>원</td>
										<td class="table_td align_right">${buyer.bidDate }</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="table_td"><span class="status">입찰</span></td>
										<td class="table_td">[${buyer.memType == 'C' ? '기업' : '개인'}회원]
										${buyer.memType == 'C' ? buyer.buyerId : buyer.buyPersonId }</td>
										<td class="table_td align_right"><fmt:formatNumber value="${buyer.bidPrice }" type="number"/>원</td>
										<td class="table_td align_right">${buyer.bidDate }</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</div>

<!-- progress container -->
			<div class="progress-container">
				<p class="progress_title">진행 상황</p>
				<div class="progress-bar-background">
					<div class="progress-bar" style="width: ${state == 'f' ? '100%' : '50%'};"></div>
				</div>

				<div class="progress-status">
					<span class="progress_item_title">낙찰 완료</span>
					<div style="display: flex; flex-direction: column;">
						<span class="progress_item_title">계약서 검토중</span>
					</div>
					<span class=" progress_item_title completed">계약 완료</span>
				</div>
			</div>


<!-- BlackList Modal  start-->
			<div class="modal">
				<div class="modal-container">
					<!-- <a href="#" class="modal-close">&times;</a> -->
					<a href="#" class="modal-close"> 
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    	<path d="M20.5 3.1L12 11.6 3.5 3.1 2.1 4.5l8.6 8.5-8.6 8.5 1.4 1.4 8.5-8.6 8.5 8.6 1.4-1.4-8.6-8.5 8.6-8.5z"></path>
                		</svg>
					</a>
					<div class="modal-header">신고하기</div>
					<div class="modal-profile">
						<div class="modal-profile-image">
							<img src="image?file=${sellerImage}" alt="SellerImg">
						</div>
						<div class="modal-profile-info">
							<div class="user-type">[개인회원]</div>
							<div class="user-id">${sperson.id }</div>
							<div class="user-email">${sperson.email }</div>
						</div>
					</div>
					<div class="modal-divider"></div>
					<div class="modal-transaction-info">
						<div>거래 내역</div>
						<div>거래 일자</div>
					</div>
					<div class="modal-transaction-info">
						<div class="modal-transaction-id">T-NO ${transactionNum}</div>
						<div class="modal-transaction-date">${date}</div>
					</div>
					<div class="modal-divider"></div>
					<div class="modal-report-title">신고 내용</div>
					<form id="sellerPeronsBlack">
						<input type="text" class="modal-input-title" name="title" placeholder="제목을 입력하세요">
						<textarea class="modal-input-content" name="content" style="min-height: 350px;" placeholder="신고 내용을 입력하세요"></textarea>
						<input type="hidden" name="transactionNum" value="${transactionNum}" />
						<input type="hidden" name="auctionNum" value="${auctionNum}" />
						<input type="hidden" name="bidNum" value="${bidNum}" />
						<input type="hidden" name="buyerId" value="${bperson.id}" />
						<input type="hidden" name="sellerId" value="${sperson.id}" />                                                   						
						<button type="submit" class="modal-submit-button">제출하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>

/*블랙리스트 신고 버튼 모달*/
const modal = document.querySelector('.modal');
const modalCloseButton = document.querySelector('.modal-close');
const reportButton = document.querySelector('.report-button');
const titleInput = document.querySelector('input[name="title"]');
const contentTextarea = document.querySelector('textarea[name="content"]');

reportButton.addEventListener('click', function() {
	modal.style.display = 'flex';
});

modalCloseButton.addEventListener('click', function(event) {
	if (titleInput.value !== "" || contentTextarea.value !== "") {
		const confirmation = confirm("작성 중인 내용이 있습니다. 창을 닫으시겠습니까?");
		if (!confirmation) {
			event.preventDefault();
			return;
		}
	}
	modal.style.display = 'none';
});

window.addEventListener('click', function(event) {
    if (event.target == modal) {
        if (titleInput.value !== "" || contentTextarea.value !== "") {
            const confirmation = confirm("작성 중인 내용이 있습니다. 창을 닫으시겠습니까?");
            if (!confirmation) {
                event.preventDefault();
                return;
            }
        }
        modal.style.display = 'none';
    }
});

/* Ajax - 블랙리스트 */
$(document).ready(function() {
	
	$('#sellerPeronsBlack').on('submit', function(event) {
		event.preventDefault();
		
		$.ajax({
			url: '${pageContext.request.contextPath}/sellerPersonBlack',
			type: 'post',
			data : $(this).serialize(), //URL인코딩
			success: function(response) {
				alert('신고가 성공했습니다.');
				$('.modal').css('display', 'none');
				$('.report-button')
					.text('신고 됨')
					.css({
						'border': '2px solid red',
						'color': 'red',
						'background-color': '#fff'
					})
					.prop('disabled',true);
			},
			error: function(xhr, status, error) {
				alert('신고 오류가 발생했습니다.');
				console.error(xhr.responseText); //오류 응답 확인
			}
		});
	});
	$('.modal-close').on('click',function() {
		$('.modal').css('display', 'none');
	});
});	

</script>
</body>
</html>