package controller.auction;

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
 * Servlet implementation class PersonSellAuctionDetail
 */
@WebServlet("/personSellAuctionDetail")
public class PersonSellAuctionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonSellAuctionDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			Integer auctionNum = Integer.parseInt(request.getParameter("auctionNum"));
			String sellerImage = request.getParameter("sellerImage");
			String sellerId = request.getParameter("sellerId");
			
			AuctionService service = new AuctionServiceImpl();
			Auction auction = service.oneAuction(auctionNum);
			
			String endDate = auction.getEndDate(); //경매종료일
			String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date(System.currentTimeMillis()));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = new Date(sdf.parse(endDate).getTime());
			Date today = new Date(sdf.parse(nowDate).getTime());
			Long calDay = date.getTime() - today.getTime();
			int dDays = (int)(calDay/(24*60*60*1000));
			long remainHours = (calDay/(60 * 60 * 1000)) % 24;
			long remainMinutes = (calDay/(60 * 1000)) % 60;
			
			BidService bidSerive = new BidServiceImpl();
			List<Bid> allBuyers = new ArrayList<>();
			allBuyers = bidSerive.bidAllBuyer(auctionNum);
			
			PersonService pservice = new PersonServiceImpl();
			Person sperson = pservice.selectPersonInfo(sellerId);
			
			
			// 판매자(Seller) person 정보
			request.setAttribute("sellerId", sellerId);
			request.setAttribute("sellerImage", sellerImage);
			request.setAttribute("sperson", sperson);
			
			// auction 정보
			request.setAttribute("auction", auction);
			request.setAttribute("auctionNum", auctionNum);
			// bid 정보
			request.setAttribute("allBuyers", allBuyers);
			// day정보
			request.setAttribute("dDays", dDays);
			request.setAttribute("dHours", remainHours);
			request.setAttribute("dMinutes", remainMinutes);
			
			request.getRequestDispatcher("/view/seller/personSellAuctionDetail.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
