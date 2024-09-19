package controller.auction;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.PersonSellAuctionListService;
import service.PersonSellAuctionListServiceImpl;

/**
 * Servlet implementation class PersonSellAuctionList
 */
@WebServlet("/personSellAuctionList")
public class PersonSellAuctionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonSellAuctionListService service = new PersonSellAuctionListServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PersonSellAuctionList() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 아이디
		String sellerId = "abc001";
		
		// 더보기버튼
		int offset = 0; 
		int limit = 6;
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		
		try {
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");

			List<Map> personSellAuctionList;
			int totalCount = service.countPSAuctionListBySellerId(sellerId);

			if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
				personSellAuctionList = service.personSellAuctionListByDateRange(sellerId, startDate, endDate, limit, offset);
				List<Map> filteredList = service.personSellAuctionListByDateRange(sellerId, startDate, endDate, Integer.MAX_VALUE, 0);
				totalCount = filteredList.size();
			} else {
				personSellAuctionList = service.personSellAuctionList(sellerId, limit, offset);
				totalCount = service.countPSAuctionListBySellerId(sellerId);
			}
			
			// 더보기 페이징 처리 (Ajax 요청인지, 일반요청인지 구분)
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				// JSON 응답으로 추가 데이터를 전송
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				// JSON 변환기 사용하여 응답
				Map<String, Object> jsonResponse = Map.of(
						"totalCount", totalCount,
						"auctionList", personSellAuctionList
				);
				String jsonResponseString = new Gson().toJson(jsonResponse);
                response.getWriter().write(jsonResponseString);
			} else {
				// 일반 요청 시 전체 페이지 반환
				request.setAttribute("personSellAuctionList", personSellAuctionList);
				request.setAttribute("totalCount", totalCount);
				request.getRequestDispatcher("/view/seller/personSellAuctionList.jsp?currentPage=personSellAuctionList").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}

	}

}
