package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonSellTransactionDetail
 */
@WebServlet("/personSellTransactionDetail")
public class PersonSellTransactionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PersonSellTransactionDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		try {
			Integer auctionNum = Integer.parseInt(request.getParameter("auctionNum").trim());

			
			
			
			request.setAttribute("auctionNum", auctionNum);
			
			
			request.getRequestDispatcher("/view/seller/personSellTransactionDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
