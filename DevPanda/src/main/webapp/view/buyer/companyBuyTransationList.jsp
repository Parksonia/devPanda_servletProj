<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Transaction"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Buy Transaction List</title>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/css/mypageList.css" rel="stylesheet">
<style>
#daterange {
	text-align: center;
	width: 200px;
}
.no-items-message {
	text-align: center;
	font-size: 18px;
	color: #888;
	margin-top: 50px;
}

.period-button.active {
	background-color: #ed6a60;
	color: white;
}

button.active-button {
	background-color: #ed6a60;
	color: white;
}

button.active-button:hover {
	background-color: #ed6a60;
}

button:hover {
	background-color: #e0e0e0;
}

button:active {
	transform: scale(0.98); /* 버튼이 살짝 눌리는 듯한 효과 */
}
</style>
</head>
<body style="margin:0;">
	<%@ include file="../inc/header.jsp"%>

	<div class="container my">
		<%@ include file="../inc/comSideNav.jsp"%>

		<!-- list 정보 start -->
		<div class="content_area my-page-content">
			<div class="my_bidlist">

				<div class="content_title border">
					<div class="title">
						<h2>낙찰 내역</h2>
					</div>
				</div>

				<!-- 필터 -->
				<div class="filters">
					<input type="hidden" id="startDate"> <input type="hidden"
						id="endDate">
					<button type="button" id="oneMonthBtn">최근 1개월</button>
					<button type="button" id="threeMonthBtn">최근 3개월</button>
					<button type="button" id="sixMonthBtn">최근 6개월</button>
					<input type="text" id="daterange" name="daterange" value=''
						placeholder="" />
					<button type="button" id="searchBtn">조회</button>

				</div>

				<!-- 날짜 범위 선택기 -->

				<div class="item_container">
					<div class="item">
						<span>판매 희망가</span>
					</div>
					<div class="item">
						<span>최종낙찰가</span>
					</div>
					<div class="item">
						<span>거래일</span>
					</div>
				</div>

				<!-- 거래 내역을 동적으로 표시할 div -->
				<div id="transaction-list"></div>

				<!-- 더보기 버튼 -->
				<div class="empty_area">
					<button id="moreBtn" class="btn outlinegrey small">더보기</button>
				</div>

				
				<script>
				$(function() {
				    // 페이지 로드 시 기본 12개월 범위를 설정하고 데이터를 로드
				    setDefaultDateRange(12);

				    // daterangepicker 초기화 (지역화 포함)
				    initializeDateRangePicker();

				    // 조회 버튼 클릭 시 데이터 로드
				    $('#searchBtn').click(function() {
				        loadTransactions(); // 조회 버튼을 눌렀을 때만 데이터 로드
				        toggleActiveButton(null); // 조회 버튼 클릭 시 모든 버튼을 비활성화
				    });

				    // 버튼 클릭 이벤트 리스너
				    $('#oneMonthBtn').click(function() {
				        sendDateRange(1); // 최근 1개월
				        resetDateRangePicker(); // daterangepicker 초기화
				        toggleActiveButton($(this)); // 활성화된 버튼 토글
				    });

				    $('#threeMonthBtn').click(function() {
				        sendDateRange(3); // 최근 3개월
				        resetDateRangePicker(); // daterangepicker 초기화
				        toggleActiveButton($(this)); // 활성화된 버튼 토글
				    });

				    $('#sixMonthBtn').click(function() {
				        sendDateRange(6); // 최근 6개월
				        resetDateRangePicker(); // daterangepicker 초기화
				        toggleActiveButton($(this)); // 활성화된 버튼 토글
				    });

				    // 더보기 버튼 클릭 시
				    $(document).on('click', '#moreBtn', function() {
				        console.log("더보기 버튼 클릭됨"); // 클릭 시 로그 출력
				        loadTransactions(true); // true로 더보기 요청
				    });
				});

				// 기본 날짜 범위 설정 함수
				function setDefaultDateRange(months) {
				    const dateRange = calculateDateRange(months);
				    $('#startDate').val(dateRange.startDate);
				    $('#endDate').val(dateRange.endDate);
				    loadTransactions(); // 기본 날짜로 거래내역 로드
				}

				// daterangepicker 초기화 및 설정 함수
				function initializeDateRangePicker() {
				    $('input[name="daterange"]').daterangepicker({
				        locale: {
				            "separator": " ~ ",
				            "format": 'YYYY-MM-DD',
				            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
				            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
				        },
				        opens: 'left', 
				        autoUpdateInput: false, 
				        todayHighlight: true, 
				        autoApply: true 
				    }, function(start, end) {
				        $('#startDate').val(start.format('YYYY-MM-DD'));
				        $('#endDate').val(end.format('YYYY-MM-DD'));
				        toggleActiveButton(null); 
				    });

				    // 날짜 선택 후 필드에 값을 업데이트하는 로직
				    $('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
				        $(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
				    });

				    // 날짜 선택 취소 시 필드 비우기
				    $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
				        $(this).val('');
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
				}

				// daterangepicker 초기화 함수
				function resetDateRangePicker() {
				    // 입력 필드를 비움
				    $('input[name="daterange"]').val('');

				    // daterangepicker 내의 값을 초기화
				    $('input[name="daterange"]').data('daterangepicker').setStartDate(moment()); // 오늘 날짜로 시작 설정
				    $('input[name="daterange"]').data('daterangepicker').setEndDate(moment()); // 오늘 날짜로 끝 설정
				}

				// 버튼 활성화/비활성화 토글 함수
				function toggleActiveButton(button) {
				    // 모든 버튼의 active 클래스를 제거하여 비활성화
				    $('#oneMonthBtn, #threeMonthBtn, #sixMonthBtn').removeClass('active-button');

				    // 전달된 버튼에만 active 클래스를 추가하여 활성화
				    if (button) {
				        button.addClass('active-button');
				    }
				}

				// 날짜 형식을 yyyy-mm-dd로 변환하는 함수
				function formatDate(date) {
				    let year = date.getFullYear();
				    let month = ('0' + (date.getMonth() + 1)).slice(-2);
				    let day = ('0' + date.getDate()).slice(-2);
				    return year + '-' + month + '-' + day;
				}

				// 기간을 계산하는 함수
				function calculateDateRange(months) {
				    const today = new Date();
				    const pastDate = new Date();
				    pastDate.setMonth(today.getMonth() - months);
				    return {
				        startDate: formatDate(pastDate),
				        endDate: formatDate(today)
				    };
				}

				// 날짜에 맞는 데이터를 불러오는 AJAX 요청
				let currentPage = 1;
				function loadTransactions(isMore = false) {
				    let startDate = $('#startDate').val();
				    let endDate = $('#endDate').val();
				    let companyId = 'comp001';
				    
				    if (!isMore) {
				        currentPage = 1; // 새로 조회할 때는 페이지 번호를 1로 설정
				    }

				    $.ajax({
				        url: "${pageContext.request.contextPath}/companyBuyTransactions",
				        type: 'POST',
				        data: {
				            startDate: startDate,
				            endDate: endDate,
				            companyId: companyId,
				            page: currentPage
				        },
				        success: function(response) {
				            var transactionList = response.transactionList;
				            var hasMoreTransactions = response.hasMoreTransactions;

				            // transactionList 데이터를 기반으로 HTML 생성
				            var transactionListHtml = '';
				            $.each(transactionList, function(index, transaction) {
				            	transactionListHtml += '<a href="' + '${pageContext.request.contextPath}/CompanyAuctionBuyerSuc?auctionNum=' + transaction.auctionNum + '&transactionNum=' + transaction.transactionNum + '" style="text-decoration: none; color: inherit;">';
				                transactionListHtml += '<div class="history-item" data-auction-num="' + transaction.auctionNum + '">';
				                transactionListHtml += '<img src="image?file='+ transaction.personImage + '" alt="User">';
				                transactionListHtml += '<div class="history-content">';
				                transactionListHtml += '<span><b>A-No ' + transaction.auctionNum+'</b>&nbsp;&nbsp;&nbsp;'+transaction.auctionTitle + '</span>';
				                transactionListHtml += '</div>';
				                transactionListHtml += '<div class="prices">';
				                transactionListHtml += '<span>' + new Intl.NumberFormat().format(transaction.maxSalary) + '원</span>';
				                transactionListHtml += '<span>' + new Intl.NumberFormat().format(transaction.price) + '원</span>';
				                transactionListHtml += '<span>' + transaction.date + '</span>';
				                transactionListHtml += '</div>';
				                transactionListHtml += '</div>';
				                transactionListHtml += '</a>';
				            });

				            // 데이터를 페이지에 추가 (혹은 덮어쓰기)
				            if (isMore) {
				                $('#transaction-list').append(transactionListHtml);
				            } else {
				                $('#transaction-list').html(transactionListHtml);
				            }

				            // 현재 페이지 증가
				            currentPage++;

				            // 남은 데이터가 없을 경우 더보기 버튼 숨기기
				            if (!hasMoreTransactions) {
				                $('#moreBtn').hide();
				            } else {
				                $('#moreBtn').show();
				            }
				        },
				        error: function() {
				            alert('거래 내역을 불러오는 중 오류가 발생했습니다.');
				        }
				    });


				}

				// 버튼 클릭 시 날짜 범위를 설정하고 거래 내역을 로드하는 함수
				function sendDateRange(months) {
				    const dateRange = calculateDateRange(months);
				    $('#startDate').val(dateRange.startDate);
				    $('#endDate').val(dateRange.endDate);
				    loadTransactions();
				}


				
				</script>
			</div>
		</div>
	</div>
</body>
</html>
