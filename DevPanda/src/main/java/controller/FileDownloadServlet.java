package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class FileDownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "upload";  // 새로 생성할 파일 업로드 디렉토리


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String fileName = request.getParameter("file");
	    String filePath = getServletContext().getRealPath("/") + "upload/" + fileName; // 수정된 경로

	    File file = new File(filePath);
	    if (file.exists()) {
	        response.setContentType("application/pdf");
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

	        try (FileInputStream inStream = new FileInputStream(file);
	             OutputStream outStream = response.getOutputStream()) {
	            byte[] buffer = new byte[4096];
	            int bytesRead;

	            while ((bytesRead = inStream.read(buffer)) != -1) {
	                outStream.write(buffer, 0, bytesRead);
	            }
	        }
	    } else {
	        response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found.");
	    }
	}

}
