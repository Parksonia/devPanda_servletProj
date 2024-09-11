package controller;

import service.AuctionService;
import service.AuctionServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
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
		String pageParam = request.getParameter("page");
		String pageSizeParam = request.getParameter("pageSize");

		int page = 1;
		int pageSize = 9;

		try {
			if (pageParam != null) {
				page = Integer.parseInt(pageParam);
			}
			if (pageSizeParam != null) {
				pageSize = Integer.parseInt(pageSizeParam);
			}
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid pagination parameters.");
			return;
		}

		List<Map<String, Object>> auctions = auctionService.getAllAuctionsWithPersonInfo(page, pageSize);

		// AJAX 요청인 경우 JSON 응답 반환
		if ("application/json".equals(request.getHeader("Accept"))) {
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(auctions);
			out.print(jsonResponse);
			out.flush();
		} else {
			// 일반 요청인 경우 JSP 페이지로 포워딩
			request.setAttribute("auctions", auctions);
			request.setAttribute("page", page);
			request.setAttribute("pageSize", pageSize);
			request.getRequestDispatcher("/view/main.jsp").forward(request, response);
		}
	}
}
