package controller.transaction;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.Person;
import service.PersonBuyTransactionListService;
import service.PersonBuyTransactionListServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class TransactionList
 */
@WebServlet("/personBuyTransactionList")
public class PersonBuyTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PersonBuyTransactionList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PersonBuyTransactionListService service = new PersonBuyTransactionListServiceImpl();
		request.setCharacterEncoding("utf-8");

		// 아이디
		//String buyerId = "abc001";
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("person") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
			dispatcher.forward(request, response);
		}
		String buyerId = ((Person)session.getAttribute("person")).getId();
		
		//더보기
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

			List<Map> personBuyTransactionList;
			int totalCount = service.countTransactionListByBuyerId(buyerId);

			if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
				personBuyTransactionList = service.personBuyTransactionListByDateRange(buyerId, startDate, endDate, limit, offset);
				// 날짜 필터링된 전체 데이터의 totalCount 계산 (제한 없이 가져와서 크기 계산)
			    List<Map> filteredList = service.personBuyTransactionListByDateRange(buyerId, startDate, endDate, Integer.MAX_VALUE, 0);
			    totalCount = filteredList.size();  // 필터링된 전체 데이터의 크기를 totalCount로 설정
			} else {
				personBuyTransactionList = service.personBuyTransactionList(buyerId, limit, offset);
				totalCount = service.countTransactionListByBuyerId(buyerId);
			}
			
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				// 응답 데이터에 총 개수와 목록을 포함
                Map<String, Object> jsonResponse = Map.of(
                    "totalCount", totalCount,
                    "transactionList", personBuyTransactionList
                );
                String jsonResponseString = new Gson().toJson(jsonResponse);
                response.getWriter().write(jsonResponseString);
			} else {
				request.setAttribute("personBuyTransactionList", personBuyTransactionList);
				request.setAttribute("totalCount", totalCount);
				request.getRequestDispatcher("/view/buyer/personBuyTransactionList.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
