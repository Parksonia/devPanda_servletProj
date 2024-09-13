<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin-bottom: 30px;
}

.modal .register-bid input[type="text"]:focus {
	outline: none;
	border-color: #ccc;
}

.modal .register-bid button {
	height: 35px;
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
	font-size: 16px;
	color: #777;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
#congImgae{
width:30px;
height:30px;
}
</style>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<body>
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<!-- side+contents container  -->
	<div class="container my">

		<%@ include file="../inc/comSideNav.jsp"%>
	
		<div class="container">
			<div class="title">거래 상세 보기</div>
			<div class="transaction-id">AB123-CD5678-${auctionNum}</div>
		
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
									<dd>${auction.occupation}</dd>
								</dl>
								<dl>
									<dt>경력</dt>
									<dd>${auction.period}</dd>
								</dl>
								<dl>
									<dt>학력</dt>
									<dd>${auction.education}</dd>
								</dl>
							</div>
							
							<div class="column">
								<dl>
									<dt>근무형태</dt>
									<dd>${auction.employmentType}</dd>
								</dl>
								<dl>
									<dt>보유기술</dt>
									<dd>${auction.stack}</dd>
								</dl>
								<dl>
									<dt>자격증</dt>
									<dd>${auction.certification}</dd>
								</dl>
								<dl>
									<dt>근무지역</dt>
									<dd>${auction.location}</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="prices">
				<div class="price_type">
					<p>즉시 구매가</p>
					<span class="bold"><fmt:formatNumber value="${auction.maxSalary}" pattern="#,###" />원</span>
				</div>
				<div class="price_type">
					<p>현재 최고 입찰가</p>
					<span class="final-bid"><fmt:formatNumber value="${auction.bidMaxPrice}" pattern="#,###" />원</span>
				</div>
				<div class="price_type">
					<p>내 입찰 금액</p>
					<span class="extra-info final-bid"><fmt:formatNumber value="${bidPrice}" pattern="#,###"/>원</span>
				</div>
			</div>
			
			<!--modal로 데이터 각각 다른 데이터 전송하기   -->
			<div class="button-container">
				<div class="button-wrapper white-background">
					<button class="custom-button black-text open-modal-btn" data-target="myModal" data-bidNum="${bidNum}" data-auctionNum="${auctionNum}" data-bidMaxPrice="${auction.bidMaxPrice}" data-myBidPrice="${bidPrice}" data-maxSalary="${auction.maxSalary}">입찰 변경하기</button>
				</div>
				<div class="button-wrapper">
					<button class="custom-button open-modal-btn" data-target="myModal" data-bidNum="${bidNum}" data-auctionNum="${auctionNum}" data-newBidPrice="${auction.maxSalary}" data-bidMaxPrice="${auction.bidMaxPrice}" data-myBidPrice="${bidPrice}" data-maxSalary="${auction.maxSalary}">즉시 구매하기</button>
				</div>
			</div>


			<div class="detail_bind" style="background-color: rgb(250, 250, 250);">
				<div class="detail_addition">
					<div class="detail_title">
						<span>경매 종료일</span>
					</div>
					<div class="detail_text">${auction.endDate}</div>
				</div>
				<div class="detail_addition">
					<div class="detail_title">
						<span>남은 기간</span>
					</div>
					<c:if test="${dDays>0}">
					<div class="detail_text">D - ${dDays}</div>
					</c:if>
				 	<c:if test="${dDays<0}">
					<div class="detail_text">종료</div>
					</c:if>
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
							<c:when test="${auction.bidMaxPrice==buyer.bidPrice}" >
							<tr>
								<td class="table_td"><span class="status final-bid">입찰</span></td>
								<td class="table_td final-bid">${buyer.buyPersonId==null?buyer.buyerId:buyer.buyPersonId}</td>
								<td class="table_td align_right final-bid">${buyer.bidPrice}</td>
								<td class="table_td align_right final-bid">${buyer.bidDate}</td>
							</tr>
							</c:when>
							<c:otherwise>
								<tr>
								<td class="table_td"><span class="status">입찰</span></td>
								<td class="table_td">${buyer.buyPersonId==null?buyer.buyerId:buyer.buyPersonId}</td>
								<td class="table_td align_right">${buyer.bidPrice}</td>
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


	<!-- 케이스로 즉시구매, 금액변경 나눌까 고민중...  -->
		 <!-- Modal structure -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="modal-header">입찰 금액 변경</div>
            <div class="price-info">
                <span>나의 입찰가</span>
                <span class="myBidPrice" id="myBidPrice"></span>
            </div>
            <div class="price-info">
                <span>현재 최고 입찰가</span>
                <span class="final-bid" id="bidMaxPrice"></span>
            </div>
            <div class="register-tra" id="register-tra"><h2><img src="image?file=cong.png" id="congImgae" /><span style="color:blue;">${auction.maxSalary}</span> 로 낙찰됩니다.<img src="image?file=cong.png" id="congImgae"/></h2></div>
            <div class="register-bid" id="register-bid">
            	<input type="text" placeholder="금액을 입력해주세요" id="newBidPrice" name="newBidPrice"  />
	            <div class="info-text"><span class="text-detail">현재 최고 입찰가보다 큰 금액을 입력하세요.</span></div>
            </div>
            <div class="register-bid"><button id="updatePriceBtn">등록하기</button></div>
        </div>
    </div>

<!-- JavaScript section -->
<script>
$(document).ready(function() {
        	
	var updatePriceData = $(this).data();
	var modal = document.getElementById("myModal");
	var span = document.querySelector(".modal .close");
	var maxSalary = "${auction.maxSalary}";
	var sellerId="${auction.id}";
	
	var minBidPrice;

	$(".open-modal-btn").click(function(e) {
	
		var bidMaxPrice = $(this).attr('data-bidMaxPrice');
    	var myBidPrice = $(this).attr('data-myBidPrice');
   	 	maxSalary = parseInt($(this).attr('data-maxSalary'),10); //10진수로 변환함 , 안하면 NaN으로 뜸 
    	minBidPrice = parseInt(bidMaxPrice, 10);
   
 	
    $('#newBidPrice').attr('maxlength', maxSalary.toString().length); // 입력 길이 수 제한함
    
    // 모달에 값 표시 , 콤마 구분 넣기
    document.getElementById('myBidPrice').innerText = myBidPrice + '원'; // 나의 입찰가
    document.getElementById('bidMaxPrice').innerText = bidMaxPrice + '원'; // 현재 최고 입찰가
    
   
    // 버튼에 따라 다르게 처리
    //즉시낙찰
    if ($(this).text().includes("즉시 구매")) {
        $("#register-bid").hide();
        $("#register-tra").show();
        $('#newBidPrice').val(maxSalary);
        
    //입찰금액변경
    } else {
        $("#register-bid").show();
        $("#register-tra").hide();
        $('#newBidPrice').val(''); //이전 값 초기화
    } 

    modal.style.display = "flex"; // 모달 표시	
	
});
            
            // 숫자만 입력 가능하게 처리
            $('#newBidPrice').on("input", function() {
                var price = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 입력
                $(this).val(price); // 입력된 숫자만 필드에 표시
            });

            // 입력 검증 및 알림 blur 이벤트: 포커스를 잃을 때 발생 (keyup,down,input 모두 에러 발생함 디바운싱을 하지 않으면 안됨,setTimeout 설정 필수)
            $('#newBidPrice').on('keydown', function(e) {
            	if(!(e.keyCode >= '0' && e.keyCode<='9')) return;           	
            }).on('blur', function(e) {
                var price = $(this).val(); // 공백 방지
                var bidMaxPrice = parseInt($('#bidMaxPrice').text().replace(/[^0-9]/g, '')) || 0; 
                if (+price <= bidMaxPrice) { // 입력값+ 붙이면 형변환 
                	alert("현재 최고 입찰금 보다 커야 합니다.");
                	$(this).val('');
                }else if(+price > maxSalary) {
                	alert("최고 낙찰 금액보다 큽니다.");
                	$(this).val('');
                }
            });
      
            // X 로만 모달 닫기
            span.onclick = function() {
                modal.style.display = "none";
            };

        	window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }; 
        
            
            // 입력된 금액 업데이트 AJAX 전송
            $('#updatePriceBtn').click(function() {
            	  var bidNum = $('.open-modal-btn').data('bidnum'); 
            	    var auctionNum = $('.open-modal-btn').data('auctionnum');
            	    var bidMaxPrice = $('.open-modal-btn').data('bidmaxprice');
            	    var maxSalary = $('.open-modal-btn').data('maxsalary');
            	    var newBidPrice = parseInt($('#newBidPrice').val(),10); 

            	    if (newBidPrice) {
            	        var data = {
            	        	sellerId:sellerId, 
            	            auctionNum: auctionNum,
            	            bidNum: bidNum,
            	            bidMaxPrice:bidMaxPrice,
            	            newBidPrice: newBidPrice,
            	            maxSalary: maxSalary
            	        };
                 // auctionNum도 보내서 auction의 bidMax도 함께 바꾸기
                    $.ajax({
                        url: '<%=request.getContextPath()%>/updateBuyerBidPrice',
                        type: 'POST',
                        data: {param:JSON.stringify(data)},
                        dataType:'json',
                        success: function(result) {
                        	if(result == 'true')
                            alert("입찰 금액 변경에 성공했습니다.");
                            modal.style.display = "none"; // 성공 시 모달 닫기
                          
                        },
                        error: function(err) {
                            alert("금액 변경 중 오류가 발생했습니다.");
                            modal.style.display = "none";
                        }
                    });
                } else {
                 
                    alert("금액을 입력해주세요.");
                }
            });
        });
    </script>
</body>
</html>
