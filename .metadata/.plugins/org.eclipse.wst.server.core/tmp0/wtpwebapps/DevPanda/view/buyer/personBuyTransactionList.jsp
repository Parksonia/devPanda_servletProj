<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>person Buy Transaction List</title>
<!-- 개인|구매내역조회|낙찰내역조회 -->

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link
	href="${pageContext.request.contextPath}/css/mypageList.css"
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
						<h2>낙찰 내역</h2>
					</div>
				</div>


				<!-- 필터 -->
				<form action="${pageContext.request.contextPath }/personBuyTransactionList" method="get">
					<div class="filters">
							<button type="submit" name="num" value="1">최근 1개월</button>
							<button type="submit" name="num" value="3">3개월</button>
							<button type="submit" name="num" value="6">6개월</button>
							<input type="text" id="daterange" name="daterange" value="" style="width:200px;"/>
							<input type="hidden" id="startDate" name="startDate" value="">
							<input type="hidden" id="endDate" name="endDate" value="">
							<script>
								$(function() {
								  $('input[name="daterange"]').daterangepicker({
								    opens: 'left',
								    autoUpdateInput: false,
								    locale : {
								    	"separator": " ~ ",                     // 시작일시와 종료일시 구분자
				                        "format": 'YYYY-MM-DD',     // 일시 노출 포맷
				                        "applyLabel": "확인",                    // 확인 버튼 텍스트
				                        "cancelLabel": "취소",                   // 취소 버튼 텍스트
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
						<span>희망금액</span>
					</div>
					<div class="item">
						<span>낙찰액</span>
					</div>
					<div class="item">
						<span>낙찰일</span>
					</div>
				</div>
				
				<c:forEach items="${personBuyTransactionList }" var="transaction">
					<form class="history-item-form"  method="post">
					<input type="hidden" name="auctionNum" value="${transaction.auctionNum }" />
					<input type="hidden" name="sellerImage" value="${transaction.personImage }" />
					<input type="hidden" name="maxSalary" value="${transaction.maxSalary }" />
					<input type="hidden" name="price" value="${transaction.price}" />
					<input type="hidden" name="date" value="${transaction.date}" />
					<input type="hidden" name="state" value="${transaction.state}" />
					<input type="hidden" name="memType" value="${transaction.memType}" />
					<input type="hidden" name="sellerId" value="${transaction.sellerId}" />
					<input type="hidden" name="buyerId" value="${transaction.buyerId}" />
					<div class="history-item">
						<img src="${pageContext.request.contextPath}/img/${transaction.personImage}" alt="User">
						<input type="text" value="${transaction.sellerId}" readonly/>
						<div class="history-content">
							<span>${transaction.title}</span> 
						</div>
						<div class="prices">
							<span>
								<fmt:formatNumber value="${transaction.maxSalary }" type="number" />원
							</span> 
							<span style="color: red;">
								<fmt:formatNumber value="${transaction.price }" type="number" />원
							</span> 
							<span>${transaction.date }</span>
						</div>
					</div>
			
				</form>
				</c:forEach>
				<!-- list end  -->


			</div>
		</div>
	</div>
	<script>
    /* 하나의 div 클릭시 해당 링크로 연결 */
    $(document).ready(function() {
    	$(document).on('click', '.history-item', function() {
    		var contextPath = '<%=request.getContextPath()%>';
    		let form = $(this).closest('form');
    		form.attr("action", contextPath+'/personBuyTransactionDetail');
    		form.submit();
    	});
    });
    
    </script>

</body>
</html>
