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

import repository.blacklist.CompanyBlacklistRepository;

@WebServlet("/companySellerBlack")
public class CompanySellerBlack extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 파라미터로부터 companyId 값을 가져옴
        String companyId = request.getParameter("companyId");

        CompanyBlacklistRepository repository = new CompanyBlacklistRepository();
        List<Map<String, Object>> blacklist = repository.getComBlackListByBlackNum(companyId); // selectList 호출

        request.setAttribute("comblack", blacklist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/buyer/companySellerBlack.jsp");
        dispatcher.forward(request, response);
    }
}
