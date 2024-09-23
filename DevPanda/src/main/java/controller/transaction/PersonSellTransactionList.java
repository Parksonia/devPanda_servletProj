package controller.transaction;

import java.io.IOException;
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
import service.PersonSellTransactionListService;
import service.PersonSellTransactionListServiceImpl;

/**
 * Servlet implementation class PersonSellTransactionList
 */
@WebServlet("/personSellTransactionList")
public class PersonSellTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonSellTransactionList() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersonSellTransactionListService service = new PersonSellTransactionListServiceImpl();
		request.setCharacterEncoding("UTF-8");
		
		//아이디
		//String sellerId = "abc001";
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("person") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
			dispatcher.forward(request, response);
		}
		String sellerId = ((Person)session.getAttribute("person")).getId();
		
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
			
			List<Map> personSellTransactionList;
			int totalCount = service.countTransactionListBySellerId(sellerId);
			
			if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
				personSellTransactionList = service.personSellTransactionListByDateRange(sellerId, startDate, endDate, limit, offset);
				// 날짜 필터링된 전체 데이터의 totalCount 계산 (제한 없이 가져와서 크기 계산)
				List<Map> filteredList = service.personSellTransactionListByDateRange(sellerId, startDate, endDate, Integer.MAX_VALUE, 0);
				totalCount = filteredList.size();
			} else {
				personSellTransactionList = service.personSellTransactionList(sellerId, limit, offset);
				totalCount = service.countTransactionListBySellerId(sellerId);
			}
			
			// 더보기 페이징 처리 
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				// 응답 데이터에 총 개수와 목록을 포함
				Map<String, Object> jsonResponse = Map.of(
	                    "totalCount", totalCount,
	                    "transactionList", personSellTransactionList
	                );
				String jsonResponseString = new Gson().toJson(jsonResponse);
                response.getWriter().write(jsonResponseString);
			} else {
				request.setAttribute("personSellTransactionList", personSellTransactionList);
				request.setAttribute("totalCount", totalCount);
				request.getRequestDispatcher("/view/seller/personSellTransactionList.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
