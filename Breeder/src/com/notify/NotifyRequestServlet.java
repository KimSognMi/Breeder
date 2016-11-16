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
@WebServlet("/NotifyRequestServlet")
public class NotifyRequestServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String notifyReason = request.getParameter("notifyReason");
		
		String notifyContent = request.getParameter("notifyContent");
		String notifyrequest = request.getParameter("notifyrequest");
	

		System.out.println(userid);
		System.out.println(username);
		System.out.println(notifyReason);
	
		System.out.println(notifyContent);
		System.out.println(notifyrequest);
		
		NotifyDTO dto = new NotifyDTO();
		
		dto.setNotifyReason(notifyReason);
		dto.setUsername(username);
		dto.setUserid(userid);
		dto.setNotifyContent(notifyContent);
		dto.setNotifyrequest(notifyrequest);
		
		
		NotifyService service = new NotifyService();
		try {
			service.addNotify(dto);
			request.setAttribute("result", "success");
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("idresult", "success");
		}
		

		
		RequestDispatcher dis =
				request.getRequestDispatcher("singopolice.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
