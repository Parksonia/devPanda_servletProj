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
 * Servlet implementation class ModifyPersonInfo
 */
@WebServlet("/modifyPersonInfo")
public class ModifyPersonInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyPersonInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
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
			 request.getRequestDispatcher("/view/modifyPersonInfo.jsp").forward(request, response);
		 } catch (Exception e) {
				e.printStackTrace();
				
			}
			

    	
    }
	//수정 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	 try {
		 Person modifedInfo = new Person();
		 PersonService service = new PersonServiceImpl();
		 //update실행
		 service.modifyPersonInfo(request);
		 request.setAttribute("person", modifedInfo);
		 response.sendRedirect("personInfo"); // 성공 시 personInfo로 리다이렉트
		 
	} catch (Exception e) {
		e.printStackTrace();
		 request.setAttribute("errorMessage", "정보 수정 중 오류가 발생했습니다.");
         request.getRequestDispatcher("/view/modifyPersonInfo.jsp").forward(request, response);
	}
		
		
		
	}

}
