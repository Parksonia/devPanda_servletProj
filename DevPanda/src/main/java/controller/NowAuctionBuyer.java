package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * Servlet implementation class NowAuctionBuyer
 */
@WebServlet("/nowAuctionBuyer")
public class NowAuctionBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NowAuctionBuyer() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Integer auctionNum =Integer.parseInt(request.getParameter("auctionNum"));
		String bidNum = request.getParameter("bidNum");
		String bidDate = request.getParameter("bidDate"); 
		Integer bidPrice = Integer.parseInt(request.getParameter("bidPrice")); 
		String sellerImage = request.getParameter("sellerImage"); 
		
		
		
		
		// 임의의 login in(P or C)
		//String id = "abc001";
		// userType="person";
		// 세션에서 사용자 ID가져와 사용 예정 
//		HttpSession session = request.getSession();
//		String myId = (String) session.getAttribute("userId"); 

		
		String id = "comp001";
		HttpSession session = request.getSession();
		//String userType="company";
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
			
			//D-Day계산
			String endDate = auction.getEndDate();
			String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date(System.currentTimeMillis())); // 오늘날짜)
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = new Date(sdf.parse(endDate).getTime());
			Date today = new Date(sdf.parse(nowDate).getTime());
			Long calDay = date.getTime() - today.getTime();
			int dDays = (int)(calDay/(24*60*60*1000));
			long remainHours = (calDay/(60 * 60 * 1000)) % 24;
			long remainMinutes = (calDay/(60 * 1000)) % 60;
			
			
			BidService bService = new BidServiceImpl();
			List<Bid> allbuyers = new ArrayList<>();
			allbuyers = bService.bidAllBuyer(auctionNum);
	
				
			request.setAttribute("auction", auction); //경매 정보
			request.setAttribute("allBuyers", allbuyers); ////해당 경매에 참여한 모든 입찰자 
			request.setAttribute("auctionNum", auctionNum);
			request.setAttribute("bidNum", bidNum);
			request.setAttribute("bidPrice", bidPrice); // 나의 입찰금
			request.setAttribute("bidDate", bidDate); // 나의 입찰일
			request.setAttribute("sellerImage", sellerImage);  //판매자 신상 사진 
			request.setAttribute("dDays", dDays); //경매 마감일과 현재날짜를 계산하여 dday표시
			request.setAttribute("dHours", remainHours);
			request.setAttribute("dMinutes", remainMinutes);
			request.setAttribute("myId", id);
			request.getRequestDispatcher("view/buyer/nowAuctionBuyer.jsp").forward(request, response);
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);
	}	
}
