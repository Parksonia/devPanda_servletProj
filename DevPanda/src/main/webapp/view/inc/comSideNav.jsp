<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVPanda|개발자 거래플랫폼</title>
<link href="${pageContext.request.contextPath}/css/sideNav.css" rel="stylesheet">

</head>
<body>

	<div class="snb_area">
		<a href="/mypage"><h2 class="snb_main_title">마이 페이지</h2></a>
		<nav class="snb">
			<div class="snb_list">
				<strong class="snb_title"> <svg class="cart_icon" xmlns="http://www.w3.org/2000/svg" height="21px" viewBox="0 -960 960 960" width="21px" fill="#5f6368">
							<path d="M280-80q-33 0-56.5-23.5T200-160q0-33 23.5-56.5T280-240q33 0 56.5 23.5T360-160q0 33-23.5 56.5T280-80Zm400 0q-33 0-56.5-23.5T600-160q0-33 23.5-56.5T680-240q33 0 56.5 23.5T760-160q0 33-23.5 56.5T680-80ZM246-720l96 200h280l110-200H246Zm-38-80h590q23 0 35 20.5t1 41.5L692-482q-11 20-29.5 31T622-440H324l-44 80h480v80H280q-45 0-68-39.5t-2-78.5l54-98-144-304H40v-80h130l38 80Zm134 280h280-280Z" /></svg> 구매내역조회
				</strong>
				<ul class="snb_menu">
					<li class="menu_item"><a href="${pageContext.request.contextPath}/bidList?companyId=comp001" class="menu_link">입찰내역조회</a></li>
					<li class="menu_item"><a href="${pageContext.request.contextPath}/CompanyBuyBidSucList?companyId=comp001" class="menu_link">낙찰내역조회</a></li>
					<!-- <li class="menu_item"><a href="/sellerBlack.jsp" class="menu_link">판매자 차단 내역</a></li> -->
					
					<li class="menu_item">
    					<a href="${pageContext.request.contextPath}/companySellerBlack?companyId=comp001" class="menu_link">판매자 차단 내역</a>
					</li>
					
				</ul>
			</div>
			<div class="snb_list">
				<strong class="snb_title"> <a> <svg class="cart_icon" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#5f6368">
								<path d="M0 0h24v24H0z" fill="none" />
								<path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" /></svg>
				</a> 내정보
				</strong>
				<ul class="snb_menu">
					<li class="menu_item"><a href="${pageContext.request.contextPath}/companyInfo?companyId=comp001" class="menu_link">정보수정</a></li>
				</ul>
			</div>
		</nav>
	</div>

</body>
</html>