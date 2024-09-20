package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Auction;
import dto.Bid;
import dto.Company;
import dto.Person;
import service.AuctionService;
import service.AuctionServiceImpl;
import service.BidService;
import service.BidServiceImpl;

/**
 * Servlet implementation class FailAuctionBuyer
 */
@WebServlet("/failAuctionBuyer")
public class FailAuctionBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FailAuctionBuyer() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer auctionNum =Integer.parseInt(request.getParameter("auctionNum"));
		String bidNum = request.getParameter("bidNum");
		String bidDate = request.getParameter("bidDate"); // 바로 화면에 전달
		Integer bidPrice = Integer.parseInt(request.getParameter("bidPrice")); // 바로 화면에 전달
		String sellerImage = request.getParameter("sellerImage"); // 바로 화면에 전달
	
		// 임의의 login in(P or C)
		//String id = "abc001";
		String id = "comp001";
		HttpSession session = request.getSession();
//		String userType="company";
		//String myId = "abc001";
		String userType = (String)session.getAttribute("userType");
		if(userType.equals("person")) {
			id = ((Person)session.getAttribute("person")).getId();
		} else {
			id = ((Company)session.getAttribute("company")).getId();
		}
		
		
		try {
			AuctionService aService = new AuctionServiceImpl();
			Auction auction  = aService.oneAuction(auctionNum);
	
			BidService bService = new BidServiceImpl();
			List<Bid> allbuyers = new ArrayList<>();
			allbuyers = bService.bidAllBuyer(auctionNum);
			
			
			request.setAttribute("auction", auction); //경매 정보
			request.setAttribute("allBuyers", allbuyers); ////해당 경매에 참여한 모든 입찰자 
			request.setAttribute("auctionNum", auctionNum);
			request.setAttribute("bidPrice", bidPrice); // 나의 입찰금
			request.setAttribute("bidDate", bidDate); // 나의 입찰일
			request.setAttribute("sellerImage", sellerImage);  //판매자 신상 사진 
			
	
			request.getRequestDispatcher("view/buyer/failAuctionBuyer.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
