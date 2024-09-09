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

import service.PersonBuyTransactionListService;
import service.PersonBuyTransactionListServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class TransactionList
 */
@WebServlet("/personBuyTransactionList")
public class PersonBuyTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonBuyTransactionListService service = new PersonBuyTransactionListServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonBuyTransactionList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//Integer page = 1; 
		
		//아이디
		String buyerId = "abc022";
		
		String filterOption = request.getParameter("num");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		LocalDate filterDate = LocalDate.now();
		String filterDateStr = filterDate.toString();
		
		if (filterOption != null) {
			switch(filterOption) {
			case "1" : 
				filterDateStr = filterDate.minusMonths(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); 
				break;
			case "3" :
				filterDateStr = filterDate.minusMonths(3).format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); 
				break;
			case "6" :
				filterDateStr = filterDate.minusMonths(6).format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); 
				break;
			}
		} 
		
		try {
			//PageInfo pageInfo = new PageInfo();
			//pageInfo.setCurPage(page);
			List<Map> personBuyTransactionList;
			
			if (filterOption != null) {
				personBuyTransactionList = service.personBuyTransactionListByDate(buyerId, filterDateStr);
			} else if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
				personBuyTransactionList = service.personBuyTransactionListByDateRange(buyerId, startDate, endDate);
			} else {
				personBuyTransactionList = service.personBuyTransactionList(buyerId);				
			}
			
			request.setAttribute("personBuyTransactionList", personBuyTransactionList);
			//request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher("/view/buyer/personBuyTransactionList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
