package controller.person;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PersonService;
import service.PersonServiceImpl;

@WebServlet("/Person/PasswordResult")
public class PasswordResultPersonServlet extends HttpServlet{

	private static PersonService personService = new PersonServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = (String)req.getParameter("id");
		String email = (String)req.getParameter("email");
		
		
		
		String password = personService.findPasswordByIdAndEmail(id, email);
		
		if(password !=null) {
			req.setAttribute("password", password);
			req.setAttribute("exist", true);
			req.setAttribute("id", id);
		}else {
			req.setAttribute("exist", false);
		}
		
		req.getRequestDispatcher("/view/search_pwd_person_result.jsp").forward(req, resp);
		
		
		
		
	}

}
