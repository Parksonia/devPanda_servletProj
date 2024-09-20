package controller.blacklist;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BuyerBlackListService;
import service.BuyerBlackListServiceImpl;

/**
 * Servlet implementation class BuyerPersonBlack
 */
@WebServlet("/buyerPersonBlack")
public class BuyerPersonBlack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerPersonBlack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {			
			Map<String, Object> blistMap = new HashMap<>();
			blistMap.put("declPerson", request.getParameter("sellerId"));
			blistMap.put("transactionNum", Integer.parseInt(request.getParameter("transactionNum")));
			blistMap.put("bidNum", Integer.parseInt(request.getParameter("bidNum")));
			blistMap.put("blackPerson", request.getParameter("buyerId"));
			blistMap.put("title", request.getParameter("title"));
			blistMap.put("content", request.getParameter("content"));
			blistMap.put("roleType", "S");
			
			//System.out.println(blistMap);
			
			BuyerBlackListService blackService = new BuyerBlackListServiceImpl();
			blackService.insertBuyerPersonBlack(blistMap);
			request.setAttribute("blistMap", blistMap); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
