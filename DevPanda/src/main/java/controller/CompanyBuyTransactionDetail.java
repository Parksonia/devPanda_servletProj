package controller;

import java.io.IOException;
import java.util.HashMap;
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
import dto.Person;
import repository.blacklist.BlacklistRepository;
import repository.blacklist.BlacklistRepositoryImpl;
import repository.transaction.CompanyAuctionBuyerSucRepository;

@WebServlet("/CompanyAuctionBuyerSuc") 
public class CompanyBuyTransactionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Integer auctionNum = Integer.parseInt(request.getParameter("auctionNum"));
        Integer transactionNum = Integer.parseInt(request.getParameter("transactionNum"));
    	CompanyAuctionBuyerSucRepository repository = new CompanyAuctionBuyerSucRepository();

        // DAO를 통해 데이터 가져오기
        Map<String, Object> getCompanyByBuyerId = repository.getCompanyByBuyerId(auctionNum);
        Map<String, Object> getPersonBySellerId = repository.getPersonBySellerId(auctionNum);
        Map<String, Object> getAuctionByAuctionNum = repository.getAuctionByAuctionNum(auctionNum);
        List<Map> getBidsByAuctionNum = repository.getBidsByAuctionNum(auctionNum);
        Map<String, Object> getTransactionByAuctionNum = repository.getTransactionByAuctionNum(auctionNum);
		
		List<Map> getAllBuyerByAuctionNum = repository.getAllBuyerByAuctionNum(auctionNum);
		
		/* List<Map> get */

		// 블랙 리스트 신고 여부 처리 
		BlacklistRepository bkRepo = new BlacklistRepositoryImpl();
		
		String id = "abc001";
		// 세션에서 사용자 ID가져와 사용 예정 
		HttpSession session = request.getSession();
		if (session == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
			dispatcher.forward(request, response);
		}
		String userType = (String)session.getAttribute("userType");
		if(userType.equals("person")) {
			id = ((Person)session.getAttribute("person")).getId();
		} else {
			id = ((Company)session.getAttribute("company")).getId();
		}
		
		HashMap<String, Object> param = new HashMap<>();
		
		param.put("declId", id); 
		param.put("userType",userType);
		param.put("transactionNum", transactionNum);
		boolean isAlreadyReported;
		try {
			isAlreadyReported = bkRepo.isAlreadyReported(param);
			request.setAttribute("isAlreadyReported",isAlreadyReported);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
        // 데이터를 request에 추가
        request.setAttribute("company", getCompanyByBuyerId);
        request.setAttribute("person", getPersonBySellerId);
        request.setAttribute("auction", getAuctionByAuctionNum);
        request.setAttribute("bids", getBidsByAuctionNum);
        request.setAttribute("transaction", getTransactionByAuctionNum);
        request.setAttribute("allBuyer", getAllBuyerByAuctionNum);

        // JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/buyer/companyAuctionBuyerSuc.jsp");
        dispatcher.forward(request, response);
    }
}

