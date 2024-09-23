package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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

import dto.Company;
import repository.transaction.TransactionRepositoryImpl;


@WebServlet("/companyBuyTransactions")
public class CompanyBuyTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("view/buyer/companyBuyTransationList.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			TransactionRepositoryImpl transactionRepository = new TransactionRepositoryImpl();
			
	        String startDate = request.getParameter("startDate");
	        String endDate = request.getParameter("endDate");
			/* String companyId = request.getParameter("companyId"); */
	        


	        HttpSession session = request.getSession(false);
		    String companyId = null;

		    if (session == null || session.getAttribute("company") == null) {
		        RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
		        dispatcher.forward(request, response);
		        return; // 포워딩 후 이후 코드를 실행하지 않도록 return
		    } else {
		        Company company = (Company) session.getAttribute("company");
		        companyId = company.getId(); // 세션에 company가 있을 경우, companyId 사용
		    }


		    int page = 1; // 기본 페이지 값
		    String pageParam = request.getParameter("page");
		    if (pageParam != null && !pageParam.isEmpty()) {
		        try {
		            page = Integer.parseInt(pageParam);
		        } catch (NumberFormatException e) {
		            // page 파라미터가 유효하지 않을 때 기본값을 1로 설정
		            page = 1;
		        }
		    }
	        
	        System.out.println(startDate);
	        System.out.println(endDate);
	        System.out.println(companyId);
	        System.out.println(page);


	        int pageSize = 6; // 페이지당 표시할 트랜잭션 수
	        int offset = (page - 1) * pageSize;

	        // 데이터 가져오기
	        List<Map<String, Object>> transactionList = transactionRepository.getTransactionListByDate(companyId, startDate, endDate, offset, pageSize + 1);
	        System.out.println(transactionList.size());
	        // 더보기 버튼을 표시할지 결정하기 위해 리스트 사이즈 확인
	        boolean hasMoreTransactions = transactionList.size() > pageSize;

	        if (hasMoreTransactions) {
	            transactionList.remove(transactionList.size() - 1); // 마지막 데이터는 더 있는지 확인용이니 삭제
	        } 

	        // JSON으로 변환할 데이터 준비
	        Map<String, Object> jsonResponse = new HashMap<>();
	        jsonResponse.put("transactionList", transactionList);
	        jsonResponse.put("hasMoreTransactions", hasMoreTransactions);
	        System.out.println(hasMoreTransactions);

	        // Gson으로 변환
	        Gson gson = new Gson();
	        String json = gson.toJson(jsonResponse);

	        // JSON 응답 설정
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        // JSON 응답 출력
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
	}

}
