package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Transaction;
import service.personBuyTransactionListService;
import service.personBuyTransactionListServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class TransactionList
 */
@WebServlet("/personBuyTransactionList")
public class personBuyTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personBuyTransactionList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//String paramPage = request.getParameter("page"); 
		Integer page = 1; 
		//if (paramPage != null) { page = Integer.parseInt(paramPage); }
		
		
		try {
			
			personBuyTransactionListService service = new personBuyTransactionListServiceImpl();
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);
			
			List<Transaction> personBuyTransactionList = service.transactionList(pageInfo);
			//System.out.println("리스트 사이즈 : " + personBuyTransactionList.size());
			
			request.setAttribute("personBuyTransactionList", personBuyTransactionList);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher("/view/buyer/personBuyTransationList.jsp").forward(request, response);
			/* response.sendRedirect("personBuyTransactionList.jsp"); */
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 오류");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
