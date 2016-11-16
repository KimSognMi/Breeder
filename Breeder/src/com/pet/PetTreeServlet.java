package com.pet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.PetDTO;
import com.dto.PetTreeDTO;
import com.exception.CommonException;
import com.exception.PetException;
import com.service.MemberService;
import com.service.PetService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/PetTreeServlet")
public class PetTreeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("PetTreeServlet");
		//String userid = request.getParameter("userid");
		HttpSession session = request.getSession();
		MemberDTO dto = 
				(MemberDTO)session.getAttribute("login");
		String p_num = request.getParameter("p_num");
		PetService service = new PetService();
		/*PetTreeDTO dto = request.getParameter("p_num");*/
		
		String target="";
		String title="";
		
		System.out.println(p_num);
		if(dto!=null){
			target="tree.jsp";
			
		
			
			try {
				PetTreeDTO dto2 = service.pettree(p_num);
				System.out.println(">>>>>>"+dto2);
				request.setAttribute("pettree", dto2);
			} catch (PetException e) {
				title= e.getMessage();
				String link="LoginFormServlet";
				target="error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}
			
		}else{
			target="LoginFormServlet";
		}

		RequestDispatcher dis =
				request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
