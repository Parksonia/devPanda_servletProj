package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Auction;
import dto.Person;
import service.AuctionInsertService;
import service.AuctionInsertServiceImpl;

@WebServlet("/insertAuction")
public class AuctionInsertServlet extends HttpServlet {

    private AuctionInsertService auctionInsertService = new AuctionInsertServiceImpl();
    private static final String UPLOAD_DIRECTORY = "upload";  // 새로 생성할 파일 업로드 디렉토리

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
    	//로그인 회원 정보 조회
    	HttpSession session = request.getSession(false);
    	
		Person person = (Person) session.getAttribute("person");
    	String id = person.getId();
    	
    	
    	// 파일 업로드 폴더 경로 설정
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY;
        
        // 업로드 폴더가 존재하지 않으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // MultipartRequest 객체 생성 (파일 업로드 처리)
        MultipartRequest multipartRequest = new MultipartRequest(
            request,
            uploadPath,
            10 * 1024 * 1024,  // 10MB
            "UTF-8",
            new DefaultFileRenamePolicy()
        );

        System.out.println("Upload Path: " + uploadPath);

        // 폼 데이터 받기
        String title = multipartRequest.getParameter("title");
        int minSalary = Integer.parseInt(multipartRequest.getParameter("minSalary"));
        int maxSalary = Integer.parseInt(multipartRequest.getParameter("maxSalary"));
        String[] locationArray = multipartRequest.getParameterValues("location[]");
        String[] stackArray = multipartRequest.getParameterValues("stack[]");
        String[] occupationArray = multipartRequest.getParameterValues("Occupation[]");
        String[] periodArray = multipartRequest.getParameterValues("period[]");
        String[] educationArray = multipartRequest.getParameterValues("education[]");
        String[] certificationArray = multipartRequest.getParameterValues("Certification[]");
        String[] employmentTypeArray = multipartRequest.getParameterValues("employmentType[]");

        // 파일 처리
        String portfolioFileName = multipartRequest.getFilesystemName("portfolio");

        // 현재 시간과 하루 후의 날짜 계산
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startDate = sdf.format(now);

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.DATE, 1);
        String endDate = sdf.format(calendar.getTime());

        // Auction 객체 생성
        Auction auction = new Auction();
        auction.setTitle(title);
        auction.setMinSalary(minSalary);
        auction.setMaxSalary(maxSalary);
       
        auction.setId(id);
        auction.setStartPrice(0);  // startPrice를 0으로 설정
        auction.setBidMaxPrice(0); // bidMaxPrice를 0으로 설정
        
        auction.setLocation(String.join(",", locationArray));
        auction.setStack(String.join(",", stackArray));
        auction.setOccupation(String.join(",", occupationArray));
        auction.setPeriod(String.join(",", periodArray));
        auction.setEducation(String.join(",", educationArray));
        auction.setCertification(String.join(",", certificationArray));
        auction.setEmploymentType(String.join(",", employmentTypeArray));
        
        // 업로드된 포트폴리오 파일명 설정
        auction.setPortfolio(portfolioFileName);
        
        auction.setStartDate(startDate);
        auction.setEndDate(endDate);
        auction.setState("processing");  // state 필드 설정

        // 데이터베이스에 저장
        auctionInsertService.insertAuction(auction);

        // 페이지 리다이렉트 또는 성공 메시지 표시
        response.sendRedirect(request.getContextPath() + "/auction");
        //response.sendRedirect("/view/main.jsp");  // 경매 등록 성공 후 이동할 페이지
    }
}
