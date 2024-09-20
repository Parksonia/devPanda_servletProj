package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.PersonService;
import service.PersonServiceImpl;

/**
 * Servlet implementation class InActivePersonAccount
 */
@WebServlet("/inactivePersonAccount")
public class InActivePersonAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InActivePersonAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		//임의의 test id
		String id="abc001";
		//String id = request.getSession().getId();
		String paramId = request.getParameter("id");
		//String userType = (String) request.getSession().getAttribute("userType");
		try {
		
			if(paramId !=null && id.equals(paramId)) {
				PersonService service = new PersonServiceImpl();
				
				boolean result = service.inactivePersonAccount(id);
				
				if(result) {
					
					//삭제하는 경우 session정보를 삭제함 
					request.getSession().invalidate(); //세션객체 강제 삭제 
					request.getRequestDispatcher("/view/start.jsp").forward(request, response);
					// 탈퇴하면 그 사람과 연관된 글들은 어떻게 되는거지.....음......?	
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
