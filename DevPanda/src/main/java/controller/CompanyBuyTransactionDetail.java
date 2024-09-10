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

import repository.transaction.CompanyAuctionBuyerSucRepository;

@WebServlet("/CompanyAuctionBuyerSuc")
public class CompanyBuyTransactionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Integer auctionNum = Integer.parseInt(request.getParameter("auctionNum"));
        CompanyAuctionBuyerSucRepository repository = new CompanyAuctionBuyerSucRepository();
        System.out.println(auctionNum);

        // DAO를 통해 데이터 가져오기
        Map<String, Object> getCompanyByBuyerId = repository.getCompanyByBuyerId(auctionNum);
        Map<String, Object> getPersonBySellerId = repository.getPersonBySellerId(auctionNum);
        Map<String, Object> getAuctionByAuctionNum = repository.getAuctionByAuctionNum(auctionNum);
        List<Map> getBidsByAuctionNum = repository.getBidsByAuctionNum(auctionNum);
        Map<String, Object> getTransactionByAuctionNum = repository.getTransactionByAuctionNum(auctionNum);


        // 데이터를 request에 추가
        request.setAttribute("company", getCompanyByBuyerId);
        request.setAttribute("person", getPersonBySellerId);
        request.setAttribute("auction", getAuctionByAuctionNum);
        request.setAttribute("bids", getBidsByAuctionNum);
        request.setAttribute("transaction", getTransactionByAuctionNum);

        // JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/buyer/companyAuctionBuyerSuc.jsp");
        dispatcher.forward(request, response);
    }
}

