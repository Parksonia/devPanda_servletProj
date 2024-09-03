<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BidList</title>
<!-- 개인|판매내역조회|낙찰내역조회| -->
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

.item_container {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.item {
	display: flex;
	align-items: center;
	position: relative;
	margin-left: 20px;
}

.arrows {
	display: flex;
	flex-direction: column;
	margin-left: 5px;
	margin-bottom: 8px;
}

.arrow-up, .arrow-down {
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
}

.arrow-up {
	border-bottom: 5px solid #ccc;
	margin-bottom: 2px;
}

.arrow-down {
	border-top: 5px solid #ccc;
	margin-top: 2px;
}

.item span {
	font-size: 14px;
	font-weight: bold;
	margin-right: 5px;
	margin-bottom: 10px;
}

.history-item {
	background-color:rgb(254, 247, 246);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 10px;
    margin-bottom: 10px;
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
	gap: 20px;
}

.prices span {
	font-size: 14px;
	font-weight: bold;
}

.pagination {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 20px;
}

.pagination a {
	text-decoration: none;
	color: blue;
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
						<h2>낙찰 내역</h2>
					</div>
				</div>
            
            
            <!-- 필터 -->
            <div class="filters">
                <button>최근 1개월</button>
                <button>3개월</button>
                <button>6개월</button>
                <script>
				$(function() {
				  $('input[name="daterange"]').daterangepicker({
				    opens: 'left',
				    autoUpdateInput: false
				  }, function(start, end, label) {
				    console.log("search date: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
				  });
				});
				</script>
                <button>조회</button>
            </div>

            <div class="item_container">
                <div class="item">
                    <span>낙찰 희망가</span>
                    <div class="arrows">
                        <div class="arrow-up"></div>
                        <div class="arrow-down"></div>
                    </div>
                </div>

                <div class="item">
                    <span>최종가</span>
                    <div class="arrows">
                        <div class="arrow-up"></div>
                        <div class="arrow-down"></div>
                    </div>
                </div>

                <div class="item">
                    <span>만료일</span>
                    <div class="arrows">
                        <div class="arrow-up"></div>
                        <div class="arrow-down"></div>
                    </div>
                </div>
            </div>

            <!-- 목록들 나열 -->
            <div class="history-item" >
                <img src="https://via.placeholder.com/50" alt="User"> 
                    <div class="history-content">
                        <span>The More Important the Work, the More Important the
                            Rest</span>
                        <div class="tags">
                            <span>JAVA</span> <span>경력1년이상</span> <span>백엔드개발</span>
                        </div>
                    </div>

                <div class="prices">
                    <span>45,000 원</span> <span>50,000 원</span> <span>2024-08-31</span>
                </div>
            </div>

            <div class="history-item" >
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력2년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>47,000 원</span> <span>53,000 원</span> <span>2024-09-01</span>
                </div>
            </div>

            <div class="history-item">
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력3년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>50,000 원</span> <span>55,000 원</span> <span>2024-09-05</span>
                </div>
            </div>

            <div class="history-item">
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력4년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>48,000 원</span> <span>54,000 원</span> <span>2024-09-10</span>
                </div>
            </div>

            <div class="history-item">
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력5년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>49,000 원</span> <span>56,000 원</span> <span>2024-09-15</span>
                </div>
            </div>

            <div class="history-item">
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력6년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>49,000 원</span> <span>56,000 원</span> <span>2024-09-15</span>
                </div>
            </div>

            <div class="history-item">
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력7년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>49,000 원</span> <span>56,000 원</span> <span>2024-09-15</span>
                </div>
            </div>

            <div class="history-item">
                <img src="https://via.placeholder.com/50" alt="User">
                <div class="history-content">
                    <span>The More Important the Work, the More Important the
                        Rest</span>
                    <div class="tags">
                        <span>JAVA</span> <span>경력8년이상</span> <span>백엔드개발</span>
                    </div>
                </div>
                <div class="prices">
                    <span>49,000 원</span> <span>56,000 원</span> <span>2024-09-15</span>
                </div>
            </div>

            <!-- pagination start -->
            <div class="pagination">
                <a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
                    href="#">3</a> <a href="#">Next</a>
            </div>
       		<!-- pagination end -->	
        	
        	
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
