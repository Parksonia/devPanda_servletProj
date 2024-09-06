package controller;

import service.CompanyService;
import service.CompanyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkCompanyId")
public class CheckIdServletCompany extends HttpServlet {
    private CompanyService companyService = new CompanyServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            boolean isIdExists = companyService.isIdExists(id);
            response.setContentType("text/plain");
            response.getWriter().write(Boolean.toString(isIdExists)); // boolean 값을 문자열로 반환
            System.out.println("Company ID exists: " + isIdExists); // 서버 로그에 출력하여 디버깅

        } catch (Exception e) {
            e.printStackTrace(); // 에러 로그 확인
            response.setContentType("text/plain");
            response.getWriter().write("error"); // 에러 발생 시 error 메시지 반환
        }
    }
}
