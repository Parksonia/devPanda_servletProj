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
.minmax {
	padding: 0;
	width: 30%;
	text-align: left;
	display: flex;
	justify-content: space-between;
}

.bid-history .highest-bid {
    color: #FF4500;
}

.bid-history .my-bid {
    background-color: #f0f0f0;
}

.bid-history .status {
    font-weight: bold;
}

.bid-history .highest-bid .status {
    color: #FF4500;
}

.bid-history .my-bid .status {
    color: #4169E1;
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

#congImgae {
	width:30px;
	height:30px;
}
</style>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/details.css"	rel="stylesheet">
</head>
<body style="margin:0;">
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
								<span><fmt:formatNumber value="${auction.minSalary}"
										pattern="#,###" />원</span>
							</div>
						</div>
						<div class="minmax">
							<span class="bold">희망 최대 연봉</span>
							<div>
								<span><fmt:formatNumber value="${auction.maxSalary}"
										pattern="#,###" />원</span>

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
							value="${auction.maxSalary}" pattern="#,###" />원</span>
				</div>
				<div class="price_type">
					<p>현재 최고 입찰가</p>
					<span class="final-bid"><fmt:formatNumber
							value="${auction.bidMaxPrice}" pattern="#,###" />원</span>
				</div>
				<div class="price_type">
					<p>내 입찰 금액</p>
					<span class="extra-info final-bid"><fmt:formatNumber
							value="${bidPrice}" pattern="#,###" />원</span>
				</div>
			</div>

			<!--modal로 데이터 각각 다른 데이터 전송하기   -->
			<div class="button-container">
				<div class="button-wrapper white-background">
					<button class="custom-button black-text open-modal-btn"
						data-target="myModal" data-bidNum="${bidNum}"
						data-auctionNum="${auctionNum}"
						data-bidMaxPrice="${auction.bidMaxPrice}"
						data-myBidPrice="${bidPrice}"
						data-maxSalary="${auction.maxSalary}">입찰 변경하기</button>
				</div>
				<div class="button-wrapper">
					<button class="custom-button open-modal-btn" data-target="myModal"
						data-bidNum="${bidNum}" data-auctionNum="${auctionNum}"
						data-newBidPrice="${auction.maxSalary}"
						data-bidMaxPrice="${auction.bidMaxPrice}"
						data-myBidPrice="${bidPrice}"
						data-maxSalary="${auction.maxSalary}">즉시 구매하기</button>
				</div>
			</div>


			<div class="detail_bind"
				style="background-color: rgb(250, 250, 250);">
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
					<c:if test="${dDays>=0}">
						<div class="detail_text">D&nbsp;&nbsp;-&nbsp;&nbsp;${dDays}일&nbsp;&nbsp;${dHours}시간&nbsp;&nbsp;${dMinutes}분</div>
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
								<c:when test="${auction.bidMaxPrice == buyer.bidPrice}">
									<tr class="highest-bid">
										<td class="table_td"><span class="status">최고 입찰</span></td>
										<td class="table_td">${buyer.buyPersonId == null ? buyer.buyerId : buyer.buyPersonId}</td>
										<td class="table_td align_right"><fmt:formatNumber value="${buyer.bidPrice}" pattern="#,###" />원</td>
										<td class="table_td align_right">${buyer.bidDate}</td>
									</tr>
								</c:when>
								<c:when test="${buyer.buyerId eq myId}">
									<tr class="my-bid">
										<td class="table_td"><span class="status">내 입찰</span></td>
										<td class="table_td">${buyer.buyPersonId == null ? buyer.buyerId : buyer.buyPersonId}</td>
										<td class="table_td align_right"><fmt:formatNumber value="${buyer.bidPrice}" pattern="#,###" />원</td>
										<td class="table_td align_right">${buyer.bidDate}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="table_td"><span class="status">입찰</span></td>
										<td class="table_td">${buyer.buyPersonId == null ? buyer.buyerId : buyer.buyPersonId}</td>
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
            <div class="register-tra" id="register-tra"><h2><img src="image?file=cong.png" id="congImgae" /><span style="color:blue;"><fmt:formatNumber value="${auction.maxSalary}" type="Number"></fmt:formatNumber></span> 로 낙찰됩니다.<img src="image?file=cong.png" id="congImgae"/></h2></div>
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
	
		var bidMaxPrice = parseInt($(this).attr('data-bidMaxPrice')).toLocaleString();
    	var myBidPrice = parseInt($(this).attr('data-myBidPrice')).toLocaleString();
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
        
            

            
            $('#updatePriceBtn').click(function() {
            	  var bidNum = $('.open-modal-btn').data('bidnum'); 
            	    var auctionNum = $('.open-modal-btn').data('auctionnum');
            	    var bidMaxPrice = $('.open-modal-btn').data('bidmaxprice');
            	    var maxSalary = $('.open-modal-btn').data('maxsalary');
            	    var newBidPrice = parseInt($('#newBidPrice').val(),10); 
            	    var sellerImage = '${sellerImage}'; 

            	    if (newBidPrice) {
            	        var data = {
            	        	sellerId:sellerId, 
            	            auctionNum: auctionNum,
            	            bidNum: bidNum,
            	            bidMaxPrice:bidMaxPrice,
            	            newBidPrice: newBidPrice,
            	            maxSalary: maxSalary,
            	            sellerImage :sellerImage
            	        };
            	      
            	        //즉시 구매 업데이트 AJAX 전송
            	        //jsonObject를 받아와서 낙찰리스트로 리다이렉트함
            	        if(newBidPrice == maxSalary){
            	            // auctionNum도 보내서 auction의 bidMax도 함께 바꾸기
                            $.ajax({
                                url: '<%=request.getContextPath()%>/updateBuyerBidToTransaction',
                                type: 'POST',
                                data: {param:JSON.stringify(data)},
                                dataType:'json',
                                success: function(result) {
                                	if(result.success) {
                                        alert("즉시 낙찰에 성공했습니다.");
    									window.location.href=result.redirectUrl;     
                                	}else{
                                		alert(result.message || "즉시 낙찰 처리 중 오류가 발생했습니다.");
                                	}
                                                   
                                },
                                error: function(err) {
                                    alert("금액 변경 중 오류가 발생했습니다.");
                                    modal.style.display = "none";
                                }
                            });  	        	
            	        	
            	          //입력 금액 변경 AJAX 전송
            	          // auctionNum도 보내서 auction의 bidMax도 함께 바꿈
            	            // 내 입찰가가 최고가라면 현재 최고 입찰가도변경
            	        } else {
            	        	 $.ajax({
            	                 url: '<%=request.getContextPath()%>/updateBuyerBidPrice',
            	                 type: 'POST',
            	                 data: {param:JSON.stringify(data)},
            	                 dataType:'json',
            	        	 	 success: function(result) {
            	        			 if (result.success) {
            	                        alert("입찰 금액 변경에 성공했습니다.");
            	                        modal.style.display = "none";
            	                        window.location.href = result.redirectUrl;
            	                    } else {
            	                        alert("금액 변경 중 오류가 발생했습니다.");
            	                    }
            	        			 modal.style.display = "none";
            	                },
                                error: function(err) {
                                    alert("금액 변경 중 오류가 발생했습니다.");
                                    modal.style.display = "none";
                                }
                            });  	        	
            	        }
            	        
                } else {
                 
                    alert("금액을 입력해주세요.");
                }
            });
            
        });
    </script>
</body>
</html>
