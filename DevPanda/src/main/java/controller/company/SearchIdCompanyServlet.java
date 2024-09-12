package controller.company;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Person;
import service.CompanyService;
import service.CompanyServiceImpl;
import service.PersonService;
import service.PersonServiceImpl;
@WebServlet("/Company/SearchId")
public class SearchIdCompanyServlet extends HttpServlet{

	
	private  static CompanyService companyService = new CompanyServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/view/search_id_com.jsp").forward(request, response);
		
	}

	
}
