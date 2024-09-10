package service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Person;
import repository.person.PersonRepository;
import repository.person.PersonRepositoryImpl;


public class AuthService {
	
	public PersonRepository personRepository = new PersonRepositoryImpl();
	
	public  Person login(HttpServletRequest request, HttpServletResponse response) {
		String id= (String) request.getParameter("id");
		String password= (String) request.getParameter("password");
		Person person = null; 
		
		if(id ==null || password == null) {
		
			return null;
		}else {
			Map<String,String> parameterMap = new HashMap<String, String>();
			parameterMap.put("id", id);
			parameterMap.put("password", password);
			person = personRepository.findPersonByIdAndPassword(parameterMap);
			if(person.getId().equals(id)  && person.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", person);
				return person;
			}
			return null;
			
			
		}
				
	}
	
	
	
	public static void logout(HttpServletRequest request, HttpServletResponse response) {
		
	}
}
