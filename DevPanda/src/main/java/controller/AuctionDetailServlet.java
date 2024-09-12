package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AuctionAndPerson;
import service.AuctionService;
import service.AuctionServiceImpl;

//localhost:8080/DevPanda/auction/detail?auctionNum=1
@WebServlet("/auction/detail")
public class AuctionDetailServlet extends HttpServlet{
	
	
	private AuctionService auctionService = new AuctionServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer auctionNum = Integer.valueOf( req.getParameter("auctionNum"));
		AuctionAndPerson auctionAndPerson = auctionService.findAuctionAndPersonById(auctionNum);
		req.setAttribute("auctionAndPerson", auctionAndPerson);
		req.setAttribute("category", 
				auctionAndPerson.getOccupation()+", "+
				auctionAndPerson.getPeriod()+", "+
				auctionAndPerson.getEducation()+", "+
				auctionAndPerson.getEmploymentType()+", "+
				auctionAndPerson.getStack()+", "+
				auctionAndPerson.getCertification()+", "+
				auctionAndPerson.getLocation());
		req.getRequestDispatcher("/view/auctionDetail2.jsp").forward(req, resp);
	}

}
