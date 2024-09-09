package controller;

import dto.Company;
import service.CompanyService;
import service.CompanyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/signUpCom")
@MultipartConfig
public class SignUpCompany extends HttpServlet {

	private CompanyService companyService = new CompanyServiceImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Collect form data
			String id = request.getParameter("id");
			String companyName = request.getParameter("companyName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			String companyNum = request.getParameter("companyNum");
			String status = "active";

			// 파일 업로드 처리
			Part companyImagePart = request.getPart("companyImage");
			String fileName = companyImagePart.getSubmittedFileName(); // 파일 이름 추출

			// 저장될 경로 지정
			String uploadDir = System.getProperty("user.home") + "/Desktop/testImage";
			String filePath = uploadDir + "/" + fileName;

			// 경로가 존재하지 않으면 디렉토리를 생성
			File uploadDirFile = new File(uploadDir);
			if (!uploadDirFile.exists()) {
				uploadDirFile.mkdirs();
			}
			companyImagePart.write(filePath);

			Company company = new Company();
			company.setId(id);
//			company.setCompanyName(companyName);
			company.setEmail(email);
			company.setPassword(password);
			company.setAddress(address);
			company.setCompanyNum(companyNum);
			company.setStatus(status);
//			company.setCompanyImage(filePath);

			companyService.registerCompany(company);

			// Redirect or forward to another page
			response.sendRedirect(request.getContextPath() + "/view/signInCom.jsp");

		} catch (IllegalArgumentException e) {
			// ID 중복 등 예외 발생 시 에러 메시지 처리
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/view/signUpCom.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("회원가입 처리 중 오류가 발생했습니다.", e);
		}
	}
}