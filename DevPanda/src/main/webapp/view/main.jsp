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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
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
					<!-- 카테고리 1 -->
					<div>
						<button id="category1-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#지역</button>
						<div id="category1-content" class="category-content">
							<label><input type="checkbox" name="category1" value="전국">
								전국</label><br> <label><input type="checkbox"
								name="category1" value="서울"> 서울</label><br> <label><input
								type="checkbox" name="category1" value="경/인"> 경/인</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 2 -->
					<div>
						<button id="category2-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#기술</button>
						<div id="category2-content" class="category-content">
							<label><input type="checkbox" name="category2"
								value="React"> React</label><br> <label><input
								type="checkbox" name="category2" value="Vue"> Vue</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 3 -->
					<div>
						<button id="category3-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#직무</button>
						<div id="category3-content" class="category-content">
							<label><input type="checkbox" name="category3"
								value="프론트엔드"> 프론트엔드</label><br> <label><input
								type="checkbox" name="category3" value="백엔드"> 백엔드</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 4 -->
					<div>
						<button id="category4-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#경험</button>
						<div id="category4-content" class="category-content">
							<label><input type="checkbox" name="category4" value="1년">
								1년</label><br> <label><input type="checkbox"
								name="category4" value="5년"> 5년</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 5 -->
					<div>
						<button id="category5-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#언어</button>
						<div id="category5-content" class="category-content">
							<label><input type="checkbox" name="category5"
								value="Python"> Python</label><br> <label><input
								type="checkbox" name="category5" value="Java"> Java</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 6 -->
					<div>
						<button id="category6-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#포트폴리오</button>
						<div id="category6-content" class="category-content">
							<label><input type="checkbox" name="category6"
								value="포트폴리오1"> 포트폴리오1</label><br> <label><input
								type="checkbox" name="category6" value="포트폴리오2"> 포트폴리오2</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 7 -->
					<div>
						<button id="category7-toggle"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#기타</button>
						<div id="category7-content" class="category-content">
							<label><input type="checkbox" name="category7"
								value="기타1"> 기타1</label><br> <label><input
								type="checkbox" name="category7" value="기타2"> 기타2</label><br>
							<!-- 추가 체크박스 -->
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
	<div id="auctionModal" class="modal">
		<div class="modal-content">
			<button class="close-button" onclick="closeAuctionModal()">×</button>
			<h2 class="text-2xl font-bold mb-4">경매 등록하기</h2>
			<form id="auctionForm">
				<label class="block mb-2 text-left">한줄 소개:</label> <input
					type="text" name="auctionTitle"
					class="w-full p-2 mb-4 border rounded" placeholder="한줄 소개를 입력하세요"
					required> <label class="block mb-2 text-left">최소
					금액:</label> <input type="number" name="minBid"
					class="w-full p-2 mb-4 border rounded" placeholder="최소 금액을 입력하세요"
					required> <label class="block mb-2 text-left">최대
					금액:</label> <input type="number" name="maxBid"
					class="w-full p-2 mb-4 border rounded" placeholder="최대 금액을 입력하세요"
					required>
				<p class="text-sm text-gray-500 mt-1">최대 금액 입찰 시 즉시 구매됩니다.</p>

				<label class="block mb-2 text-left">카테고리 선택:</label>
				<div class="category-container">
					<!-- 카테고리 1 -->
					<div>
						<button id="category1-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#지역</button>
						<div id="category1-content-modal" class="category-content">
							<label><input type="checkbox" name="modalCategory1"
								value="전국"> 전국</label><br> <label><input
								type="checkbox" name="modalCategory1" value="서울"> 서울</label><br>
							<label><input type="checkbox" name="modalCategory1"
								value="경/인"> 경/인</label><br>
						</div>
					</div>
					<!-- 추가 카테고리들... -->
				</div>

				<button type="submit"
					class="bg-blue-500 text-white p-2 rounded mt-4">등록</button>
			</form>
		</div>
	</div>


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
	
	
	
		function openAuctionModal() {
			document.getElementById('auctionModal').style.display = 'block';
		}

		function closeAuctionModal() {
			document.getElementById('auctionModal').style.display = 'none';
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

.category-content {
	display: none;
	padding-left: 20px;
}

.custom-bg-color {
	background-color: #f0f0f0;
}

.category-item {
	cursor: pointer;
	text-align: left;
}
</style>

</body>
</html>
