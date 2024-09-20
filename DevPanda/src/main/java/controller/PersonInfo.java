package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Person;
import service.PersonService;
import service.PersonServiceImpl;

/**
 * Servlet implementation class PersonInfo
 */
@WebServlet("/personInfo")
public class PersonInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = ((Person)session.getAttribute("person")).getId();
		
		//임의의 id 사용
		 //String id ="abc001";
		 
		
		 try {
			 Person pInfo = new Person();
			 PersonService service = new PersonServiceImpl();
			 pInfo = service.selectPersonInfo(id);
			 request.setAttribute("person", pInfo);
			 request.getRequestDispatcher("/view/personInfo.jsp").forward(request, response);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
