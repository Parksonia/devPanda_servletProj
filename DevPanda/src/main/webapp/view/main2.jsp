<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Auction"%>
<%@ page import="dto.Person"%>
<%@ page import="dto.AuctionAndPerson"%>

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
        
        <!-- 필터링 폼 추가 -->
        <div >
        
            <!-- 카테고리들 -->
            <div class="category-container">
                <!-- 카테고리 1: 지역 -->
                <div>
                    <button type="button" id="category1-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#지역</button>
                    <div id="category1-content" class="category-content hidden">
                        <!-- 지역 체크박스들 -->
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
                    <button type="button" id="category2-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#보유 기술</button>
                    <div id="category2-content" class="category-content hidden">
                        <!-- 보유 기술 체크박스들 -->
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

                <!-- 카테고리 3: 직무 -->
                <div>
                    <button type="button" id="category3-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#직무</button>
                    <div id="category3-content" class="category-content hidden">
                        <!-- 직무 체크박스들 -->
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
                    <button type="button" id="category4-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#경력</button>
                    <div id="category4-content" class="category-content hidden">
                        <!-- 경력 체크박스들 -->
                        <label><input type="checkbox" name="period[]" value="신입"> 신입</label><br>
                        <label><input type="checkbox" name="period[]" value="경력"> 경력</label><br>
                    </div>
                </div>

                <!-- 카테고리 5: 학력 -->
                <div>
                    <button type="button" id="category5-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#학력</button>
                    <div id="category5-content" class="category-content hidden">
                        <!-- 학력 체크박스들 -->
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
                    <button type="button" id="category6-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#자격증</button>
                    <div id="category6-content" class="category-content hidden">
                        <!-- 자격증 체크박스들 -->
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
                    <button type="button" id="category7-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#고용형태</button>
                    <div id="category7-content" class="category-content hidden">
                        <!-- 고용형태 체크박스들 -->
                         <label><input type="checkbox" name="employmentType[]" value="계약직3개월"> 계약직3개월</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="계약직6개월"> 계약직6개월</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="정규직"> 정규직</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="인턴"> 인턴</label><br>
                    <label><input type="checkbox" name="employmentType[]" value="프리랜서"> 프리랜서</label><br>
                    </div>
                </div>
            </div>
    
            <div class="flex justify-between mt-4">
    <button id="reset-button" class="bg-gray-300 text-gray-800 p-2 rounded">초기화</button>
    <button type="submit" id="apply-button" class="bg-green-500 text-white p-2 rounded">적용</button>
</div>
 </div>

        </div>
    </section>

<!-- 나만의 개발자 Section ajax로 jsp  -->
<section class="mb-8">
    <h2 class="text-xl font-bold mb-4">나만의 개발자</h2>
    <div id="auction-container" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        <!-- 프로필 카드들이 서버에서 렌더링됩니다 -->
        <c:forEach var="auction" items="${auctions}">
            <div class="profile-card bg-white shadow-md rounded p-4">
                <img src="<c:out value='${auction.personImage}' default='/DevPanda/upload/default.jpg'/>"
                     alt="${auction.nickName}의 이미지" class="rounded-full w-16 h-16 mx-auto mb-2">
                <h3 class="text-lg font-semibold text-center">${auction.title}</h3>
                <p class="text-center text-gray-600">${auction.nickName}</p>
                <p class="text-center text-gray-600">최소 금액: <c:out value='${auction.minSalary}'/>원</p>
                <p class="text-center text-gray-600">최대 금액: <c:out value='${auction.maxSalary}'/>원</p>
                <div class="text-center mt-4">
                    <button onclick="openProfilePage(${auction.auctionNum})" class="bg-blue-500 text-white p-2 rounded">
                        상세보기
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>
    <div id="loading" class="text-center mt-4 hidden">
        <p>로딩 중...</p>
    </div>
   
</section>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

    var offset = 0; // 초기 오프셋 값
     // 페이지당 아이템 수
    let isLoading = false; // 로딩 상태
    let isScrollingEnabled = true; // 스크롤 이벤트 활성화 상태
    const container = document.getElementById('auction-container');
    const loading = document.getElementById('loading');
    let debounceTimer;

    // 필터 상태 저장
    let filters = {
        location: [],
        stack: [],
        Occupation: [],
        period: [],
        education: [],
        Certification: [],
        employmentType: []
    };

    // 적용 버튼 클릭 시
    document.getElementById('apply-button').addEventListener('click', applyFilters);

    // 필터 적용 함수
    function applyFilters() {
        // 필터 변수 설정
        

        // 필터링된 데이터 로드
        offset = 0;
        
        
        loadMoreAuctions();
        
    }

    // 필터링된 데이터를 로드하는 함수
    function loadMoreAuctions() {
        
    	filters.location = Array.from(document.querySelectorAll('input[name="location[]"]:checked')).map(el => el.value);
        filters.stack = Array.from(document.querySelectorAll('input[name="stack[]"]:checked')).map(el => el.value);
        filters.Occupation = Array.from(document.querySelectorAll('input[name="Occupation[]"]:checked')).map(el => el.value);
        filters.period = Array.from(document.querySelectorAll('input[name="period[]"]:checked')).map(el => el.value);
        filters.education = Array.from(document.querySelectorAll('input[name="education[]"]:checked')).map(el => el.value);
        filters.Certification = Array.from(document.querySelectorAll('input[name="Certification[]"]:checked')).map(el => el.value);
        filters.employmentType = Array.from(document.querySelectorAll('input[name="employmentType[]"]:checked')).map(el => el.value);
    	
        console.log(isLoading)
    	if (isLoading) return;
    	// 이미 로딩 중일 때는 실행하지 않음
        isLoading = true;
        loading.classList.remove('hidden');

        if (!isScrollingEnabled) {
            isScrollingEnabled = true; // 스크롤 이벤트 비활성화 해제
        }

        let param= {
                offset: offset,
                location: filters.location.join(','),  // 배열을 콤마로 구분하여 전송  서울,부산
                stack: filters.stack.join(','),
                occupation: filters.Occupation.join(','),
                period: filters.period.join(','),
                education: filters.education.join(','),
                certification: filters.Certification.join(','),
                employmentType: filters.employmentType.join(',')
            };

        console.log(param);

        // 필터링된 데이터 요청
        $.ajax({
            url: '/DevPanda/auctionoffset',
            method: 'POST',

            
            data: {param:JSON.stringify(param)},
            dataType: 'text',

            
            success: function(result) {
                console.log(result)
				if(offset === 0 ){
					container.innerHTML = '';
				}
				
            	const array = JSON.parse(result)
            	console.log(array)
            	
            	
            	
            	array.forEach(item =>{
            	console.log(`\${item.minSalary}`);
				const superDiv = document.createElement('div');
				const img = document.createElement('img');
				const h3 = document.createElement('h3');
				const p1 = document.createElement('p');
				const p2 = document.createElement("p");
				const p3 = document.createElement('p');
				const subDiv = document.createElement('div');
				const button = document.createElement('button');
				button.setAttribute('onclick',`openProfilePage(\${item.personImage})`)
				button.className='bg-blue-500 text-white p-2 rounded'
				button.innerText='상세보기'
				subDiv.className='text-center mt-4'
				p1.className='text-center text-gray-600'
				p1.innerText=`\${item.nickName}`
				p2.innerText=`최소 금액: \${item.minSalary}원`
				p3.innerText=`최대 금액: \${item.maxSalary}원`
				h3.className='text-lg font-semibold text-center'
				h3.innerText=`\${item.title}`
				img.setAttribute('src',`\${item.personImage}`)
				img.setAttribute('default','/DevPanda/upload/default.jpg')
				img.setAttribute('alt',`\${item.nickName}의 이미지`)
				img.className='rounded-full w-16 h-16 mx-auto mb-2'
				superDiv.className='profile-card bg-white shadow-md rounded p-4'
				subDiv.appendChild(button)
				superDiv.appendChild(img)
				superDiv.appendChild(h3)
				superDiv.appendChild(p1)
				superDiv.appendChild(p2)
				superDiv.appendChild(p3)
				superDiv.appendChild(subDiv)
				
				container.appendChild(superDiv);
			
            	});
				
                

                // 데이터가 없을 경우 스크롤 이벤트 제거
                if (array.length === 0) {
                   //$(window).off('scroll', onScroll); // jQuery에서 스크롤 이벤트 제거
                   loading.classList.add('hidden');
                   isLoading = false;
                   
                    
                   return;
                }else{
                	offset = offset +9; // 다음 오프셋 준비
                    console.log('Updated offset:', offset); // 업데이트된 오프셋 로그

                    isLoading = false;
                    loading.classList.add('hidden');
                }

                
            },
            error: function(xhr, status, error) {
                console.error('Fetch error:', error);
                loading.classList.add('hidden');
                isLoading = false;
                alert('데이터를 불러오는 중 오류가 발생했습니다. 다시 시도해주세요.');
            }
        });
    }

    // 스크롤 이벤트 핸들러
    function onScroll() {
        if (!isScrollingEnabled) return; // 스크롤 이벤트 비활성화 상태일 때는 처리하지 않음

        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            if (window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 100 && !isLoading) {
                loadMoreAuctions();
            }
        }, 150); // 디바운스 시간 150ms로 설정
    }

    // 스크롤 이벤트 등록
    $(window).on('scroll', onScroll); // jQuery에서 스크롤 이벤트 등록

    // 초기화 버튼 클릭 시
    document.getElementById('reset-button').addEventListener('click', resetSelections);    

    // 필터 초기화 함수
    function resetSelections() {
        // 스크롤 이벤트 비활성화
        isScrollingEnabled = false;

        // 모든 체크박스 해제
        document.querySelectorAll('input[type="checkbox"]').forEach(el => el.checked = false);

        // 필터 상태 초기화
        filters = {
            location: [],
            stack: [],
            Occupation: [],
            period: [],
            education: [],
            Certification: [],
            employmentType: []
        };

        // 필터링된 데이터 로드
        offset = 0;
        container.innerHTML = '';

        loadMoreAuctions();

        // 스크롤 이벤트 재활성화
        setTimeout(() => {
            isScrollingEnabled = true;
        }, 500); // 초기화가 완료된 후 500ms 후에 스크롤 이벤트 재활성화
    }
    



</script>

 
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

		/* function resetSelections() {
			document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
				checkbox.checked = false;
			});
		} */
		
		
		
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
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.profile-image {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 10px;
}

.text-xl {
    font-size: 1.25rem;
    line-height: 1.75rem;
}

.text-gray-700 {
    color: #4a5568;
}

.text-gray-600 {
    color: #718096;
}

.bg-white {
    background-color: #ffffff;
}

.shadow-md {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.rounded {
    border-radius: 0.375rem;
}

.p-4 {
    padding: 1rem;
}

.mt-4 {
    margin-top: 1rem;
}

.hidden {
    display: none;
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

.profile-card {
    background-color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 16px;
    text-align: center;
    margin-bottom: 16px;
}

.profile-card img {
    border-radius: 50%;
    width: 64px;
    height: 64px;
}

.profile-card h3 {
    font-size: 18px;
    margin-bottom: 8px;
}

.profile-card p {
    color: #666;
}

</style>


</body>
</html>
