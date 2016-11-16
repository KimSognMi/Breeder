package com.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BoardService;
import com.dto.BoardDTO;
import com.dto.PageDTO;

@WebServlet("/BoardHSearchServlet")
public class BoardHSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("BoardHSearchServlet");
		request.setCharacterEncoding("UTF-8");
		String curPage = request.getParameter("curPage");
		if(curPage == null){
			curPage = "1";
		}
		
		
		BoardService service = new BoardService();
		
		
		PageDTO dto = service.Hsearch(Integer.parseInt(curPage));

		request.setAttribute("page", dto);

		System.out.println(dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("boardlist.jsp");
		dis.forward(request, response);
	}// end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
