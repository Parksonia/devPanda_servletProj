package controller.blacklist;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SellerBlackListService;
import service.SellerBlackListServiceImpl;

/**
 * Servlet implementation class BlackList
 */
@WebServlet("/blackList")
public class BlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SellerBlackListService service = new SellerBlackListServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 아이디
		String declPerson = "abc001";
		
		// 페이지
		int page = 1;
		int pageSize = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		try {
			int totalCnt = service.countBlacklistById(declPerson);
			List<Map> personSellerBlackList = service.selectBlacklistById(declPerson, page, pageSize);
			
			int totalPages = (int)Math.ceil((double) totalCnt / pageSize);
			
			request.setAttribute("personSellerBlackList", personSellerBlackList);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", page);
			request.getRequestDispatcher("/view/seller/buyerBlack.jsp?currentPage=blackList").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err","게시글 목록 오류");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
