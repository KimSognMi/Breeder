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
import com.service.MemberService;
import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.CommentPageDTO;
import com.dto.MemberDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/MemberRetrieveServlet")
public class MemberRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	
		String userid = request.getParameter("userid");
		MemberService service = new MemberService();
		
		MemberDTO dto;
		try {
			dto = service.mypage(userid);
			request.setAttribute("mypage", dto);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		String curPage = request.getParameter("curPage");
		if(curPage==null){
			curPage="1";
		}
		
		
		
		
		RequestDispatcher dis =
		request.getRequestDispatcher("mypage.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





