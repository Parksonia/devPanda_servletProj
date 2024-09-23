<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
    String userType = (String)session.getAttribute("userType");
    request.setAttribute("userType", userType);  
%>
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
            <a href="${pageContext.request.contextPath }/auctionoffset"><img src="${pageContext.request.contextPath}/img/logoS.png" alt="DevPanda Logo"></a>

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
                            <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/auction">AUCTION</a></li>
	                            <c:choose>
	                                <c:when test="${userType == 'person'}">
	                                    <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/personInfo">MYPAGE</a></li>
	                                </c:when>
	                                <c:when test="${userType == 'company'}">
	                                    <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/companyInfo">MYPAGE</a></li>
	                                </c:when>
	                            </c:choose>
                            <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/auctionoffset">AUCTION</a></li>
                            <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/bidList">MYPAGE</a></li>

                  	
                     <c:choose>
                        <c:when test="${userType == 'person'}">
                           <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/personInfo">MYPAGE</a></li>
                        </c:when>
                        <c:otherwise>
                           <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/companyInfo">MYPAGE</a></li>
                        </c:otherwise>
                     </c:choose>

                            <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/start">LOGOUT</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
