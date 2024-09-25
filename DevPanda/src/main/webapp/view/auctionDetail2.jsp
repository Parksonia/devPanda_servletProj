<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/auctionDetail.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


</head>


<body class="bg-gray-100 text-gray-900">

	<header>
		<%@ include file="./inc/header.jsp"%>
	</header>

	<main class="p-8">
		<div id="profile-details" class="bg-white p-4 shadow-md rounded" style="padding: 50px; width: 800px; margin: 0 auto;">
			<img
				src="<c:out value='${pageContext.request.contextPath}/upload/${auctionAndPerson.personImage}' default='${pageContext.request.contextPath}/upload/default.jpg'/>"
				alt="${auctionAndPerson.nickName}의 이미지"
				class="rounded-full w-16 h-16 mx-auto mb-2">
			<h2 id="profile-name" class="text-xl font-bold text-center">${auctionAndPerson.nickName}</h2>
			<p id="profile-job-title" class="text-lg text-center text-gray-600">${auctionAndPerson.occupation}</p>



			<!-- 경매 정보 표시 -->
			<p id="auction-title" class="text-lg font-bold mt-4">경매 제목:
				${auctionAndPerson.title}</p>
			<p id="auction-min-bid" class="text-lg">최소 입찰가:
				<fmt:formatNumber value="${auctionAndPerson.minSalary}" pattern="#,###" />원</p>
			<p id="auction-max-bid" class="text-lg">최대 입찰가:
				<fmt:formatNumber value="${auctionAndPerson.maxSalary}" pattern="#,###" />원</p>

			<%-- <!-- 카테고리 체크박스 정보 표시 -->
			<p id="auction-categories" class="text-lg">카테고리:${category}</p> --%>

			<%-- <!-- 카테고리 리스트 -->
			<p id="auction-categories" class="text-lg font-bold mt-4">카테고리:</p>
			<ul>
			    <c:forEach var="categoryItem" items="${fn:split(category, ',')}">
			        <li class="text-lg">${categoryItem.trim()}</li>
			    </c:forEach>
			</ul> --%>

			<h2>경매 상세 정보</h2>

			<table>
				<tr>
					<th>경매 번호</th>
					<td>${auctionAndPerson.auctionNum}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${auctionAndPerson.id}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${auctionAndPerson.title}</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td>${auctionAndPerson.startDate}</td>
				</tr>
				<tr>
					<th>종료일</th>
					<td>${auctionAndPerson.endDate}</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>${auctionAndPerson.state}</td>
				</tr>
				<tr>
					<th>시작 가격</th>
					<td><fmt:formatNumber value="${auctionAndPerson.startPrice}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>최소 입찰가</th>
					<td><fmt:formatNumber value="${auctionAndPerson.minSalary}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>최대 입찰가</th>
					<td><fmt:formatNumber value="${auctionAndPerson.maxSalary}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>현재 최고 입찰가</th>
					<td><fmt:formatNumber value="${auctionAndPerson.bidMaxPrice}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>직종</th>
					<td>${auctionAndPerson.occupation}</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>${auctionAndPerson.period}</td>
				</tr>
				<tr>
					<th>학력</th>
					<td>${auctionAndPerson.education}</td>
				</tr>
				<tr>
					<th>고용 유형</th>
					<td>${auctionAndPerson.employmentType}</td>
				</tr>
				<tr>
					<th>기술 스택</th>
					<td>${auctionAndPerson.stack}</td>
				</tr>
				<tr>
					<th>자격증</th>
					<td>${auctionAndPerson.certification}</td>
				</tr>
				<tr>
					<th>위치</th>
					<td>${auctionAndPerson.location}</td>
				</tr>


				<tr>
					<th>포트폴리오</th>
					<td>
						<c:if test="${auctionAndPerson.portfolio != null}">
							<a href="${pageContext.request.contextPath}/download?file=${auctionAndPerson.portfolio}"
								target="_blank">
							포트폴리오 다운로드
								<img src="${pageContext.request.contextPath}/img/download.svg" alt="" style="width:20px; height:20px;display:inline;">
							</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${auctionAndPerson.nickName}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${auctionAndPerson.email}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${auctionAndPerson.address}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${auctionAndPerson.sex}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${auctionAndPerson.age}</td>
				</tr>
				<%--  <tr>
        <th>프로필 이미지</th>
        <td> <img src="<c:out value='${pageContext.request.contextPath}/upload/${auction.personImage}' default='${pageContext.request.contextPath}/upload/default.jpg'/>"
                     alt="${auction.nickName}의 이미지" class="rounded-full w-16 h-16 mx-auto mb-2"></td>
    </tr> --%>
				<tr>
					<th>상태</th>
					<td>${auctionAndPerson.status}</td>
				</tr>
			</table>
			<c:if test="${id != auctionAndPerson.id}">
				<button onclick="bidOnProfile()" class="mt-4 bg-blue-500 text-white p-2 rounded w-full">입찰하기</button>
			</c:if>		
		</div>
	</main>

	<!-- 입찰하기 모달 -->
	<div id="bid-modal" class="bid-modal">
		<div class="bid-modal-content">
			<button class="close-button" onclick="closeBidModal()">×</button>
			<h2 class="text-xl font-bold mb-4">입찰하기</h2>
			<input type="number" id="bid-amount"
				placeholder="최소 입력 금액:${auctionAndPerson.bidMaxPrice == 0 ? auctionAndPerson.startPrice : auctionAndPerson.bidMaxPrice}원" class="w-full p-2 border border-gray-300 rounded">
			<p id="current-bid" class="text-sm text-gray-600 mt-2">현재 최고 입찰
				금액: <fmt:formatNumber value="${auctionAndPerson.bidMaxPrice}" pattern="#,###" />원</p>
			<p class="text-sm text-gray-600 mt-2">* 최대금액으로 입찰하면 즉시 구매됩니다.</p>
			<button onclick="submitBid()"
				class="custom-bg-color text-black p-2 rounded mt-4 w-full">제출</button>
		</div>
	</div>

	<script>
	

	
		const input = document.getElementById('bid-amount');
		const p = document.getElementById('current-bid');
	
	
		function bid() {
			const today = new Date();

			const year = today.getFullYear();

			const month = (today.getMonth() + 1).toString().padStart(2, '0');

			const day = today.getDate().toString().padStart(2, '0');

			const inputdate = year + "-" + month + "-" + day;

			const bidAmount = $('#bid-amount').val();

			
			if ('${userType}' === 'person') {

				$.ajax({
							url : 'http://localhost:8080/DevPanda/bid',
							dataType : 'text',
							type : 'POST',
							data : {

								'buyPersonId' : '${person.id}',
								'auctionNum' : '${auctionAndPerson.auctionNum}',
								'sellerId' : '${auctionAndPerson.id}',
								'bidDate' : inputdate,
								'bidPrice' : $('#bid-amount').val(),
								'bidState' : '1',
								'memType' : '${userType}',
								'bidMaxPrice' : $('#bid-amount').val(),
							},
							success : function(result) {
								if (result === 'success') {
									console.log(bidAmount)
									const a = 1;
									input.setAttribute('placeholder',`현재 최고 입찰 금액: \${bidAmount}원`)
									input.value=null;
									p.innerText=`현재 최고 입찰 금액: \${bidAmount}원`
									alert(`입찰 금액 \${bidAmount}원이 입찰되었습니다.`);

								} else {
									alert(`입찰 금액 \${bidAmount}원이 입찰실패하였습니다. 다시 시도해 주세요`);

								}

							}
						});

			} else {

				$.ajax({
							url : 'http://localhost:8080/DevPanda/bid',
							dataType : 'text',
							type : 'POST',
							data : {

								'buyerId' : '${company.id}',
								'auctionNum' : '${auctionAndPerson.auctionNum}',
								'sellerId' : '${auctionAndPerson.id}',
								'bidDate' : inputdate,
								'bidPrice' : $('#bid-amount').val(),
								'bidState' : '1',
								'memType' : '${userType}',
								'bidMaxPrice' : $('#bid-amount').val(),
							},
							success : function(result) {
								if (result === 'success') {
									input.setAttribute('placeholder',`현재 최고 입찰 금액: \${bidAmount}원`)
									input.value=null;
									p.innerText=`현재 최고 입찰 금액: \${bidAmount}원`
									alert(`입찰 금액 \${bidAmount}원이 입찰되었습니다.`);

								} else {
									alert(`입찰 금액 \${bidAmount}원이 입찰실패하였습니다. 다시 시도해 주세요`);

								}

							}
						});

			}

		}

		function transactionbid() {

			const today = new Date();

			const year = today.getFullYear();

			const month = (today.getMonth() + 1).toString().padStart(2, '0');

			const day = today.getDate().toString().padStart(2, '0');

			const inputdate = year + "-" + month + "-" + day;

			const bidAmount = $('#bid-amount').val();
			
			const Amount = ${auctionAndPerson.maxSalary};

			if ('${userType}' === 'person') {

				$.ajax({
							url : 'http://localhost:8080/DevPanda/transactionbid',
							dataType : 'text',
							type : 'POST',
							data : {

								'buyPersonId' : '${person.id}',
								'auctionNum' : '${auctionAndPerson.auctionNum}',
								'sellerId' : '${auctionAndPerson.id}',
								'bidDate' : inputdate,
								'bidPrice' : '${auctionAndPerson.maxSalary}',
								'bidState' : '3',
								'memType' : '${userType}',
								'bidMaxPrice' : '${auctionAndPerson.maxSalary}',
								'date' : inputdate,
								'price' : '${auctionAndPerson.maxSalary}',
								'state' : 'i'
							},
							success : function(result) {
								if (result === 'success') {
									input.setAttribute('placeholder',`현재 최고 입찰 금액: \${Amount}원`)
									input.value=null;
									p.innerText=`현재 최고 입찰 금액: \${Amount}원`
									alert(`입찰 금액 \${bidAmount}원이 최대 금액이므로 즉시 구매되었습니다.`);
								} else {
									alert(`입찰 금액 \${bidAmount}원이 입찰 실패하였습니다. 다시 시도해 주세요`);
								}

							}
						});

			} else {

				$.ajax({
							url : 'http://localhost:8080/DevPanda/transactionbid',
							dataType : 'text',
							type : 'POST',
							data : {

								'buyerId' : '${company.id}',
								'auctionNum' : '${auctionAndPerson.auctionNum}',
								'sellerId' : '${auctionAndPerson.id}',
								'bidDate' : inputdate,
								'bidPrice' : '${auctionAndPerson.maxSalary}',
								'bidState' : '3',
								'memType' : '${userType}',
								'bidMaxPrice' : '${auctionAndPerson.maxSalary}',
								'date' : inputdate,
								'price' : '${auctionAndPerson.maxSalary}',
								'state' : 'i'
							},
							success : function(result) {
								if (result === 'success') {
									input.setAttribute('placeholder',`현재 최고 입찰 금액: \${Amount}원`)
									input.value=null;
									p.innerText=`현재 최고 입찰 금액: \${Amount}원`
									alert(`입찰 금액 \${bidAmount}원이 최대 금액이므로 즉시 구매되었습니다.`);
								} else {
									alert(`입찰 금액 \${bidAmount}원이 입찰 실패하였습니다. 다시 시도해 주세요`);
								}

							}
						});

			}

		}

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
			console.log(bidAmount);
			const maxAmount = ${auctionAndPerson.maxSalary};
			let currentBid = ${auctionAndPerson.bidMaxPrice};
			if (bidAmount) {
				if (bidAmount >= maxAmount) {
					//bid insert, auction update insert transaction

					transactionbid();
					closeBidModal();
				} else if (bidAmount < ${auctionAndPerson.startPrice}) {
					alert('입찰 금액이 최소 입찰 금액보다 낮습니다.');
					document.getElementById('bid-amount').value='';
				} else if (bidAmount > currentBid) {
					//bid insert, auction update
					bid();
					closeBidModal();
				} else {
					alert('입찰 금액이 현재 최고 금액보다 낮습니다.');
				}
			} else {
				alert('금액을 입력해 주세요.');
			}
		}
	</script>

	<style>
table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>

</body>
</html>
