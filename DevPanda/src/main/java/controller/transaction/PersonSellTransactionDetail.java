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
import dto.Company;
import dto.Person;
import service.AuctionService;
import service.AuctionServiceImpl;
import service.BidService;
import service.BidServiceImpl;
import service.CompanyService;
import service.CompanyServiceImpl;
import service.PersonSellTransactionListService;
import service.PersonSellTransactionListServiceImpl;
import service.PersonService;
import service.PersonServiceImpl;

/**
 * Servlet implementation class PersonSellTransactionDetail
 */
@WebServlet("/personSellTransactionDetail")
public class PersonSellTransactionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PersonSellTransactionDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
			Integer transactionNum = Integer.parseInt(request.getParameter("transactionNum"));
			Integer bidNum = Integer.parseInt(request.getParameter("bidNum"));
			String sellerImage = request.getParameter("sellerImage");
			String title = request.getParameter("title");
			Integer price = Integer.parseInt(request.getParameter("price"));
			String date = request.getParameter("date");
			String sellerId = request.getParameter("sellerId"); 
			String buyerId = request.getParameter("buyerId");  
			String memType = request.getParameter("memType");  
			String state = request.getParameter("state");
			
			
			
			// auction 처리
			AuctionService service = new AuctionServiceImpl();
			Auction auction = service.oneAuction(auctionNum);
			
			// bid 처리
			BidService bidService = new BidServiceImpl();
			List<Bid> allBuyers = new ArrayList<>();
			allBuyers = bidService.bidAllBuyer(auctionNum);
			
			// person 처리
			PersonService pservice = new PersonServiceImpl();
			Person sperson = pservice.selectPersonInfo(sellerId);
				
			
			// 블랙 리스트 신고 여부 처리  
			String userType = (String)request.getSession().getAttribute("userType");
			PersonSellTransactionListService trService = new PersonSellTransactionListServiceImpl();
			boolean isAlreadyReported = trService.isAlreadyReportedBlack(sellerId,transactionNum,userType,"S"); //"P"를 session의 userType으로 바꿔야함 
			request.setAttribute("isAlreadyReported",isAlreadyReported);
			
			
			// 판매자(Seller) person 정보 
			request.setAttribute("sellerId", sellerId);
			request.setAttribute("sellerImage", sellerImage);
			request.setAttribute("sperson", sperson);
			
			// 구매자(Buyer) 정보 : person or company 
			if (memType != null && memType.equals("company")) {
				PersonSellTransactionListService pstService = new PersonSellTransactionListServiceImpl();
				Company bcompany = pstService.selectCompanyInfo(buyerId);
				request.setAttribute("bcompany", bcompany);
			} else if (memType != null && memType.equals("person")){
				PersonService bservice = new PersonServiceImpl();
				Person bperson = bservice.selectPersonInfo(buyerId);
				request.setAttribute("bperson", bperson);
			}
			
			// auction 정보 
			request.setAttribute("auction", auction);
			request.setAttribute("auctionNum", auctionNum);
			
			
			// bid 정보
			request.setAttribute("allBuyers", allBuyers);
			
			
			// request.set			
			request.setAttribute("price", price); //낙찰액
			request.setAttribute("date", date);  //낙찰일
			request.setAttribute("memType", memType);
			request.setAttribute("state", state); //계약진행상황
			request.setAttribute("transactionNum", transactionNum);
			request.setAttribute("bidNum", bidNum);
			
			
			request.getRequestDispatcher("/view/seller/personSellTransactionDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
