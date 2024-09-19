package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BlackList;
import repository.blacklist.CompanyBlacklistRepository;


@WebServlet("/sellerCompanyBlack")
public class SellerCompanyBlack extends HttpServlet {

    private CompanyBlacklistRepository companyBlacklistRepository = new CompanyBlacklistRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String auctionNum = request.getParameter("auctionNum");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (auctionNum == null || auctionNum.isEmpty()) {
            response.getWriter().write("거래번호가 없습니다.");
            return;
        }

        // Auction number로 buyerId와 sellerId 조회 (Map으로 받아옴)
        Map<String, Object> auctionDetails = companyBlacklistRepository.getComAuctionDetailsByAuctionNum(Integer.parseInt(auctionNum));

        if (auctionDetails == null) {
            response.getWriter().write("상세 페이지가 없습니다.");
            return;
        }

        String buyerId = (String) auctionDetails.get("buyerId");   // declCom에 들어갈 값
        String sellerId = (String) auctionDetails.get("sellerId"); // blackPerson에 들어갈 값
        int transactionNum = (Integer) auctionDetails.get("transactionNum");
        int bidNum = (Integer) auctionDetails.get("bidNum");

        // Blacklist 객체 생성 및 값 설정
        BlackList blacklist = new BlackList();
        blacklist.setDeclCom(buyerId);           // declCom
        blacklist.setBlackPerson(sellerId);      // blackPerson
        blacklist.setTransactionNum(transactionNum); // transactionNum
        blacklist.setBidNum(bidNum);             // bidNum
        blacklist.setTitle(title);               // 제목
        blacklist.setContent(content);           // 신고 내용
        blacklist.setRoleType("B");              // 역할 유형

        // Blacklist 테이블에 데이터 삽입
        boolean isSuccess = companyBlacklistRepository.addToComBlacklist(blacklist);

        if (!isSuccess) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 서버 오류
        } else {
            response.setStatus(HttpServletResponse.SC_OK); // 성공 응답
        }
    }
}
