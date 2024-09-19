package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.company.CompanyRepositoryImpl;

@WebServlet("/companyInfo")
public class CompanyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String companyId = request.getParameter("companyId");
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

