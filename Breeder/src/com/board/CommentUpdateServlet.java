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
@WebServlet("/CommentUpdateServlet")
public class CommentUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		String commentNum = request.getParameter("commentNum");
		String commentParentName = request.getParameter("commentParentName");
		String commentParentPassword = request.getParameter("commentParentPassword");
		String commentParentText = request.getParameter("commentParentText");
		String commentwriteday = request.getParameter("commentwriteday");
	
		System.out.println(commentNum);
		System.out.println(commentParentName);
		System.out.println(commentParentPassword);
		System.out.println(commentParentText);
		System.out.println(commentwriteday);

		CommentDTO dto = new CommentDTO();
		dto.setCommentNum(Integer.parseInt(commentNum));
		dto.setCommentParentName(commentParentName);
		dto.setCommentParentPassword(Integer.parseInt(commentParentPassword));
		dto.setCommentParentText(commentParentText);
		dto.setCommentwriteday(commentwriteday);
		
		
		
		CommentService service = new CommentService();
		service.update(dto);
		
		
		response.sendRedirect("BoardRetrieveServlet?num="+num);
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





