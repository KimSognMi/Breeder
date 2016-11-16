package com.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BoardService;
import com.dto.BoardDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		String boardCategory = request.getParameter("boardCategory");
		String boardpw = request.getParameter("boardpw");
		
	
		System.out.println(boardCategory);
		System.out.println(title);
		System.out.println(author);
		System.out.println(content);
		System.out.println(boardpw);
		
		
		BoardDTO dto = new BoardDTO();
		
		dto.setUserid(userid);
		dto.setBoardCategory(boardCategory);
		dto.setTitle(title);
		dto.setAuthor(author);
		dto.setContent(content);
		dto.setBoardpw(Integer.parseInt(boardpw));
		
		
		BoardService service = new BoardService();
		service.write(dto);
		
		System.out.println(dto);
		
		response.sendRedirect("BoardListServlet");
		
		
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





