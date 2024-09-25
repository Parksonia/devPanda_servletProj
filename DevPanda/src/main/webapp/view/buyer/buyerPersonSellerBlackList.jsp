<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PersonBlack</title>
<!-- 개인|구매내역조회|판매자차단내역| -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<style>
/* modal start */
.modal {
	display: none;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(34, 34, 34, 0.5);
	z-index: 1010;
}

.modal-container {
	position: relative;
	width: 599px;
	height: auto;
	background: #FFFFFF;
	border-radius: 20px;
	padding: 40px 20px;
	box-sizing: border-box;
}

.modal-close {
	position: absolute;
	top: 20px;
	right: 20px;
	width: 24px;
	height: 24px;
	cursor: pointer;
}
/* modal end */

</style>
<link href="${pageContext.request.contextPath }/css/blacklist.css" rel="stylesheet">
</head>

<body style="margin:0;">

	<!-- Header Start -->
	<%@ include file="../inc/header.jsp"%>
	<!-- Header End-->

	<div class="container my">
		<%@ include file="../inc/personSideNav.jsp"%>

		<!-- personBlack Start  -->
		<div class="content_area my-page-content">
			<div class="my_blacklist">

				<div class="content_title border">
					<div class="title">
						<h2>판매자 차단 내역</h2>
					</div>
				</div>


				<!---->
				<div class="blacklist_list finished bid">

					<!--sort head start : 구매내역에서 가져옴-->
					<div class="bk_head">
						<div class="head_totalcnt">
							<div class="total-rows">전체 ${pageInfo.totalCnt} </div>
						</div>
						<div class="head_sort">
							<div class="sorting_box field_date_transaiont">
								<a href="#" class="sort_link"><span class="sort_txt">거래일</span></a>
							</div>

							<div class="sorting_box field_reported_at">
								<a href="#" class="sort_link"><span class="sort_txt">신고일</span></a>
							</div>

							<div class="sorting_box field_reported_at">
								<span class="sort_txt"></span>
							</div>
						</div>
					</div>
					<!--sort head end-->
					<c:choose>
                    <c:when test="${empty sellerBlackList}">
                        <div class="no-items-message">
                            <h2>차단 내역이 없습니다.</h2>
                        </div>
                    </c:when>
					<c:otherwise>
					<c:forEach items="${sellerBlackList}" var="item">
					<div class="modal_btn">
						<div class="black_list_item">
							<div class="black_list_display_mem" style="background-color: rgb(255, 255, 255);"
							 data-auctionNum="${item.auctionNum}"
							 data-blackperson="${item.blackPerson}" data-blacknum="${item.blackNum}" 
            				 data-transaction-date="${item.tansationDate}"  data-content="${item.content}" data-title="${item.title}"
             				 data-email="${item.email}" data-transaction-num="${item.transactionNum}" data-seller-image="${item.personImage}">

								<div class="black_list_mem">
									<div class="list_item_img_wrap">
										<img alt="mem_image" src="image?file=${item.personImage}" class="mem_image">

									</div>
									<div class="list_item_title_wrap">
										<!---->
										<p class="list_itme_div_user">[개인회원]</p>
										<p class="list_item_title"><b>${item.nickName}</b>(${item.blackPerson})</p>
										<p class="list_item_description">
											<span>${item.title}</span>
										</p>
									</div>
								</div>

								<div class="list_item_status">
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">${item.tansationDate}</p>
									</div>
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">${item.reportDate}</p>
									</div>
									<div class="list_item_column column_last">
										<button class="btn btn_add unblock_btn" type="button" data-blackperson="${item.blackPerson}">해제하기</button>
										<!-- 버튼에 해제 처리해야함  -->
									</div>
								</div>
							</div>

						</div>
					</div>
					</c:forEach>
				</c:otherwise>
                </c:choose>
				</div>
				<!---->

				<!--pagination start  -->
				<div class="pagination">
				    <div class="pagination_box">
				        <div class="prev_btn_box">
				            <c:choose>
				               <c:when test="${pageInfo.curPage > 1}">
				                   <a href="BlackListAboutSeller?page=${pageInfo.curPage - 1}" class="btn_arr">
				                       <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-prev icon sprite-icons">
				                           <use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev"></use>
				                       </svg>
				                   </a>
				               </c:when>
				               <c:otherwise>
				                   <a class="btn_arr disabled">
				                       <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-prev icon sprite-icons">
				                           <use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev"></use>
				                       </svg>
				                   </a>
				               </c:otherwise>
				           </c:choose>
				       </div>
				       <div class="page_bind">
				           <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="i">
				               <c:choose>
				                   <c:when test="${i eq pageInfo.curPage}">
				                       <a href="BlackListAboutSeller?page=${i}" class="btn_page active">${i}</a>
				                   </c:when>
				                   <c:otherwise>
				                       <a href="BlackListAboutSeller?page=${i}" class="btn_page">${i}</a>
				                   </c:otherwise>
				               </c:choose>
				           </c:forEach>
				       </div>
				       <div class="next_btn_box">
				           <c:choose>
				               <c:when test="${pageInfo.curPage < pageInfo.allPage}">
				                   <a href="BlackListAboutSeller?page=${pageInfo.curPage + 1}" class="btn_arr">
				                       <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-next icon sprite-icons">
				                           <use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next"></use>
				                       </svg>
				                   </a>
				               </c:when>
				               <c:otherwise>
				                   <a class="btn_arr disabled">
				                       <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-next icon sprite-icons">
				                           <use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next"></use>
				                       </svg>
				                   </a>
				               </c:otherwise>
				           </c:choose>
				        </div>
				    </div>
				</div>
				<!--pagination end  -->

				<!-- Modal -->
				<div id="blacklistModal" class="modal">
					<div class="modal-container">
		
			<a href="#" class="modal-close"> 
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M20.5 3.1L12 11.6 3.5 3.1 2.1 4.5l8.6 8.5-8.6 8.5 1.4 1.4 8.5-8.6 8.5 8.6 1.4-1.4-8.6-8.5 8.6-8.5z"></path>
                </svg>
			</a>
						<div class="modal-header">차단 상세 내역</div>

						<div class="profile-section">
							<div class="profile-image"></div>
							<div class="profile-info">
								<div class="user-type">[개인회원]</div>
								<div class="user-name"></div>
								<div class="user-email"></div>
							</div>
						</div>

						<div class="modal-divider"></div>

						<div class="modal-transaction-info">
							<div>거래 내역</div>
							<div>거래 일자</div>
						</div>
						<div class="modal-transaction-info">
							<div class="modal-transaction-num">T-No </div>
							<div class="modal-transaction-date"></div>
						</div>


						<div class="modal-divider"></div>

						<div class="section-title">신고 제목</div>
						<div class="dropdown-content report-title"></div>

						<div class="section-title">신고 내용</div>
						<div class="dropdown-content report-content"></div>
					</div>
				</div>

				<script>
				 $(document).ready(function() {
				        var modal = document.getElementById("blacklistModal");
				        const modalCloseButton = document.querySelector('.modal-close');

				        /* 모달 닫기 */
				        $('.modal-close').on('click', function() {
				        	$(this).closest('.modal').css('display', 'none');
				        });
				    	//모달 외 영역 클릭 닫기
				        window.onclick = function(event) {
				            if (event.target == modal) {
				                modal.style.display = "none";
				            }
				        };
				        
				        $(".black_list_display_mem").click(function(e) {
				            if (!$(e.target).hasClass('btn_add')) { // 해제하기 버튼 눌렀을 때 모달 뜨지 않도록 함 
				                var $this = $(this);
				                
				                // 프로필 이미지 업데이트
				                $(".profile-image").html('<img src="image?file=' + $this.attr('data-seller-image') + '" alt="Profile Image">');
				                
				                // 사용자 정보 업데이트
				                $(".profile-info .user-name").text($this.attr('data-blackperson'));
				                $(".profile-info .user-email").text($this.attr('data-email'));
				                
				                // 거래 정보 업데이트
				        
				                $(".modal-transaction-num").append($this.attr('data-transaction-num'));
				                $(".modal-transaction-date").text($this.attr('data-transaction-date'));
				                
				                // 신고 제목과 내용 업데이트
				                $(".dropdown-content.report-title").text($this.attr('data-title'));
				                $(".dropdown-content.report-content").html('<p>' + $this.attr('data-content') + '</p>');
				                
				               
				                modal.style.display = "block";
				            }
				        });

				        $(".unblock_btn").click(function(e) {
				            e.stopPropagation();
				            var blackPerson = $(this).attr('data-blackperson');
				            var blackNum = $('.black_list_display_mem').data('blacknum');
				            console.log(blackNum);
				            if(confirm(blackPerson + "님을 차단 해제하시겠습니까?")) {
				                $.ajax({
				                    url: 'buyPersonDeleteSellerBlack',
				                    type: 'POST',
				                    data: {blackNum: blackNum},
				                    success: function(result) {
				                        if(result.success) {
				                            alert(blackPerson + "님의 차단이 해제되었습니다.");
				                            location.reload();
				                        } else {
				                            alert("차단 해제에 실패했습니다. 다시 시도해주세요.");
				                        }
				                    },
				                    error: function() {
				                        alert("서버 오류가 발생했습니다. 나중에 다시 시도해주세요.");
				                    }
				                });
				            }
				        });

					
				    });
    </script>
	<!-- Modal End-->
	
			</div>
		</div>
	</div>

	
</body>
</html>