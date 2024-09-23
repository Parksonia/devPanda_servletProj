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

import dto.Company;
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
	    
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String companyName = request.getParameter("companyName");
        String address = request.getParameter("address");
        System.out.println(companyId); 
        System.out.println(email);
        System.out.println(password);
        System.out.println(companyName);
        System.out.println(address);
        // 데이터를 맵에 담기
        Map<String, Object> companyInfo = new HashMap<>();
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
