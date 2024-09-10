<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BidList</title>
<!-- 개인|판매내역조회|경매등록내역조회| -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/css/myPageList.css"
	rel="stylesheet">
</head>
<body>
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<div class="container my">
		<%@ include file="../inc/personSideNav.jsp"%>

		<!-- list 정보 start -->
		<div class="content_area my-page-content">
			<div class="my_bidlist">

				<div class="content_title border">
					<div class="title">
						<h2>경매등록내역</h2>
					</div>
				</div>


				<!-- 필터 -->
				<form
					action="${pageContext.request.contextPath }/personSellAuctionList"
					method="get">
					<div class="filters">
						<button type="submit" name="num" value="1">최근 1개월</button>
						<button type="submit" name="num" value="3">3개월</button>
						<button type="submit" name="num" value="6">6개월</button>
						<input type="text" id="daterange" name="daterange" value=""	style="width: 200px;" /> 
						<input type="hidden" id="startDate" name="startDate" value=""> 
						<input type="hidden" id="endDate" name="endDate" value="">
						<script>
						$(function() {
							 $('input[name="daterange"]').daterangepicker({
								opens: 'left',
								autoUpdateInput: false,
								locale : {
									"separator": " ~ ",                 
			                        "format": 'YYYY-MM-DD',
			                        "applyLabel": "확인",
			                        "cancelLabel": "취소",
			                        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			                        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
								}
							}, function(start, end, label) {
								$('#startDate').val(start.format('YYYY-MM-DD'));
								$('#endDate').val(end.format('YYYY-MM-DD'));
								$('input[name="daterange"]').val(start.format('YYYY-MM-DD') + '~' + end.format('YYYY-MM-DD'));
								console.log("search date: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
							});
						});
					</script>
						<button type="submit">조회</button>
					</div>
				</form>

				<!-- list start -->
				<div class="item_container">
					<div class="item">
						<span>판매희망최대가</span>
					</div>
					<div class="item">
						<span>현재 최종가</span>
					</div>
					<div class="item">
						<span>경매종료일</span>
					</div>
				</div>
				
				<c:forEach items="${personSellAuctionList }" var="sellAuction">
					<div class="history-item" style="<c:if test='${sellAuction.state eq "processing"}'> background-color:rgb(254, 247, 246);</c:if>">
						<input type="hidden" readonly value="${sellAuction.state}">
						<img src="${pageContext.request.contextPath}/img/${sellAuction.personImage}" alt="User">
						<div class="history-content">
							<span>${sellAuction.title }</span>
						</div>
						<div class="prices">
							<span> <fmt:formatNumber value="${sellAuction.maxSalary }"
									type="number" />원
							</span> <span style="color: red;"> <fmt:formatNumber
									value="${sellAuction.bidMaxPrice }" type="number" />원
							</span> <span>${sellAuction.endDate }</span>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<script>
    /* 하나의 div 클릭시 해당 링크로 연결 */
    const linkOpen = document.querySelectorAll('.history-item');
    linkOpen.forEach(button => {
        button.addEventListener('click', function() {
        	 window.location.href = './buyer/personAuctionBuyerSuc.jsp'
        });
    });
    
    </script>
</body>
</html>
