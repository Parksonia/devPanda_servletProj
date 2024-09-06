package controller;

import service.PersonService;
import service.PersonServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkId")
public class CheckIdServlet extends HttpServlet {
	private PersonService personService = new PersonServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			boolean isIdExists = personService.isIdExists(id);
			response.setContentType("text/plain");
			response.getWriter().write(Boolean.toString(isIdExists)); // boolean 값을 문자열로 반환
			System.out.println("ID exists: " + isIdExists); // 서버 로그에 출력하여 디버깅

		} catch (Exception e) {
			// 로그를 남겨서 문제를 추적할 수 있도록 한다
			e.printStackTrace(); // 서버 로그에서 에러를 확인하기 위해
			response.setContentType("text/plain");
			response.getWriter().write("error"); // 에러 발생 시 error 메시지 반환
		}
	}
}
