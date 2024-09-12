<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Auction"%>
<%@ page import="dto.Person"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DevPanda</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body class="bg-gray-100 text-gray-900">

	<!-- Header Start -->
	<header>
		<%@ include file="./inc/header.jsp"%>
	</header>
	<!-- Header End -->

	<main class="p-8">
	
<!-- 관심 키워드 Section -->
<section class="mb-8">
    <h2 class="text-xl font-bold mb-4">관심 키워드</h2>
    <div class="bg-white p-4 shadow-md rounded">
        <!-- 카테고리들 -->
        <div class="category-container">
            <!-- 카테고리 1: 지역 -->
            <div>
                <button id="category1-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#지역</button>
                <div id="category1-content" class="category-content hidden">
                    <label><input type="checkbox" name="region" value="전국"> 전국</label><br>
                    <label><input type="checkbox" name="region" value="서울"> 서울</label><br>
                    <label><input type="checkbox" name="region" value="경/인"> 경/인</label><br>
                    <label><input type="checkbox" name="region" value="강원"> 강원</label><br>
                    <label><input type="checkbox" name="region" value="경남"> 경남</label><br>
                    <label><input type="checkbox" name="region" value="경북"> 경북</label><br>
                    <label><input type="checkbox" name="region" value="전남"> 전남</label><br>
                    <label><input type="checkbox" name="region" value="전북"> 전북</label><br>
                    <label><input type="checkbox" name="region" value="충남"> 충남</label><br>
                    <label><input type="checkbox" name="region" value="충북"> 충북</label><br>
                    <label><input type="checkbox" name="region" value="제주"> 제주</label><br>
                </div>
            </div>

            <!-- 카테고리 2: 보유 기술 -->
            <div>
                <button id="category2-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#보유 기술</button>
                <div id="category2-content" class="category-content hidden">
                    <label><input type="checkbox" name="skills" value="JAVA"> JAVA</label><br>
                    <label><input type="checkbox" name="skills" value="Python"> Python</label><br>
                    <label><input type="checkbox" name="skills" value="C"> C</label><br>
                    <label><input type="checkbox" name="skills" value="C++"> C++</label><br>
                    <label><input type="checkbox" name="skills" value="C#"> C#</label><br>
                    <label><input type="checkbox" name="skills" value="html,css,js"> html,css,js</label><br>
                    <label><input type="checkbox" name="skills" value="Go"> Go</label><br>
                    <label><input type="checkbox" name="skills" value="kotlin"> kotlin</label><br>
                    <label><input type="checkbox" name="skills" value="aws"> aws</label><br>
                    <label><input type="checkbox" name="skills" value="springboot"> springboot</label><br>
                    <label><input type="checkbox" name="skills" value="react"> react</label><br>
                    <label><input type="checkbox" name="skills" value="vue"> vue</label><br>
                    <label><input type="checkbox" name="skills" value="django"> django</label><br>
                    <label><input type="checkbox" name="skills" value="tensorflow"> tensorflow</label><br>
                    <label><input type="checkbox" name="skills" value="flutter"> flutter</label><br>
                    <label><input type="checkbox" name="skills" value="ios"> ios</label><br>
                    <label><input type="checkbox" name="skills" value="android"> android</label><br>
                    <label><input type="checkbox" name="skills" value="swift"> swift</label><br>
                    <label><input type="checkbox" name="skills" value="oracle"> oracle</label><br>
                    <label><input type="checkbox" name="skills" value="redis"> redis</label><br>
                    <label><input type="checkbox" name="skills" value="mysql"> mysql</label><br>
                    <label><input type="checkbox" name="skills" value="nosql"> nosql</label><br>
                    <label><input type="checkbox" name="skills" value="mariadb"> mariadb</label><br>
                </div>
            </div>

            <!-- 카테고리 3: (원하는)직무 -->
            <div>
                <button id="category3-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#직무</button>
                <div id="category3-content" class="category-content hidden">
                    <label><input type="checkbox" name="role" value="백엔드"> 백엔드</label><br>
                    <label><input type="checkbox" name="role" value="프론트엔드"> 프론트엔드</label><br>
                    <label><input type="checkbox" name="role" value="웹"> 웹</label><br>
                    <label><input type="checkbox" name="role" value="앱"> 앱</label><br>
                    <label><input type="checkbox" name="role" value="시스템엔지니어"> 시스템엔지니어</label><br>
                    <label><input type="checkbox" name="role" value="네트워크엔지니어"> 네트워크엔지니어</label><br>
                    <label><input type="checkbox" name="role" value="데이터엔지니어"> 데이터엔지니어</label><br>
                    <label><input type="checkbox" name="role" value="보안엔지니어"> 보안엔지니어</label><br>
                    <label><input type="checkbox" name="role" value="게임 개발"> 게임 개발</label><br>
                    <label><input type="checkbox" name="role" value="임베디드 개발"> 임베디드 개발</label><br>
                    <label><input type="checkbox" name="role" value="머신러닝,AI,블록체인 개발"> 머신러닝,AI,블록체인 개발</label><br>
                    <label><input type="checkbox" name="role" value="클라우드엔지니어"> 클라우드엔지니어</label><br>
                    <label><input type="checkbox" name="role" value="웹퍼블리셔"> 웹퍼블리셔</label><br>
                </div>
            </div>

            <!-- 카테고리 4: 경력 -->
            <div>
                <button id="category4-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#경력</button>
                <div id="category4-content" class="category-content hidden">
                    <label><input type="checkbox" name="experience" value="신입"> 신입</label><br>
                    <label><input type="checkbox" name="experience" value="경력"> 경력</label><br>
                </div>
            </div>

            <!-- 카테고리 5: 학력 -->
            <div>
                <button id="category5-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#학력</button>
                <div id="category5-content" class="category-content hidden">
                    <label><input type="checkbox" name="education" value="고졸"> 고졸</label><br>
                    <label><input type="checkbox" name="education" value="초대졸"> 초대졸</label><br>
                    <label><input type="checkbox" name="education" value="학사"> 학사</label><br>
                    <label><input type="checkbox" name="education" value="석사"> 석사</label><br>
                    <label><input type="checkbox" name="education" value="박사"> 박사</label><br>
                    <label><input type="checkbox" name="education" value="학력무관"> 학력무관</label><br>
                </div>
            </div>

            <!-- 카테고리 6: 자격증 -->
            <div>
                <button id="category6-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#자격증</button>
                <div id="category6-content" class="category-content hidden">
                    <label><input type="checkbox" name="certifications" value="토익700↑"> 토익700↑</label><br>
                    <label><input type="checkbox" name="certifications" value="토플700↑"> 토플700↑</label><br>
                    <label><input type="checkbox" name="certifications" value="토스IL↑"> 토스IL↑</label><br>
                    <label><input type="checkbox" name="certifications" value="정보처리산업기사"> 정보통신기사</label><br>
                    <label><input type="checkbox" name="certifications" value="정보처리기사"> 정보처리기사</label><br>
                    <label><input type="checkbox" name="certifications" value="리눅스마스터1급"> 리눅스마스터1급</label><br>
                    <label><input type="checkbox" name="certifications" value="리눅스마스터2급"> 리눅스마스터2급</label><br>
                    <label><input type="checkbox" name="certifications" value="네트워크관리사2급"> 네트워크관리사2급</label><br>
                    <label><input type="checkbox" name="certifications" value="정보보안산업기사"> 정보보안산업기사</label><br>
                    <label><input type="checkbox" name="certifications" value="정보보안기사"> 정보보안기사</label><br>
                    <label><input type="checkbox" name="certifications" value="SQLD"> SQLD</label><br>
                    <label><input type="checkbox" name="certifications" value="SQLP"> SQLP</label><br>
                    <label><input type="checkbox" name="certifications" value="기타"> 기타</label><br>
                </div>
            </div>
            
            <!-- 카테고리 7: 고용형태 -->
            <div>
                <button id="category7-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#고용형태</button>
                <div id="category7-content" class="category-content hidden">
                    <label><input type="checkbox" name="education" value="계약직3개월"> 계약직3개월</label><br>
                    <label><input type="checkbox" name="education" value="계약직6개월"> 계약직6개월</label><br>
                    <label><input type="checkbox" name="education" value="정규직"> 정규직</label><br>
                    <label><input type="checkbox" name="education" value="인턴"> 인턴</label><br>
                    <label><input type="checkbox" name="education" value="프리랜서"> 프리랜서</label><br>
                </div>
            </div>
        </div>
    

				<div class="flex justify-between mt-4">
					<button onclick="resetSelections()"
						class="bg-gray-300 text-gray-800 p-2 rounded">초기화</button>

					<button onclick="openAuctionModal()"
						class="bg-green-500 text-white p-2 rounded">경매 등록하기</button>
				</div>
			</div>
		</section>

		<!-- 나만의 개발자 Section -->
		<section class="mb-8">
			<h2 class="text-xl font-bold mb-4">나만의 개발자</h2>
			<div id="auction-container"
				class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
				<!-- 프로필 카드들 -->
				<c:forEach var="auctionMap" items="${auctions}">
					<c:set var="title" value="${auctionMap.title}" />
					<c:set var="minSalary" value="${auctionMap.minSalary}" />
					<c:set var="maxSalary" value="${auctionMap.maxSalary}" />
					<c:set var="personImage" value="${auctionMap.personImage}" />
					<c:set var="nickName" value="${auctionMap.nickName}" />
					<div class="profile-card bg-white shadow-md rounded p-4">
						<img src="${personImage}" alt="Profile Image"
							class="profile-image">
						<h2 class="text-xl font-semibold">${title}</h2>
						<p class="text-gray-700">Min Salary: ${minSalary}</p>
						<p class="text-gray-700">Max Salary: ${maxSalary}</p>
						<p class="text-gray-600">${nickName}</p>
					</div>
				</c:forEach>

			</div>
			<div id="loading" class="text-center mt-4 hidden">
				<p>로딩 중...</p>
			</div>
		</section>



	</main>

	<!-- 경매 등록하기 모달 -->
<div id="auctionModal" class="modal" onclick="closeAuctionModal(event)">
    <div class="modal-content" onclick="event.stopPropagation()">
        <button class="close-button" onclick="closeAuctionModal(event)">×</button>
        <h2 class="text-2xl font-bold mb-4">경매 등록하기</h2>
        
        <form id="auctionForm" method="POST" action="insertAuction" enctype="multipart/form-data">
            
            <label class="block mb-2 text-left">TITLE:</label> 
            <input type="text" name="title" class="w-full p-2 mb-4 border rounded" placeholder="한줄 소개를 입력하세요" required>
            <label class="block mb-2 text-left">최소 금액:</label> 
            <input type="number" name="minSalary" class="w-full p-2 mb-4 border rounded" placeholder="최소 금액을 입력하세요" required>
            <label class="block mb-2 text-left">최대 금액:</label> 
            <input type="number" name="maxSalary" class="w-full p-2 mb-4 border rounded" placeholder="최대 금액을 입력하세요" required>
            <p class="text-sm text-gray-500 mt-1">최대 금액 입찰 시 즉시 구매됩니다.</p>

            <label class="block mb-2 text-left">카테고리 선택:</label>
            
            <div class="category-container">
					<!-- 카테고리 1: 지역 -->
<div>
    <button type="button" id="category1-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#지역</button>
    <div id="category1-content-modal" class="category-content hidden">
        <label><input type="checkbox" name="location[]" value="전국"> 전국</label><br>
        <label><input type="checkbox" name="location[]" value="서울"> 서울</label><br>
        <label><input type="checkbox" name="location[]" value="경/인"> 경/인</label><br>
        <label><input type="checkbox" name="location[]" value="강원"> 강원</label><br>
        <label><input type="checkbox" name="location[]" value="경남"> 경남</label><br>
        <label><input type="checkbox" name="location[]" value="경북"> 경북</label><br>
        <label><input type="checkbox" name="location[]" value="전남"> 전남</label><br>
        <label><input type="checkbox" name="location[]" value="전북"> 전북</label><br>
        <label><input type="checkbox" name="location[]" value="충남"> 충남</label><br>
        <label><input type="checkbox" name="location[]" value="충북"> 충북</label><br>
        <label><input type="checkbox" name="location[]" value="제주"> 제주</label><br>
    </div>
</div>

<!-- 카테고리 2: 보유 기술 -->
<div>
    <button type="button" id="category2-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#보유 기술</button>
    <div id="category2-content-modal" class="category-content hidden">
        <label><input type="checkbox" name="stack[]" value="JAVA"> JAVA</label><br>
        <label><input type="checkbox" name="stack[]" value="Python"> Python</label><br>
        <label><input type="checkbox" name="stack[]" value="C"> C</label><br>
        <label><input type="checkbox" name="stack[]" value="C++"> C++</label><br>
        <label><input type="checkbox" name="stack[]" value="C#"> C#</label><br>
        <label><input type="checkbox" name="stack[]" value="html,css,js"> html,css,js</label><br>
        <label><input type="checkbox" name="stack[]" value="Go"> Go</label><br>
        <label><input type="checkbox" name="stack[]" value="kotlin"> kotlin</label><br>
        <label><input type="checkbox" name="stack[]" value="aws"> aws</label><br>
        <label><input type="checkbox" name="stack[]" value="springboot"> springboot</label><br>
        <label><input type="checkbox" name="stack[]" value="react"> react</label><br>
        <label><input type="checkbox" name="stack[]" value="vue"> vue</label><br>
        <label><input type="checkbox" name="stack[]" value="django"> django</label><br>
        <label><input type="checkbox" name="stack[]" value="tensorflow"> tensorflow</label><br>
        <label><input type="checkbox" name="stack[]" value="flutter"> flutter</label><br>
        <label><input type="checkbox" name="stack[]" value="ios"> ios</label><br>
        <label><input type="checkbox" name="stack[]" value="android"> android</label><br>
        <label><input type="checkbox" name="stack[]" value="swift"> swift</label><br>
        <label><input type="checkbox" name="stack[]" value="oracle"> oracle</label><br>
        <label><input type="checkbox" name="stack[]" value="redis"> redis</label><br>
        <label><input type="checkbox" name="stack[]" value="mysql"> mysql</label><br>
        <label><input type="checkbox" name="stack[]" value="nosql"> nosql</label><br>
        <label><input type="checkbox" name="stack[]" value="mariadb"> mariadb</label><br>
    </div>
</div>

<!-- 카테고리 3: (원하는)직무 -->
<div>
    <button type="button" id="category3-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#직무</button>
    <div id="category3-content-modal" class="category-content hidden">
        <label><input type="checkbox" name="Occupation[]" value="백엔드"> 백엔드</label><br>
        <label><input type="checkbox" name="Occupation[]" value="프론트엔드"> 프론트엔드</label><br>
        <label><input type="checkbox" name="Occupation[]" value="웹"> 웹</label><br>
        <label><input type="checkbox" name="Occupation[]" value="앱"> 앱</label><br>
        <label><input type="checkbox" name="Occupation[]" value="시스템엔지니어"> 시스템엔지니어</label><br>
        <label><input type="checkbox" name="Occupation[]" value="네트워크엔지니어"> 네트워크엔지니어</label><br>
        <label><input type="checkbox" name="Occupation[]" value="데이터엔지니어"> 데이터엔지니어</label><br>
        <label><input type="checkbox" name="Occupation[]" value="보안엔지니어"> 보안엔지니어</label><br>
        <label><input type="checkbox" name="Occupation[]" value="게임 개발"> 게임 개발</label><br>
        <label><input type="checkbox" name="Occupation[]" value="임베디드 개발"> 임베디드 개발</label><br>
        <label><input type="checkbox" name="Occupation[]" value="머신러닝,AI,블록체인 개발"> 머신러닝,AI,블록체인 개발</label><br>
        <label><input type="checkbox" name="Occupation[]" value="클라우드엔지니어"> 클라우드엔지니어</label><br>
        <label><input type="checkbox" name="Occupation[]" value="웹퍼블리셔"> 웹퍼블리셔</label><br>
    </div>
</div>

<!-- 카테고리 4: 경력 -->
<div>
    <button type="button" id="category4-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#경력</button>
    <div id="category4-content-modal" class="category-content hidden">
        <label><input type="checkbox" name="period[]" value="신입"> 신입</label><br>
        <label><input type="checkbox" name="period[]" value="경력"> 경력</label><br>
    </div>
</div>

<!-- 카테고리 5: 학력 -->
<div>
    <button type="button" id="category5-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#학력</button>
    <div id="category5-content-modal" class="category-content hidden">
        <label><input type="checkbox" name="education[]" value="고졸"> 고졸</label><br>
        <label><input type="checkbox" name="education[]" value="초대졸"> 초대졸</label><br>
        <label><input type="checkbox" name="education[]" value="학사"> 학사</label><br>
        <label><input type="checkbox" name="education[]" value="석사"> 석사</label><br>
        <label><input type="checkbox" name="education[]" value="박사"> 박사</label><br>
        <label><input type="checkbox" name="education[]" value="학력무관"> 학력무관</label><br>
    </div>
</div>

<!-- 카테고리 6: 자격증 -->
<div>
    <button type="button" id="category6-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#자격증</button>
    <div id="category6-content-modal" class="category-content hidden">
        <label><input type="checkbox" name="Certification[]" value="토익700↑"> 토익700↑</label><br>
        <label><input type="checkbox" name="Certification[]" value="토플700↑"> 토플700↑</label><br>
        <label><input type="checkbox" name="Certification[]" value="토스IL↑"> 토스IL↑</label><br>
        <label><input type="checkbox" name="Certification[]" value="정보처리기사"> 정보처리기사</label><br>
        <label><input type="checkbox" name="Certification[]" value="SQLD"> SQLD</label><br>
        <label><input type="checkbox" name="Certification[]" value="SQLP"> SQLP</label><br>
        <label><input type="checkbox" name="Certification[]" value="리눅스마스터"> 리눅스마스터</label><br>
        <label><input type="checkbox" name="Certification[]" value="AWS자격증"> AWS자격증</label><br>
        <label><input type="checkbox" name="Certification[]" value="기타"> 기타</label><br>
    </div>
</div>

<!-- 카테고리 7: 고용형태 -->
            <div>
                <button type="button" id="category7-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#고용형태</button>
                <div id="category7-content-modal" class="category-content hidden">
                    <label><input type="checkbox" name="employmentType[]" value="계약직3개월"> 계약직3개월</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="계약직6개월"> 계약직6개월</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="정규직"> 정규직</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="인턴"> 인턴</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="프리랜서"> 프리랜서</label><br>
                </div>
            </div>
					
				<!-- 카테고리 8: 포트폴리오 -->
<div>
    <button type="button" id="category8-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#포트폴리오</button>
    <div id="category8-content-modal" class="category-content hidden">
        <label class="block mb-2 text-left">포트폴리오 파일 첨부:</label>
        <input type="file" name="portfolio" class="w-full p-2 mb-4 border rounded" accept=".pdf,.doc,.docx,.ppt,.pptx,.zip,.rar">
        <p class="text-sm text-gray-500 mt-1">PDF, DOC, PPT, ZIP 파일만 첨부 가능합니다.</p>
    </div>
</div>

				</div>

				<button type="submit" class="bg-blue-500 text-white p-2 rounded mt-4">등록</button>
			</form>
		</div>
	</div>


	<script>
	
	document.addEventListener('DOMContentLoaded', function () {
	    // 각 카테고리 버튼 클릭 이벤트
	    document.querySelectorAll('[id$="-toggle"]').forEach(button => {
	        button.addEventListener('click', function (event) {
	            // 등록이 아니라 체크박스 보여주기만 할 수 있도록 stopPropagation 추가
	            event.stopPropagation(); 

	            // 클릭한 버튼의 관련된 체크박스 영역을 토글
	            const contentId = this.id.replace('-toggle', '-content');
	            const contentElement = document.getElementById(contentId);

	            if (contentElement) {
	                contentElement.classList.toggle('open');
	            }
	        });
	    });
	});

	</script>
	
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	    // 각 카테고리 버튼 클릭 이벤트
	    document.querySelectorAll('[id$="-toggle-modal"]').forEach(button => {
	        button.addEventListener('click', function (event) {
	            // 등록이 아니라 체크박스 보여주기만 할 수 있도록 stopPropagation 추가
	            event.stopPropagation(); 

	            // 클릭한 버튼의 관련된 체크박스 영역을 토글
	            const contentId = this.id.replace('-toggle-modal', '-content-modal');
	            const contentElement = document.getElementById(contentId);

	            if (contentElement) {
	                contentElement.classList.toggle('open');
	            }
	        });
	    });
	});

	

	</script>
	
	<script>


	let page = ${page};
	const pageSize = ${pageSize};
	const container = document.getElementById('auction-container');
	const loading = document.getElementById('loading');

	function loadMoreAuctions() {
	    console.log('Fetching more auctions...'); // 로드가 시작될 때 로그 출력

	    fetch(`/auction?page=${page}&pageSize=${pageSize}`)
	    
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            return response.json();
	        })
	        .then(data => {
	            console.log('Data received:', data); // 데이터 수신 시 로그 출력

	            if (data.length === 0) {
	                console.log('No more data to load.'); // 데이터가 없을 때 로그 출력
	                loading.classList.add('hidden');
	                return;
	            }

	            data.forEach(auctionMap => {
	                const auction = auctionMap['auction'];
	                const person = auctionMap['person'];
	                container.insertAdjacentHTML('beforeend', `
	                    <div class="profile-card bg-white shadow-md rounded p-4">
	                        <img src="${person.personImage}" alt="${person.nickName}의 이미지" class="rounded-full w-16 h-16 mx-auto mb-2">
	                        <h3 class="text-lg font-semibold text-center">${auction.title}</h3>
	                        <p class="text-center text-gray-600">${person.nickName}</p>
	                        <p class="text-center text-gray-600">최소 금액: ${auction.minSalary}</p>
	                        <p class="text-center text-gray-600">최대 금액: ${auction.maxSalary}</p>
	                        <div class="text-center mt-4">
	                            <button onclick="openProfilePage(${auction.auctionNum})" class="bg-blue-500 text-white p-2 rounded">상세보기</button>
	                        </div>
	                    </div>
	                `);
	            });
	            page++;
	            console.log('Next page:', page); // 페이지 증가 여부 확인
	            loading.classList.add('hidden');
	        })
	        .catch(error => {
	            console.error('Fetch error:', error); // 에러 발생 시 로그 출력
	            loading.classList.add('hidden');
	        });
	}

	// 스크롤 이벤트 리스너
	window.addEventListener('scroll', () => {
	    console.log('Scroll event detected'); // 스크롤 이벤트 감지 시 로그 출력

	    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
	        if (!loading.classList.contains('hidden')) {
	            return; // 로딩 중이면 추가 요청 방지
	        }
	        loading.classList.remove('hidden');
	        loadMoreAuctions();
	    }
	});
	
	
	</script>
	<script>
	
		function openAuctionModal() {
			document.getElementById('auctionModal').style.display = 'block';
		}

		// 모달 닫기
	    function closeAuctionModal(event) {
	        if (event.target.id === 'auctionModal' || event.target.classList.contains('close-button')) {
	            document.getElementById('auctionModal').style.display = 'none';
	        }
	    }

		function openProfilePage(auctionNum) {
			window.location.href = `/view/auctionDetail.jsp?auctionNum=${auctionNum}`;
		}

		function resetSelections() {
			document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
				checkbox.checked = false;
			});
		}
		
		
		
	</script>

<style>
/* Modal Styles */
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
	border-radius: 8px;
}

.close-button {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close-button:hover, .close-button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.category-content-modal.hidden {
    display: none;
}

.category-content.hidden {
    display: none;
}



.category-content.hidden {
    display: none;
}
.category-content-modal.hidden {
    display: none;
}

.custom-bg-color {
	background-color: #f0f0f0;
}

.category-item {
	cursor: pointer;
	text-align: left;
}


body {
    font-family: 'Roboto', sans-serif;
    padding-top: 150px; /* 헤더 높이에 맞춰 패딩 추가 */
}

header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: white;
    z-index: 1000;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.category-content-modal {
    display: none;
}

.category-content-modal.open {
    display: block;
}

.category-content {
    display: none; /* 기본적으로 숨김 */
}

.category-content.open {
    display: block; /* open 클래스를 가졌을 때 표시 */
}
/* 숨김 처리 */
.category-content {
    display: none;
}


.category-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 2px;
}

.category-item {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f9f9f9;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.profile-card {
    transition: transform 0.3s ease, z-index 0.3s ease;
    cursor: pointer;
}

.profile-card.expanded {
    transform: scale(1.5);
    z-index: 10;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(1.5);
    width: 90vw;
    height: 90vh;
}

.custom-bg-color {
    background-color: #FFFEF7;
}

.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
    z-index: 1000;
}

.modal.active {
    display: flex;
}

.modal-content {
    background: white;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    position: relative;
    max-width: 800px;
    width: 100%;
}

.modal-content img {
    border-radius: 50%;
    width: 70%;
    height: auto;
}

.modal-content button.close-button {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #f44336;
    color: white;
    border: none;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}

</style>


</body>
</html>
