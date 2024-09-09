package controller;

import service.AuctionService;
import service.AuctionServiceImpl;
import dto.Auction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/auction")
public class AuctionServlet extends HttpServlet {
	private AuctionService auctionService;

	@Override
	public void init() throws ServletException {
		auctionService = new AuctionServiceImpl();
	}

	@Override
	public void destroy() {
		auctionService = null; // 자원 해제 로직
	}

//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		try {
//			// 모든 경매 데이터를 가져오기
//			List<Auction> auctions = auctionService.getAllAuctions();
//
//			// 경매 데이터가 정상적으로 가져왔는지 확인
//			if (auctions != null && !auctions.isEmpty()) {
//				request.setAttribute("auctions", auctions);
//			} else {
//				request.setAttribute("error", "No auction data found.");
//				System.out.println("No auction data found.");
//			}
//
//		} catch (Exception e) {
//			// 예외 처리
//			request.setAttribute("error", "Failed to retrieve auction data.");
//			e.printStackTrace(); // 디버깅 용도로 예외 출력
//		}
//
//		// main.jsp로 포워드
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/main.jsp");
//		dispatcher.forward(request, response);
//	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int page = 1; // 기본 페이지 번호
			int pageSize = 9; // 기본 페이지 크기
			String pageParam = request.getParameter("page");
			if (pageParam != null) {
				page = Integer.parseInt(pageParam);
			}

			List<Auction> auctions = auctionService.getAllAuctions(page, pageSize);
			if (auctions != null && !auctions.isEmpty()) {
				request.setAttribute("auctions", auctions);
			} else {
				request.setAttribute("error", "No auction data found.");
				System.out.println("No auction data found.");
			}

		} catch (Exception e) {
			request.setAttribute("error", "Failed to retrieve auction data.");
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/main.jsp");
		dispatcher.forward(request, response);
	}

}
