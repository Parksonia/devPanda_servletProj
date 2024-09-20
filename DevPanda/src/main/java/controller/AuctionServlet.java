package controller;

import dto.AuctionAndPerson;
import service.AuctionService;
import service.AuctionServiceImpl;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/auction")
public class AuctionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private AuctionService auctionService;

    @Override
    public void init() throws ServletException {
        auctionService = new AuctionServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String offsetParam = request.getParameter("offset");
            String pageSizeParam = request.getParameter("pageSize");

            int offset = (offsetParam != null && !offsetParam.isEmpty()) ? Integer.parseInt(offsetParam) : 0;
            int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 9;

            if (offset < 0) offset = 0;
            if (pageSize <= 0) pageSize = 9;

            // 필터링 파라미터 가져오기
            String[] location = request.getParameterValues("location[]");
            String[] stack = request.getParameterValues("stack[]");
            String[] Occupation = request.getParameterValues("Occupation[]");
            String[] period = request.getParameterValues("period[]");
            String[] education = request.getParameterValues("education[]");
            String[] Certification = request.getParameterValues("Certification[]");
            String[] employmentType = request.getParameterValues("employmentType[]");
            
         // null 체크 및 필터링 로직 처리
            location = (location != null) ? location : new String[0];
            stack = (stack != null) ? stack : new String[0];
            Occupation = (Occupation != null) ? Occupation : new String[0];
            period = (period != null) ? period : new String[0];
            education = (education != null) ? education : new String[0];
            Certification = (Certification != null) ? Certification : new String[0];
            employmentType = (employmentType != null) ? employmentType : new String[0];
            
            List<AuctionAndPerson> auctions = auctionService.getFilteredAuctionsWithPersonInfo(offset, pageSize,
            		location, stack, Occupation, period, education, Certification, employmentType);

            Gson gson = new Gson();
            String jsonResponse = gson.toJson(auctions);
            System.out.println("Fetching auctions with offset: " + offset + ", pageSize: " + pageSize);
            System.out.println("JSON Response: " + jsonResponse);
            System.out.println("Fetched auctions: " + auctions.size());

            if ("application/json".equals(request.getHeader("Accept"))) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(jsonResponse);
                out.flush();
            } else {
                request.setAttribute("auctions", auctions);
                request.setAttribute("offset", offset);
                request.setAttribute("pageSize", pageSize);
                request.getRequestDispatcher("/view/main.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid offset or pageSize parameter.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal server error occurred.");
        }
    }

}



