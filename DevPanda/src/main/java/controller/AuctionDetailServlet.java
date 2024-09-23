package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AuctionAndPerson;
import dto.Company;
import dto.Person;
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
		System.out.println(auctionAndPerson);
		req.setAttribute("auctionAndPerson", auctionAndPerson);
		req.setAttribute("category", 
				auctionAndPerson.getOccupation()+", "+
				auctionAndPerson.getPeriod()+", "+
				auctionAndPerson.getEducation()+", "+
				auctionAndPerson.getEmploymentType()+", "+
				auctionAndPerson.getStack()+", "+
				auctionAndPerson.getCertification()+", "+
				auctionAndPerson.getLocation());
		req.setAttribute("userType", (String)req.getSession().getAttribute("userType"));
		
		
		if(((String) req.getSession().getAttribute("userType")).equals("person")) {
			req.setAttribute("person", (Person)req.getSession().getAttribute("person"));
		}else {
			req.setAttribute("company", (Company)req.getSession().getAttribute("company"));
		}
		req.getRequestDispatcher("/view/auctionDetail2.jsp").forward(req, resp);
	}

}
