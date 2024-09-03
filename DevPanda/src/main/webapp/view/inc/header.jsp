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
<style>
body {
    font-family: "Nanum Gothic", sans-serif;
    font-weight: 400;
    font-style: normal;
}

.header {
    width: 100%;
    background-color: #FFFEF7;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);
    position: fixed;
    z-index: 100;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
    height: 150px;
}

.header_logo {
    display: flex;
    align-items: center;
    height: 100%;
}
.header_logo >span {
	font-size: 24px;
	font-weight:bold;
}

.header_logo img {
    max-height: 100px;
    height: auto;
    object-fit: contain;
}

.header_content {
    display: flex;
    height: 100%;
    margin-right: 100px;
    align-content: flex-end;
    align-items: center;
}
}

.header_top {
    display: flex;
    padding-top: 8px;
}

.header_top .top_list {
    display: flex;
    align-items: center;
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.header_top .top_item + .top_item {
    margin-left: 24px;
}

.header_top .top_link {
    color: rgba(34, 34, 34, .8);
    font-size: 12px;
    letter-spacing: -.06px;
    text-decoration: none;
}

/* .header_main {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
 */
/* .header_main .gnb_area {
    display: flex;
    align-items: center;
} */

.header_main .gnb_list {
    display: flex;
    list-style-type: none;
    margin: 0;
    margin-top: 30px;
    padding: 0;
}

.header_main .gnb_item + .gnb_item {
    margin-left: 40px;
}

.header_main .gnb_link {
    font-size: 20px;
    font-weight: bold;
    color: black;
    text-decoration: none;
}
</style>
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
