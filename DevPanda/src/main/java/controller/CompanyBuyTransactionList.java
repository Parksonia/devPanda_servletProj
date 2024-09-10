package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.transaction.TransactionRepository;
import repository.transaction.TransactionRepositoryImpl;

@WebServlet("/CompanyBuyBidSucList")
public class CompanyBuyTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청에서 companyId 값을 받음 (예: 쿼리 파라미터로 넘어온 값)
		String companyId = request.getParameter("companyId");

		try {
			TransactionRepository transactionRepository = new TransactionRepositoryImpl();
			List<Map> transactionList = transactionRepository.findTransactionsByCompanyId(companyId);
			Map<String, Object> getAuctionMaxByCompanyId = transactionRepository.getAuctionMaxByCompanyId(companyId);

			request.setAttribute("companyId", companyId);
			request.setAttribute("transactionList", transactionList);
			request.setAttribute("MaxSal", getAuctionMaxByCompanyId);

			request.getRequestDispatcher("/view/buyer/companyBuyTransationList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
