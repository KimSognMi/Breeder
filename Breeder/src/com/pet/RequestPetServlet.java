package com.pet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BoardDTO;
import com.dto.MemberPetPageDTO;
import com.dto.RequestDTO;
import com.dto.RequestPetDTO;
import com.exception.CommonException;
import com.service.BoardService;
import com.service.RequestService;
import com.sms.SendSMS;

@WebServlet("/RequestPetServlet")
public class RequestPetServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RequestPetServlet");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		String userid = request.getParameter("userid");
		String p_num = request.getParameter("p_num");
		String r_content = request.getParameter("r_content");
		String agree = request.getParameter("agree");
		String p_name = request.getParameter("p_name");
		String p_age = request.getParameter("p_age");
		String p_type = request.getParameter("p_type");
		String p_gender = request.getParameter("p_gender");
		String p_photo = request.getParameter("p_photo");
		String requestid = request.getParameter("requestid");
		String phone = request.getParameter("phone");

		System.out.println(userid);
		System.out.println(p_num);
		System.out.println(r_content);
		System.out.println(agree);
		System.out.println(p_name);
		System.out.println(p_age);
		System.out.println(p_type);
		System.out.println(p_gender);
		System.out.println(phone);

		RequestDTO dto = new RequestDTO();
		RequestPetDTO dto2 = new RequestPetDTO();

		dto.setP_num(Integer.parseInt(p_num));
		dto.setR_content(r_content);
		dto.setUserid(userid);
		dto.setAgree(agree);
		dto.setRequestid(requestid);

		dto2.setAgree(agree);
		dto2.setUserid(userid);
		dto2.setP_name(p_name);
		dto2.setP_age(Integer.parseInt(p_age));
		dto2.setP_type(p_type);
		dto2.setR_content(r_content);
		dto2.setP_gender(p_gender);
		dto2.setP_num(Integer.parseInt(p_num));
		dto2.setPhone(phone);

		RequestService service = new RequestService();

		String title = "";
		String target = "";
		try {
			service.request(dto);

			session.setAttribute("request", dto);
			System.out.println(requestid);
			List<RequestPetDTO> xxx = service.requestlist2(requestid);

			session.setAttribute("requestlist", xxx);

			System.out.println("사진" + dto2);
			target = "test.jsp";
		} catch (Exception e) {
			title = e.getMessage();
			String link = "MemberFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}

		new SendSMS();

		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
