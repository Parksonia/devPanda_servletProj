package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import dto.Company;
import dto.Person;
import dto.Transaction;
import service.BidService;
import service.BidServiceImpl;

/**
 * Servlet implementation class UpdateBuyerBidToTransaction
 */
@WebServlet("/updateBuyerBidToTransaction")
public class UpdateBuyerBidToTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBuyerBidToTransaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			
		String param = request.getParameter("param");
		if(param !=null) {
			System.out.println(param);
		}

		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject)parser.parse(param);
		
		Integer auctionNum = ((Long)jsonObj.get("auctionNum")).intValue(); 
		Integer bidNum = ((Long)jsonObj.get("bidNum")).intValue(); 
		Integer newBidPrice = ((Long)jsonObj.get("newBidPrice")).intValue(); 
		Integer maxSalary = ((Long)jsonObj.get("maxSalary")).intValue(); 
		String sellerId = (String)jsonObj.get("sellerId");
		
		//String myId = request.getSession().getId();
		String myId = "comp001";
		HttpSession session = request.getSession();
//		String userType="company";
		//String myId = "abc001";
		String userType = (String)session.getAttribute("userType");
		if(userType.equals("person")) {
			myId = ((Person)session.getAttribute("person")).getId();
		} else {
			myId = ((Company)session.getAttribute("company")).getId();
		}
		
		Transaction transaction = new Transaction();
		transaction.setSellerId(sellerId);
		transaction.setAuctionNum(auctionNum);
		transaction.setBidNum(bidNum);
		transaction.setBuyerId(myId);
		transaction.setPrice(newBidPrice);
		transaction.setState("i");
		if (userType.equals("company")) {
			transaction.setMemType("company");
		} else {
			transaction.setMemType("person");
		}
	
		BidService service = new BidServiceImpl();
		
		if(newBidPrice.equals(maxSalary)) {
			boolean result =  service.updateMyBidToTransactionSuc(transaction,auctionNum,bidNum,newBidPrice);
			Gson gson = new Gson();
			Map<String, Object> jsonResponse = new HashMap<>();
			
			//true return 
			if(result) {
				
                jsonResponse.put("success", true);
                // userType에 따라 다른 URL로 이동 낙찰 리스트 페이지로 이동하기 위함 
                if (userType.equals("company")) {
                    jsonResponse.put("redirectUrl", request.getContextPath() + "/companyBuyTransactions?companyId=" + myId);
                } else {
                    jsonResponse.put("redirectUrl", request.getContextPath() + "/personBuyTransactionList?buyerId=" + myId);
                }
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "즉시 낙찰 처리에 실패했습니다.");
            }
			  String jsonString = gson.toJson(jsonResponse);
			    response.setContentType("application/json");
			    response.getWriter().write(jsonString);
		}else {
			//false return 
			Map<String, Object> jsonResponse = new HashMap<>();
		    jsonResponse.put("success", false);
		    jsonResponse.put("message", "유효하지 않은 입찰가입니다.");
		    String jsonString = new Gson().toJson(jsonResponse);
		    response.setContentType("application/json");
		    response.getWriter().write(jsonString);
		}
		
		}catch(Exception e) {
			e.printStackTrace();
	
		}
	}

}
