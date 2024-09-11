package controller;

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

import service.PersonSellTransactionListService;
import service.PersonSellTransactionListServiceImpl;

/**
 * Servlet implementation class PersonSellTransactionList
 */
@WebServlet("/personSellTransactionList")
public class PersonSellTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonSellTransactionListService service = new PersonSellTransactionListServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonSellTransactionList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//아이디
		String sellerId = "abc022";
		
		//날짜
		String filterOpion = request.getParameter("num");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		LocalDate filterDate = LocalDate.now();
		String filterDateStr = filterDate.toString();
		
		if (filterOpion != null) {
			switch(filterOpion) {
			case "1" :
				filterDateStr = filterDate.minusMonths(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				break;
			case "3" :
				filterDateStr = filterDate.minusMonths(3).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				break;
			case "6":
				filterDateStr = filterDate.minusMonths(6).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				break;
			}
		}
		
		try {
			List<Map> personSellTransactionList;
			
			if (filterOpion != null) {
				personSellTransactionList = service.personSellTransactionListByDate(sellerId, filterDateStr);
			} else if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
				personSellTransactionList = service.personSellTransactionListByDateRange(sellerId, startDate, endDate);
			} else {
				personSellTransactionList = service.personSellTransactionList(sellerId);
			}
			
			request.setAttribute("personSellTransactionList", personSellTransactionList);
			request.getRequestDispatcher("/view/seller/personSellTransactionList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
