package controller.person;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Person;
import service.PersonService;
import service.PersonServiceImpl;
@WebServlet("/Person/SearchId")
public class SearchIdPersonServlet extends HttpServlet{

	
	private  static PersonService personService = new PersonServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/view/search_id_person.jsp").forward(request, response);
		
	}

	
}
