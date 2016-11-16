
<%@page import="com.dto.MemberPetSearchDTO"%>
<%@page import="com.service.MemberService"%>
<%@page import="java.util.List"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");
	String p_gender = request.getParameter("p_gender");
	String p_type = request.getParameter("p_type");

	MemberService service = new MemberService();
	List<MemberPetSearchDTO> arrlist = (ArrayList<MemberPetSearchDTO>) service.memberListByCity(keyword,
			p_gender, p_type, "");
	int arrsize = arrlist.size();
	String condition = "[";

	for (int i = 0; i < arrsize; i++) {
		MemberPetSearchDTO mpdto = arrlist.get(i);
		
		String userid = mpdto.getUserid();
		String kkcnumber = mpdto.getP_kkcnumber();
		String p_name = mpdto.getP_name();
		int p_age = mpdto.getP_age();
		String p_addr = mpdto.getAddr1();
		String p_photo = mpdto.getP_photo();
		int p_num = mpdto.getP_num();
		System.out.println(arrlist.get(i));
		condition += "{" + "\"" + "userid" + "\"" + ":" + "\"" + userid + "\"" + "," + "\"" + "kkcnumber" + "\""
				+ ":" + "\"" + kkcnumber + "\"" + "," + "\"" + "p_name" + "\"" + ":" + "\"" + p_name + "\""
				+ "," + "\"" + "p_age" + "\"" + ":" + "\"" + p_age + "\"" + "," + "\"" + "p_gender" + "\"" + ":"
				+ "\"" + p_gender + "\"" + "," + "\"" + "p_type" + "\"" + ":" + "\"" + p_type + "\"" + ","
				+ "\"" + "p_addr" + "\"" + ":" + "\"" + p_addr + "\"" + "," + "\"" + "p_photo" + "\"" + ":"
				+ "\"" + p_photo + "\"" + "," + "\"" + "p_num" + "\"" + ":" + "\"" + p_num + "\"" + "}";
		if (i < arrsize - 1) {
			condition += ",";
		}
	}

	condition += "]";
%>
<%=condition%>
