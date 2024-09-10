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

import com.google.gson.Gson;

@WebServlet("/auction")
public class AuctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuctionService auctionService;

	@Override
	public void init() throws ServletException {
		auctionService = new AuctionServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 페이지와 페이지 크기 파라미터 가져오기
		String pageParam = request.getParameter("page");
		String pageSizeParam = request.getParameter("pageSize");

		// 기본값 설정
		int page = 1;
		int pageSize = 9;

		// 페이지와 페이지 크기 값 파싱
		if (pageParam != null) {
			try {
				page = Integer.parseInt(pageParam);
			} catch (NumberFormatException e) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid page parameter");
				return;
			}
		}

		if (pageSizeParam != null) {
			try {
				pageSize = Integer.parseInt(pageSizeParam);
			} catch (NumberFormatException e) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid pageSize parameter");
				return;
			}
		}

		// 경매 데이터 가져오기
		List<Auction> auctions = auctionService.getAllAuctions(page, pageSize);

		// JSON으로 변환 후 응답
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		Gson gson = new Gson();
		String json = gson.toJson(auctions);
		response.getWriter().write(json);
	}
}


	

