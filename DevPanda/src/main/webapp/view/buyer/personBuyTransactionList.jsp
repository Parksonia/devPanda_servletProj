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
<style>
.period-button.active {
	background-color: #ed6a60;
	color: white;
}
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/css/mypageList.css" rel="stylesheet">
</head>
<body style="margin:0;">
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
				<form id="dateForm"  action="${pageContext.request.contextPath }/personBuyTransactionList" method="get">
					<div class="filters">
						<button type="button" id="one" class="period-button">최근 1개월</button>
						<button type="button" id="three" class="period-button">최근 3개월</button>
						<button type="button" id="six" class="period-button">최근 6개월</button>
						<input type="text" id="daterange" name="daterange" value="" style="width:200px;"/>
						<input type="hidden" id="startDate" name="startDate" value="">
						<input type="hidden" id="endDate" name="endDate" value="">
						<input type="hidden" id="selectedPeriod" name="selectedPeriod" value="">
						<button type="submit">조회</button>
					</div>
				</form>

				<!-- list start -->
				<c:choose>
					<c:when test="${personBuyTransactionList.size() == 0 }">
					 	<h3 style="text-align:center;">낙찰 정보가 존재하지 않습니다.</h3>
					</c:when>
					<c:otherwise>
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
						<div class="item_list_container">
							<c:forEach items="${personBuyTransactionList }" var="transaction">
								<form class="history-item-form"  method="post">
									<input type="hidden" name="auctionNum" value="${transaction.auctionNum }" />
									<input type="hidden" name="bidNum" value="${transaction.bidNum}" />
									<input type="hidden" name="transactionNum" value="${transaction.transactionNum}" />
									<input type="hidden" name="sellerImage" value="${transaction.personImage }" />
									<input type="hidden" name="maxSalary" value="${transaction.maxSalary }" />
									<input type="hidden" name="price" value="${transaction.price}" />
									<input type="hidden" name="date" value="${transaction.date}" />
									<input type="hidden" name="state" value="${transaction.state}" />
									<input type="hidden" name="memType" value="${transaction.memType}" />
									<input type="hidden" name="sellerId" value="${transaction.sellerId}" />
									<input type="hidden" name="buyerId" value="${transaction.buyerId}" />
									<div class="history-item">
										<img src="image?file=${transaction.personImage}" alt="personImage">
										<input type="hidden" value="${transaction.auctionNum}" />
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
						</div>
					</c:otherwise>
				</c:choose>
				<%-- <p>total count : ${totalCount }</p> --%>
				<c:choose>
					<c:when test="${totalCount > 6 }">
						<div class="empty_area">
							<button id="moreBtn" class="btn outlinegrey small">더보기</button>
						</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
<script>
/*더보기 버튼*/
$(document).ready(function() {
	let currentOffset = 6;
	let limit = 6;
	let totalCount = ${totalCount};
	
	$('#moreBtn').click(function() {
		let startDate = $('#startDate').val();
		let endDate = $('#endDate').val();
		
		$.ajax({
			url:'${pageContext.request.contextPath}/personBuyTransactionList',
			type:'POST',
			data: {
				offset:currentOffset,
				limit:limit,
				startDate:startDate,
				endDate:endDate
			},
			dataType:'json',
			success:function(response) {
				let transactionList = response.transactionList;
				let totalCount = response.totalCount;
				
				if(transactionList.length > 0) {
					transactionList.forEach(function(transaction){
						if ($('input[name="transactionNum"][value="' + transaction.transactionNum + '"]').length === 0){
							let newItem = 
								'<form class="history-item-form" method="post">' +
						        '<input type="hidden" name="auctionNum" value="' + transaction.auctionNum + '"/>' +
						        '<input type="hidden" name="bidNum" value="' + transaction.bidNum + '"/>' +
						        '<input type="hidden" name="transactionNum" value="' + transaction.transactionNum + '"/>' +
						        '<input type="hidden" name="sellerImage" value="' + transaction.personImage + '"/>' +
						        '<input type="hidden" name="maxSalary" value="' + transaction.maxSalary + '"/>' +
						        '<input type="hidden" name="price" value="' + transaction.price + '"/>' +
						        '<input type="hidden" name="date" value="' + transaction.date + '"/>' +
						        '<input type="hidden" name="state" value="' + transaction.state + '"/>' +
						        '<input type="hidden" name="memType" value="' + transaction.memType + '"/>' +
						        '<input type="hidden" name="sellerId" value="' + transaction.sellerId + '"/>' +
						        '<input type="hidden" name="buyerId" value="' + transaction.buyerId + '"/>' +
						        '<div class="history-item">' +
						            '<img src="image?file=' + transaction.personImage + '" alt="personImage">' +
						            '<input type="hidden" value="' + transaction.auctionNum + '"/>' +
						            '<div class="history-content">' +
						                '<span>' + transaction.title + '</span>' +
						            '</div>' +
						            '<div class="prices">' +
						                '<span>' + transaction.maxSalary.toLocaleString() + '원</span>' +
						                '<span style="color: red;">' + transaction.price.toLocaleString() + '원</span>' +
						                '<span>' + transaction.date + '</span>' +
						            '</div>' +
						        '</div>' +
						    '</form>';
						    
						    $('.item_list_container').append(newItem);
						}
					});
					currentOffset += limit; // 오프셋 업데이트
					
					if(currentOffset >= totalCount){
                    	$('#moreBtn').hide();
                    }
				} else {
					$('#moreBtn').hide(); // 더 이상 데이터가 없으면 버튼 숨기기
				}
			},
			error: function() {
                alert('데이터를 불러오는 데 실패했습니다.');
            }
		});
	});
});

/* 하나의 div 클릭시 해당 링크로 연결 */
$(document).ready(function() {
	$(document).on('click', '.history-item', function() {
		var contextPath = '<%=request.getContextPath()%>';
		let form = $(this).closest('form');
		form.attr("action", contextPath+'/personBuyTransactionDetail');
		form.submit();
	});
});

/*날짜 조회*/
$(function() {
  // 날짜 선택기 초기화
  $('input[name="daterange"]').daterangepicker({
    opens: 'left',
    locale: {
      "separator": " ~ ",     // 시작일시와 종료일시 구분자
      "format": 'YYYY-MM-DD',     // 일시 노출 포맷
      "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
      "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    },
    autoUpdateInput: false,
    todayHighlight: true,
    autoApply: true
  }, function(start, end, label) {
    $('#startDate').val(start.format('YYYY-MM-DD'));
    $('#endDate').val(end.format('YYYY-MM-DD'));
    $('input[name="daterange"]').val(start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD'));
    
    // 날짜 범위가 선택되면 버튼에서 active 클래스 제거
    $('.period-button').removeClass('active');   
  });
  
  //'오늘' 버튼 추가
  $('.daterangepicker').append('<button class="today-button">오늘</button>');

  // '오늘' 버튼 클릭 이벤트
  $(document).on('click', '.today-button', function() {
    var today = moment();
    $('input[name="daterange"]').data('daterangepicker').setStartDate(today);
    $('input[name="daterange"]').data('daterangepicker').setEndDate(today);
    $('input[name="daterange"]').val(today.format('YYYY-MM-DD') + ' ~ ' + today.format('YYYY-MM-DD'));
    $('#startDate').val(today.format('YYYY-MM-DD'));
    $('#endDate').val(today.format('YYYY-MM-DD'));
    $('.period-button').removeClass('active');
    $('.daterangepicker').hide();
  });

  // 최근 1개월, 3개월, 6개월 설정 및 active 클래스 추가
  function setDateRange(months, button) {
    let endDate = moment(); // 현재 날짜
    let startDate = moment().subtract(months, 'months'); // 설정된 기간만큼 이전 날짜

    $('#startDate').val(startDate.format('YYYY-MM-DD'));
    $('#endDate').val(endDate.format('YYYY-MM-DD'));

    // 선택된 버튼만 active로 만들기
    $('.period-button').removeClass('active');
    $(button).addClass('active');
    
	 // URL에 선택된 기간을 파라미터로 추가
    $('#selectedPeriod').val(months);

    // 폼을 제출하여 조회
    $('#dateForm').submit();
  }

  // 최근 1개월 버튼 클릭 시
  $('#one').click(function() {
    setDateRange(1, this);
  });

  // 최근 3개월 버튼 클릭 시
  $('#three').click(function() {
    setDateRange(3, this);
  });

  // 최근 6개월 버튼 클릭 시
  $('#six').click(function() {
    setDateRange(6, this);
  });
  
  //페이지 로드 시 URL 파라미터를 확인하고 버튼 활성화
  function getUrlParameter(name) {
	var urlParams = new URLSearchParams(window.location.search);
	return urlParams.get(name) || '';
  }

  // URL 파라미터에 따라 버튼에 active 클래스 추가
  var selectedPeriod = getUrlParameter('selectedPeriod');
  if (selectedPeriod === '1') {
    $('#one').addClass('active');
  } else if (selectedPeriod === '3') {
    $('#three').addClass('active');
  } else if (selectedPeriod === '6') {
    $('#six').addClass('active');
  }
});
</script>

</body>
</html>