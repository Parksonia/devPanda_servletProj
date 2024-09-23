package controller.person;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Person;
import service.AuthService;
@WebServlet("/Person/login")
public class PersonAuthLoginServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	private AuthService authService = new AuthService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("call!!");
		request.getRequestDispatcher("/view/signInPerson.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Person person = authService.personLogin(request, response);
		System.out.println(person);
		if(person == null) {
			response.sendRedirect("/DevPanda/Person/login");
		}else {
			response.sendRedirect("/DevPanda/auctionoffset");
		}
		
	}
	
	
	

}
