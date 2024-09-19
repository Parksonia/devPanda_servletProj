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
 * Servlet implementation class TransactionSendMail
 */
@WebServlet("/transactionSendMail")
public class TransactionSendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransactionSendMail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=UTF-8");
		String recipient = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String replyTo = request.getParameter("replyTo");

		try {
			PersonSellTransactionListService service = new PersonSellTransactionListServiceImpl();
			service.sendTransactionMail(recipient, subject, content, replyTo);
			response.getWriter().write("메일 전송 성공");
			//System.out.println("메일전송 성공");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("메일 전송 실패:" + e.getMessage());
		}

	}

}
