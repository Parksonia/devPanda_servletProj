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
<style>
.container.my .content_area {
	min-height: 380px;
}

.container {
	background-color: #fff;
	padding: 0px 20px 20px 20px;
	border-radius: 10px;
	box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);
}

.my_bidlist {
	padding: 0 24px 80px;
}

.content_title {
	display: flex;
}

.content_title.border {
	border-bottom: 3px solid #222;
	padding-bottom: 16px;
}

.title {
	font-size: 24px;
	letter-spacing: -.36px
}

.title>h3, h2 {
	font-size: inherit;
	line-height: 29px
}

.list_header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.list_header input {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	width: 60%;
}

.list_header select, .header button {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.searchBtn {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.filters {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
	margin-top: 20px;
}

.filters button {
	flex: 1;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	background-color: #f0f0f0;
	cursor: pointer;
}

.filters button:hover {
	background-color: #e0e0e0;
}

#daterange {
	text-align: center;
	width: 200px;
}

.item_container {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	gap: 10px;
	padding: 0 15px;
	margin-bottom: 10px;
}

.item {
	width: 120px; /* prices와 동일한 너비 설정 */
	text-align: right; /* 텍스트 가운데 정렬 */
}

.item span {
	font-size: 14px;
	font-weight: bold;
	margin-right: 5px;
	margin-bottom: 10px;
}

.history-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 10px;
	background-color: #fafafa;
	transition: transform 0.3s ease, background-color 0.3s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transform-origin: center; /* 확대될 때 중심을 기준으로 확대되도록 설정 */
}

.history-item:hover {
	background-color: #f5f5f5;
	transform: scale(1.02);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* 확대 효과에 따른 그림자 */
}

.history-item img {
	border-radius: 10px;
	width: 80px;
	height: 80px;
	margin-right: 10px;
}

.history-content {
	margin-left: 20px;
	display: flex;
	flex-direction: column;
	flex: 1;
}

.history-content .tags {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.history-content .tags span {
	padding: 5px 10px;
	background-color: #e0e0e0;
	border-radius: 20px;
	font-size: 12px;
}

.prices {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 10px;
}

.prices span {
	font-size: 14px;
	font-weight: bold;
	width: 120px; /* 일정한 너비 설정 */
	text-align: right; /* 금액을 오른쪽 정렬 */
}

.empty_area {
	padding: 81px 0 45px;
	text-align: center
}

.btn {
	align-items: center;
	background-color: #fff;
	color: rgba(34, 34, 34, .8);
	cursor: pointer;
	display: inline-flex;
	justify-content: center;
	text-align: center;
	vertical-align: middle
}

.outlinegrey {
	border: 1px solid #d3d3d3;
	color: rgba(34, 34, 34, .8)
}

.outlinegrey:active {
	background-color: #f4f4f4;
	border-color: #ebebeb;
	color: rgba(34, 34, 34, .5)
}

.small {
	border-radius: 10px;
	font-size: 12px;
	height: 34px;
	letter-spacing: -.06px;
	padding: 0 14px
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
<body>
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
				                transactionListHtml += '<img src="https://via.placeholder.com/50" alt="User">';
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
