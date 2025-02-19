package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ImageUtil;

/**
 * Servlet implementation class Image
 */
@WebServlet("/image")
public class Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Image() {
        super(); 
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	request.setCharacterEncoding("utf-8");
    	String file = request.getParameter("file"); 
    	ImageUtil image = new ImageUtil();
    	
    	try {
			image.imageView(request, response.getOutputStream(), file);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    }

}
