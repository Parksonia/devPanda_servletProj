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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/css/details.css" rel="stylesheet">
<style>
.progress_item_description {
	color: black; /* 기본 색상 */
	text-decoration: none;
	display: flex;
	align-items: center;
}

.progress_item_description:hover {
	color: red; /* hover시 빨간색으로 변경 */
}

::placeholder {
	color : black;
}

.modal-info-list {
       margin: 15px 0; /* 위아래 여백 */
       padding-left: 20px; /* 왼쪽 들여쓰기 */
       list-style-type: disc; /* 목록 앞에 기본 점 스타일 */
       color: #444; /* 텍스트 색상 */
       font-size: 14px; /* 텍스트 크기 */
       line-height: 1.5; /* 줄 간격 */
}

.modal-info-list li {
    margin-bottom: 8px; /* 목록 간 간격 */
}

.completed {
    color: red; /* 계약 완료일 때 빨간색으로 변경 */
    display: flex;
    align-items: center;
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
			<div class="transaction-id">A-No ${auctionNum }</div>
			
<!-- userInfo -->
			<div class="user-info-container">
				<div class="user-info">
					<div class="user">
						<img src="image?file=${sellerImage}" alt="SellerImage">
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
					<!-- 구매자(Buyer) 프로필 -->
					<c:choose>
						<c:when test="${memType == 'person'}">
							<div class="profile">
								<img src="image?file=${bperson.personImage}" alt="BuyerImg">
								<p style="color: #888; font-weight: bold;">[개인회원]</p>
								<p style="font-weight: bold;">구매자 : ${bperson.nickName }</p>
								<p>아이디 : ${bperson.id}</p>
								<p>이메일 : ${bperson.email }</p>
								<p>주소 : ${bperson.address }</p>
								<c:choose>
									<c:when test="${isAlreadyReported}">
										<button class="report-button" disabled style="background-color: #ccc; cursor: not-allowed;">이미 신고됨</button>
									</c:when>
									<c:otherwise>
										<button class="report-button">블랙리스트 등록</button>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:otherwise>
							<div class="profile">
								<img src="image?file=${bcompany.companyImage}" alt="BuyerImg">
								<p style="color: #888; font-weight: bold;">[기업회원]</p>
								<p style="font-weight: bold;">구매자 : ${bcompany.companyName }</p>
								<p>아이디 : ${bcompany.id}</p>
								<p>이메일 : ${bcompany.email }</p>
								<p>주소 : ${bcompany.address }</p>
									<c:choose>
									<c:when test="${isAlreadyReported}">
										<button class="report-button" disabled style="background-color: #ccc; cursor: not-allowed;">이미 신고됨</button>
									</c:when>
									<c:otherwise>
										<button class="report-button">블랙리스트 등록</button>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>

					<!-- 구매자(Seller) 프로필 -->
					<div class="profile">
						<img src="image?file=${sperson.personImage }"	alt="SellerImg">
						<p style="color: #888; font-weight: bold;">[개인회원]</p>
						<p style="font-weight: bold;">판매자 : ${sperson.nickName }</p>
						<p>아이디: ${sperson.id }</p>
						<p>이메일: ${sperson.email }</p>
						<p>주소: ${sperson.address }</p>
					</div>
				</div>
			</div>


<!-- Transaction Details -->
			<hr class="gray-line">
			<div class="prices">
				<div class="price_type">
					<p>나의 판매 희망금액</p>
					<span class="bold"><fmt:formatNumber
							value="${auction.maxSalary }" type="number" />원</span>
				</div>
				<div class="price_type">
					<p>최종 낙찰 금액</p>
					<span class="final-bid"><fmt:formatNumber value="${price }"
							type="number" />원</span>
				</div>
			</div>

			<div class="detail_bind"
				style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span style="font-weight: bold;">최종 거래일시</span>
					</div>
					<div class="detail_text">${date }</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>낙찰 유형</span>
					</div>
					<div class="detail_text">낙찰 완료</div>
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
										<td class="table_td">[${buyer.memType == 'company' ? '기업' : '개인'}회원]
											${buyer.memType == 'company' ? buyer.buyerId : buyer.buyPersonId}</td>
										<td class="table_td align_right"><fmt:formatNumber
												value="${buyer.bidPrice }" type="number" />원</td>
										<td class="table_td align_right">${buyer.bidDate }</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="table_td"><span class="status">입찰</span></td>
										<td class="table_td">[${buyer.memType == 'company' ? '기업' : '개인'}회원]
											${buyer.memType == 'company' ? buyer.buyerId : buyer.buyPersonId }</td>
										<td class="table_td align_right"><fmt:formatNumber
												value="${buyer.bidPrice }" type="number" />원</td>
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
							<a href="#" class="progress_item_description send-mail-btn" style="display:flex; align-items:center;"> 
								<img src="${pageContext.request.contextPath }/img/mail-svgrepo-com.svg" alt=""  style="width:20px;height:20px;">메일보내기
							</a>
					</div>
					<div style="display: flex; flex-direction: column;">
			            <span id="contractCompleted" class="progress_item_title completed" style="color: red; display: ${state == 'f' ? 'flex' : 'none'};">
			                <img src="${pageContext.request.contextPath}/img/checkbox-check-svgrepo-com.svg" alt="" style="width:20px;height:20px;">
			                계약 완료
			            </span>
			            <a href="#" id="progressItemDescription" class="progress_item_description" style="display: ${state == 'f' ? 'none' : 'flex'};">
			                <img src="${pageContext.request.contextPath}/img/unchecked.svg" alt="" style="width:20px;height:20px;">
			                완료로 변경
			            </a>
			        </div>
				</div>
			</div>

<!-- BlackList Report Modal  start-->
			<div class="modal">
				<div class="modal-container">
					<!-- <a href="#" class="modal-close">&times;</a> -->
					<a href="#" class="modal-close"> 
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    	<path d="M20.5 3.1L12 11.6 3.5 3.1 2.1 4.5l8.6 8.5-8.6 8.5 1.4 1.4 8.5-8.6 8.5 8.6 1.4-1.4-8.6-8.5 8.6-8.5z"></path>
                		</svg>
					</a>
					<div class="modal-header">신고하기</div>
					
					<c:choose>
					
						<c:when test="${memType == 'person'}">
							<div class="modal-profile">
								<div class="modal-profile-image">
									<img src="image?file=${bperson.personImage}" alt="BuyerImg">
								</div>
								<div class="modal-profile-info">
									<div class="user-type">[개인회원]</div>
									<div class="user-id">${bperson.id }</div>
									<div class="user-email">${bperson.email }</div>
								</div>
							</div>
							<div class="modal-divider"></div>
							<div class="modal-transaction-info">
								<div>거래 내역</div>
								<div>거래 일자</div>
							</div>
							<div class="modal-transaction-info">
								<div class="modal-transaction-id">T-No ${transactionNum}</div>
								<div class="modal-transaction-date">${date }</div>
							</div>
							<div class="modal-divider"></div>
							<div class="modal-report-title">신고 내용</div>
							<form id="buyerPersonBlack">
								<input type="text" class="modal-input-title" name="title" placeholder="제목을 입력하세요">
								<textarea class="modal-input-content" name="content" style="min-height: 350px;" placeholder="신고 내용을 입력하세요"></textarea>
								<input type="hidden" name="transactionNum" value="${transactionNum}" />
								<input type="hidden" name="auctionNum" value="${auctionNum}" />
								<input type="hidden" name="bidNum" value="${bidNum}" />
								<input type="hidden" name="buyerId" value="${bperson.id}" />
								<input type="hidden" name="sellerId" value="${sperson.id}" />
								<input type="hidden" name="memType" value="${memType }"/>

								<button type="submit" class="modal-submit-button">제출하기</button>
							</form>
						</c:when>
				
						<c:otherwise>
							<div class="modal-profile">
								<div class="modal-profile-image">
									<img src="image?file=${bcompany.companyImage}" alt="BuyerImg">
								</div>
								<div class="modal-profile-info">
									<div class="user-type">[기업회원]</div>
									<div class="user-id">${bcompany.id }</div>
									<div class="user-email">${bcompany.email }</div>
								</div>
							</div>
							<div class="modal-divider"></div>
							<div class="modal-transaction-info">
								<div>거래 내역</div>
								<div>거래 일자</div>
							</div>
							<div class="modal-transaction-info">
								<div class="modal-transaction-id">T-No ${transactionNum}</div>
								<div class="modal-transaction-date">${date }</div>
							</div>
							<div class="modal-divider"></div>
							<div class="modal-report-title">신고 내용</div>
							<form id="buyerComBlack">
								<input type="text" class="modal-input-title" name="title" placeholder="제목을 입력하세요">
								<textarea class="modal-input-content" name="content" style="min-height: 350px;" placeholder="신고 내용을 입력하세요"></textarea>
								<input type="hidden" name="transactionNum" value="${transactionNum}" />
								<input type="hidden" name="auctionNum" value="${auctionNum}" />
								<input type="hidden" name="bidNum" value="${bidNum}" />
								<input type="hidden" name="buyerComId" value="${bcompany.id}" />
								<input type="hidden" name="sellerId" value="${sperson.id}" />
								<input type="hidden" name="memType" value="${memType}"/>
								<button type="submit" class="modal-submit-button">제출하기</button>
							</form>
						</c:otherwise>
						
					</c:choose>
				</div>
			</div>
<!-- BlackList Report Modal  end-->

<!-- Send Email Modal -->
			<div class="modal mail-modal">
				<div class="modal-container">
					<a href="#" class="modal-close mail-modal-close">&times;</a>
					<div class="modal-header">메일 보내기</div>
					<form id="sendMailForm">
						<input type="text" class="modal-input-title" name="subject" placeholder="메일 제목을 입력하세요">
						<textarea class="modal-input-content" name="content" style="min-height: 350px;" placeholder="내용을 입력하세요"></textarea>
						<ul class="modal-info-list">
							<li>관리자 계정으로 구매자에게 메일이 전송됩니다</li>
							<li>구매자는 답장하기를 선택하면 판매자의 이메일로 답장을 할 수 있습니다.</li>
						</ul>
						<input type="hidden" name="replyTo" value="${sperson.email}" />
						<input type="hidden" name="recipientEmail" value="${bperson.email}" />
						<button type="submit" class="modal-submit-button">메일 보내기</button>
					</form>
				</div>
			</div>
<!-- Send Email Modal End-->
		</div>
	</div>

<script>
/*블랙리스트 신고 버튼 모달*/
const modal = document.querySelector('.modal');
const modalCloseButton = document.querySelector('.modal-close');
const reportButton = document.querySelector('.report-button');

reportButton.addEventListener('click', function() {
	modal.style.display = 'flex';
});

modalCloseButton.addEventListener('click', function() {
	modal.style.display = 'none';
});

/* Ajax - 진행상황 */
$(document).ready(function() {
	$('#progressItemDescription').click(function(e) {
		e.preventDefault();
		$.ajax({
			url: '${pageContext.request.contextPath}/progressItemDescription',
			type: 'POST',
			data: {
				auctionNum : ${auctionNum}
			},
			success: function(response) {
		        alert('완료로 변경되었습니다.');
				$('.progress-bar').css('width', '100%');
				$('#progressItemDescription').hide();
                $('#contractCompleted').show();
		    },
		    error: function(xhr, status, error) {
		        alert('오류가 발생하였습니다.');
		    }
		})
	})
})
		
/* Ajax - 블랙리스트 */
$(document).ready(function() {
	$('#buyerPersonBlack, #buyerComBlack').on('submit', function(event) {
		event.preventDefault();
		
		var memType = $('input[name="memType"]').val();
		var url = '';
		if (memType == 'person') {
			url = '${pageContext.request.contextPath}/buyerPersonBlack';
		} else if (memType == 'company'){
			url = '${pageContext.request.contextPath}/buyerComBlack';
		}
		
		$.ajax({
			url: url,
			type: 'post',
			data : $(this).serialize(), //URL인코딩
			success: function(response) {
				alert('신고가 성공했습니다.');
				$('.modal').css('display', 'none');
				location.reload();
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

/* 메일 전송 */
$(document).ready(function() {
    // 메일 보내기 버튼 클릭 시 메일 모달 띄우기
    $('.send-mail-btn').on('click', function(event) {
        event.preventDefault();
        $('.mail-modal').css('display', 'flex');
    });

    // 메일 모달 닫기 버튼
    $('.mail-modal-close').on('click', function() {
        $('.mail-modal').css('display', 'none');
    });
    
    // 바깥 클릭
    $(document).on('click', function(event) {
        if ($(event.target).hasClass('mail-modal')) {
            $('.mail-modal').css('display', 'none');  // 메일 모달 닫기
        }
    });

    // 메일 보내기 Ajax 처리
    $('#sendMailForm').on('submit', function(event) {
        event.preventDefault();
        
     	// FormData로 폼 데이터를 가져옴
        var formData = new FormData(this);
        var content = formData.get('content').trim();
        var subject = formData.get('subject').trim(); 

        if (!content) {
            alert('메일 내용을 입력하세요.');
            return;
        }
        
     	// 수신자 이메일 주소
        var memType = '${memType}';
        var recipient = memType === 'person' ? '${bperson.email}' : '${bcompany.email}';
        var replyTo = '${sperson.email}';

        if (!recipient) {
            alert('수신자 이메일 주소를 찾을 수 없습니다.');
            return;
        }

        $.ajax({
            url: '${pageContext.request.contextPath}/transactionSendMail',
            type: 'POST',
            data: {
                recipient: recipient,
                subject: subject,
                content: content,
                replyTo: replyTo
            },
            success: function(response) {
                alert('메일이 성공적으로 전송되었습니다.');
                $('.mail-modal').css('display', 'none');  // 메일 모달 닫기
            },
            error: function(xhr, status, error) {
                alert('메일 전송 중 오류가 발생했습니다.');
                console.error(xhr.responseText);
            }
        });
    });
});
	</script>
</body>
</html>