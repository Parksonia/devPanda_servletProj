/*
package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Transaction;
import repository.blacklist.CompanyBlacklistRepository;

@WebServlet("/sellerCompanyBlack")
public class SellerCompanyBlack extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyBlacklistRepository repository = new CompanyBlacklistRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String auctionNum = request.getParameter("auctionNum");

        try {
            // 트랜잭션 테이블에서 auctionNum으로 값 조회
        	Map<String, Object> transaction = repository.getTransactionByAuctionNum(auctionNum);

            if (transaction != null) {
                String declCom = transaction.getBuyerId();  // buyerId는 신고자 (기업)
                String blackPerson = transaction.getSellerId(); // sellerId는 피신고자 (개인)
                String title = request.getParameter("title"); // 제목
                String content = request.getParameter("content"); // 신고 내용
                String roleType = "B"; // Buyer 신고자

                // 블랙리스트에 추가
                boolean isSuccess = repository.addToBlacklist(transaction.getTransactionNum(), transaction.getBidNum(), declCom, blackPerson, title, content, roleType);
                
                if (isSuccess) {
                    response.getWriter().write("Blacklist entry added successfully.");
                } else {
                    response.getWriter().write("Failed to add blacklist entry.");
                }
            } else {
                response.getWriter().write("No transaction found for the provided auctionNum.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred.");
        }
    }
}*/