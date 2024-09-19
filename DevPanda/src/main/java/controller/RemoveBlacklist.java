package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.blacklist.CompanyBlacklistRepository;

@WebServlet("/removeBlacklist")
public class RemoveBlacklist extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String blackId = request.getParameter("blackNum");
		System.out.println(blackId);

		CompanyBlacklistRepository blacklistRepository = new CompanyBlacklistRepository();
		boolean isDeleted = blacklistRepository.removeBlacklistById(Integer.parseInt(blackId));

		// 삭제 성공 여부에 따라 응답 전송
		if (isDeleted) {
			response.getWriter().write("success");
		} else {
			response.getWriter().write("failure");
		}

	}
}