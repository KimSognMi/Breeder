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
import com.service.MemberService;
import com.dto.BoardDTO;
import com.dto.MemberPageDTO;
import com.dto.MemberPetPageDTO;
import com.dto.PageDTO;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/MemberSearchServlet")
public class MemberSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String curPage = request.getParameter("curPage");
		if(curPage == null){
			curPage = "1";
		}
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");

		MemberService service = new MemberService();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);

		MemberPetPageDTO dto = service.search(Integer.parseInt(curPage), map);

		request.setAttribute("page", dto);

		System.out.println(dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("memberlist.jsp");
		dis.forward(request, response);
	}// end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
