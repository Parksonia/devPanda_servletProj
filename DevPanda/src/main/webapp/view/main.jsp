<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DevPanda</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
}
/* Header fixed 상태에서 본문과 겹치지 않도록 상단 패딩 추가 */
body {
	padding-top: 150px; /* 헤더 높이에 맞춰 패딩 추가 */
}

header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: white;
	z-index: 1000; /* 다른 요소보다 위에 위치하도록 설정 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.category-content {
	max-height: 0;
	overflow-y: hidden;
	transition: max-height 0.3s ease-out;
}

.category-content.open {
	max-height: 200px;
	overflow-y: auto;
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
</head>
<body class="bg-gray-100 text-gray-900">

	<!-- Header Start -->
	<header>
		<%@ include file="./inc/header.jsp"%>
	</header>

	<!-- Header End-->

	<!-- <header
		class="bg-white shadow-md p-4 flex justify-between items-center">
		<div class="flex items-center space-x-4">
			<h1 class="text-2xl font-bold">DevPanda</h1>
			<nav class="flex space-x-4">
				<a href="#" class="text-lg">Home</a> <a href="#" class="text-lg">Mypage</a>
			</nav>
		</div>
		<div class="flex items-center space-x-4">
			<span>권익재님</span>
			<button aria-label="알림 확인" class="relative">
				<svg class="w-6 h-6 text-gray-600" fill="none" stroke="currentColor"
					viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round"
						stroke-width="2"
						d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6 6 0 10-12 0v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
                </svg>
				<span
					class="absolute top-0 right-0 block h-2 w-2 rounded-full ring-2 ring-white bg-red-400"></span>
			</button>
			<button class="text-lg">로그아웃</button>
		</div>
	</header> -->

	<main class="p-8">
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
								name="category1" value="서울"> 서울</label><br>
								<label><input type="checkbox"
								name="category1" value="경/인"> 경/인</label><br>
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

		<section class="mb-8">
			<h2 class="text-xl font-bold mb-4">나만의 개발자</h2>
			<div
				class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
				<!-- 프로필 카드들 -->
				<div class="profile-card bg-white shadow-md rounded p-4"
					onclick="openProfilePage('profile1')">
					<img src="https://via.placeholder.com/150" alt="Profile Picture"
						class="rounded-full w-16 h-16 mx-auto mb-2">
					<h3 class="text-lg font-semibold text-center">John Doe</h3>
					<p class="text-center text-gray-600">Web Developer</p>
				</div>

				<div class="profile-card bg-white shadow-md rounded p-4"
					onclick="() => {openProfilePage('profile2')}">
					<img src="https://via.placeholder.com/150" alt="Profile Picture"
						class="rounded-full w-16 h-16 mx-auto mb-2">
					<h3 class="text-lg font-semibold text-center">Jane Smith</h3>
					<p class="text-center text-gray-600">Software Engineer</p>
				</div>

				<div class="profile-card bg-white shadow-md rounded p-4"
					onclick="openProfilePage('profile1')">
					<img src="https://via.placeholder.com/150" alt="Profile Picture"
						class="rounded-full w-16 h-16 mx-auto mb-2">
					<h3 class="profile-title text-lg font-semibold text-center">John
						Doe</h3>
					<p class="profile-description text-center text-gray-600">한줄 소개
						없음</p>
					<p class="profile-min-bid text-center text-gray-600">최소 금액: N/A</p>
					<p class="profile-max-bid text-center text-gray-600">최대 금액: N/A</p>
				</div>


				<!-- 추가 프로필 카드들 -->
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
							<label><input type="checkbox" name="category1" value="서울">
								서울</label><br> <label><input type="checkbox"
								name="category1" value="부산"> 부산</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 2 -->
					<div>
						<button id="category2-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#기술</button>
						<div id="category2-content-modal" class="category-content">
							<label><input type="checkbox" name="category2"
								value="React"> React</label><br> <label><input
								type="checkbox" name="category2" value="Vue"> Vue</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 3 -->
					<div>
						<button id="category3-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#직무</button>
						<div id="category3-content-modal" class="category-content">
							<label><input type="checkbox" name="category3"
								value="프론트엔드"> 프론트엔드</label><br> <label><input
								type="checkbox" name="category3" value="백엔드"> 백엔드</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 4 -->
					<div>
						<button id="category4-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#경험</button>
						<div id="category4-content-modal" class="category-content">
							<label><input type="checkbox" name="category4" value="1년">
								1년</label><br> <label><input type="checkbox"
								name="category4" value="5년"> 5년</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 5 -->
					<div>
						<button id="category5-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#언어</button>
						<div id="category5-content-modal" class="category-content">
							<label><input type="checkbox" name="category5"
								value="Python"> Python</label><br> <label><input
								type="checkbox" name="category5" value="Java"> Java</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 6 -->
					<div>
						<button id="category6-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#포트폴리오</button>
						<div id="category6-content-modal" class="category-content">
							<label><input type="checkbox" name="category6"
								value="포트폴리오1"> 포트폴리오1</label><br> <label><input
								type="checkbox" name="category6" value="포트폴리오2"> 포트폴리오2</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>

					<!-- 카테고리 7 -->
					<div>
						<button id="category7-toggle-modal"
							class="custom-bg-color text-black p-2 rounded w-full text-left category-item">
							#기타</button>
						<div id="category7-content-modal" class="category-content">
							<label><input type="checkbox" name="category7"
								value="기타1"> 기타1</label><br> <label><input
								type="checkbox" name="category7" value="기타2"> 기타2</label><br>
							<!-- 추가 체크박스 -->
						</div>
					</div>
				</div>

				<div class="flex justify-between mt-4">
					<button type="button" class="bg-gray-300 text-gray-800 p-2 rounded"
						onclick="resetModalSelections()">초기화</button>
					<button type="submit" class="bg-green-500 text-white p-2 rounded">등록하기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
    
    function saveAuctionData(event) {
    event.preventDefault(); // 폼 제출 시 페이지 리로드 방지

    const auctionTitle = document.querySelector('input[name="auctionTitle"]').value;
    const minBid = document.querySelector('input[name="minBid"]').value;
    const maxBid = document.querySelector('input[name="maxBid"]').value;
    const categories = []; // 체크박스 데이터 저장
    document.querySelectorAll('input[name="categories"]:checked').forEach((checkbox) => {
        categories.push(checkbox.value);
    });

    const auctionData = {
        auctionTitle,
        minBid,
        maxBid,
        categories
    };

    // 경매 데이터를 로컬 스토리지에 저장
    localStorage.setItem('auctionData', JSON.stringify(auctionData));

    alert('경매 정보가 저장되었습니다.');
}
 // 카테고리 버튼 클릭 시 체크박스 영역 열기/닫기
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

        // 모달 내 카테고리 버튼 클릭 이벤트 (경매 등록 모달용)
        document.querySelectorAll('[id$="-toggle-modal"]').forEach(button => {
            button.addEventListener('click', function (event) {
                event.stopPropagation(); // 등록을 방지하기 위한 조치

                const contentId = this.id.replace('-toggle-modal', '-content-modal');
                const contentElement = document.getElementById(contentId);

                if (contentElement) {
                    contentElement.classList.toggle('open');
                }
            });
        });

        // 경매 등록 폼 제출 시 경매 정보 저장하기
        document.getElementById('auctionForm').addEventListener('submit', function (event) {
            event.preventDefault(); // 폼 제출 시 페이지 리로드 방지

            const auctionTitle = document.querySelector('input[name="auctionTitle"]').value;
            const minBid = document.querySelector('input[name="minBid"]').value;
            const maxBid = document.querySelector('input[name="maxBid"]').value;
            const categories = []; // 체크박스 데이터 저장

            document.querySelectorAll('#auctionForm input[type="checkbox"]:checked').forEach((checkbox) => {
                categories.push(checkbox.value);
            });

            if (categories.length === 0) {
                alert('최소한 하나의 카테고리를 선택해주세요.');
                return; // 카테고리 선택이 없으면 등록 중단
            }

            const auctionData = {
                auctionTitle,
                minBid,
                maxBid,
                categories
            };

            // 경매 데이터를 로컬 스토리지에 저장
            localStorage.setItem('auctionData', JSON.stringify(auctionData));

            alert('경매 정보가 저장되었습니다.');
            closeAuctionModal(); // 모달 닫기
        });
    });

 		function openProfilePage(profileId) {
	    window.location.href = `Profile.jsp?id=${profileId}`;
		}	
 
 		/* function openProfilePage(profileId) {
     	window.location.href = 'auctionDetail.jsp?id=' + profileId;	
 		} */


        function resetSelections() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = false;
            });
            saveSelections();
        }
        // 체크박스 상태가 변경될 때마다 저장
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                saveSelections();
            });
        });

        function saveSelections() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                localStorage.setItem(checkbox.value, checkbox.checked);
            });
        }

        function loadSelections() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                const storedValue = localStorage.getItem(checkbox.value);
                if (storedValue === "true") {
                    checkbox.checked = true;
                } else {
                    checkbox.checked = false;
                }
            });
        }

        
        document.addEventListener('DOMContentLoaded', function() {
    loadProfileCard();
});

function loadProfileCard() {
    const auctionData = JSON.parse(localStorage.getItem('auctionData'));

    if (auctionData) {
        const profileCards = document.querySelectorAll('.profile-card');
        profileCards.forEach((card, index) => {
            const profileTitle = card.querySelector('.profile-title');
            const profileMinBid = card.querySelector('.profile-min-bid');
            const profileMaxBid = card.querySelector('.profile-max-bid');
            const profileDescription = card.querySelector('.profile-description');

            profileTitle.textContent = auctionData.auctionTitle || '한줄 소개 없음';
            profileMinBid.textContent = `최소 금액: ${auctionData.minBid || 'N/A'}`;
            profileMaxBid.textContent = `최대 금액: ${auctionData.maxBid || 'N/A'}`;
            profileDescription.textContent = auctionData.auctionTitle || '한줄 소개 없음';
        });
    }
}

// 모달 열기/닫기 함수
function openAuctionModal() {
        document.getElementById('auctionModal').classList.add('active');
    }

    // 모달 닫기
    function closeAuctionModal() {
        document.getElementById('auctionModal').classList.remove('active');
    }

    // 경매 모달 초기화
    function resetModalSelections() {
        document.getElementById('auctionForm').reset();
    }

    // 체크박스 선택 상태 초기화 함수
    function resetSelections() {
        document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => checkbox.checked = false);
    }
    </script>

	<style>
/* 모달 스타일 */
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

.modal.open {
	display: flex;
}

.modal-content {
	background: white;
	padding: 20px;
	border-radius: 8px;
	width: 90%;
	max-width: 600px;
	position: relative;
}

.close-button {
	position: absolute;
	top: 10px;
	right: 10px;
	background: none;
	border: none;
	font-size: 24px;
	cursor: pointer;
}
</style>
</body>
</html>
