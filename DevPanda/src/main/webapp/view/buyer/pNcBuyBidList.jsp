<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuyBidList</title>
<!-- 개인,기업|구매내역조회|입찰내역조회| -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/css/mypageList.css" rel="stylesheet">
<style>
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
</style>
</head>
<body style="margin:0;">
	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<div class="container my">
                     <c:choose>
                        <c:when test="${userType == 'person'}">	
							<%@ include file="../inc/personSideNav.jsp"%>
                        </c:when>
                        <c:otherwise>
                           <%@ include file="../inc/comSideNav.jsp"%>
                        </c:otherwise>
                     </c:choose>
		<!-- list 정보 start -->
        <div class="content_area my-page-content">
            <div class="my_bidlist">
            
            <div class="content_title border">
					<div class="title">
						<h2>입찰 내역</h2>
					</div>
				</div>
            
            
            <!-- 필터 -->
            <div class="filters">
                <button type="button" class="period-button" onclick="calcPeriod(1);">최근 1개월</button>
                <button  type="button" class="period-button" onclick="calcPeriod(3);">최근 3개월</button>
                <button  type="button"  class="period-button" onclick="calcPeriod(6);">최근 6개월</button>
                <input type="text" id="daterange" name="daterange" value='' placeholder=""/>
				
				<script>
			     $(function () {
			            $('#daterange').daterangepicker({
			                locale: {
			                    "separator": " ~ ",
			                    "format": 'YYYY-MM-DD',
			                    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			                },
			                autoUpdateInput: false,
			                todayHighlight: true,
			                autoApply: true
			            });
			            
			            //'오늘' 버튼 추가
			            $('.daterangepicker').append('<button class="today-button">오늘</button>');

			            $('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
			                $(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
			            });

			            $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
			                $(this).val('');
			            });
			        });

			        // 날짜 값을 URL에 추가하는 함수
			    </script>
				
                <button type="button" onclick="sendDateRange()">조회</button>
            </div>

            <div class="item_container">
                <div class="item">
                    <span>입찰희망가</span>
                </div>

                <div class="item">
                    <span>현재최고입찰가</span>
                </div>

                <div class="item">
                    <span>입찰일</span>
                </div>
                
                <div class="item">
                    <span>마감일</span>
                </div>
            </div>

			<div class="item_list"></div>
			<div class="no-items-message" style="display: none;">
                <h2>입찰 내역이 없습니다.</h2>
            </div>
				
			<div class="empty_area">
				<button id="moreBtn" class="btn outlinegrey small">더보기</button>
			</div>
				
<script>

//$(document).ready(function() {
	
	let contextPath = '<%=request.getContextPath()%>';
	let page = 0;
	let maxPage = 0;
	let startDate = null;
	let endDate = null;
	
	function reqeustData() {
		let param = {page:page+1, startDate:startDate, endDate:endDate};
		console.log(param)
	 	$.ajax({
			url:`\${contextPath}/bidList`,
			type:'POST',
			dataType: 'json', 
			data:{param:JSON.stringify(param)},
			success: function(result) {
				console.log(result);
				maxPage = result.maxPage;
				page = result.page;
				if(page>=maxPage) {
					$('#moreBtn').hide();
				} else {
					$('#moreBtn').show();
				}

				let bizs = result.bidList;
				 if(bizs==null || bizs==undefined || bizs.length === 0) {
		                $('.item_list').hide();
		                $('.item_container').hide();
		                $('.no-items-message').show();
		                
		                resetDateRange();
		                return;
		          }
				  $('.item_list').show();
				  $('.item_container').show();
		          $('.no-items-message').hide();
		       
				bizs.forEach(function(item) {
					// bidState가 1일 때 빨간색 배경
					let backgroundColor = item.bidState === 1 ? 'background-color: rgb(254, 247, 246);':'';
					let itemHtml = '<form class="history-item-form"" method="post">' +
									'<input type="hidden" name="bidState" value="' + item.bidState + '">' +
			                        '<input type="hidden" name="sellerImage" value="' + item.personImage + '">' +
			                        '<input type="hidden" name="auctionNum" value="' + item.auctionNum + '">' +
			                        '<input type="hidden" name="bidNum" value="' + item.bidNum + '">'+
			                           				'<input type="hidden" name="bidPrice" value="' + item.bidPrice + '">' +
			                           				'<input type="hidden" name="bidDate" value="' + item.bidDate + '">' +
			                           				'<div class="history-item"  style="' + backgroundColor + '">' +
               										'<img src="image?file=' + item.personImage + '" alt="User">' +
               										'<div class="history-content">' +
               										'<span><b>A-No '+item.auctionNum +'</b>&nbsp;&nbsp;&nbsp;'+ item.title + '</span>' +
               										'</div>' +
               										'<div class="prices">' +
              										 '<span>' + item.bidPrice.toLocaleString() + '원</span>' +
               										'<span>' + item.bidMaxPrice.toLocaleString() + '원</span>' +
               										'<span>' + item.bidDate + '</span>' +
               										'<span>' + item.endDate + '</span>' +
               										'</div></div>'+
               									 	'</form>';
               		
					$('.item_list').append(itemHtml);
				
				});
						
			},
			error: function() {
				alert('데이터를 불러오는 중 오류가 발생했습니다.');
			}
		
	 	
	 	});
	}
	 // 이벤트 핸들러 추가: AJAX로 동적으로 추가된 요소에도 적용되도록 변경
    $(document).on('click', '.history-item', function() {
    		//.history-item 클래스의 form 태그를 찾기   
    		let form = $(this).closest('form');
    		  
    		
    		//state에 따라 다른 값을 전달해야함 
    	 	let bidState = form.find('input[name="bidState"]').val();
    		
    	    if (bidState === '1') { //suc
    	       form.attr("action",contextPath+'/nowAuctionBuyer');
    	    } else { //fail
    	    	  form.attr("action",contextPath+'/failAuctionBuyer');
    	    }
    	    form.submit();
    });

	function calcPeriod(param_month) {
		var date = new Date();

		var year = date.getFullYear();
		var month = (date.getMonth() + 1);
		var day = date.getDate();
		
		month = (month < 10) ? "0" + String(month) : month;
		day = (day < 10) ? "0" + String(day) : day;
		endDate = year + '-' + month + '-' + day;

		var monthOfYear = date.getMonth();
	  	date.setMonth(monthOfYear - param_month);
		
		year = date.getFullYear();
		month = (date.getMonth() + 1);
		day = date.getDate();
		
		month = (month < 10) ? "0" + String(month) : month;
		day = (day < 10) ? "0" + String(day) : day;
		
		startDate = year + '-' + month + '-' + day;	
		
		$('.period-button').removeClass('active');
		$(event.target).addClass('active');
		$('#daterange').val(''); 
		
		$('.item_list').html('');
		page=0;
		reqeustData();
	}	
	
    function sendDateRange() {
        var dateRange = $('#daterange').val();
        if(dateRange != null) {
        	var dates = dateRange.split(' ~ ');
        	startDate = dates[0];
        	endDate = dates[1];
            $('.period-button').removeClass('active');
        } else {
        	resetDateRange();
           
        }
		$('.item_list').html('');
		page=0;
        reqeustData();
    }
    function resetDateRange() {
        startDate = null;
        endDate = null;
        $('#daterange').val('');
        $('.period-button').removeClass('active');
    }
    
	
	$('#moreBtn').on('click',function(){
		reqeustData();
	});
	reqeustData(); // 처음 호출 
	
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
//});	
</script>
        	</div>
        </div>
    </div>    
</body>
</html>