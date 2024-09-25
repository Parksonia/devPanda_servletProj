package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Person;
import service.PersonService;
import service.PersonServiceImpl;

@WebServlet("/signUpPerson")
@MultipartConfig
public class SignUpPerson extends HttpServlet {

    private PersonService personService = new PersonServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 회원가입 폼을 보여줌 (signUpPerson.jsp)
        request.getRequestDispatcher("/view/signUpPerson.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
        try {
        	String path = request.getServletContext().getRealPath("upload");
			int size = 10*1024*1024;
			
			MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8", new DefaultFileRenamePolicy());
        	
            // 요청 파라미터를 가져옴
            String id = multi.getParameter("id");
            String nickName = multi.getParameter("nickName");
            String email = multi.getParameter("email");
            String password = multi.getParameter("password");
            String address = multi.getParameter("address");
            String sex = multi.getParameter("sex");
            String age = multi.getParameter("age");
            String status = "active";

            // 파일 업로드 처리
            String fileName = multi.getOriginalFileName("personImage");
            
            // Person 객체 생성
            Person person = new Person();
            person.setId(id);
            person.setNickName(nickName);
            person.setEmail(email);
            person.setPassword(password);
            person.setAddress(address);
            person.setSex(sex);
            person.setAge(age);
            person.setPersonImage(fileName); // 파일 경로를 저장
            person.setStatus(status);

            // 서비스 레이어를 호출하여 회원가입을 처리합니다.
            personService.registerPerson(person);

            // 성공 시 로그인 페이지로 리다이렉트합니다.
            response.sendRedirect(request.getContextPath() + "/view/signInPerson.jsp");

        } catch (IllegalArgumentException e) {
            // ID 중복 등 예외 발생 시 에러 메시지 처리
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/view/signUpPerson.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("회원가입 처리 중 오류가 발생했습니다.", e);
        }
    }
}
