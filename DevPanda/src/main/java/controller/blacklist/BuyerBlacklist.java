package controller.blacklist;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Person;
import service.SellerBlackListService;
import service.SellerBlackListServiceImpl;

/**
 * Servlet implementation class MyBlackList
 */
@WebServlet("/buyerBlacklist")
public class BuyerBlacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerBlacklist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 아이디
		//String declPerson = "abc001";
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("person") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/start");
			dispatcher.forward(request, response);
		}
		String declPerson = ((Person)session.getAttribute("person")).getId();
		// 페이지
		int page = 1;
		int pageSize = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		try {
			SellerBlackListService service = new SellerBlackListServiceImpl();
			int totalCnt = service.countBlacklistById(declPerson);
			List<Map> buyerBlackList = service.selectBlacklistById(declPerson, page, pageSize);
			int totalPages = (int)Math.ceil((double) totalCnt / 10);
			
			request.setAttribute("buyerBlackList", buyerBlackList);
			request.setAttribute("totalCnt", totalCnt);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", 1);
			request.getRequestDispatcher("/view/seller/buyerBlack.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err","게시글 목록 오류");
		}

	}

}
