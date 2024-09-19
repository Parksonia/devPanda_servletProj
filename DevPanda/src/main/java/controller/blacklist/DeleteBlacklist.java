package controller.blacklist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SellerBlackListService;
import service.SellerBlackListServiceImpl;

/**
 * Servlet implementation class DeleteBlacklist
 */
@WebServlet("/deleteBlacklist")
public class DeleteBlacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SellerBlackListService service = new SellerBlackListServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteBlacklist() {
		super();
		// TODO Auto-generated constructor stub
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer blackNum = Integer.parseInt(request.getParameter("blackNum"));
			service.deleteSellerBlack(blackNum);
			response.sendRedirect(request.getContextPath() + "/personBlackList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
