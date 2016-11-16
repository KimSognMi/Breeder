package com.notify;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dto.NotifyDTO;

import com.exception.CommonException;

import com.service.NotifyService;


/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/NotifyServlet")
public class NotifyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String username = request.getParameter("commentParentName");
		

		NotifyDTO dto = new NotifyDTO();
		
		
		dto.setUserid(userid);
		dto.setUsername(username);
		
		request.setAttribute("abcd", dto);
		
		RequestDispatcher dis =
				request.getRequestDispatcher("singopolice.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
