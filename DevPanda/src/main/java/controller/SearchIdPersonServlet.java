package controller;

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
		
		request.getRequestDispatcher("/view/search_id.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		List<Person> personList = personService.findPersonByEmail(email);
		
		if(personList.size() >0) {
			request.setAttribute("personList", personList);
			//TODO: 화면 뿌리기
		}else {
			// TODO : 화면 뿌리기(해당하는 아이디가 없습니다.)
		}
		
		
		
		
	}

}
