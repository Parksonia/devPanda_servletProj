<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PersonBlack</title>
<!-- 개인,기업|구매내역조회|판매자차단내역| -->
<link href="${pageContext.request.contextPath}/css/sellerBlack.css"	rel="stylesheet">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
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
	color: inherit;
}

/*sort head start*/
.bk_head {
	align-items: center;
	border-bottom: 1px solid #ebebeb;
	display: flex;
	padding: 12px;
}

.head_totalcnt {
	display: flex;
}

.total-rows {
	color: rgba(34, 34, 34, .8);
	font-size: 13px;
	letter-spacing: -.07px;
}

.head_sort {
	justify-content: space-between;
	align-items: center;
	display: flex;
	margin-left: auto;
	text-align: right;
}

.head_sort .sorting_box {
	margin-left: 0px;
	width: 150px; /* 너비를 줄여 균형 있게 만듦 */
}

.head_sort .sorting_box.active_first {
	font-weight: 700;
}

.bid.finished .head_sort .sorting_box.field_date_transaiont {
	display: block;
}

.bid.finished .head_sort .sorting_box.field_reported_at {
	display: block;
}

.head_sort .sort_link {
	display: inline-block;
	font-size: 13px;
	letter-spacing: -.07px;
	line-height: 24px;
	padding-right: 16px;
	position: relative;
}

.head_sort .sort_link:after {
	background-image: url("./img/expand-up-down-fill.png");
	content: "";
	height: 24px;
	position: absolute;
	top: 0;
	width: 24px;
}

.head_sort .sort_txt {
	display: inline-block;
	vertical-align: top;
}
/*sort head end*/

/*list start */
li, ol, ul {
	list-style: none;
}

.black_list_display_mem {
	align-items: center;
	border-bottom: 1px solid #ebebeb;
	cursor: pointer;
	display: flex;
	padding: 12px;
}

.black_list_mem {
	display: flex;
	align-items: center;
	width: 100%; /* 전체 너비로 정렬 */
}

.black_list_mem .list_item_img_wrap {
	position: relative;
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
	width: 60%; /* 아이템 제목 칸 너비 조정 */
}

.black_list_mem .list_item_title_wrap .list_itme_div_user {
	color: #ebebeb;
	font-size: 16px;
	letter-spacing: -.27px;
	line-height: 1.2222222222;
	white-space: nowrap; /* 한 줄로 표시 */
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
	line-height: 19px;
	margin-top: 4px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.list_item_status {
	display: flex;
	justify-content: space-between; /* 각 항목을 양 끝으로 배치 */
	width: 70%; /* 나머지 공간 차지 */
	align-items: center;
	text-align: right;
}

.list_item_status .list_item_column {
	width: 150px; /* 날짜 너비 조정 */
	text-align: center;
}

.list_item_status .column_secondary {
	font-size: 13px;
	letter-spacing: -.07px;
}

.list_item_status .column_last {
	width: 100px; /* 버튼 위치 고정 */
	display: flex;
	justify-content: flex-end;
}

.list_item_status .column_last .btn {
	font-size: 12px;
	border-radius: 10px;
	height: 34px;
	line-height: 32px;
	padding: 0 14px;
	background-color: #222;
	color: #fff;
	font-weight: 700;
}
/*list end  */

/*pagination  */
.pagination {
	padding: 28px 0;
}

.pagination_box {
	font-size: 0;
	position: relative;
	text-align: center;
}

.pagination_box.first .prev_btn_box, .pagination_box.last .next_btn_box {
	display: none;
}

.page_bind {
	display: inline-block;
	vertical-align: top;
}

.btn_page {
	color: rgba(34, 34, 34, .5);
	display: inline-block;
	font-size: 16px;
	padding: 0 8px;
}

.btn_page+.btn_page {
	margin-left: 12px;
}

.btn_page:hover {
	-webkit-text-decoration: underline;
	text-decoration: underline;
}

.btn_page.active {
	color: #222;
	font-weight: 700;
}

.next_btn_box, .prev_btn_box {
	display: inline-block;
	vertical-align: top;
}

.next_btn_box .btn_arr, .prev_btn_box .btn_arr {
	height: 24px;
	padding: 3px;
	width: 24px;
}

.next_btn_box .btn_arr+.btn_arr, .prev_btn_box .btn_arr+.btn_arr {
	margin-left: 5px;
}

.prev_btn_box {
	margin-right: 25px;
}

.next_btn_box {
	margin-left: 25px;
}

[class*=arr-page-] {
	height: 22px;
	width: 18px;
}
/*pagination end */

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

.modal-transaction-info .modal-transaction-id, .modal-transaction-info .modal-transaction-date {
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

</head>

<body>

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

				<div class="blacklist_list finished bid">
					<div class="bk_head">
						<div class="head_totalcnt">
							<div class="total-rows">전체 </div>
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

					<c:forEach items="${personSellerBlackList }" var="blacklist" varStatus="status">
						<c:choose>
							<c:when test="${personSellerBlackList.size() == 0}">
								<h3>블랙리스트 목록이 없습니다.</h3>
							</c:when>
							<c:otherwise>
								<div class="modal_btn">
										<div class="black_list_display_mem" data-index="${status.index }"
																			 data-blacknum="${blacklist.blackNum}"
																		     data-personimage="${blacklist.personImage}"
																		     data-blackcom="${blacklist.blackCom}"
																		     data-blackperson="${blacklist.blackPerson}"
																		     data-email="${blacklist.email}"
																		     data-title="${blacklist.title}"
																		     data-content="${blacklist.content}"
																		     data-date="${blacklist.date}"
																		     data-reportdate="${blacklist.reportDate}"
																		     data-bidnum="${blacklist.bidNum}">
											<div class="black_list_mem">
												<div class="list_item_img_wrap">
													<img src="image?file=${blacklist.personImage }"	alt="seller_image" class="mem_image">
												</div>
												<div class="list_item_title_wrap">
													<c:choose>
														<c:when test="${blacklist.blackCom != null }">
															<p class="list_itme_div_user">[기업회원]</p>
															<p class="list_item_title">${blacklist.blackCom }</p>
														</c:when>
														<c:when test="${blacklist.blackPerson != null }">
															<p class="list_itme_div_user">[개인회원]</p>
															<p class="list_item_title">${blacklist.blackPerson }</p>
														</c:when>
														<c:otherwise>
															<p class="list_itme_div_user">[회원정보없음]</p>
														</c:otherwise>
													</c:choose>
													<p class="list_item_description">
														<span>${blacklist.title }</span>
													</p>
												</div>
											</div>

											<div class="list_item_status">
												<div class="list_item_column column_secondary">
													<p class="text-lookup secondary_title display_paragraph"
														style="color: rgb(34, 34, 34);">${blacklist.date }</p>
												</div>
												<div class="list_item_column column_secondary">
													<p class="text-lookup secondary_title display_paragraph"
														style="color: rgb(34, 34, 34);">${blacklist.reportDate }</p>
												</div>
												<div class="list_item_column column_last">
													<button class="btn btn_add" type="button" data-index="${status.index}" data-blacknum="${blacklist.blackNum}">해제하기</button>
												</div>
											</div>
										</div>	
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!--pagination start -->
					<div class="pagination">
					    <div class="pagination_box">
					        <!-- 이전 버튼 -->
					        <c:if test="${currentPage > 1}">
					            <div class="prev_btn_box">
					                <a href="?page=${currentPage - 1}" class="btn_arr"> 
					                    <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-prev icon sprite-icons">
					                        <use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev"
					                             xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev"></use>
					                    </svg>
					                </a>
					            </div>
					        </c:if>
					
					        <!-- 페이지 번호 -->
					        <div class="page_bind">
					            <c:forEach begin="1" end="${totalPages}" var="i">
					                <a href="?page=${i}" class="btn_page <c:if test='${i == currentPage}'>active</c:if>">
					                    ${i}
					                </a>
					            </c:forEach>
					        </div>
					
					        <!-- 다음 버튼 -->
					        <c:if test="${currentPage < totalPages}">
					            <div class="next_btn_box">
					                <a href="?page=${currentPage + 1}" class="btn_arr">
					                    <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-next icon sprite-icons">
					                        <use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next"
					                             xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next"></use>
					                    </svg>
					                </a>
					            </div>
					        </c:if>
					    </div>
					</div>
					<!--pagination end -->
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세내역 Modal -->
	<div class="modal" id="common-modal">
		<div class="modal-container">
			<a href="#" class="modal-close">&times;</a>
			<div class="modal-header">차단 상세 내역</div>
			<div class="black-num"></div>

			<div class="profile-section">
				<div class="profile-image"><img src="" alt="seller_image"  class="mem_image" id="modal-person-image"></div>
				<div class="profile-info">
					<div class="user-type" id="modal-user-type"></div>
					<div class="user-name" id="modal-user-name"></div>
					<div class="user-email" id="modal-email"></div>
				</div>
			</div>

			<div class="modal-divider"></div>
			<div class="modal-transaction-info">
				<div>거래 내역</div>
				<div>거래 일자</div>
			</div>
			<div class="modal-transaction-info">
				<div class="modal-transaction-id" id="modal-bidnum">AB123-CD5678</div>
				<div class="modal-transaction-date" id="modal-date"></div>
			</div>


			<div class="modal-divider"></div>
			<div class="dropdown-content" id="modal-title">신고 제목</div>
			<div class="dropdown-content"></div>
			<div class="section-title">신고 내용</div>
			<div class="dropdown-content" id="modal-content"></div>
		</div>
	</div>
	<!-- Modal End-->
<script>
$(document).ready(function() {
	/* 리스트 항목 클릭 시 모달 열기 */
    $('.black_list_display_mem').on('click', function(e) {
    	const personImage = $(this).data('personimage');
        const blackCom = $(this).data('blackcom');
        const blackPerson = $(this).data('blackperson');
        const email = $(this).data('email');
        const title = $(this).data('title');
        const content = $(this).data('content');
        const bidNum = $(this).data('bidnum'); 
        const date = $(this).data('date'); 
        
    	 // 모달에 데이터 삽입
        $('#modal-person-image').attr('src', 'image?file=' + personImage);
        $('#modal-user-type').text(blackCom ? '[기업회원]' : '[개인회원]');
        $('#modal-user-name').text(blackCom ? blackCom : blackPerson);
        $('#modal-email').text(email);
        $('#modal-title').text(title);
        $('#modal-content').text(content);
        $('#modal-bidnum').text('AB123-CD5678-' + bidNum);
        $('#modal-date').text(date);
        
     	// 모달 열기
        $('#common-modal').css('display', 'flex');
    });

    /* 모달 닫기 */
    $('.modal-close').on('click', function() {
    	$(this).closest('.modal').css('display', 'none');
    });
    
    /* 모달 바깥 영역 클릭 시 닫기 */
    $(window).on('click', function(event) {
        if ($(event.target).is('#common-modal')) {
            $('#common-modal').css('display', 'none');
        }
    });

    /* 해제하기 버튼 */
    $('.btn.btn_add').on('click', function(e) {
        e.stopPropagation(); // 해제하기 버튼 클릭 시 모달 열림 방지
        const blackNum = $(this).closest('.black_list_display_mem').find('.black-num').text();

        if (confirm('차단 해제하시겠습니까?')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/deleteBlacklist', // 서블릿 URL
                type: 'POST',
                data: { blackNum: blackNum },
                success: function(response) {
                    alert('차단이 해제되었습니다.');
                    location.reload(); // 성공 시 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    alert('차단 해제에 실패했습니다.');
                    console.error(error);
                }
            });
        }
    });
});
</script>

</body>
</html>