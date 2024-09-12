package controller.company;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Company;
import dto.Person;
import service.CompanyService;
import service.CompanyServiceImpl;
import service.PersonService;
import service.PersonServiceImpl;

@WebServlet("/Company/IdResult")
public class IdResultCompanyServlet extends HttpServlet{
	private static CompanyService companyService = new CompanyServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email =  (String) req.getParameter("email");
		System.out.println(email);
		req.setAttribute("email", email);
		
		List<Company> list = companyService.findCompanyByEmail(email);
		System.out.print(list.size());
		req.setAttribute("list", list);
		req.setAttribute("size", list.size());
		req.getRequestDispatcher("/view/search_id_com_result.jsp").forward(req, resp);
	}

}
