package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import service.BuyerBlackListService;
import service.BuyerBlackListServiceImpl;

/**
 * Servlet implementation class BuyPersonDeleteSellerBlack
 */
@WebServlet("/buyPersonDeleteSellerBlack")
public class BuyPersonDeleteSellerBlack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyPersonDeleteSellerBlack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		Map<String, Object> jsonResponse = new HashMap<>();
		Gson gson = new Gson();
		try {
			Integer blackNum = Integer.parseInt(request.getParameter("blackNum"));
			BuyerBlackListService service = new BuyerBlackListServiceImpl();
			boolean result = service.buyerPersonDeleteSellerBlack(blackNum);
			if(result) {
	            jsonResponse.put("success", true);
	            jsonResponse.put("message", "차단이 성공적으로 해제되었습니다.");
			}else {
				jsonResponse.put("message", "차단 해제에 실패했습니다.");
            }
			 String jsonString = gson.toJson(jsonResponse);
		     response.getWriter().write(jsonString);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
