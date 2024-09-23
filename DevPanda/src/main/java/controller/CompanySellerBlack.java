package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Company;
import repository.blacklist.CompanyBlacklistRepository;

@WebServlet("/companySellerBlack")
public class CompanySellerBlack extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 파라미터로부터 companyId 값을 가져옴
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

        CompanyBlacklistRepository repository = new CompanyBlacklistRepository();
        List<Map<String, Object>> blacklist = repository.getComBlackListByBlackNum(companyId); // selectList 호출
        System.out.println(blacklist);
        request.setAttribute("comblack", blacklist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/buyer/companySellerBlack.jsp");
        dispatcher.forward(request, response);

    }
}
