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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			String path = request.getServletContext().getRealPath("upload");
			int size = 10*1024*1024;
			
			MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8", new DefaultFileRenamePolicy());
			
			
			// 폼 데이터 가져오기
			String id = multi.getParameter("id");
			String companyName = multi.getParameter("companyName");
			String email = multi.getParameter("email");
			String password = multi.getParameter("password");
			String address = multi.getParameter("address");
			String companyNum = multi.getParameter("companyNum");
			String status = "active";

			// 파일 업로드 처리
			String fileName = multi.getOriginalFileName("companyImage");

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
