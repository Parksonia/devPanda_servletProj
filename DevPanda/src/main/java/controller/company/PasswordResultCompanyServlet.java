package controller.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CompanyService;
import service.CompanyServiceImpl;
import service.PersonService;
import service.PersonServiceImpl;

@WebServlet("/Company/PasswordResult")
public class PasswordResultCompanyServlet extends HttpServlet{

	private static CompanyService companyService = new CompanyServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = (String)req.getParameter("id");
		String email = (String)req.getParameter("email");
		
		
		
		String password = companyService.findPasswordByIdAndEmail(id, email);
		
		if(password !=null) {
			req.setAttribute("password", password);
			req.setAttribute("exist", true);
			req.setAttribute("id", id);
		}else {
			req.setAttribute("exist", false);
		}
		
		req.getRequestDispatcher("/view/search_pwd_com_result.jsp").forward(req, resp);
		
		
		
		
	}

}
