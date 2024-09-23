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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 회원가입 폼을 보여줌 (signUpCom.jsp)
        request.getRequestDispatcher("/view/signUpCom.jsp").forward(request, response);
    }
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			// 폼 데이터 가져오기
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

			// 저장될 경로 지정 (webapp 밑의 upload 폴더)
			String uploadDir = getServletContext().getRealPath("/upload");
			String filePath = uploadDir + File.separator + fileName;

			// 경로가 존재하지 않으면 디렉토리를 생성
			File uploadDirFile = new File(uploadDir);
			if (!uploadDirFile.exists()) {
				uploadDirFile.mkdirs();
			}

			// 파일을 지정한 경로에 저장
			companyImagePart.write(filePath);
            System.out.println("파일 저장 경로: " + filePath);

			// 상대 경로를 저장 (웹에서 접근 가능한 경로)
			//String relativeFilePath = "/upload/" + fileName;

			// Company 객체 생성
			Company company = new Company();
			company.setId(id);
			company.setCompanyName(companyName);
			company.setEmail(email);
			company.setPassword(password);
			company.setAddress(address);
			company.setCompanyNum(companyNum);
			company.setStatus(status);
			company.setCompanyImage(fileName); // 상대 경로 저장

			// 회사 등록 처리
			companyService.registerCompany(company);

			// 성공 시 로그인 페이지로 리다이렉트
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
