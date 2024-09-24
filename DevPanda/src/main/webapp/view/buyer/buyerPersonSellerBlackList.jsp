<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PersonBlack</title>
<!-- 개인|구매내역조회|판매자차단내역| -->
<style>
.container.my .content_area {
	min-height: 380px;
	overflow: hidden;
}

.content_area {
	overflow: hidden;
}

.my-page-content {
	flex: 1;
}

.my_blacklist {
	padding: 0 24px 80px;
}

.content_title {
	display: flex;
}

.content_title.border {
	border-bottom: 3px solid #222;
	padding-bottom: 16px;
}

.title {
	font-size: 24px;
	letter-spacing: -.36px
}

.title>h3, h2 {
	font-size: inherit;
	line-height: 29px
}

/*블랙리스트 목록 시작 */
a {
	-webkit-tap-highlight-color: rgba(0, 0, 0, .1);
	color: inherit
}

/*sort head start*/
.bk_head {
	align-items: center;
	border-bottom: 1px solid #ebebeb;
	display: flex;
	padding: 12px
}

.head_totalcnt {
	display: flex
}

.total-rows {
	color: rgba(34, 34, 34, .8);
	font-size: 13px;
	letter-spacing: -.07px
}

.head_sort {
	align-items: center;
	display: flex;
	margin-left: auto;
	text-align: right
}

.head_sort .sorting_box {
	margin-left: 20px;
	width: 184px;
}

.head_sort .sorting_box.active_first {
	font-weight: 700
}

.bid.finished .head_sort .sorting_box.field_date_transaiont {
	display: block
}

.bid.finished .head_sort .sorting_box.field_reported_at {
	display: block
}

.head_sort .sort_link {
	display: inline-block;
	font-size: 13px;
	letter-spacing: -.07px;
	line-height: 24px;
	padding-right: 16 px;
	position: relative;
}

.head_sort .sort_link:after {
	/*:after속성은 링크나 다른요소 뒤에 바로 붙을 수 있게함?  */
	background-image: url("./img/expand-up-down-fill.png");
	content: "";
	height: 24px;
	position: absolute;
	/* right: -4px; */
	top: 0;
	width: 24px;
}

.head_sort .sort_txt {
	display: inline-block;
	vertical-align: top
}
/*sort head end*/

/*list start */
li, ol, ul {
	list-style: none
}

.black_list_display_mem {
	align-items: center;
	border-bottom: 1px solid #ebebeb;
	cursor: pointer;
	display: flex;
	padding: 12px;
}

.black_list_mem {
	display: flex
}

.black_list_mem .list_item_img_wrap {
	position: relative
}

.black_list_mem .list_item_img_wrap .mem_image {
	border-radius: 12px;
	height: 80px;
	-o-object-fit: cover;
	object-fit: cover;
	width: 80px;
}

.black_list_mem .list_item_title_wrap {
	align-self: center;
	display: flex;
	flex-direction: column;
	margin-left: 16px;
	width: 100%;
}

.black_list_mem .list_item_title_wrap .list_itme_div_user {
	color: #ebebeb;
	font-size: 16px;
	letter-spacing: -.27px;
	line-height: 1.2222222222
}

.black_list_mem .list_item_title_wrap .list_item_title {
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	display: -webkit-box;
	font-size: 14px;
	font-weight: 700;
	line-height: 17px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.black_list_mem .list_item_title_wrap .list_item_description {
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	color: #0c0c0c7d;
	display: -webkit-box;
	font-size: 13px;
	letter-spacing: -.21px;
	letter-spacing: -.5px;
	line-height: 19px;
	margin-top: 4px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.no-items-message {
	text-align: center;
	padding: 50px 0;
	font-size: 18px;
	color: #888;
}

.list_item_status {
	align-items: center;
	display: flex;
	margin-left: auto;
	text-align: right
}

.list_item_status .list_item_column {
	margin-left: 10px;
	width: 184px;
}

.list_item_status .column_secondary {
	font-size: 13px;
	letter-spacing: -.07px
}

.list_item_status .column_last {
	align-self: center;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	flex-shrink: 0;
	margin-left: auto;
}

.list_item_status .column_last .btn {
	align-items: center;
	display: flex;
	font-size: 14px;
	letter-spacing: -.21px;
	margin-right: -6px;
	padding: 0 6px
}

.list_item_status .column_last .btn.btn_add {
	/* border: 1px solid #222; */
	border-radius: 10px;
	font-size: 12px;
	height: 34px;
	letter-spacing: -.06px;
	line-height: 32px;
	margin-right: 0;
	padding: 0 14px;
	background-color: #222;
	color: #fff;
	font-weight: 700;
}

/*list end  */

/*pagination  */
.pagination {
	padding: 28px 0
}

.pagination_box {
	font-size: 0;
	position: relative;
	text-align: center
}

.pagination_box.first .prev_btn_box, .pagination_box.last .next_btn_box
	{
	display: none
}

.page_bind {
	display: inline-block;
	vertical-align: top
}

.btn_page {
	color: rgba(34, 34, 34, .5);
	display: inline-block;
	font-size: 16px;
	padding: 0 8px
}

.btn_page+.btn_page {
	margin-left: 12px
}

.btn_page:hover {
	-webkit-text-decoration: underline;
	text-decoration: underline
}

.btn_page.active {
	color: #222;
	font-weight: 700
}

.next_btn_box, .prev_btn_box {
	display: inline-block;
	vertical-align: top
}

.next_btn_box .btn_arr, .prev_btn_box .btn_arr {
	height: 24px;
	padding: 3px;
	width: 24px
}

.next_btn_box .btn_arr+.btn_arr, .prev_btn_box .btn_arr+.btn_arr {
	margin-left: 5px
}

.prev_btn_box {
	margin-right: 25px
}

.next_btn_box {
	margin-left: 25px
}

[class*=arr-page-] {
	height: 22px;
	width: 18px
}
/*pagination end */

/* modal start */
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-container {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
	border-radius: 20px;
	position: relative;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	font-weight: 700;
	font-size: 32px;
	color: #000000;
	text-align: center;
	margin-bottom: 40px;
}

.profile-section {
	display: flex;
	align-items: center;
	margin-bottom: 40px;
}

.profile-image {
	width: 80px;
	height: 80px;
	border-radius: 10px;
	background-size: cover;
	margin-right: 20px;
}

.profile-image img {
	width: 80px;
	height: 80px;
	border-radius: 10px;
	object-fit: cover;
}

.profile-info .user-type {
	font-weight: 600;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.27);
}

.profile-info .user-name {
	font-weight: 600;
	font-size: 18px;
	color: #000000;
}

.profile-info .user-email {
	font-weight: 400;
	font-size: 14px;
	color: rgba(34, 34, 34, 0.5);
}

.modal-divider {
	width: 100%;
	height: 1px;
	background: #D9D9D9;
	margin: 20px 0;
}

.modal-transaction-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.modal-transaction-info div {
	font-weight: 600;
	font-size: 18px;
	color: #D3D3D3;
}

.modal-transaction-info .modal-transaction-id, .modal-transaction-info  .modal-transaction-date
	{
	font-weight: 400;
	font-size: 18px;
	color: #000000;
}

.modal-report-title {
	font-weight: 600;
	font-size: 23px;
	color: #000000;
	margin-bottom: 20px;
}

.section-title {
	font-weight: 600;
	font-size: 18px;
	color: #000000;
	margin-bottom: 10px;
}

.dropdown-content {
	background: #FAFAFA;
	border: 1px solid #EBEBEB;
	border-radius: 20px;
	padding: 20px;
	margin-bottom: 20px;
}

.dropdown-content p {
	margin: 0;
	font-weight: 400;
	font-size: 16px;
	color: #000000;
}
/* modal end */
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

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
										<p class="list_item_title">${item.blackPerson}</p>
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
		
						 <span class="close">&times;</span>	
						
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
							<div class="modal-transaction-id"></div>
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
				        var span = document.getElementsByClassName("close")[0];

				        $(".black_list_display_mem").click(function(e) {
				            if (!$(e.target).hasClass('btn_add')) { // 해제하기 버튼 눌렀을 때 모달 뜨지 않도록 함 
				                var $this = $(this);
				                
				                // 프로필 이미지 업데이트
				                $(".profile-image").html('<img src="image?file=' + $this.attr('data-seller-image') + '" alt="Profile Image">');
				                
				                // 사용자 정보 업데이트
				                $(".profile-info .user-name").text($this.attr('data-blackperson'));
				                $(".profile-info .user-email").text($this.attr('data-email'));
				                
				                // 거래 정보 업데이트
				                $(".modal-transaction-id").text($this.attr('data-transaction-num'));
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

				        span.onclick = function() {
				            modal.style.display = "none";
				        };

				        window.onclick = function(event) {
				            if (event.target == modal) {
				                modal.style.display = "none";
				            }
				        };
				    });
    </script>
	<!-- Modal End-->
			</div>
		</div>
	</div>
</body>
</html>