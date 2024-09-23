package controller.transaction;

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
import service.PersonSellTransactionListService;
import service.PersonSellTransactionListServiceImpl;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
		try {
			
			Integer auctionNum = Integer.parseInt(request.getParameter("auctionNum"));
			Integer bidNum = Integer.parseInt(request.getParameter("bidNum"));
			Integer transactionNum = Integer.parseInt(request.getParameter("transactionNum"));
			Integer price = Integer.parseInt(request.getParameter("price"));
			//System.out.println(auctionNum);
			//System.out.println(price);
			
			String sellerImage = request.getParameter("sellerImage");
			String date = request.getParameter("date");
			String state = request.getParameter("state");
			String memType = request.getParameter("memType");
			String sellerId = request.getParameter("sellerId");
			String buyerId = request.getParameter("buyerId");

			AuctionService service = new AuctionServiceImpl();
			Auction auction = service.oneAuction(auctionNum);

			BidService bidSerive = new BidServiceImpl();
			List<Bid> allBuyers = new ArrayList<>();
			allBuyers = bidSerive.bidAllBuyer(auctionNum);

			PersonService pservice = new PersonServiceImpl();
			Person sperson = pservice.selectPersonInfo(sellerId);
			Person bperson = pservice.selectPersonInfo(buyerId);

			// 블랙 리스트 신고 여부 처리  
			String userType = (String)request.getSession().getAttribute("userType");
			PersonSellTransactionListService trService = new PersonSellTransactionListServiceImpl(); // SellService로 동일하게 활용 가능 
			boolean isAlreadyReported = trService.isAlreadyReportedBlack(buyerId,transactionNum,userType,"B"); 
			request.setAttribute("isAlreadyReported",isAlreadyReported);
						
			
			// 판매자(Seller) person 정보
			request.setAttribute("sellerId", sellerId);
			request.setAttribute("sellerImage", sellerImage);
			request.setAttribute("sperson", sperson);

			// 구매자(Buyer) person 정보
			request.setAttribute("bperson", bperson);

			// auction 정보
			request.setAttribute("auction", auction);
			request.setAttribute("auctionNum", auctionNum);
			// bid 정보
			request.setAttribute("bidNum", bidNum);
			request.setAttribute("allBuyers", allBuyers);
			// request 정보
			request.setAttribute("price", price); // 낙찰액
			request.setAttribute("date", date); // 낙찰일
			request.setAttribute("state", state);
			request.setAttribute("transactionNum", transactionNum);
			request.setAttribute("memType", memType);

			request.getRequestDispatcher("/view/buyer/personBuyTransactionDetail.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
