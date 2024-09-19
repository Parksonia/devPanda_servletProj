package controller.transaction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PersonSellTransactionListService;
import service.PersonSellTransactionListServiceImpl;

/**
 * Servlet implementation class ProgressItemDescription
 */
@WebServlet("/progressItemDescription")
public class ProgressItemDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgressItemDescription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			Integer auctionNum = Integer.parseInt(request.getParameter("auctionNum"));
			PersonSellTransactionListService pstService = new PersonSellTransactionListServiceImpl();
			pstService.updateStateTransactionState(auctionNum);
			//response.sendRedirect("/view/seller/personSellTransactionDetail.jsp");
			request.getRequestDispatcher("/view/seller/personSellTransactionDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
