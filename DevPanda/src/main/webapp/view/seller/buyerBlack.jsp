<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PersonBlack</title>
<!-- 개인,기업|판매내역조회|구매자차단내역| -->
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

.title>h3,h2 {
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
    background: url('./img/woman.jpg') no-repeat center center;
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

.modal-transaction-info .modal-transaction-id,.modal-transaction-info  .modal-transaction-date {
   
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
						<h2>구매자 차단 내역</h2>
					</div>
				</div>


				<!---->
				<div class="blacklist_list finished bid">

					<!--sort head start : 구매내역에서 가져옴-->
					<div class="bk_head">
						<div class="head_totalcnt">
							<div class="total-rows">전체 3</div>
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

					<div class="modal_btn">
						<div>
							<div class="black_list_display_mem" style="background-color: rgb(255, 255, 255);">

								<div class="black_list_mem">
									<div class="list_item_img_wrap">
										<img alt="mem_image" src="../img/woman.jpg" class="mem_image">

									</div>
									<div class="list_item_title_wrap">
										<!---->
										<p class="list_itme_div_user">[개인회원]</p>
										<p class="list_item_title">kimjava</p>
										<p class="list_item_description">
											<span>제일좋아하는것은김자바</span>
										</p>
									</div>
								</div>

								<div class="list_item_status">
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">24/08/15</p>
									</div>
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">24/08/15</p>
									</div>
									<div class="list_item_column column_last">
										<button class="btn btn_add" type="button">해제하기</button>
										<!-- 버튼에 해제 처리해야함  -->
									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="modal_btn">
						<div>
							<div class="black_list_display_mem" style="background-color: rgb(255, 255, 255);">

								<div class="black_list_mem">
									<div class="list_item_img_wrap">
										<img alt="mem_image" src="../img/woman.jpg" class="mem_image">

									</div>
									<div class="list_item_title_wrap">
										<!---->
										<p class="list_itme_div_user">[개인회원]</p>
										<p class="list_item_title">kimjava</p>
										<p class="list_item_description">
											<span>제일좋아하는것은김자바</span>
										</p>
									</div>
								</div>

								<div class="list_item_status">
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">24/08/15</p>
									</div>
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">24/08/15</p>
									</div>
									<div class="list_item_column column_last">
										<button class="btn btn_add" type="button">해제하기</button>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="modal_btn">
						<div>
							<div class="black_list_display_mem" style="background-color: rgb(255, 255, 255);">

								<div class="black_list_mem">
									<div class="list_item_img_wrap">
										<img alt="mem_image" src="../img/man.jpg" class="mem_image">

									</div>
									<div class="list_item_title_wrap">
										<!---->
										<p class="list_itme_div_user">[개인회원]</p>
										<p class="list_item_title">developer</p>
										<p class="list_item_description">
											<span>제일좋아하는것은김자바</span>
										</p>
									</div>
								</div>

								<div class="list_item_status">
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">24/08/15</p>
									</div>
									<div class="list_item_column column_secondary">
										<p class="text-lookup secondary_title display_paragraph" style="color: rgb(34, 34, 34);">24/08/15</p>
									</div>
									<div class="list_item_column column_last">
										<button class="btn btn_add" type="button">해제하기</button>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!---->

				<!--pagination start  -->
				<div class="pagination">
					<div class="pagination_box first last">
						<div class="prev_btn_box">
							<a href="#" class="btn_arr"> <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-first icon sprite-icons">
									<use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-first" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-first"></use>
									</svg>
							</a> <a href="#" class="btn_arr"> <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-prev icon sprite-icons">
								<use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-prev"></use>
								</svg>
							</a>
						</div>
						<div class="page_bind">
							<a href="#" class="btn_page active"> 1 </a>
						</div>
						<div class="next_btn_box">
							<a href="#" class="btn_arr"> <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-next icon sprite-icons">
									<use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-next"></use>
								</svg>
							</a> <a href="#" class="btn_arr"> <svg xmlns="http://www.w3.org/2000/svg" class="arr-page-last icon sprite-icons">
									<use href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-last" xlink:href="/_nuxt/902a7eb5512d7d4f25543902cfd1ccdc.svg#i-arr-page-last"></use>
								</svg>
							</a>
						</div>
					</div>
				</div>
				<!--pagination end  -->




				<!-- Modal -->
				<div class="modal">
					<div class="modal-container">
						<a href="#" class="modal-close"> <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M 20.496094 2.9921875 A 0.50005 0.50005 0 0 0 20.146484 3.1464844 L 12 11.292969 L 3.8535156 3.1464844 A 0.50005 0.50005 0 0 0 3.4941406 2.9941406 A 0.50005 0.50005 0 0 0 3.1464844 3.8535156 L 11.292969 12 L 3.1464844 20.146484 A 0.50005 0.50005 0 1 0 3.8535156 20.853516 L 12 12.707031 L 20.146484 20.853516 A 0.50005 0.50005 0 1 0 20.853516 20.146484 L 12.707031 12 L 20.853516 3.8535156 A 0.50005 0.50005 0 0 0 20.496094 2.9921875 z"></path>
                </svg>
						</a>
						<div class="modal-header">차단 상세 내역</div>

						<div class="profile-section">
							<div class="profile-image"></div>
							<div class="profile-info">
								<div class="user-type">[개인회원]</div>
								<div class="user-name">김자바</div>
								<div class="user-email">kimjava@gmail.com</div>
							</div>
						</div>

						<div class="modal-divider"></div>

						<div class="modal-transaction-info">
							<div>거래 내역</div>
							<div>거래 일자</div>
						</div>
						<div class="modal-transaction-info">
							<div class="modal-transaction-id">AB123-CD5678-90</div>
							<div class="modal-transaction-date">24/04/05</div>
						</div>


						<div class="modal-divider"></div>

						<div class="section-title">신고 제목</div>
						<div class="dropdown-content">갑질이 너무 심합니다.</div>

						<div class="section-title">신고 내용</div>
						<div class="dropdown-content">
							<p>처음 거래하는데</p>
							<p>다시는 거래하고 싶지 않네요</p>
						</div>
					</div>
				</div>

				<script>
        const modal = document.querySelector('.modal');
        const modalCloseButton = document.querySelector('.modal-close');
        const modalOpenButtons = document.querySelectorAll('.modal_btn');

        modalOpenButtons.forEach(button => {
            button.addEventListener('click', function() {
                modal.style.display = 'flex';
            });
        });

        modalCloseButton.addEventListener('click', function() {
            modal.style.display = 'none';
        });
    </script>
	<!-- Modal End-->
			</div>
		</div>
	</div>
</body>
</html>