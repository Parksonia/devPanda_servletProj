<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 상세</title>
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
/* 모달 스타일 추가 */
.bid-modal {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
}

.bid-modal.active {
	display: flex; /* 모달이 열릴 때 */
}

.bid-modal-content {
	background: white;
	padding: 2rem;
	border-radius: 0.5rem;
	max-width: 500px;
	width: 100%;
	position: relative;
}

.close-button {
	background: transparent;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
	position: absolute;
	top: 1rem;
	right: 1rem;
}
</style>
</head>
<body class="bg-gray-100 text-gray-900">

	<header>
		<%@ include file="./inc/header.jsp"%>
	</header>

	<!-- <header class="bg-white shadow-md p-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold">나만의 개발자</h1>
    </header> -->

	<main class="p-8">
		<div id="profile-details" class="bg-white p-4 shadow-md rounded">
			<img id="profile-pic" src="" alt="Profile Picture"
				class="rounded-full w-32 h-32 mx-auto mb-4">
			<h2 id="profile-name" class="text-xl font-bold text-center"></h2>
			<p id="profile-job-title" class="text-lg text-center text-gray-600"></p>
			<p id="profile-company" class="text-lg text-center text-gray-600"></p>
			<p id="profile-bio" class="text-lg text-gray-600"></p>

			<!-- 경매 정보 표시 -->
			<p id="auction-title" class="text-lg font-bold mt-4">경매 제목:</p>
			<p id="auction-min-bid" class="text-lg">최소 입찰가:</p>
			<p id="auction-max-bid" class="text-lg">최대 입찰가:</p>

			<!-- 카테고리 체크박스 정보 표시 -->
			<p id="auction-categories" class="text-lg">카테고리:</p>

			<button onclick="bidOnProfile()"
				class="mt-4 bg-blue-500 text-white p-2 rounded w-full">입찰하기</button>
		</div>
	</main>


	<!-- 입찰하기 모달 -->
	<div id="bid-modal" class="bid-modal">
		<div class="bid-modal-content">
			<button class="close-button" onclick="closeBidModal()">×</button>
			<h2 class="text-xl font-bold mb-4">입찰하기</h2>
			<input type="number" id="bid-amount" placeholder="금액 입력" min="0"
				class="w-full p-2 border border-gray-300 rounded">
			<p id="current-bid" class="text-sm text-gray-600 mt-2">현재 최고 입찰
				금액: 0</p>
			<!-- 현재 최고 입찰금액 표시 -->
			<p class="text-sm text-gray-600 mt-2">* 최대금액으로 입찰하면 즉시 구매됩니다.</p>
			<button onclick="submitBid()"
				class="custom-bg-color text-black p-2 rounded mt-4 w-full">제출</button>
		</div>
	</div>

	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							let currentBid = 5000; // 현재 최고 입찰금액을 설정 (예: 5000)
							const maxAmount = 10000; // 최대 금액 설정

							// 페이지 로드 시 현재 최고 입찰 금액 표시
							document.getElementById('current-bid').innerText = `현재 최고 입찰 금액: ${currentBid}원`;
							document.getElementById('bid-amount').placeholder = `현재 최고 입찰 금액: ${currentBid}원`;

							const urlParams = new URLSearchParams(
									window.location.search);
							const profileId = urlParams.get('id');
							const profiles = {
								'profile1' : {
									name : 'John Doe',
									jobTitle : 'Web Developer',
									company : 'Tech Corp',
									bio : 'Experienced web developer with a passion for building user-friendly applications.',
									imgSrc : 'https://via.placeholder.com/150'
								},
								'profile2' : {
									name : 'Jane Smith',
									jobTitle : 'Software Engineer',
									company : 'Tech Solutions',
									bio : 'An experienced software engineer specializing in backend development.',
									imgSrc : 'https://via.placeholder.com/150'
								}
							};

							const profile = profiles[profileId];

							if (profile) {
								document.getElementById('profile-pic').src = profile.imgSrc;
								document.getElementById('profile-name').innerText = profile.name;
								document.getElementById('profile-job-title').innerText = profile.jobTitle;
								document.getElementById('profile-company').innerText = profile.company;
								document.getElementById('profile-bio').innerText = profile.bio;
							} else {
								document.getElementById('profile-details').innerText = '프로필을 찾을 수 없습니다.';
							}

							// 로컬 스토리지에서 경매 데이터 불러오기
							const auctionData = JSON.parse(localStorage
									.getItem('auctionData'));

							if (auctionData) {
								// 프로필 정보 표시
								document.getElementById('auction-title').innerText = `경매 제목: ${auctionData.auctionTitle}`;
								document.getElementById('auction-min-bid').innerText = `최소 입찰가: ${auctionData.minBid}원`;
								document.getElementById('auction-max-bid').innerText = `최대 입찰가: ${auctionData.maxBid}원`;

								// 카테고리 표시
								const categoriesElement = document
										.getElementById('auction-categories');
								categoriesElement.innerText = `카테고리: ${auctionData.categories.join(', ')}`;
							} else {
								document.getElementById('profile-details').innerText = '경매 정보를 찾을 수 없습니다.';
							}
						});

		function bidOnProfile() {
			openBidModal();
		}

		function openBidModal() {
			document.getElementById('bid-modal').classList.add('active');
		}

		function closeBidModal() {
			document.getElementById('bid-modal').classList.remove('active');
		}

		function submitBid() {
			const bidAmount = parseInt(document.getElementById('bid-amount').value);
			const maxAmount = 10000; // 최대 금액 설정 (예: 10000)
			let currentBid = 5000; // 현재 최고 입찰 금액 예시

			if (bidAmount) {
				if (bidAmount >= maxAmount) {
					alert(`입찰 금액 ${bidAmount}원이 최대 금액이므로 즉시 구매되었습니다.`);
					closeBidModal();
				} else if (bidAmount > currentBid) {
					currentBid = bidAmount;
					document.getElementById('current-bid').innerText = `현재 최고 입찰 금액: ${currentBid}원`;
					document.getElementById('bid-amount').placeholder = `현재 최고 입찰 금액: ${currentBid}원`;
					alert(`입찰 금액 ${bidAmount}원이 제출되었습니다.`);
					closeBidModal();
				} else {
					alert('입찰 금액이 현재 최고 금액보다 낮습니다.');
				}
			} else {
				alert('금액을 입력해 주세요.');
			}
		}
	</script>
</body>
</html>
