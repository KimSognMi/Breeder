package com.pet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.MemberPetSearchDTO;
import com.dto.PetDTO;
import com.exception.CommonException;
import com.service.MemberService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/PetSearchServlet")
public class PetSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 나중에 필터로 설정하기
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		PetDTO petdto = (PetDTO) session.getAttribute("List");
		System.out.println("petdto" + "-->" + petdto);
		String target = "";
		String title = "";
		ArrayList<MemberPetSearchDTO> list = new ArrayList<MemberPetSearchDTO>();
	
		//검색 사용시 searchId input tag name 쓰면 동작하게될 부분
		String searchid = request.getParameter("searchId");
		
		if(dto == null){
			//로그인 페이지로 리다이렉트
			response.sendRedirect("LoginFormServlet");
			return;
		}
		
		if (dto != null) {
			//사용자 정보 마지막 표시될 정보 기준 userid
			
			MemberPetSearchDTO mpdto = new MemberPetSearchDTO();
			String userid = dto.getUserid();
			String p_gender = mpdto.getP_gender();
			String p_type = mpdto.getP_type();
			String p_photo = mpdto.getP_photo();
			int p_num = mpdto.getP_num();

			MemberService service = new MemberService();
			target = "nearmedog.jsp";
			try {
				MemberDTO searchhome = null;

				MemberDTO myhome = service.nearmedog(userid);
				String keyword = myhome.getAddr1().substring(0, 6);
				
				//사용자 기준 정보 토대로 주소의 6자dsfsdf리까지 잘라서 해당 기준으로 검색하여 맵에 표시

				list = (ArrayList<MemberPetSearchDTO>) service.memberListByCity(keyword, p_gender, p_type, p_photo);

				if (list.size() > 0) {
					System.out.println("주변 사용자 수 : " + list.size());
					request.setAttribute("nearmedoglist", list);
				}
				if (searchid != null && searchid.trim().length() != 0) {
					searchhome = service.nearmedog(searchid);
				}
				System.out.println(">>>>>>" + searchhome);
				request.setAttribute("nearmedog", myhome);
				System.out.println("nearmedog" + myhome);
				request.setAttribute("nearmeSdog", searchhome);
				request.setAttribute("mode", "base");
				System.out.println("nearmeSdog" + searchhome);
			} catch (CommonException e) {
				String link = "LoginFormServlet";
				target = "error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}
			RequestDispatcher dis = request.getRequestDispatcher(target);
			dis.forward(request, response);
		} else {
		
			String link = "LoginFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
			RequestDispatcher dis = request.getRequestDispatcher(target);
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}