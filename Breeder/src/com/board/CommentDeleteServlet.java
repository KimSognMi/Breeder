package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.CommentService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/CommentDeleteServlet")
public class CommentDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("CommentDeleteServlet");
		String num = request.getParameter("num");
		String commentNum = request.getParameter("commentNum");
		
		
		System.out.println(num);
		System.out.println(commentNum);
		
		CommentService service = new CommentService();
		service.delete(commentNum);
		
		
		response.sendRedirect("BoardRetrieveServlet?num="+num);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





