package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AuctionSchedulerService;
import service.AuctionSchedulerServiceImpl;

@WebServlet("/startScheduler")
public class AuctionSchedulerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private AuctionSchedulerService auctionSchedulerService = new AuctionSchedulerServiceImpl();

    @Override
    public void init() throws ServletException {
    	super.init();
        // 서버 시작 시 스케줄러 실행
        auctionSchedulerService.startScheduler();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 수동으로 스케줄러 실행
        auctionSchedulerService.startScheduler();
        response.getWriter().println("Auction Scheduler started successfully!");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
