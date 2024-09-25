package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("do filter!!!");
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp; 
		String uri = request.getRequestURI();
		String[] array = uri.split("/");
		String check = array[2];
		if(check.startsWith("css") 
				|| check.startsWith("img") 
				|| check.startsWith("upload")
				|| check.startsWith("start")
				|| check.startsWith("Person")
				|| check.startsWith("signUpPerson")
				|| check.startsWith("signUpCom")
				|| check.startsWith("Company")
				|| check.startsWith("checkCertification")
				|| check.startsWith("checkId")
				|| check.startsWith("checkCompanyId")
				|| check.startsWith("mailsend")
				
				) {
			
			chain.doFilter(request, response);
			
		}else {
			
			if(request.getSession()==null) {
				response.sendRedirect("/DevPanda/start");
			}else {
				
				if(request.getSession().getAttribute("userType") == null) {
					response.sendRedirect("/DevPanda/start");
				}else {
					
					
					if(request.getSession().getAttribute("userType").equals("person") || request.getSession().getAttribute("userType").equals("company")) {
						chain.doFilter(request, response);
					}else {
						response.sendRedirect("/DevPanda/start");
					}
					
					
				}
				
				
				
				
			}
			
			
			
			
		}
		
		
	}
	
	
	

}
