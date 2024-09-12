<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div id="profile-details" class="bg-white p-4 shadow-md rounded">
			<img id="profile-pic" src="${auctionAndPerson.personImage}" alt="Profile Picture"
				class="rounded-full w-32 h-32 mx-auto mb-4">
			<h2 id="profile-name" class="text-xl font-bold text-center">${auctionAndPerson.nickName}</h2>
			<p id="profile-job-title" class="text-lg text-center text-gray-600">${auctionAndPerson.occupation}</p>
			
			

			<!-- 경매 정보 표시 -->
			<p id="auction-title" class="text-lg font-bold mt-4">경매 제목: ${auctionAndPerson.title}</p>
			<p id="auction-min-bid" class="text-lg">최소 입찰가: ${auctionAndPerson.maxSalary}원</p>
			<p id="auction-max-bid" class="text-lg">최대 입찰가: ${auctionAndPerson.minSalary}원</p>

			<!-- 카테고리 체크박스 정보 표시 -->
			<p id="auction-categories" class="text-lg">카테고리:${category}</p>

			<button onclick="bidOnProfile()"
				class="mt-4 bg-blue-500 text-white p-2 rounded w-full">입찰하기</button>
		</div>
	</main>

	<!-- 입찰하기 모달 -->
	<div id="bid-modal" class="bid-modal">
		<div class="bid-modal-content">
			<button class="close-button" onclick="closeBidModal()">×</button>
			<h2 class="text-xl font-bold mb-4">입찰하기</h2>
			<input type="number" id="bid-amount" placeholder="현재 최고 입찰
				금액: ${auctionAndPerson.bidMaxPrice}원" min="0"
				class="w-full p-2 border border-gray-300 rounded">
			<p id="current-bid" class="text-sm text-gray-600 mt-2">현재 최고 입찰
				금액: ${auctionAndPerson.bidMaxPrice}원</p>
			<p class="text-sm text-gray-600 mt-2">* 최대금액으로 입찰하면 즉시 구매됩니다.</p>
			<button onclick="submitBid()"
				class="custom-bg-color text-black p-2 rounded mt-4 w-full">제출</button>
		</div>
	</div>

	<script>
      	
		function bid(){
			
			
			$.ajax({
		        url:'http://localhost:8080/DevPanda/bid',
		        dataType:'text',
		        type:'POST',
		        data:{
		        	'buyerId':'',
		        	'buyPersonId':'',
		        	'auctionNum':'',
		        	'sellerId':'${auctionAndPerson.id}',
		        	'bidDate':'',
		        	'bidPrice':'',
		        	'bidState':'',
		        	'memType':'${userType}',
		        	'bidMaxPrice':'${auctionAndPerson.bidMaxPrice}',
		        	'date':'',
		        	'price':'${auctionAndPerson.bidMaxPrice}',
		        	'state':''},
		        success:function(result){
		        if(result==='success'){
		        	alert(`입찰 금액 ${bidAmount}원이 입찰되었습니다.`);
		        	
		        }  else{
		        	alert(`입찰 금액 ${bidAmount}원이 입찰실패하였습니다. 다시 시도해 주세요`);
		        	
		        }
		        
		        
		        
		        
		        }
		    });
					
	
		}
		
		
		
		function transactionbid(){
			
			
			$.ajax({
		        url:'http://localhost:8080/DevPanda/transactionbid',
		        dataType:'text',
		        type:'POST',
		        data:{'id':$('#id').val(),
		        		'email':$('#email').val()},
		        success:function(result){
		        if(result==='success'){
		        	alert(`입찰 금액 ${bidAmount}원이 최대 금액이므로 즉시 구매되었습니다.`);
		        }  else{
		        	alert(`입찰 금액 ${bidAmount}원이 입찰 실패하였습니다. 다시 시도해 주세요`);
		        }
		        
		        
		        
		        
		        }
		    });
					
	
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
            const maxAmount = ${auctionAndPerson.maxSalary};
            let currentBid = ${auctionAndPerson.bidMaxPrice};

            if (bidAmount) {
                if (bidAmount >= maxAmount) {
                	//bid insert, auction update insert transaction
                	alert(`입찰 금액 ${bidAmount}원이 최대 금액이므로 즉시 구매되었습니다.`);
                    closeBidModal();
                } else if (bidAmount > currentBid) {
                   	//bid insert, auction update
                    alert(`입찰 금액 ${bidAmount}원이 입찰되었습니다.`);
                    closeBidModal();
                } else {
                    alert('입찰 금액이 현재 최고 금액보다 낮습니다.');
                }
            } else {
                alert('금액을 입력해 주세요.');
            }
        }
        
        console.log(1)
    </script>
    

</body>
</html>
