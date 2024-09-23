package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Company;
import dto.Person;
import service.BuyerBlackListService;
import service.BuyerBlackListServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class BlackListAboutSeller
 */
@WebServlet("/BlackListAboutSeller")
public class BuyPersonSellerBlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyPersonSellerBlackList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if(paramPage !=null) {
			page = Integer.parseInt(paramPage);
		}
		
		String id = "abc001";
		// 세션에서 사용자 ID가져와 사용 예정 
		HttpSession session = request.getSession();
		if (session == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
			dispatcher.forward(request, response);
		}
//		String id = (String) session.getAttribute("userId"); 
		String userType = (String)session.getAttribute("userType");
		if(userType.equals("person")) {
			id = ((Person)session.getAttribute("person")).getId();
		} else {
			id = ((Company)session.getAttribute("company")).getId();
		}
		
		
		//person 이 roleType "B" 일 때, 블랙리스트를 출력 
		
		try {
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurPage(page);
		
		
		//서비스 통합이 필요할 듯하여 따로 만들지 않고 해당 서비스에 메서드 생성  (blackList서비스로 통합)
		BuyerBlackListService service = new BuyerBlackListServiceImpl();
		List<Map> sellerBlackList = new ArrayList<>();
		sellerBlackList = service.buyerPersonSellerBlackList(id, pageInfo);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("sellerBlackList", sellerBlackList);
		request.getRequestDispatcher("/view/buyer/buyerPersonSellerBlackList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
