package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.BidService;
import service.BidServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class CalcMonthBidList
 */
@WebServlet("/calcMonthBidList")
public class CalcMonthBidList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalcMonthBidList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      // num 파라미터 값 (month 값)
        String numStr = request.getParameter("num");
        Integer month = (numStr != null && !numStr.isEmpty()) ? Integer.parseInt(numStr) : null;
        
        // startDate와 endDate 파라미터 값
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
    	
    	
		Integer page = 1;
		String pageNum = request.getParameter("page");
		if(pageNum!=null && !pageNum.isEmpty()) { 
			 page = Integer.parseInt(pageNum); 
			 
		 }
		 
        
        // 기본 날짜 설정 (오늘 날짜)
        LocalDate now = LocalDate.now();
        String nowStr = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String pastDateStr = null;
        
        // startDate와 endDate가 있는 경우 그 값을 사용
        if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
            pastDateStr = startDate;  // startDate를 과거 날짜로 사용
            nowStr = endDate;  // endDate를 현재 날짜로 사용
        }
        // startDate, endDate가 없으면 month 값을 기준으로 날짜 계산
        else if (month != null) {
            LocalDate pastDate;
            if (month == 1) {
                pastDate = now.minusMonths(1);
            } else if (month == 3) {
                pastDate = now.minusMonths(3);
                System.out.println(pastDate);
            } else {
                pastDate = now.minusMonths(6);
            }
            pastDateStr = pastDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        }
        
       
      	
      	// 서비스 호출
        try {
        	 // 페이지 정보 설정
            PageInfo pageInfo = new PageInfo();
            pageInfo.setCurPage(page);
            //임의의  test 로그인 id 
          	String id ="abc007";
        	BidService service = new BidServiceImpl();
            List<Map> bidBuyList;
        	// 동적 쿼리에 필요한 날짜 범위와 페이지 정보를 서비스로 전달
            bidBuyList = service.bidListAllWithCalDate(pageInfo,id, nowStr, pastDateStr);
    		request.setAttribute("maxPage",pageInfo.getAllPage());
    		
            if(bidBuyList == null) {
            	request.setAttribute("maxPage",0);
            	request.getRequestDispatcher("view/buyer/pNcBuyBidList.jsp").forward(request, response);
            }
            
 

				// 기본으로 6개까지는 리스트가 떠야함
				if (page == 1) {
					request.setAttribute("buyBidList", bidBuyList); 
					request.setAttribute("page", page);
					request.getRequestDispatcher("view/buyer/pNcBuyBidList.jsp").forward(request, response);
				}else {

				// 더보기 버튼을 위해 JSON형식으로 데이터 변환
						Gson gson = new Gson();
						String jsonBidList = gson.toJson(bidBuyList);
						System.out.println(jsonBidList);  // 서버 콘솔에 출력하여 JSON 데이터 확인
						response.setCharacterEncoding("utf-8");
		                response.getWriter().write(jsonBidList);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
