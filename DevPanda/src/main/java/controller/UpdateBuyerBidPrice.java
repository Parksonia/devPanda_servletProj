package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

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
		String userType="company";
		//String myId = "abc001";
//		String userType = (String)session.getAttribute("userType");
//		if(userType.equals("person")) {
//			id = ((Person)session.getAttribute("person")).getId();
//		} else {
//			id = ((Company)session.getAttribute("company")).getId();
//		}
		
		BidService service = new BidServiceImpl();
		boolean result =  service.updateMyBidPrice(auctionNum,bidNum,newBidPrice,maxSalary,sellerId,myId,userType);
		response.getWriter().write(String.valueOf(result));
		
		}catch(Exception e) {
			e.printStackTrace();
	
		}
	
	}
}