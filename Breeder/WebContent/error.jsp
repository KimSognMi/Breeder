<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ERROR</title>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
<%
   String title = (String)request.getAttribute("title");
   String link = (String)request.getAttribute("link");
%>
<h2><%= title %></h2>
<hr>    
<a href="<%= link %>">바로가기</a>
</body>
</html>