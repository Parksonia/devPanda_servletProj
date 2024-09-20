package controller;

import java.io.IOException;
import java.net.URLEncoder;
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
import service.BidService;
import service.BidServiceImpl;


@WebServlet("/updateBuyerBidPrice")
public class UpdateBuyerBidPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateBuyerBidPrice() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
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
		String sellerImage = (String)jsonObj.get("sellerImage");

	
		
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

		BidService service = new BidServiceImpl();
		boolean result =  service.updateMyBidPrice(auctionNum,bidNum,newBidPrice);
		Gson gson = new Gson();
		Map<String, Object> jsonResponse = new HashMap<>();
		
	    if(result) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "입찰 금액이 성공적으로 변경되었습니다.");
            String redirectUrl = request.getContextPath() + "/nowAuctionBuyer?" +
                    "auctionNum=" + auctionNum +
                    "&bidNum=" + bidNum +
                    "&bidPrice=" + newBidPrice +
                    "&sellerImage=" + URLEncoder.encode(sellerImage, "UTF-8");
            jsonResponse.put("redirectUrl", redirectUrl);
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "입찰 금액 변경에 실패했습니다.");
        }
		
	    String jsonString = gson.toJson(jsonResponse);
        response.getWriter().write(jsonString);
		
		}catch(Exception e) {
			e.printStackTrace();
			
	
		}
	
	}
}