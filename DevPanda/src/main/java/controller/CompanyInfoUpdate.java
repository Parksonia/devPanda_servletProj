package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Company;
import dto.Person;
import repository.company.CompanyRepositoryImpl;

@WebServlet("/companyInfoUpdate")
public class CompanyInfoUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8"); // 인코딩 설정
        // 폼 데이터 받기
    	HttpSession session = request.getSession(false);
	    String companyId = null;

	    if (session == null || session.getAttribute("company") == null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
	        dispatcher.forward(request, response);
	        return; // 포워딩 후 이후 코드를 실행하지 않도록 return
	    } else {
	        Company company = (Company) session.getAttribute("company");
	        companyId = company.getId(); // 세션에 company가 있을 경우, companyId 사용
	    }
	    String path = request.getServletContext().getRealPath("upload");
	    int size = 10 * 1024 * 1024; // 크기지정 10MB
	    MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	        
	    String companyImage = null;
	    if (multi.getFile("companyImageFile") != null) { // name 속성이 companyImageFile인 파일을 받음
	        companyImage = multi.getFilesystemName("companyImageFile");
	        System.out.println("업로드된 파일 이름: " + companyImage);
	    } else {
	        System.out.println("이미지 파일이 업로드되지 않았습니다.");
	    }
	    
	    System.out.println(companyImage);
        String email = multi.getParameter("email");
        String password = multi.getParameter("password");
        String companyName = multi.getParameter("companyName");
        String address = multi.getParameter("address");
        // 데이터를 맵에 담기
        Map<String, Object> companyInfo = new HashMap<>();
        companyInfo.put("companyImage", companyImage);
        companyInfo.put("companyId", companyId);
        companyInfo.put("email", email);
        companyInfo.put("password", password);
        companyInfo.put("companyName", companyName);
        companyInfo.put("address", address);
        CompanyRepositoryImpl Repository = new CompanyRepositoryImpl();
        System.out.println(companyInfo);
        // DAO 호출하여 업데이트 처리
        int updateResult = Repository.updateCompanyInfo(companyInfo);
   
        // 업데이트 결과에 따른 처리
        if (updateResult > 0) {
            response.sendRedirect(request.getContextPath() + "/companyInfo?companyId=" + companyId);
        } else {
            System.out.println("실패");
        }
    }
}
