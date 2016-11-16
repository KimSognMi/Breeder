package com.pet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ApplyPetDTO;
import com.dto.MemberDTO;
import com.dto.PetDTO;
import com.dto.RequestPetDTO;
import com.exception.CommonException;
import com.exception.PetException;
import com.service.MemberService;
import com.service.PetService;
import com.service.RequestService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/AnswerPetServlet")
public class AnswerPetServlet extends HttpServlet {

		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			HttpSession session = request.getSession();
			MemberDTO dto = 
					(MemberDTO)session.getAttribute("login");
			String target="";
			String title="";
			
			String r_num = request.getParameter("r_num");
			
			if(dto!=null){
				target="answerpet.jsp";
				
			
				RequestService service = new RequestService();
				try {
					ApplyPetDTO my = service.yourpage(r_num);
					System.out.println("yourdog"+my);
					request.setAttribute("yourdog", my);
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