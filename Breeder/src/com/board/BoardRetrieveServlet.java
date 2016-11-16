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
import com.service.CommentService;
import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.CommentPageDTO;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardRetrieveServlet")
public class BoardRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		BoardService service = new BoardService();
		
		BoardDTO dto = service.retrieve(num);
		
		request.setAttribute("retrieve", dto);
		
		String curPage = request.getParameter("curPage");
		if(curPage==null){
			curPage="1";
		}
		
		
		String num2 = request.getParameter("num");
		CommentService service2 = new CommentService();
		List<CommentDTO> dto2 = 
				service2.list(Integer.parseInt(num2));
		String commentNum = request.getParameter("commentNum");
	
		
		request.setAttribute("commentlist", dto2);

		RequestDispatcher dis =
		request.getRequestDispatcher("retrieve.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





