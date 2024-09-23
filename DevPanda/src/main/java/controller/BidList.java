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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import dto.Company;
import dto.Person;
import service.BidService;
import service.BidServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class BidList
 */
@WebServlet("/bidList")
public class BidList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BidList() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("view/buyer/pNcBuyBidList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		

		// 조건에 따른 서비스 호출 : 기본/날짜계산
		try {
			String param = request.getParameter("param");
			//System.out.println(param);

			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(param);
			Integer page = ((Long)jsonObj.get("page")).intValue();
			
			//System.out.println(page);
			String startDate = (String)jsonObj.get("startDate");
			String endDate = (String)jsonObj.get("endDate");
			
			BidService service = new BidServiceImpl();
			List<Map> bidBuyList;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);

			String id = "comp001";
			//String userType = "company";  // AuthService 에서 userType="P"와 "C"로 저장함 
			
			HttpSession session = request.getSession();
			if(session == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
				dispatcher.forward(request, response);
			}
			String userType = (String)session.getAttribute("userType");
		
			if(userType.equals("person")) {
				id = ((Person)session.getAttribute("person")).getId();
			} else {
				id = ((Company)session.getAttribute("company")).getId();
			}
			
			if(startDate == null) {
				bidBuyList = service.bidListAll(pageInfo, id, userType);
			} else {
				bidBuyList = service.bidListAllWithCalDate(pageInfo, id, endDate, startDate, userType);				
			}
			
			//System.out.println(pageInfo.getAllPage());
			//System.out.println(bidBuyList);

			Map<String, Object> result = new HashMap<>();
			result.put("page", pageInfo.getCurPage());
			result.put("maxPage", pageInfo.getAllPage());
			result.put("bidList", bidBuyList);

			Gson gson = new Gson();
			String jsonResult = gson.toJson(result);
			
			response.getWriter().write(jsonResult);

			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
