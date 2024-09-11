<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVPanda|개발자 거래플랫폼</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <div class="header_logo">
            <a href="main.jsp"><img src="${pageContext.request.contextPath}/img/logoS.png" alt="DevPanda Logo"></a>
        	<span>DevPanda</span>
        </div>

        <div class="header_content">
    <!--         <div class="header_top">
                <ul class="top_list">
                    <li class="top_item"><a class="top_link" href="./personInfo.jsp">마이페이지</a></li>
                    <li class="top_item"><a class="top_link" href="#notifications">알림</a></li>
                    <li class="top_item"><a class="top_link" href="/">로그아웃</a></li>
                </ul>
            </div> -->

            <div class="header_main">
                <div class="gnb_area">
                    <nav class="gnb" id="pcGnbContainer">
                        <ul class="gnb_list" id="pcGnbList">
                            <li class="gnb_item"><a class="gnb_link" href="main.jsp">AUCTION</a></li>
                            <li class="gnb_item"><a class="gnb_link" href="personInfo.jsp">MYPAGE</a></li>
                            <li class="gnb_item"><a class="gnb_link" href="personInfo.jsp">LOGOUT</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
