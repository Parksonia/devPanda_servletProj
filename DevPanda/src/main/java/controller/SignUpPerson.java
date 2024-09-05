package controller;

import dto.Person;
import service.PersonService;
import service.PersonServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/signUpPerson")
@MultipartConfig
public class SignUpPerson extends HttpServlet {

	private PersonService personService = new PersonServiceImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 요청 파라미터를 가져옴
			String id = request.getParameter("id");
			String nickName = request.getParameter("nickName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String status = "active";

			// 파일 업로드 처리
			Part personImagePart = request.getPart("personImage");
			String fileName = personImagePart.getSubmittedFileName(); // 파일 이름 추출

			// 저장될 경로 지정
			String uploadDir = System.getProperty("user.home") + "/Desktop/testImage";
			String filePath = uploadDir + "/" + fileName;

			// 경로가 존재하지 않으면 디렉토리를 생성
			File uploadDirFile = new File(uploadDir);
			if (!uploadDirFile.exists()) {
				uploadDirFile.mkdirs();
			}

			// 파일을 지정한 경로에 저장
			personImagePart.write(filePath);

			// Person 객체 생성
			Person person = new Person();
			person.setId(id);
			person.setNickName(nickName);
			person.setEmail(email);
			person.setPassword(password);
			person.setAddress(address);
			person.setSex(sex);
			person.setAge(age);
			person.setPersonImage(filePath); // 파일 경로를 저장
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
