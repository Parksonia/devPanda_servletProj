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
	private static final String UPLOAD_DIRECTORY = "upload"; // 업로드 디렉토리

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("file"); // 쿼리 파라미터에서 파일 이름 가져오기
		System.out.println("Requested file: " + fileName);
		String filePath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY + "/" + fileName; // 파일 경로 설정
		System.out.println("File path: " + filePath);

		File file = new File(filePath);
		if (file.exists()) {
			String mimeType = getServletContext().getMimeType(file.getName());
			if (mimeType == null) {
				mimeType = "application/octet-stream"; // 기본 MIME 타입 설정
			}
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\""); // 다운로드 시 파일
																											// 이름 설정

			try (FileInputStream inStream = new FileInputStream(file);
					OutputStream outStream = response.getOutputStream()) {
				byte[] buffer = new byte[4096];
				int bytesRead;

				while ((bytesRead = inStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found."); // 파일이 존재하지 않을 경우
		}
	}
}
