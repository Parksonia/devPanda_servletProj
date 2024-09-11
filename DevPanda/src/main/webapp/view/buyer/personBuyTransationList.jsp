<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="${pageContext.request.contextPath}/css/personBuyTransationList.css" rel="stylesheet">
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
					<input type="text" name="daterange" value="" />
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
						<span>최고희망금액</span>
					</div>

					<div class="item">
						<span>낙찰액</span>
					</div>

					<div class="item">
						<span>낙찰일</span>
					</div>
				</div>





				<!-- 목록들 나열 -->
				<!-- -------------------------------------------------------------------------------- 반복-->
				<div class="history-item"
					style="background-color: rgb(254, 247, 246)">
					<img src="https://via.placeholder.com/50" alt="User">
					<div class="history-content">
						<span>The More Important the Work, the More Important the
							Rest</span>
					</div>
					<div class="prices">
						<span>45,000 원</span> <span>50,000 원</span> <span>2024-08-31</span>
					</div>
				</div>

				<div class="history-item"
					style="background-color: rgb(254, 247, 246)">
					<img src="https://via.placeholder.com/50" alt="User">
					<div class="history-content">
						<span>The More Important the Work, the More Important the
							Rest</span>
					</div>

					<div class="prices">
						<span>45,000 원</span> <span>50,000 원</span> <span>2024-08-31</span>
					</div>
				</div>
				<!-- -------------------------------------------------------------------------------- -->

				<div class="history-item"
					style="background-color: rgb(254, 247, 246)">
					<img src="https://via.placeholder.com/50" alt="User">
					<div class="history-content">
						<span>The More Important the Work, the More Important the
							Rest</span>
					</div>
					<div class="prices">
						<span>47,000 원</span> <span>53,000 원</span> <span>2024-09-01</span>
					</div>
				</div>

				<div class="history-item"
					style="background-color: rgb(254, 247, 246)">
					<img src="https://via.placeholder.com/50" alt="User">
					<div class="history-content">
						<span>The More Important the Work, the More Important the
							Rest</span>
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
					</div>
					<div class="prices">
						<span>49,000 원</span> <span>56,000 원</span> <span>2024-09-15</span>
					</div>
				</div>
				<!-- 목록들 나열 -->

				<!-- pagination start -->
				<div class="pagination">
					<a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
						href="#">3</a> <a href="#">Next</a>
				</div>
				<!-- pagination end -->




				<!-- 데이터 체크용  -->
				<table border="1 solid black">
					<tr id="tr_top">
						<th>최고희망금액</th>
						<th>낙찰금액</th>
						<th>낙찰일</th>
					</tr>
					<c:forEach items="${personBuyTransactionList }" var="transaction">
						<tr>
							<td>${transaction.auction.maxSalary }원</td>
							<td>${transaction.price }원</td>
							<td>${transaction.date }</td>
						</tr>
					</c:forEach>
				</table>
				<!-- 데이터 체크용  -->


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
