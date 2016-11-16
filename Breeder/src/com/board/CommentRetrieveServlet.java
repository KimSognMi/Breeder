package com.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.service.CommentService;

import com.dto.CommentDTO;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/CommentRetrieveServlet")
public class CommentRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String boardNum = request.getParameter("boardNum");
		String commentNum = request.getParameter("commentNum");
		CommentService service = new CommentService();
		
		
		CommentDTO dto = service.retrieve(commentNum);
		
		request.setAttribute("retrieve2", dto);
		
		RequestDispatcher dis =
		request.getRequestDispatcher("retrieve2.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





