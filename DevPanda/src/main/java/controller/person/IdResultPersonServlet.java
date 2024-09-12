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

@WebServlet("/Person/IdResult")
public class IdResultPersonServlet extends HttpServlet{
	private static PersonService personService = new PersonServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email =  (String) req.getParameter("email");
		System.out.println(email);
		req.setAttribute("email", email);
		
		List<Person> list = personService.findPersonByEmail(email);
		System.out.print(list.size());
		req.setAttribute("list", list);
		req.setAttribute("size", list.size());
		req.getRequestDispatcher("/view/search_id_person_result.jsp").forward(req, resp);
	}

}
