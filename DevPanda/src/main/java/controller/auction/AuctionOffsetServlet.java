package controller.auction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.AuctionAndPerson;
import service.AuctionService;
import service.AuctionServiceImpl;

@WebServlet("/auctionoffset")
public class AuctionOffsetServlet extends HttpServlet{

	private static AuctionService auctionService = new AuctionServiceImpl();
	private static Gson gson = new Gson();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InputStream inputStream = request.getInputStream();
		String data = getBody(request);
		System.out.println(data);
		
		
		
		List<AuctionAndPerson> auctions = auctionService.findAllAuctionWithOffset(data);
		if(auctions !=null) {
			if ("application/json".equals(request.getHeader("Accept"))) {
				
	            String jsonResponse = gson.toJson(auctions);
				response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(jsonResponse);
                out.flush();
            } else {
                request.setAttribute("auctions", auctions);
                System.out.println(auctions);
                request.getRequestDispatcher("/view/main2.jsp").forward(request, response);
            }
		}
		
	}
	
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String data = request.getParameter("param");
		
		System.out.println(data);
		
		
		
		List<AuctionAndPerson> auctions = auctionService.findAllAuctionWithOffset(data);
		
		if(auctions !=null) {
			
			System.out.println(auctions);	
            String jsonResponse = gson.toJson(auctions);
			response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            
            
		}
	}






	public static String getBody(HttpServletRequest request) throws IOException {
	    // 요청의 인코딩 설정
	    request.setCharacterEncoding("UTF-8");

	    String body = null;
	    StringBuilder stringBuilder = new StringBuilder();
	    BufferedReader bufferedReader = null;

	    try {
	        InputStream inputStream = request.getInputStream();
	        if (inputStream != null) {
	            // UTF-8 인코딩을 명시적으로 설정
	            bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
	            char[] charBuffer = new char[128];
	            int bytesRead;
	            while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                stringBuilder.append(charBuffer, 0, bytesRead);
	            }
	        }
	    } catch (IOException ex) {
	        throw ex;
	    } finally {
	        if (bufferedReader != null) {
	            try {
	                bufferedReader.close();
	            } catch (IOException ex) {
	                throw ex;
	            }
	        }
	    }

	    body = stringBuilder.toString();
	    return body;
	}


}
