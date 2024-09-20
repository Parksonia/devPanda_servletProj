package controller.start;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuctionSchedulerService;
import service.AuctionSchedulerServiceImpl;

@WebServlet("/start")
public class StartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AuctionSchedulerService auctionSchedulerService = new AuctionSchedulerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 스케줄러 시작
        auctionSchedulerService.startScheduler();

        // 로그를 콘솔에 출력 (디버깅 용도)
        System.out.println("Scheduler started.");

        // 페이지 리다이렉트 또는 포워드
        req.getRequestDispatcher("/view/start.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 스케줄러 시작 (POST 요청에도 동일하게 처리)
        auctionSchedulerService.startScheduler();

        // 로그를 콘솔에 출력 (디버깅 용도)
        System.out.println("Scheduler started.");

        // 페이지 리다이렉트 또는 포워드
        req.getRequestDispatcher("/view/start.jsp").forward(req, resp);
    }
}
