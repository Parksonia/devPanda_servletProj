<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
    String userType = (String)session.getAttribute("userType");
	String id = (String)session.getAttribute("id");
	//System.out.println(id);
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
    <div class="header" style=" box-sizing: border-box;">
        <div class="header_logo">
            <a href="${pageContext.request.contextPath }/auctionoffset"><img src="${pageContext.request.contextPath}/img/logoS.png" alt="DevPanda Logo"></a>

        	<span>DevPanda</span>
        </div>

        <div class="header_content">
    		<div class="header_top">
				<c:choose>
					<c:when test="${userType == 'person'}">
						<img src="${pageContext.request.contextPath}/img/individual.png"  style="width:15px;height:15px;">
					</c:when>
					<c:when test="${userType == 'company'}">
						<img src="${pageContext.request.contextPath}/img/company.png"  style="width:15px;height:15px;">
					</c:when>
				</c:choose>
            	<span style="font-weight:bold; padding-left:5px;">${id}님 환영합니다</span>
            </div>

            <div class="header_main">
                <div class="gnb_area">
                    <nav class="gnb" id="pcGnbContainer">
                        <ul class="gnb_list" id="pcGnbList">
                            <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/auctionoffset">AUCTION</a></li>
	                            <c:choose>
	                                <c:when test="${userType == 'person'}">
	                                    <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/personInfo">MYPAGE</a></li>
	                                </c:when>
	                                <c:when test="${userType == 'company'}">
	                                    <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/companyInfo">MYPAGE</a></li>
	                                </c:when>
	                            </c:choose>
                            <li class="gnb_item"><a class="gnb_link" href="${pageContext.request.contextPath }/logout">LOGOUT</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
