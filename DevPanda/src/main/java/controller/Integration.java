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
 * Servlet implementation class Integration
 */
@WebServlet("/Integration")
public class Integration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Integration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//공통
		Integer page = 1;
		 String pageNum = request.getParameter("page");
		 if(pageNum!=null && !pageNum.isEmpty()) { 
			 page = Integer.parseInt(pageNum); 		 
		 }
		 
		//임의의  test 로그인 id 
		 String id ="abc007";
		 

	   // num 파라미터 값 (month 값)
       String numStr = request.getParameter("num");
       Integer month = (numStr != null && !numStr.isEmpty()) ? Integer.parseInt(numStr) : null;
       
       // startDate와 endDate 파라미터 값
       String startDate = request.getParameter("startDate");
       String endDate = request.getParameter("endDate");
       
       // calcMonthBidList 기본 날짜 설정 (오늘 날짜)
       LocalDate now = LocalDate.now();
       String nowStr = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
       String pastDateStr = null;
       

       
		//조건에 따른 서비스 호출 : 기본/날짜계산
		 try {
				PageInfo pageInfo = new PageInfo();
				pageInfo.setCurPage(page);			
				BidService service = new BidServiceImpl();
				List<Map> bidBuyList;
		       
				// datePicker-> startDate와 endDate가 있는 경우 그 값을 사용
		       if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
		           pastDateStr = startDate;  // startDate를 과거 날짜로 사용
		           nowStr = endDate;  // endDate를 현재 날짜로 사용
		           bidBuyList = service.bidListAllWithCalDate(pageInfo,id, nowStr, pastDateStr);
		          
		       }
		       // 1,3,6 계산 -> startDate, endDate가 없으면 month 값을 기준으로 날짜 계산
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
		           bidBuyList = service.bidListAllWithCalDate(pageInfo,id, nowStr, pastDateStr);
		         
		       }else {
		    	   
		    	   //기본 전체 리스트 
		    	   bidBuyList = service.bidListAll(pageInfo,id);
		       }
			   request.setAttribute("maxPage",pageInfo.getAllPage());
			 
			
			//데이터가 존재하지 않음
			if(bidBuyList == null || bidBuyList.isEmpty()) {
				request.setAttribute("maxPage",0);
				   if (page == 1) {
	                    request.getRequestDispatcher("view/buyer/pNcBuyBidList.jsp").forward(request, response);
	                } else {
	                    response.getWriter().write("[]");
	                }
	                return;
	            }

	            
			// 기본으로 6개까지는 리스트가 떠야함
			if (page == 1) {
				request.setAttribute("buyBidList", bidBuyList);
				request.getRequestDispatcher("view/buyer/pNcBuyBidList.jsp").forward(request, response);

			} else {

			// 더보기 버튼을 위해 JSON형식으로 데이터 변환
				Gson gson = new Gson();
				String jsonBidList = gson.toJson(bidBuyList);
				System.out.println(jsonBidList);  // 서버 콘솔에 출력하여 JSON 데이터 확인
				response.setCharacterEncoding("utf-8");
                response.getWriter().write(jsonBidList);
			}			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
