package controller.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Company;
import dto.Person;
import service.AuthService;
@WebServlet("/Company/login")
public class CompanyAuthLoginServlet extends HttpServlet{

	
	private AuthService authService = new AuthService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/view/signInCom.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Company company = authService.companyLogin(request, response);
		System.out.println(company);
		if(company == null) {
			response.sendRedirect("/DevPanda/Company/login");
		}else {
			response.sendRedirect("/DevPanda/auctionoffset");
		}
		
	}
	
	
	

}
