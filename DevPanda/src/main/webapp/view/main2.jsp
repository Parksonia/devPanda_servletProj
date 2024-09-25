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
  <style type="text/tailwindcss">
    @layer utilities {
      .bg-red-auctioninput-btn {
        background-color: #ed6a60;
   	    padding: 10px;
      	}
	  .main-btn-size {
		width: 80px;
		font-weight: bold; 
		}
	
	}
  </style>
<style>
.checkDiv {
  height: 25px;
  display: flex;
  padding-top:2px;
  padding-left:5px;
}
input[type="checkbox"]{
        display: none;
}
.check {
        display: inline-block;
        width: 20px;
        height: 20px;
        border:1px solid lightgray;
        position: relative;
        border-radius: 3px;
}

      
input[type="checkbox"]:checked + label::after{
        content:'✔';
        font-size: 15px;
        width: 20px;
        height: 20px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }      
</style>
</head>
<body class="bg-gray-100 text-gray-900" >

   <!-- Header Start -->
   <header>
      <%@ include file="./inc/header.jsp"%>
   </header>
   <!-- Header End -->

   <main class="p-8">
   
<!-- 관심 키워드 Section -->
    <section class="mb-8">
    <div class="text-xl font-bold mb-4" style="display: flex;justify-content: space-between;">
        <span>관심 키워드</span>
        	<c:if test="${userType == 'person' }">
        		<button onclick="openAuctionModal()" 
                  class="bg-red-auctioninput-btn text-white p-2 rounded" style="display:inline-block;width:150px;">경매 등록하기</button>
        	</c:if>
   	</div>
   	
        <div class="bg-white p-4 shadow-md rounded">
        <!-- 필터링 폼 추가 -->
        <div>
        
            <!-- 카테고리들 -->
            <div class="category-container">
                <!-- 카테고리 1: 지역 -->
                <div>
                    <button type="button" id="category1-toggle" class="custom-bg-color text-black p-3 rounded w-full text-left category-item">#지역</button>
                    <div id="category1-content" class="category-content hidden">
                        <!-- 지역 체크박스들 -->

        <div class="checkDiv"><input type="checkbox" name="location[]" value="서울" id="check_seoul"><label for="check_seoul" class="check"></label>&nbsp;&nbsp;<label for="check_seoul" >서울</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="경/인" id="check_kyungin"><label for="check_kyungin" class="check"></label>&nbsp;&nbsp;<label for="check_kyungin">경/인</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="강원" id="check_kangwon"><label for="check_kangwon" class="check"></label>&nbsp;&nbsp;<label for="check_kangwon">강원</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="경남" id="check_kyungnam"><label for="check_kyungnam" class="check"></label>&nbsp;&nbsp;<label for="check_kyungin">경남</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="경북" id="check_kyungbook"><label for="check_kyungbook" class="check"></label>&nbsp;&nbsp;<label for="check_kyungbook">경북</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="전남" id="check_jeonnam"><label for="check_jeonnam" class="check"></label>&nbsp;&nbsp;<label for="check_jungnam">전남</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="전북" id="check_jeonbook"><label for="check_jeonbook" class="check"></label>&nbsp;&nbsp;<label for="check_jungbook">전북</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="충남" id="check_chungnam"><label for="check_chungnam" class="check"></label>&nbsp;&nbsp;<label for="check_chungnam">충남</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="충북" id="check_chungbook"><label for="check_chungbook" class="check"></label>&nbsp;&nbsp;<label for="check_chungbook">충북</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="제주" id="check_jeju"><label for="check_jeju" class="check"></label>&nbsp;&nbsp;<label for="check_jeju">제주</label></div>
                    </div>
                </div>

                <!-- 카테고리 2: 보유 기술 -->
                <div>
                    <button type="button" id="category2-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#보유 기술</button>
                    <div id="category2-content" class="category-content hidden">
                        <!-- 보유 기술 체크박스들 -->
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="JAVA" id="check_JAVA"><label for="check_JAVA" class="check"></label>&nbsp;&nbsp;<label for="check_JAVA" >JAVA</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="Python" id="check_Python"><label for="check_Python" class="check"></label>&nbsp;&nbsp;<label for="check_Python">Python</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="C" id="check_C"><label for="check_C" class="check"></label>&nbsp;&nbsp;<label for="check_C">C</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="C++"  id="check_C++"><label for="check_C++" class="check"></label>&nbsp;&nbsp;<label for="check_C++"> C++</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="C#" id="check_C#"><label for="check_C#" class="check"></label>&nbsp;&nbsp;<label for="check_C#" > C#</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="html,css,js" id="check_html,css,js"><label for="check_html,css,js" class="check"></label>&nbsp;&nbsp;<label for="check_html,css,js" > html,css,js</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="Go" id="check_Go"><label for="check_Go" class="check"></label>&nbsp;&nbsp;<label for="check_Go" > Go</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="kotlin" id="check_kotlin"><label for="check_kotlin" class="check"></label>&nbsp;&nbsp;<label for="check_kotlin"> kotlin</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="aws" id="check_aws"><label for="check_aws" class="check"></label>&nbsp;&nbsp;<label for="check_aws" >aws</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="springboot" id="check_springboot"><label for="check_springboot" class="check"></label>&nbsp;&nbsp;<label for="check_springboot" > springboot</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="react" id="check_react"><label for="check_react" class="check"></label>&nbsp;&nbsp;<label for="check_react" > react</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="vue" id="check_vue"><label for="check_vue" class="check"></label>&nbsp;&nbsp;<label for="check_vue" > vue</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="django" id="check_django"><label for="check_django" class="check"></label>&nbsp;&nbsp;<label for="check_django" > django</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="tensorflow" id="check_tensorflow"><label for="check_tensorflow" class="check"></label>&nbsp;&nbsp;<label for="check_tensorflow" > tensorflow</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="flutter" id="check_flutter"><label for="check_flutter" class="check"></label>&nbsp;&nbsp;<label for="check_flutter" > flutter</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="ios" id="check_ios"><label for="check_ios" class="check"></label>&nbsp;&nbsp;<label for="check_ios" > ios</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="android" id="check_android"><label for="check_android" class="check"></label>&nbsp;&nbsp;<label for="check_android" > android</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="swift" id="check_swift"><label for="check_swift" class="check"></label>&nbsp;&nbsp;<label for="check_swift" > swift</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="oracle" id="check_oracle"> <label for="check_oracle" class="check"></label>&nbsp;&nbsp;<label for="check_oracle" >oracle</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="redis" id="check_redis"><label for="check_redis" class="check"></label>&nbsp;&nbsp;<label for="check_redis" > redis</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="mysql" id="check_mysql"><label for="check_mysql" class="check"></label>&nbsp;&nbsp;<label for="check_mysql" > mysql</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="nosql" id="check_nosql"><label for="check_nosql" class="check"></label>&nbsp;&nbsp;<label for="check_nosql" > nosql</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="mariadb" id="check_mariadb"><label for="check_mariadb" class="check"></label>&nbsp;&nbsp;<label for="check_mariadb" > mariadb</label></div>
                    </div>
                </div>

                <!-- 카테고리 3: 직무 -->
                <div>
                    <button type="button" id="category3-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#직무</button>
                    <div id="category3-content" class="category-content hidden">
                        <!-- 직무 체크박스들 -->
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="백엔드" id="check_backend"><label for="check_backend" class="check"></label>&nbsp;&nbsp;<label for="check_backend" >백엔드</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="프론트엔드" id="check_front"><label for="check_front" class="check"></label>&nbsp;&nbsp;<label for="check_front" >프론트엔드</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="웹" id="check_web"><label for="check_web" class="check"></label>&nbsp;&nbsp;<label for="check_web" > 웹</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="앱" id="check_app"><label for="check_app" class="check"></label>&nbsp;&nbsp;<label for="check_app" > 앱</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="시스템엔지니어" id="check_sysengine"><label for="check_sysengine" class="check"></label>&nbsp;&nbsp;<label for="check_sysengine" > 시스템엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="네트워크엔지니어" id="check_netengine"><label for="check_netengine" class="check"></label>&nbsp;&nbsp;<label for="check_netengine" > 네트워크엔지니어</label></div>
       	<div class="checkDiv"><input type="checkbox" name="Occupation[]" value="데이터엔지니어" id="check_dataengine"><label for="check_dataengine" class="check"></label>&nbsp;&nbsp;<label for="check_dataengine" > 데이터엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="보안엔지니어" id="check_secuengine"><label for="check_secuengine" class="check"></label>&nbsp;&nbsp;<label for="check_secuengine" > 보안엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="게임 개발" id="check_gamedevel"><label for="check_gamedevel" class="check"></label>&nbsp;&nbsp;<label for="check_gamedevel" > 게임 개발</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="임베디드 개발" id="check_emdevel"><label for="check_emdevel" class="check"></label>&nbsp;&nbsp;<label for="check_emdevel" >임베디드 개발</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="머신러닝,AI,블록체인 개발" id="check_AIdevel"><label for="check_AIdevel" class="check"></label>&nbsp;&nbsp;<label for="check_AIdevel" > 머신러닝,AI,블록체인 개발</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="클라우드엔지니어" id="check_cloudengine"><label for="check_cloudengine" class="check"></label>&nbsp;&nbsp;<label for="check_cloudengine" > 클라우드엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="웹퍼블리셔" id="check_webpub"><label for="check_webpub" class="check"></label>&nbsp;&nbsp;<label for="check_webpub" > 웹퍼블리셔</label></div>

                    </div>
                </div>

                <!-- 카테고리 4: 경력 -->
                <div>
                    <button type="button" id="category4-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#경력</button>
                    <div id="category4-content" class="category-content hidden">
                        <!-- 경력 체크박스들 -->
                         <div class="checkDiv"><input type="checkbox" name="period[]" value="신입" id="check_new"><label for="check_new" class="check"></label>&nbsp;&nbsp;<label for="check_new" > 신입</label></div>
                         <div class="checkDiv"><input type="checkbox" name="period[]" value="경력" id="check_worked"><label for="check_worked" class="check"></label>&nbsp;&nbsp;<label for="check_worked"> 경력</label></div>
                    </div>
                </div>

                <!-- 카테고리 5: 학력 -->
                <div>
                    <button type="button" id="category5-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#학력</button>
                    <div id="category5-content" class="category-content hidden">
                        <!-- 학력 체크박스들 -->
        <div class="checkDiv"><input type="checkbox" name="education[]" value="고졸" id="check_high"><label for="check_high" class="check"></label>&nbsp;&nbsp;<label for="check_high"> 고졸</label></div>
       	<div class="checkDiv"><input type="checkbox" name="education[]" value="초대졸" id="check_associate"><label for="check_associate" class="check"></label>&nbsp;&nbsp;<label for="check_associate" > 초대졸</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="학사" id="check_bachelor"><label for="check_bachelor" class="check"></label>&nbsp;&nbsp;<label for="check_bachelor" > 학사</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="석사" id="check_master"><label for="check_master" class="check"></label>&nbsp;&nbsp;<label for="check_master" > 석사</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="박사" id="check_doctorate"><label for="check_doctorate" class="check"></label>&nbsp;&nbsp;<label for="check_doctorate" > 박사</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="학력무관" id="check_none"><label for="check_none" class="check"></label>&nbsp;&nbsp;<label for="check_none" > 학력무관</label></div>
                    </div>
                </div>

                <!-- 카테고리 6: 자격증 -->
                <div>
                    <button type="button" id="category6-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#자격증</button>
                    <div id="category6-content" class="category-content hidden">
                        <!-- 자격증 체크박스들 -->
       	<div class="checkDiv"><input type="checkbox" name="Certification[]" value="토익700↑" id="check_toeic"><label for="check_toeic" class="check"></label>&nbsp;&nbsp;<label for="check_toeic">  토익700↑</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="토플700↑" id="check_toefl"><label for="check_toefl" class="check"></label>&nbsp;&nbsp;<label for="check_toefl">  토플700↑</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="토스IL↑"  id="check_ticspeaking"><label for="check_ticspeaking" class="check"></label>&nbsp;&nbsp;<label for="check_ticspeaking">  토스IL↑</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="정보처리기사"  id="check_engineerCerti"><label for="check_engineerCerti" class="check"></label>&nbsp;&nbsp;<label for="check_engineerCerti">  정보처리기사</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="SQLD"  id="check_sqld"><label for="check_sqld" class="check"></label>&nbsp;&nbsp;<label for="check_sqld">  SQLD</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="SQLP"  id="check_sqlp"><label for="check_sqlp" class="check"></label>&nbsp;&nbsp;<label for="check_sqlp">  SQLP</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="리눅스마스터"  id="check_linuxCerti"><label for="check_linuxCerti" class="check"></label>&nbsp;&nbsp;<label for="check_linuxCerti">  리눅스마스터</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="AWS자격증"  id="check_awsCerti"><label for="check_awsCerti" class="check"></label>&nbsp;&nbsp;<label for="check_awsCerti">  AWS자격증</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="기타"  id="check_others"><label for="check_others" class="check"></label>&nbsp;&nbsp;<label for="check_others">  기타</label></div>

                    </div>
                </div>

                <!-- 카테고리 7: 고용형태 -->
                <div>
                    <button type="button" id="category7-toggle" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#고용형태</button>
                    <div id="category7-content" class="category-content hidden">
                        <!-- 고용형태 체크박스들 -->
       <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="계약직3개월" id="check_3month"><label for="check_3month" class="check"></label>&nbsp;&nbsp;<label for="check_3month"> 계약직3개월</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="계약직6개월" id="check_6month"><label for="check_6month" class="check"></label>&nbsp;&nbsp;<label for="check_6month"> 계약직6개월</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="정규직" id="check_fulltime"><label for="check_fulltime" class="check"></label>&nbsp;&nbsp;<label for="check_fulltime"> 정규직</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="인턴" id="check_intern"><label for="check_intern" class="check"></label>&nbsp;&nbsp;<label for="check_intern"> 인턴</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="프리랜서" id="check_freelancer"><label for="check_freelancer" class="check"></label>&nbsp;&nbsp;<label for="check_freelancer"> 프리랜서</label></div>
                    </div>
                </div>
            
            </div>
    
            <div class="flex justify-between mt-4">
    <button id="reset-button" class="bg-gray-300 text-white rounded main-btn-size " style="margin-left:10px; display:inline-block;">초기화</button>
    <button type="submit" id="apply-button" class="bg-blue-500 text-white p-2 rounded main-btn-size" style="margin-right:10px; display:inline-block;">적 용</button>
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
               <img src="<c:out value='${pageContext.request.contextPath}/upload/${auction.personImage}' default='${pageContext.request.contextPath}/upload/default.jpg'/>"
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
    var moreActions = true;
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
        
      moreActions=true;
      isLoading=false;
        // 필터링된 데이터 로드
        offset = 0;
        
        
        if(moreActions){
           loadMoreAuctions();   
        }
           
        
        
        
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
            button.setAttribute('onclick',`openProfilePage(\${item.auctionNum})`)
            button.className='bg-blue-500 text-white p-2 rounded main-btn-size'
            button.innerText='상세보기'
            subDiv.className='text-center mt-4'
            p1.className='text-center text-gray-600'
            p1.innerText=`\${item.nickName}`
            p2.innerText=`최소 금액: \${item.minSalary.toLocaleString()}원`
            p3.innerText=`최대 금액: \${item.maxSalary.toLocaleString()}원`
            h3.className='text-lg font-semibold text-center'
            h3.innerText=`\${item.title}`
            img.setAttribute('src',`/DevPanda/upload/\${item.personImage}`)
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
                   $(window).off('scroll', onScroll); // jQuery에서 스크롤 이벤트 제거
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
      moreActions=true;
      isLoading=false;
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
            
            <label class="block mb-2 text-left">경매 제목:</label> 
            <input type="text" name="title" class="w-full p-2 mb-4 border rounded" placeholder="한줄 소개를 입력하세요" required>
            <label class="block mb-2 text-left">최소 금액:</label> 
            <input type="number" name="minSalary" class="w-full p-2 mb-4 border rounded" placeholder="최소 금액을 입력하세요" required>
            <label class="block mb-2 text-left">최대 금액:</label> 
            <input type="number" name="maxSalary" class="w-full p-2 mb-4 border rounded" placeholder="최대 금액을 입력하세요" required>
            
            <!-- <label for="endDate">End Date:</label>
          <input type="date" id="endDate" name="endDate" required> -->
            
            
            <label for="endDate">End Date:</label>
         <input type="date" id="endDate" name="endDate" required>
	      <label for="endTime">End Time:</label>
         <input type="time" id="endTime" name="endTime" required >
       
            
            <p class="text-sm text-gray-500 mt-1">최대 금액 입찰 시 즉시 구매됩니다.</p>

            <label class="block mb-2 text-left">카테고리 선택:</label>
            
            <div class="category-container">
               <!-- 카테고리 1: 지역 -->
<div>
    <button type="button" id="category1-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#지역</button>
    <div id="category1-content-modal" class="category-content hidden">
       
        <div class="checkDiv"><input type="checkbox" name="location[]" value="서울" id="check_mseoul"><label for="check_mseoul" class="check"></label>&nbsp;&nbsp;<label for="check_mseoul" >서울</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="경/인" id="check_mkyungin"><label for="check_mkyungin" class="check"></label>&nbsp;&nbsp;<label for="check_mkyungin">경/인</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="강원" id="check_mkangwon"><label for="check_mkangwon" class="check"></label>&nbsp;&nbsp;<label for="check_mkangwon">강원</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="경남" id="check_mkyungnam"><label for="check_mkyungnam" class="check"></label>&nbsp;&nbsp;<label for="check_mkyungnam">경남</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="경북" id="check_mkyungbook"><label for="check_mkyungbook" class="check"></label>&nbsp;&nbsp;<label for="check_mkyungbook">경북</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="전남" id="check_mjeonnam"><label for="check_mjeonnam" class="check"></label>&nbsp;&nbsp;<label for="check_mjeonnam">전남</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="전북" id="check_mjeonbook"><label for="check_mjeonbook" class="check"></label>&nbsp;&nbsp;<label for="check_mjeonbook">전북</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="충남" id="check_mchungnam"><label for="check_mchungnam" class="check"></label>&nbsp;&nbsp;<label for="check_mchungnam">충남</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="충북" id="check_mchungbook"><label for="check_mchungbook" class="check"></label>&nbsp;&nbsp;<label for="check_mchungbook">충북</label></div>
        <div class="checkDiv"><input type="checkbox" name="location[]" value="제주" id="check_mjeju"><label for="check_mjeju" class="check"></label>&nbsp;&nbsp;<label for="check_mjeju">제주</label></div>
    </div>
</div>

<!-- 카테고리 2: 보유 기술 -->
<div>
    <button type="button" id="category2-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#보유 기술</button>
    <div id="category2-content-modal" class="category-content hidden">
     <div class="checkDiv"><input type="checkbox" name="stack[]" value="JAVA" id="check_mJAVA"><label for="check_mJAVA" class="check"></label>&nbsp;&nbsp;<label for="check_mJAVA" >JAVA</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="Python" id="mcheck_Python"><label for="mcheck_Python" class="check"></label>&nbsp;&nbsp;<label for="mcheck_Python">Python</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="C" id="check_mC"><label for="check_mC" class="check"></label>&nbsp;&nbsp;<label for="check_mC">C</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="C++"  id="check_mC++"><label for="check_mC++" class="check"></label>&nbsp;&nbsp;<label for="check_mC++"> C++</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="C#" id="check_mC#"><label for="check_mC#" class="check"></label>&nbsp;&nbsp;<label for="check_mC#" > C#</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="html,css,js" id="check_mhtml,css,js"><label for="check_mhtml,css,js" class="check"></label>&nbsp;&nbsp;<label for="check_mhtml,css,js" > html,css,js</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="Go" id="check_mGo"><label for="check_mGo" class="check"></label>&nbsp;&nbsp;<label for="check_mGo" > Go</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="kotlin" id="check_mkotlin"><label for="check_mkotlin" class="check"></label>&nbsp;&nbsp;<label for="check_mkotlin"> kotlin</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="aws" id="check_maws"><label for="check_maws" class="check"></label>&nbsp;&nbsp;<label for="check_maws" >aws</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="springboot" id="check_mspringboot"><label for="check_mspringboot" class="check"></label>&nbsp;&nbsp;<label for="check_mspringboot" > springboot</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="react" id="check_mreact"><label for="check_mreact" class="check"></label>&nbsp;&nbsp;<label for="check_mreact" > react</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="vue" id="check_mvue"><label for="check_mvue" class="check"></label>&nbsp;&nbsp;<label for="check_mvue" > vue</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="django" id="check_mdjango"><label for="check_mdjango" class="check"></label>&nbsp;&nbsp;<label for="check_mdjango" > django</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="tensorflow" id="check_mtensorflow"><label for="check_mtensorflow" class="check"></label>&nbsp;&nbsp;<label for="check_mtensorflow" > tensorflow</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="flutter" id="check_mflutter"><label for="check_mflutter" class="check"></label>&nbsp;&nbsp;<label for="check_mflutter" > flutter</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="ios" id="check_mios"><label for="check_mios" class="check"></label>&nbsp;&nbsp;<label for="check_mios" > ios</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="android" id="check_mandroid"><label for="check_mandroid" class="check"></label>&nbsp;&nbsp;<label for="check_mandroid" > android</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="swift" id="check_mswift"><label for="check_mswift" class="check"></label>&nbsp;&nbsp;<label for="check_mswift" > swift</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="oracle" id="check_moracle"> <label for="check_moracle" class="check"></label>&nbsp;&nbsp;<label for="check_moracle" >oracle</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="redis" id="check_mredis"><label for="check_mredis" class="check"></label>&nbsp;&nbsp;<label for="check_mredis" > redis</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="mysql" id="check_mmysql"><label for="check_mmysql" class="check"></label>&nbsp;&nbsp;<label for="check_mmysql" > mysql</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="nosql" id="check_mnosql"><label for="check_mnosql" class="check"></label>&nbsp;&nbsp;<label for="check_mnosql" > nosql</label></div>
        <div class="checkDiv"><input type="checkbox" name="stack[]" value="mariadb" id="check_mmariadb"><label for="check_mmariadb" class="check"></label>&nbsp;&nbsp;<label for="check_mmariadb" > mariadb</label></div>
    </div>
</div>

<!-- 카테고리 3: (원하는)직무 -->
<div>
    <button type="button" id="category3-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#직무</button>
    <div id="category3-content-modal" class="category-content hidden">
       <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="백엔드" id="check_mbackend"><label for="check_mbackend" class="check"></label>&nbsp;&nbsp;<label for="check_mbackend" >백엔드</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="프론트엔드" id="check_mfront"><label for="check_mfront" class="check"></label>&nbsp;&nbsp;<label for="check_mfront" >프론트엔드</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="웹" id="check_mweb"><label for="check_mweb" class="check"></label>&nbsp;&nbsp;<label for="check_mweb" > 웹</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="앱" id="check_mapp"><label for="check_mapp" class="check"></label>&nbsp;&nbsp;<label for="check_mapp" > 앱</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="시스템엔지니어" id="check_msysengine"><label for="check_msysengine" class="check"></label>&nbsp;&nbsp;<label for="check_msysengine" > 시스템엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="네트워크엔지니어" id="check_mnetengine"><label for="check_mnetengine" class="check"></label>&nbsp;&nbsp;<label for="check_mnetengine" > 네트워크엔지니어</label></div>
       	<div class="checkDiv"><input type="checkbox" name="Occupation[]" value="데이터엔지니어" id="check_mdataengine"><label for="check_mdataengine" class="check"></label>&nbsp;&nbsp;<label for="check_mdataengine" > 데이터엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="보안엔지니어" id="check_msecuengine"><label for="check_msecuengine" class="check"></label>&nbsp;&nbsp;<label for="check_msecuengine" > 보안엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="게임 개발" id="check_mgamedevel"><label for="check_mgamedevel" class="check"></label>&nbsp;&nbsp;<label for="check_mgamedevel" > 게임 개발</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="임베디드 개발" id="check_memdevel"><label for="check_memdevel" class="check"></label>&nbsp;&nbsp;<label for="check_memdevel" >임베디드 개발</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="머신러닝,AI,블록체인 개발" id="check_mAIdevel"><label for="check_mAIdevel" class="check"></label>&nbsp;&nbsp;<label for="check_mAIdevel" > 머신러닝,AI,블록체인 개발</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="클라우드엔지니어" id="check_mcloudengine"><label for="check_mcloudengine" class="check"></label>&nbsp;&nbsp;<label for="check_mcloudengine" > 클라우드엔지니어</label></div>
        <div class="checkDiv"><input type="checkbox" name="Occupation[]" value="웹퍼블리셔" id="check_mwebpub"><label for="check_mwebpub" class="check"></label>&nbsp;&nbsp;<label for="check_mwebpub" > 웹퍼블리셔</label></div>

    </div>
</div>

<!-- 카테고리 4: 경력 -->
<div>
    <button type="button" id="category4-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#경력</button>
    <div id="category4-content-modal" class="category-content hidden">
        <div class="checkDiv"><input type="checkbox" name="period[]" value="신입" id="check_mnew"><label for="check_mnew" class="check"></label>&nbsp;&nbsp;<label for="check_mnew" > 신입</label></div>
       	<div class="checkDiv"><input type="checkbox" name="period[]" value="경력" id="check_mworked"><label for="check_mworked" class="check"></label>&nbsp;&nbsp;<label for="check_mworked"> 경력</label></div>
    </div>
</div>

<!-- 카테고리 5: 학력 -->
<div>
    <button type="button" id="category5-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#학력</button>
    <div id="category5-content-modal" class="category-content hidden">
         <div class="checkDiv"><input type="checkbox" name="education[]" value="고졸" id="check_mhigh"><label for="check_mhigh" class="check"></label>&nbsp;&nbsp;<label for="check_mhigh"> 고졸</label></div>
       	<div class="checkDiv"><input type="checkbox" name="education[]" value="초대졸" id="check_massociate"><label for="check_massociate" class="check"></label>&nbsp;&nbsp;<label for="check_massociate" > 초대졸</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="학사" id="check_mbachelor"><label for="check_mbachelor" class="check"></label>&nbsp;&nbsp;<label for="check_mbachelor" > 학사</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="석사" id="check_mmaster"><label for="check_mmaster" class="check"></label>&nbsp;&nbsp;<label for="check_mmaster" > 석사</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="박사" id="check_mdoctorate"><label for="check_mdoctorate" class="check"></label>&nbsp;&nbsp;<label for="check_mdoctorate" > 박사</label></div>
        <div class="checkDiv"><input type="checkbox" name="education[]" value="학력무관" id="check_mnone"><label for="check_mnone" class="check"></label>&nbsp;&nbsp;<label for="check_mnone" > 학력무관</label></div>
    </div>
</div>

<!-- 카테고리 6: 자격증 -->
<div>
    <button type="button" id="category6-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#자격증</button>
    <div id="category6-content-modal" class="category-content hidden">
                       <!-- 자격증 체크박스들 -->
       	<div class="checkDiv"><input type="checkbox" name="Certification[]" value="토익700↑" id="check_mtoeic"><label for="check_mtoeic" class="check"></label>&nbsp;&nbsp;<label for="check_mtoeic">  토익700↑</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="토플700↑" id="check_mtoefl"><label for="check_mtoefl" class="check"></label>&nbsp;&nbsp;<label for="check_mtoefl">  토플700↑</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="토스IL↑"  id="check_mticspeaking"><label for="check_mticspeaking" class="check"></label>&nbsp;&nbsp;<label for="check_mticspeaking">  토스IL↑</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="정보처리기사"  id="check_mengineerCerti"><label for="check_mengineerCerti" class="check"></label>&nbsp;&nbsp;<label for="check_mengineerCerti">  정보처리기사</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="SQLD"  id="check_msqld"><label for="check_msqld" class="check"></label>&nbsp;&nbsp;<label for="check_msqld">  SQLD</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="SQLP"  id="check_msqlp"><label for="check_msqlp" class="check"></label>&nbsp;&nbsp;<label for="check_msqlp">  SQLP</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="리눅스마스터"  id="check_mlinuxCerti"><label for="check_mlinuxCerti" class="check"></label>&nbsp;&nbsp;<label for="check_mlinuxCerti">  리눅스마스터</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="AWS자격증"  id="check_mawsCerti"><label for="check_mawsCerti" class="check"></label>&nbsp;&nbsp;<label for="check_mawsCerti">  AWS자격증</label></div>
        <div class="checkDiv"><input type="checkbox" name="Certification[]" value="기타"  id="check_mothers"><label for="check_mothers" class="check"></label>&nbsp;&nbsp;<label for="check_mothers">  기타</label></div>
    </div>
</div>

<!-- 카테고리 7: 고용형태 -->
            <div>
                <button type="button" id="category7-toggle-modal" class="custom-bg-color text-black p-2 rounded w-full text-left category-item">#고용형태</button>
                <div id="category7-content-modal" class="category-content hidden">
          <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="계약직3개월" id="check_m3month"><label for="check_m3month" class="check"></label>&nbsp;&nbsp;<label for="check_m3month"> 계약직3개월</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="계약직6개월" id="check_m6month"><label for="check_m6month" class="check"></label>&nbsp;&nbsp;<label for="check_m6month"> 계약직6개월</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="정규직" id="check_mfulltime"><label for="check_mfulltime" class="check"></label>&nbsp;&nbsp;<label for="check_mfulltime"> 정규직</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="인턴" id="check_mintern"><label for="check_mintern" class="check"></label>&nbsp;&nbsp;<label for="check_mintern"> 인턴</label></div>
	   <div class="checkDiv"><input type="checkbox" name="employmentType[]" value="프리랜서" id="check_mfreelancer"><label for="check_mfreelancer" class="check"></label>&nbsp;&nbsp;<label for="check_mfreelancer"> 프리랜서</label></div>
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

            <button type="submit" class="bg-blue-500 text-white p-2 rounded mt-4 main-btn-size">등록</button>
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
          window.location.href = `/DevPanda/auction/detail?auctionNum=\${auctionNum}`;
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


.category-container >div {
    margin:10px;

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
    max-width: 1100px;
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

section {
	width: 1600px;
	margin: 0 auto;
}

</style>

</body>
</html>
