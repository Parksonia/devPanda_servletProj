<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVPanda|개발자 거래플랫폼</title>
<link href="${pageContext.request.contextPath}/css/sideNav.css" rel="stylesheet">
<style>
.menu_item.active .menu_link {
  font-weight: bold;
  color: #007bff; /* 원하는 하이라이트 색상으로 변경 */
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
  const currentPath = window.location.pathname + window.location.search;
  const menuItems = document.querySelectorAll('.menu_item');
  
  menuItems.forEach(item => {
    const link = item.querySelector('.menu_link');
    if (link) {
      const href = link.getAttribute('href');
      // URL의 기본 경로만 추출 (쿼리 파라미터 제외)
      const hrefPath = href.split('?')[0];
      // 현재 URL이 메뉴 항목의 href로 시작하는지 확인
      if (currentPath.startsWith(hrefPath)) {
        item.classList.add('active');
      }
    }
  });
});
</script>
</head>
<body>

	<div class="snb_area">
		<h2 class="snb_main_title">마이 페이지</h2>
		<nav class="snb">
			<div class="snb_list">
				<strong class="snb_title"> 
					<svg class="cart_icon" xmlns="http://www.w3.org/2000/svg" height="21px" viewBox="0 -960 960 960" width="21px" fill="#5f6368">
						<path d="M280-80q-33 0-56.5-23.5T200-160q0-33 23.5-56.5T280-240q33 0 56.5 23.5T360-160q0 33-23.5 56.5T280-80Zm400 0q-33 0-56.5-23.5T600-160q0-33 23.5-56.5T680-240q33 0 56.5 23.5T760-160q0 33-23.5 56.5T680-80ZM246-720l96 200h280l110-200H246Zm-38-80h590q23 0 35 20.5t1 41.5L692-482q-11 20-29.5 31T622-440H324l-44 80h480v80H280q-45 0-68-39.5t-2-78.5l54-98-144-304H40v-80h130l38 80Zm134 280h280-280Z" />
					</svg>
					구매내역조회
				</strong>
				<ul class="snb_menu">
					<li class="menu_item">
						<a href="${pageContext.request.contextPath}/bidList" class="menu_link">입찰내역조회</a>
					</li>
					<li class="menu_item">
						<a href="${pageContext.request.contextPath}/personBuyTransactionList" class="menu_link">낙찰내역조회</a>
					</li>
					<li class="menu_item">
						<a href="${pageContext.request.contextPath}/BlackListAboutSeller" class="menu_link">판매자 차단 내역</a>
					</li>
				</ul>
			</div>
			<div class="snb_list">
				<strong class="snb_title">
					<svg class="cart_icon" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#5f6368">
						<path d="M856-390 570-104q-12 12-27 18t-30 6q-15 0-30-6t-27-18L103-457q-11-11-17-25.5T80-513v-287q0-33 23.5-56.5T160-880h287q16 0 31 6.5t26 17.5l352 353q12 12 17.5 27t5.5 30q0 15-5.5 29.5T856-390ZM513-160l286-286-353-354H160v286l353 354ZM260-640q25 0 42.5-17.5T320-700q0-25-17.5-42.5T260-760q-25 0-42.5 17.5T200-700q0 25 17.5 42.5T260-640Zm220 160Z" />
					</svg>
					판매내역조회 
				</strong>
				<ul class="snb_menu">
					<li class="menu_item">
						<a href="${pageContext.request.contextPath}/personSellAuctionList" class="menu_link">경매등록 내역조회</a>
					</li>
					<li class="menu_item">
						<a href="${pageContext.request.contextPath}/personSellTransactionList" class="menu_link">낙찰내역조회</a>
					</li>
					<li class="menu_item">
						<a href="${pageContext.request.contextPath}/buyerBlacklist" class="menu_link">구매자 차단 내역</a>
					</li>
				</ul>
			</div>
			<div class="snb_list">
				<strong class="snb_title"> 
				<a> 
					<svg class="cart_icon" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#5f6368">
						<path d="M0 0h24v24H0z" fill="none" /> 
						<path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
					</svg>
				</a>
				내정보
				</strong>
				<ul class="snb_menu">
					<li class="menu_item">
					<a href="${pageContext.request.contextPath}/personInfo" class="menu_link">정보수정</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>

</body>
</html>