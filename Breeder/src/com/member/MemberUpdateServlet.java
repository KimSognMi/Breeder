package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.exception.CommonException;
import com.service.MemberService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//나중에 필터로 설정하기
		request.setCharacterEncoding("UTF-8");
		
		//String m_num = request.getParameter("m_num");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone = request.getParameter("phone");
		
		
		MemberDTO dto =
				new MemberDTO();
		
		dto.setUsername(username);
		dto.setUserid(userid);
		dto.setPasswd(passwd);
		dto.setPost1(post1);
		dto.setPost2(post2);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setPhone(phone);
		
	    MemberService service =
	    		new MemberService();
	    String title="";
	    String target="";
	    try {
			service.updateMember(dto);
			target = "index.jsp";
			request.setAttribute("update", "정상적으로 수정되었습니다.");
		} catch (CommonException e) {
			title= e.getMessage();
			String link="MyPageServlet";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		
		RequestDispatcher dis =
				request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
