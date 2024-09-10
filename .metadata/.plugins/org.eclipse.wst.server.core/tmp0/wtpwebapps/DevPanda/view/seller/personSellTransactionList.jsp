<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BidList</title>
<!-- 개인|판매내역조회|낙찰내역조회| -->
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
						<h2>낙찰 내역</h2>
					</div>
				</div>


				<!-- 필터 -->
				<form
					action="${pageContext.request.contextPath }/personSellTransactionList"
					method="get">
					<div class="filters">
						<button type="submit" name="num" value="1">최근 1개월</button>
						<button type="submit" name="num" value="3">3개월</button>
						<button type="submit" name="num" value="6">6개월</button>
						<input type="text" id="daterange" name="daterange" value="" style="width: 200px;" /> 
						<input type="hidden" id="startDate" name="startDate" value="" /> 
						<input type="hidden" id="endDate" name="endDate" value="" />
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

				<div class="item_container">
					<div class="item">
						<span>낙찰 최대희망가</span>
					</div>
					<div class="item">
						<span>낙찰액</span>
					</div>
					<div class="item">
						<span>낙찰일</span>
					</div>
				</div>


				<c:forEach items="${personSellTransactionList }" var="transaction">
					<form action="${pageContext.request.contextPath }/personSellTransactionDetail" method="post">
						<div class="history-item" data-auctionNum=${transaction.auctionNum }>
							<img src="${pageContext.request.contextPath}/img/${transaction.personImage}" alt="User">
							<div class="history-content">
								<span>${transaction.title }</span>
							</div>
							<div class="prices">
								<span> <fmt:formatNumber value="${transaction.maxSalary }" type="number" />원 </span> 
								<span style="color: red;"> <fmt:formatNumber value="${transaction.price }" type="number" />원 </span> 
								<span>${transaction.date }</span>
							</div>
							<!-- Detail로 넘겨줄 값 - auction 테이블 -->
							<input type="hidden" name="auctionNum" value="${transaction.auctionNum } "/>
							<input type="hidden" name="title" value="${transaction.title } "/>
							<input type="hidden" name="minSalary" value="${transaction.minSalary} "/>
							<input type="hidden" name="maxSalary" value="${transaction.maxSalary} "/>
							<input type="hidden" name="occupation" value="${transaction.occupation} "/>
							<input type="hidden" name="period" value="${transaction.period} "/>
							<input type="hidden" name="education" value="${transaction.education} "/>
							<input type="hidden" name="employmentType" value="${transaction.employmentType } "/>
							<input type="hidden" name="stack" value="${transaction.stack } "/>
							<input type="hidden" name="certification" value="${transaction.certification } "/>
							<input type="hidden" name="location" value="${transaction.location } "/>
							<!-- Detail로 넘겨줄 값 - transaction 테이블 -->
							<input type="hidden" name="price" value="${transaction.price } "/>
							<input type="hidden" name="t_state" value="${transaction.t_state } "/>
						</div>
					</form>
				</c:forEach>

			</div>
		</div>
	</div>
	<script>
    /* 하나의 div 클릭시 해당 링크로 연결 */
     $(document).ready(function() {
         $(document).on('click', '.history-item', function() {  
               var contextPath = '<%=request.getContextPath()%>';
               let form = $(this).closest('form');
               let auctionNum = $(this).data('auctionNum');
          	   console.log("AuctionNum : ", auctionNum);
          	   form.attr("action",contextPath+'/personSellTransactionDetail');
               form.submit();	 
     	});
     });
    
</script>

</body>
</html>
