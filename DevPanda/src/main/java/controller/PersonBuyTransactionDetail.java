package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Auction;
import dto.Bid;
import dto.Person;
import service.AuctionService;
import service.AuctionServiceImpl;
import service.BidService;
import service.BidServiceImpl;
import service.PersonService;
import service.PersonServiceImpl;

/**
 * Servlet implementation class PersonBuyTransactionDetail
 */
@WebServlet("/personBuyTransactionDetail")
public class PersonBuyTransactionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonBuyTransactionDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer auctionNum =Integer.parseInt(request.getParameter("auctionNum"));
		String sellerImage = request.getParameter("sellerImage");
		Integer price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		String state = request.getParameter("state");
		//String memType = request.getParameter("memType");
		String sellerId = request.getParameter("sellerId");
		String buyerId = request.getParameter("buyerId");
		
		try {
			AuctionService service = new AuctionServiceImpl();
			Auction auction = service.oneAuction(auctionNum);
			
			BidService bidSerive = new BidServiceImpl();
			List<Bid> allBuyers = new ArrayList<>();
			allBuyers = bidSerive.bidAllBuyer(auctionNum);
			
			
			PersonService pservice = new PersonServiceImpl();
			Person sperson = pservice.selectPersonInfo(sellerId);
			Person bperson = pservice.selectPersonInfo(buyerId);
			
			//판매자(Seller) person 정보 
			request.setAttribute("sellerId", sellerId);
			request.setAttribute("sellerImage", sellerImage);
			request.setAttribute("sperson", sperson);
			
			//구매자(Buyer) person 정보
			request.setAttribute("bperson", bperson);
			
			//auction 정보 
			request.setAttribute("auction", auction);
			request.setAttribute("auctionNum", auctionNum);
			//bid 정보
			request.setAttribute("allBuyers", allBuyers);
			//request 정보
			request.setAttribute("price", price); //낙찰액
			request.setAttribute("date", date);  //낙찰일
			request.setAttribute("state", state);
			
			request.getRequestDispatcher("/view/buyer/personBuyTransactionDetail.jsp").forward(request, response);
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
