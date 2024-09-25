package service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Company;
import dto.Person;
import repository.company.CompanyRepository;
import repository.company.CompanyRepositoryImpl;
import repository.person.PersonRepository;
import repository.person.PersonRepositoryImpl;


public class AuthService {
	
	public PersonRepository personRepository = new PersonRepositoryImpl();
	public CompanyRepository companyRepository = new CompanyRepositoryImpl();
	
	public  Person personLogin(HttpServletRequest request, HttpServletResponse response) {
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
			if(person != null && person.getId().equals(id)  && person.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("person", person);
				session.setAttribute("id", person.getId());
				session.setAttribute("userType", "person");
				session.setMaxInactiveInterval(1800);
				return person;
			}
			return null;
			
			
		}
				
	}
	
	public  Company companyLogin(HttpServletRequest request, HttpServletResponse response) {
		String id= (String) request.getParameter("id");
		String password= (String) request.getParameter("password");
		
		Company company = null; 
		
		if(id ==null || password == null) {
		
			return null;
		}else {
			Map<String,String> parameterMap = new HashMap<String, String>();
			parameterMap.put("id", id);
			parameterMap.put("password", password);
			
			company = companyRepository.findCompanyByIdAndPassword(parameterMap);
			
			if(company != null && company.getId().equals(id)  && company.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("company", company);
				session.setAttribute("id", company.getId());
				session.setAttribute("userType", "company");
				session.setMaxInactiveInterval(1800);
				return company;
			}
			return null;
			
			
		}
				
	}
	
	
	
	public  void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		
	}
}
