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
.my_bidlist{
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

.title>h3,h2 {
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
	margin-top :20px;
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
#daterange{
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
   margin-left:20px;
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

</style>
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
						<h2>입찰 내역</h2>
					</div>
				</div>
            
            
            <!-- 필터 -->
            <div class="filters">
                <button type="button" onclick="calcPeriod(1);">최근 1개월</button>
                <button  type="button" onclick="calcPeriod(3);">3개월</button>
                <button  type="button" onclick="calcPeriod(6);">6개월</button>
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
				if(bizs==null || bizs==undefined) return;
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
               										'<img src="' + item.personImage + '" alt="User">' +
               										'<div class="history-content">' +
               										'<span>' + item.title + '</span>' +
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
        }
		$('.item_list').html('');
		page=0;
        reqeustData();
    }
	
	$('#moreBtn').on('click',function(){
		reqeustData();
	});
	reqeustData(); // 처음 호출 
//});	
</script>
        	</div>
        </div>
    </div>    
</body>
</html>