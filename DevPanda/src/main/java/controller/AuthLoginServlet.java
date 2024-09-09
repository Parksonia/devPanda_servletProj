package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Person;
import service.AuthService;
@WebServlet("/login")
public class AuthLoginServlet extends HttpServlet{

	
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
		
		Person person = authService.login(request, response);
		System.out.println(person);
		if(person == null) {
			response.getWriter().write("login fail");
		}else {
			response.getWriter().write("login success check cookie jssion id!!");
		}
		
	}
	
	
	

}
