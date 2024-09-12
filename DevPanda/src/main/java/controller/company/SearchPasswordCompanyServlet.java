package controller.company;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CompanyService;
import service.CompanyServiceImpl;
import service.PersonService;
import service.PersonServiceImpl;
@WebServlet("/Company/SearchPassword")
public class SearchPasswordCompanyServlet extends HttpServlet{

	private  static CompanyService companyService = new CompanyServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/view/search_pwd_com.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		String password = companyService.findPasswordByIdAndEmail(id, email);
		if(password != null) {
			request.setAttribute("id", id);
			request.setAttribute("email", email);
			request.setAttribute("password",password);
			//TODO : 비밀번호 보여주기 화면
		
		}else {
			// TODO : 오류 보여주기 화면
		}
		
		
	}
	
	
	
	
	

}
