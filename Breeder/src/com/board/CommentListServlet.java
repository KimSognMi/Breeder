package com.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CommentDTO;
import com.dto.CommentPageDTO;
import com.service.CommentService;



/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/CommentListServlet")
public class CommentListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String commentNum = request.getParameter("commentNum");
	
		CommentService service = new CommentService();
		List<CommentDTO> dto = 
				service.list(Integer.parseInt(commentNum));
		
		request.setAttribute("list", dto);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("BoardRetrieveServlet");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





