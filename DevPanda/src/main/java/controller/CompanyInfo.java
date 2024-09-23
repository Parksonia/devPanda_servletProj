package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Company;
import repository.company.CompanyRepositoryImpl;

@WebServlet("/companyInfo")
public class CompanyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
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
	    
		// Repository 호출
		CompanyRepositoryImpl repository = new CompanyRepositoryImpl();
		Map<String, Object> company = repository.selectCompanyByCompanyId(companyId);
		System.out.println(company);
		// 회사 정보가 존재하면, 이를 뷰로 전달
		request.setAttribute("company", company);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/companyInfo.jsp"); 
		dispatcher.forward(request, response);
	}

}

