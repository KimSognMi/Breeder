
<%@page import="com.dto.MemberPetPageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>

<html>
<head>
<title>SMART BREADER</title>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<!-- Note: The "styleN" class below should match that of the banner element. -->
		<header id="header" class="alt style2">
			<a href="index.jsp" class="logo"><strong>SMART</strong> <span>BREEDER</span></a>
			<nav>
			<c:if test="${sessionScope.login!=null}">
		안녕하세요.  ${login.username}님<p style="color: red">♥</p>
			</c:if>
				&nbsp;<a href="#menu">Menu</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">

<!-- <ul class="links">
							<li><a href="index.jsp">HOME</a></li>
							<li><a href="about.jsp">ABOUT US</a></li>
							<li><a href="BoardListServlet2">BOARD</a></li>
							<li><a href="nearmenow.jsp">NEAR ME NOW</a></li>
							<li><a href="PetSearsdfchServlet">NEAR ME DOG</a></li>
						
						</ul> -->
						<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet2">게시판관리</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>
					
				</ul>
						
						<ul class="actions vertical">
							<li><a href="MemberListServlet" class="button special fit">회원관리</a></li>
							<li><a href="LogOutServlet" class="button fit">LogOut</a></li>
						</ul>
		</nav>

		<!-- Banner -->
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style3">
			<div class="inner">
				<span class="image"> <img src="images/ff.jpg" alt="" />
				</span>
				<header class="major">
					<h1>Board</h1>
				</header>
				<div class="content">
					<p>
						Lorem ipsum dolor sit amet nullam consequat<br /> sed veroeros.
						tempus adipiscing nulla.
					</p>
				</div>
			</div>
		</section>


		<div id="main">
			<!-- Table -->
			<section id="three" class="style3">
				<div class="inner">
					<h2 id="content">회원리스트</h2>
					<div class="content">
						<p>
						<h3>Text</h3>
						<!-- <a href="BoardWriteUIServlet">글쓰기 화면</a> -->
						<div class="table-wrapper">
							<table border="1">
								<thead>
									<tr>
										<th>번호</th>
										<th>이름</th>
										<th>아이디</th>
										<th>펫</th>
										<th>신고</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<c:set var="ppp" value="${page}" />
										<c:forEach var="xxx" items="${ppp.list}" varStatus="status">
									</tr>
									<%-- <input type="hidden" name="passwd" value="${mypage.passwd}"> --%>

									<tr>
										<td>${xxx.m_num}</td>
										<td><a href="MemberRetrieveServlet?userid=${xxx.userid}">${xxx.username}</td>
										<td>${xxx.userid}</td>
										<td>${xxx.p_name}</td>
										<td>${xxx.notifyCount}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<tr>
							<div class="field2" style="height: 100px;">
								<div class="field2">

									<td colspan="5">
										<%
											MemberPetPageDTO memberpetpageDTO = (MemberPetPageDTO) request.getAttribute("page");
											int curPage = memberpetpageDTO.getCurPage();
											int perPage = memberpetpageDTO.getPerPage();
											int totalRecord = memberpetpageDTO.getTotalRecord();

											int totalCount = totalRecord / perPage;
											if (totalRecord % perPage != 0)
												totalCount++;

											for (int i = 1; i <= totalCount; i++) {

												if (curPage == i) {
													out.print(i + "&nbsp;");
												} else {
													out.print("<a href='MemberListServlet?curPage=" + i + "'>" + i + "</a>&nbsp;");
												}

											}
										%>
									</td>
								</div>
							</div>

						</tr>


					</div>
					<tr>
						<form action="MemberSearchServlet" method="get">

							<div class="row uniform">
								<div class="field half">

									<div class="select-wrapper">
										<select name="searchName">
											<option value="username">이름</option>
											<option value="userid">아이디</option>
											<option value="p_name">펫이름</option>
										</select>
									</div>

								</div>

								<div class="field half" style="width: 250px;">

									<input type="text" name="searchValue">

								</div>
								<div class="field half">
									<button>검색</button>
								</div>
							</div>

						</form>

					</tr>
				</div>
				
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon alt fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon alt fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon alt fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon alt fa-github"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon alt fa-linkedin"><span
							class="label">LinkedIn</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Untitled</li>
					<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>

				</ul>
			</div>
		</footer>
	</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>