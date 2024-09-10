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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
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
			List<Map> personSellAuctionList;
			
			if (filterOption != null) {
				personSellAuctionList = service.personSellAuctionListByDate(filterDateStr);
			} else if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
				personSellAuctionList = service.personSellAuctionListByDateRange(startDate, endDate);
			} else {
				personSellAuctionList = service.personSellAuctionList();
			}
			
			request.setAttribute("personSellAuctionList", personSellAuctionList);
			request.getRequestDispatcher("/view/seller/personSellAuctionList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
		
	}

}
