/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.91
 * Generated at: 2024-09-08 11:38:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.view.seller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class personAuctionSellerSuc_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/view/inc/header.jsp", Long.valueOf(1725504021918L));
    _jspx_dependants.put("/view/inc/personSideNav.jsp", Long.valueOf(1725504021920L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<!-- 개인|판매내역조회|낙찰내역조회|거래성공 |상세보기 -->\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/details.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/personAuctionSellerSuc.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- Header Start -->\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>DEVPanda|개발자 거래플랫폼</title>\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("    font-family: \"Nanum Gothic\", sans-serif;\r\n");
      out.write("    font-weight: 400;\r\n");
      out.write("    font-style: normal;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header {\r\n");
      out.write("    width: 100%;\r\n");
      out.write("    background-color: #FFFEF7;\r\n");
      out.write("    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);\r\n");
      out.write("    position: fixed;\r\n");
      out.write("    z-index: 100;\r\n");
      out.write("    display: flex;\r\n");
      out.write("    justify-content: space-between;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("    padding: 0 40px;\r\n");
      out.write("    height: 150px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_logo {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("    height: 100%;\r\n");
      out.write("}\r\n");
      out.write(".header_logo >span {\r\n");
      out.write("	font-size: 24px;\r\n");
      out.write("	font-weight:bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_logo img {\r\n");
      out.write("    max-height: 100px;\r\n");
      out.write("    height: auto;\r\n");
      out.write("    object-fit: contain;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_content {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    height: 100%;\r\n");
      out.write("    margin-right: 100px;\r\n");
      out.write("    align-content: flex-end;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_top {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    padding-top: 8px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_top .top_list {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("    list-style-type: none;\r\n");
      out.write("    margin: 0;\r\n");
      out.write("    padding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_top .top_item + .top_item {\r\n");
      out.write("    margin-left: 24px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_top .top_link {\r\n");
      out.write("    color: rgba(34, 34, 34, .8);\r\n");
      out.write("    font-size: 12px;\r\n");
      out.write("    letter-spacing: -.06px;\r\n");
      out.write("    text-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* .header_main {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    justify-content: space-between;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("}\r\n");
      out.write(" */\r\n");
      out.write("/* .header_main .gnb_area {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("} */\r\n");
      out.write("\r\n");
      out.write(".header_main .gnb_list {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    list-style-type: none;\r\n");
      out.write("    margin: 0;\r\n");
      out.write("    margin-top: 30px;\r\n");
      out.write("    padding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_main .gnb_item + .gnb_item {\r\n");
      out.write("    margin-left: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header_main .gnb_link {\r\n");
      out.write("    font-size: 20px;\r\n");
      out.write("    font-weight: bold;\r\n");
      out.write("    color: black;\r\n");
      out.write("    text-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"header\">\r\n");
      out.write("        <div class=\"header_logo\">\r\n");
      out.write("            <a href=\"main.jsp\"><img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/img/logoS.png\" alt=\"DevPanda Logo\"></a>\r\n");
      out.write("        	<span>DevPanda</span>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"header_content\">\r\n");
      out.write("    <!--         <div class=\"header_top\">\r\n");
      out.write("                <ul class=\"top_list\">\r\n");
      out.write("                    <li class=\"top_item\"><a class=\"top_link\" href=\"./personInfo.jsp\">마이페이지</a></li>\r\n");
      out.write("                    <li class=\"top_item\"><a class=\"top_link\" href=\"#notifications\">알림</a></li>\r\n");
      out.write("                    <li class=\"top_item\"><a class=\"top_link\" href=\"/\">로그아웃</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div> -->\r\n");
      out.write("\r\n");
      out.write("            <div class=\"header_main\">\r\n");
      out.write("                <div class=\"gnb_area\">\r\n");
      out.write("                    <nav class=\"gnb\" id=\"pcGnbContainer\">\r\n");
      out.write("                        <ul class=\"gnb_list\" id=\"pcGnbList\">\r\n");
      out.write("                            <li class=\"gnb_item\"><a class=\"gnb_link\" href=\"main.jsp\">AUCTION</a></li>\r\n");
      out.write("                            <li class=\"gnb_item\"><a class=\"gnb_link\" href=\"personInfo.jsp\">MYPAGE</a></li>\r\n");
      out.write("                            <li class=\"gnb_item\"><a class=\"gnb_link\" href=\"personInfo.jsp\">LOGOUT</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </nav>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("	<!-- Header End-->\r\n");
      out.write("\r\n");
      out.write("	<!-- side+contents container -->\r\n");
      out.write("	<div class=\"container my\">\r\n");
      out.write("\r\n");
      out.write("		<!-- Side Navigation -->\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>DEVPanda|개발자 거래플랫폼</title>\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write(" button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1,\r\n");
      out.write("	h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td,\r\n");
      out.write("	textarea, th, ul {\r\n");
      out.write("	margin: 0;\r\n");
      out.write("	padding: 0;\r\n");
      out.write("	font-family: \"Nanum Gothic\", sans-serif;\r\n");
      out.write("	font-style: normal;\r\n");
      out.write("	color:#222;\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("}\r\n");
      out.write("a,a:active,a:focus,a:hover {\r\n");
      out.write("    -webkit-text-decoration: none;\r\n");
      out.write("    text-decoration: none\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/* 꽉 채워서*/\r\n");
      out.write("/* .container.my {\r\n");
      out.write("	display: flex;\r\n");
      out.write("	margin-left: auto;\r\n");
      out.write("	margin-right: auto;\r\n");
      out.write("	padding: 40px 40px 160px 5px; \r\n");
      out.write("	border-bottom: 0;\r\n");
      out.write("}  \r\n");
      out.write("*/\r\n");
      out.write("/*중앙에배치*/\r\n");
      out.write(" .container.my{\r\n");
      out.write("    display: flex;\r\n");
      out.write("    margin-left: auto;\r\n");
      out.write("    margin-right: auto;\r\n");
      out.write("    max-width: 1280px;\r\n");
      out.write("    padding: 200px 40px 160px;\r\n");
      out.write("    \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".container.my .snb_area {\r\n");
      out.write("	margin-right: 40px;\r\n");
      out.write("	width: 180px;\r\n");
      out.write("	height:90%;\r\n");
      out.write("	/* background-color: #f9f9f9; */\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".container.my .snb_main_title {\r\n");
      out.write("	font-size: 24px;\r\n");
      out.write("	font-weight: 700;\r\n");
      out.write("	letter-spacing: -.36px;\r\n");
      out.write("	letter-spacing: -.15px;\r\n");
      out.write("	line-height: 29px;\r\n");
      out.write("	padding-bottom: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".snb_title {\r\n");
      out.write("	display: flex;\r\n");
      out.write("	font-size: 18px;\r\n");
      out.write("	font-weight: 700;\r\n");
      out.write("	letter-spacing: -.27px;\r\n");
      out.write("	line-height: 22px;\r\n");
      out.write("	margin-bottom: 12px;\r\n");
      out.write("	vertical-align: top;\r\n");
      out.write("	align-items: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".cart_icon {\r\n");
      out.write("	margin-right: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".snb_area+div {\r\n");
      out.write("	flex: 1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".menu_item {\r\n");
      out.write("	list-style-type: none;\r\n");
      out.write("	padding: 3px 0px 3px 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".menu_item:hover {\r\n");
      out.write("    background-color: #f0f0f0; \r\n");
      out.write("    transition: background-color 0.3s ease;\r\n");
      out.write("    border-radius: 8px;\r\n");
      out.write("} /*수정한 부분*/ \r\n");
      out.write("\r\n");
      out.write(".menu_link {\r\n");
      out.write("	color: black;\r\n");
      out.write("	font-size: 13px;\r\n");
      out.write("	letter-spacing: -.15px;\r\n");
      out.write("	line-height: 18px\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".snb_list+.snb_list {\r\n");
      out.write("	margin-top: 40px\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"snb_area\">\r\n");
      out.write("		<h2 class=\"snb_main_title\">마이 페이지</h2>\r\n");
      out.write("		<nav class=\"snb\">\r\n");
      out.write("			<div class=\"snb_list\">\r\n");
      out.write("				<strong class=\"snb_title\"> <svg class=\"cart_icon\" xmlns=\"http://www.w3.org/2000/svg\" height=\"21px\" viewBox=\"0 -960 960 960\" width=\"21px\" fill=\"#5f6368\">\r\n");
      out.write("							<path d=\"M280-80q-33 0-56.5-23.5T200-160q0-33 23.5-56.5T280-240q33 0 56.5 23.5T360-160q0 33-23.5 56.5T280-80Zm400 0q-33 0-56.5-23.5T600-160q0-33 23.5-56.5T680-240q33 0 56.5 23.5T760-160q0 33-23.5 56.5T680-80ZM246-720l96 200h280l110-200H246Zm-38-80h590q23 0 35 20.5t1 41.5L692-482q-11 20-29.5 31T622-440H324l-44 80h480v80H280q-45 0-68-39.5t-2-78.5l54-98-144-304H40v-80h130l38 80Zm134 280h280-280Z\" /></svg> 구매내역조회\r\n");
      out.write("				</strong>\r\n");
      out.write("				<ul class=\"snb_menu\">\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"../buyer/pNcBuyBidList.jsp\" class=\"menu_link\">입찰내역조회</a></li>\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"../buyer/personBuyTransationList.jsp\" class=\"menu_link\">낙찰내역조회</a></li>\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"../buyer/sellerBlack.jsp\" class=\"menu_link\">판매자 차단 내역</a></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"snb_list\">\r\n");
      out.write("				<strong class=\"snb_title\"><svg class=\"cart_icon\" xmlns=\"http://www.w3.org/2000/svg\" height=\"24px\" viewBox=\"0 -960 960 960\" width=\"24px\" fill=\"#5f6368\">\r\n");
      out.write("								<path d=\"M856-390 570-104q-12 12-27 18t-30 6q-15 0-30-6t-27-18L103-457q-11-11-17-25.5T80-513v-287q0-33 23.5-56.5T160-880h287q16 0 31 6.5t26 17.5l352 353q12 12 17.5 27t5.5 30q0 15-5.5 29.5T856-390ZM513-160l286-286-353-354H160v286l353 354ZM260-640q25 0 42.5-17.5T320-700q0-25-17.5-42.5T260-760q-25 0-42.5 17.5T200-700q0 25 17.5 42.5T260-640Zm220 160Z\" /></svg> 판매내역조회 </strong>\r\n");
      out.write("				<ul class=\"snb_menu\">\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"../seller/personSellAcutionList.jsp\" class=\"menu_link\">경매등록 내역조회</a></li>\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"../seller/personSellTransactionList.jsp\" class=\"menu_link\">낙찰내역조회</a></li>\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"../seller/buyerBlack.jsp\" class=\"menu_link\">구매자 차단 내역</a></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"snb_list\">\r\n");
      out.write("				<strong class=\"snb_title\"> <a> <svg class=\"cart_icon\" xmlns=\"http://www.w3.org/2000/svg\" height=\"24px\" viewBox=\"0 0 24 24\" width=\"24px\" fill=\"#5f6368\">\r\n");
      out.write("								<path d=\"M0 0h24v24H0z\" fill=\"none\" /> \r\n");
      out.write("								<path d=\"M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z\" /></svg>\r\n");
      out.write("				</a> 내정보\r\n");
      out.write("				</strong>\r\n");
      out.write("				<ul class=\"snb_menu\">\r\n");
      out.write("					<li class=\"menu_item\"><a href=\"./personInfo.jsp\" class=\"menu_link\">정보수정</a></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("		</nav>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<!-- Content Area -->\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("			<!-- Title -->\r\n");
      out.write("			<div class=\"title\">거래 상세 보기</div>\r\n");
      out.write("			<div class=\"transaction-id\">AB123-CD5678-90</div>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"user-info-container\">\r\n");
      out.write("				<div class=\"user-info\">\r\n");
      out.write("					<div class=\"user\">\r\n");
      out.write("						<img src=\"https://via.placeholder.com/80\" alt=\"User Icon\">\r\n");
      out.write("						<p class=\"user_type\">[개인회원]</p>\r\n");
      out.write("						<p class=\"bold\">김땡땡</p>\r\n");
      out.write("						<p class=\"title\">자바 백엔드 일자리 구합니다.</p>\r\n");
      out.write("						<div class=\"minmax\">\r\n");
      out.write("							<span class=\"bold\">희망 최소 연봉</span>\r\n");
      out.write("							<div>\r\n");
      out.write("								<span> 30만원</span>\r\n");
      out.write("								<!-- 수정된 금액 -->\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"minmax\">\r\n");
      out.write("							<span class=\"bold\">희망 최대 연봉</span>\r\n");
      out.write("							<div>\r\n");
      out.write("								<span> 3000만원</span>\r\n");
      out.write("								<!-- 수정된 금액 -->\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"filter_bind\">\r\n");
      out.write("							<div class=\"column\">\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>직무</dt>\r\n");
      out.write("									<dd>백엔드</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>경력</dt>\r\n");
      out.write("									<dd>신입</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>학력</dt>\r\n");
      out.write("									<dd>대졸</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"column\">\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>근무형태</dt>\r\n");
      out.write("									<dd>프리랜서</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>보유기술</dt>\r\n");
      out.write("									<dd>JAVA, SQL</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>자격증</dt>\r\n");
      out.write("									<dd>정보처리기사</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("								<dl>\r\n");
      out.write("									<dt>근무지역</dt>\r\n");
      out.write("									<dd>서울, 경기, 인천</dd>\r\n");
      out.write("								</dl>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<!-- Profile Section -->\r\n");
      out.write("			<div class=\"profile-container\">\r\n");
      out.write("				<h2>프로필</h2>\r\n");
      out.write("				<h	r class=\"gray-line\">\r\n");
      out.write("				<div style=\"display: flex; justify-content: space-between;\">\r\n");
      out.write("					<!-- 첫 번째 프로필 -->\r\n");
      out.write("					<div class=\"profile\">\r\n");
      out.write("						<img src=\"https://via.placeholder.com/80\" alt=\"User Icon\">\r\n");
      out.write("						<p style=\"color: #888; font-weight: bold;\">[개인회원]</p>\r\n");
      out.write("						<p style=\"font-weight: bold;\">구매자이름</p>\r\n");
      out.write("						<p>아이디: kgvrfah2</p>\r\n");
      out.write("						<p>이메일: kgvrfah2@naver.com</p>\r\n");
      out.write("						<p>휴대폰 번호: 010-1111-1111</p>\r\n");
      out.write("						<p>주소: 서울특별시 금천구 독산동</p>\r\n");
      out.write("						<button class=\"report-button\">블랙리스트 등록</button>\r\n");
      out.write("					</div>\r\n");
      out.write("					<!-- 두 번째 프로필 -->\r\n");
      out.write("					<div class=\"profile\">\r\n");
      out.write("						<img src=\"https://via.placeholder.com/80\" alt=\"User Icon\">\r\n");
      out.write("						<p style=\"color: #888; font-weight: bold;\">[개인회원]</p>\r\n");
      out.write("						<p style=\"font-weight: bold;\">판매자이름</p>\r\n");
      out.write("						<p>아이디: kgvrfah1</p>\r\n");
      out.write("						<p>이메일: kgvrfah1@naver.com</p>\r\n");
      out.write("						<p>휴대폰 번호: 010-1111-1111</p>\r\n");
      out.write("						<p>주소: 서울특별시 금천구 독산동</p>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<!-- Transaction Details -->\r\n");
      out.write("			<hr class=\"gray-line\">\r\n");
      out.write("			<div class=\"prices\">\r\n");
      out.write("				<div class=\"price_type\">\r\n");
      out.write("					<p>나의 판매 희망금액</p>\r\n");
      out.write("					<span class=\"bold\">1,000,000,000원</span>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"price_type\">\r\n");
      out.write("					<p>최종 낙찰 금액</p>\r\n");
      out.write("					<span class=\"final-bid\">900,000원</span>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"detail_bind\" style=\"background-color: rgb(250, 250, 250);\">\r\n");
      out.write("				<div class=\"detail_addition\">\r\n");
      out.write("					<div class=\"detail_title\">\r\n");
      out.write("						<span style=\"font-weight: bold;\">최종 거래일시</span>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"detail_text\">24/08/10</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"detail_addition\">\r\n");
      out.write("					<div class=\"detail_title\">\r\n");
      out.write("						<span>낙찰 유형</span>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"detail_text\">기간 종료</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			<!-- 	<div class=\"detail_addition\">\r\n");
      out.write("					<div class=\"detail_title\">\r\n");
      out.write("						<span>낙찰유형</span>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"detail_text\" style=\"color: red;\">성공</div>\r\n");
      out.write("				</div> -->\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<!-- Bid History -->\r\n");
      out.write("			<div class=\"bid-history\">\r\n");
      out.write("				<table>\r\n");
      out.write("					<thead>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<th class=\"table_th\">상태</th>\r\n");
      out.write("							<th class=\"table_th\">참여자</th>\r\n");
      out.write("							<th class=\"table_th align_right\">입찰가</th>\r\n");
      out.write("							<th class=\"table_th align_right\">입찰일</th>\r\n");
      out.write("						</tr>\r\n");
      out.write("					</thead>\r\n");
      out.write("					<tbody>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td class=\"table_td\"><span class=\"status\">입찰</span></td>\r\n");
      out.write("							<td class=\"table_td\">[기업회원] company1</td>\r\n");
      out.write("							<td class=\"table_td align_right\">700,000원</td>\r\n");
      out.write("							<td class=\"table_td align_right\">24/04/04</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td class=\"table_td\"><span class=\"status\">입찰</span></td>\r\n");
      out.write("							<td class=\"table_td\">[기업회원] company2</td>\r\n");
      out.write("							<td class=\"table_td align_right\">800,000원</td>\r\n");
      out.write("							<td class=\"table_td align_right\">24/04/04</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td class=\"table_td\"><span class=\"status\">입찰</span></td>\r\n");
      out.write("							<td class=\"table_td\">[기업회원] mycompany</td>\r\n");
      out.write("							<td class=\"table_td align_right\">880,000원</td>\r\n");
      out.write("							<td class=\"table_td align_right\">24/04/04</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr style=\"background-color: rgba(128, 128, 128, 0.2);\">\r\n");
      out.write("							<td class=\"table_td\"><span class=\"status final-bid\">낙찰</span></td>\r\n");
      out.write("							<td class=\"table_td final-bid\">[개인회원] company3</td>\r\n");
      out.write("							<td class=\"table_td align_right final-bid\">900,000원</td>\r\n");
      out.write("							<td class=\"table_td align_right final-bid\">24/04/05</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("					</tbody>\r\n");
      out.write("				</table>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"progress-container\" >\r\n");
      out.write("				<p  class=\"progress_title\">진행 상황</p>\r\n");
      out.write("				<div class=\"progress-bar-background\">\r\n");
      out.write("					<div class=\"progress-bar\"></div>\r\n");
      out.write("				</div>\r\n");
      out.write("				\r\n");
      out.write("				<div class=\"progress-status\">\r\n");
      out.write("					<span class=\"progress_item_title\">낙찰 완료</span> \r\n");
      out.write("					<div style=\"display:flex; flex-direction: column;\">\r\n");
      out.write("					<span class=\"progress_item_title\">계약서 검토중</span>\r\n");
      out.write("					<a href=\"#\" class=\"progress_item_description\">메일보내기</a>\r\n");
      out.write("					</div>\r\n");
      out.write("					<span class=\" progress_item_title completed\">계약서 전송 완료</span>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("   <!-- Modal  start-->\r\n");
      out.write("    <div class=\"modal\">\r\n");
      out.write("        <div class=\"modal-container\">\r\n");
      out.write("            <a href=\"#\" class=\"modal-close\">\r\n");
      out.write("                <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\r\n");
      out.write("                    <path d=\"M20.5 3.1L12 11.6 3.5 3.1 2.1 4.5l8.6 8.5-8.6 8.5 1.4 1.4 8.5-8.6 8.5 8.6 1.4-1.4-8.6-8.5 8.6-8.5z\"/>\r\n");
      out.write("                </svg>\r\n");
      out.write("            </a>\r\n");
      out.write("            <div class=\"modal-header\">신고하기</div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"modal-profile\">\r\n");
      out.write("                <div class=\"modal-profile-image\"></div>\r\n");
      out.write("                <div class=\"modal-profile-info\">\r\n");
      out.write("                    <div class=\"user-type\">[개인회원]</div>\r\n");
      out.write("                    <div class=\"user-id\">kgvrfah2</div>\r\n");
      out.write("                    <div class=\"user-email\">po****@naver.com</div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"modal-divider\"></div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"modal-transaction-info\">\r\n");
      out.write("                <div>거래 내역</div>\r\n");
      out.write("                <div>거래 일자</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"modal-transaction-info\">\r\n");
      out.write("                <div class=\"modal-transaction-id\">AB123-CD5678-90</div>\r\n");
      out.write("                <div class=\"modal-transaction-date\">24/04/05</div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"modal-divider\"></div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"modal-report-title\">신고 내용</div>\r\n");
      out.write("            \r\n");
      out.write("            <form>\r\n");
      out.write("                <input type=\"text\" class=\"modal-input-title\" placeholder=\"제목을 입력하세요\">\r\n");
      out.write("                <textarea class=\"modal-input-content\" style=\" min-height:350px;\" placeholder=\"신고 내용을 입력하세요\"></textarea>\r\n");
      out.write("                <button type=\"submit\" class=\"modal-submit-button\">제출하기</button>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        const modal = document.querySelector('.modal');\r\n");
      out.write("        const modalCloseButton = document.querySelector('.modal-close');\r\n");
      out.write("        const reportButton = document.querySelector('.report-button');\r\n");
      out.write("\r\n");
      out.write("        reportButton.addEventListener('click', function() {\r\n");
      out.write("            modal.style.display = 'flex';\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        modalCloseButton.addEventListener('click', function() {\r\n");
      out.write("            modal.style.display = 'none';\r\n");
      out.write("        });\r\n");
      out.write("    </script>\r\n");
      out.write("<!-- Modal  end-->\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
