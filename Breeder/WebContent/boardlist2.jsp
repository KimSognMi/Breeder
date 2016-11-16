
<%@page import="com.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<script src="jquery-2.2.3.js"></script>
<script>
	function writesen(f) {
		f.action = "BoardWriteUIServlet";
	}
	
	$(document).ready(function() {

		$("#allCheck").on("change", function(event) {
			console.log(this.checked);
			if (this.checked) {
				$(".check").each(function(idx, element) {
					console.log($(this));
					$(this).attr("checked", "checked");
				});
			} else {
				$(".check").each(function(idx, element) {
					console.log($(this));
					$(this).removeAttr("checked");
				});
			}
		});

	});
</script>
<html>
<head>
<title>SMART BREADER</title>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="sasdftylesheet" href="assets/css/ie9.css" /><![endif]-->
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
				<a href="#menu">Menu</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">

			<c:if test="${sessionScope.login==null}">
				<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet">후기 & 질문</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>
					
				</ul>
				<ul class="actions vertical">
					<li><a href="memberform.jsp" class="button special fit">회원관리</a></li>
					<li><a href="loginform.jsp" class="button fit">LogIn</a></li>
				</ul>
			</c:if>

			<c:if test="${sessionScope.login!=null}">
				
					<c:if test="${login.userid =='adminkongju@naver.com'}">
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
				
				
				 
				</c:if>  
					
						<c:if test="${login.userid!='adminkongju@naver.com'}">
					
						<c:if test="${sessionScope.list.size()!=0}">
					
					<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet">후기 & 질문</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>
					
				</ul>
					
					<ul class="actions vertical">
						<li><a href="MyPetListServlet?userid=${login.userid}" class="button fit">My PET</a></li>
						<li><a href="MyPageServlet" class="button special fit">MyPage</a></li>
						<li><a href="LogOutServlet" class="button fit">LogOut</a></li>
					</ul>
					
				</c:if>
				
				
								

 		
				<c:if test="${sessionScope.list.size()==0}">
				
					<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet">후기 & 질문</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>
					
				</ul>

					<ul class="actions vertical">
						<li><a href="MyPetListServlet?userid=${login.userid}" class="button fit">MyPET Page</a></li>
						<li><a href="MyPageServlet" class="button special fit">MyPage</a></li>
						<li><a href="LogOutServlet" class="button fit">LogOut</a></li>
					</ul>
				
				</c:if>
				
	
					</c:if>
					
		
	</c:if>

			
		</nav>

		<!-- Banner -->
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style3">
			<div class="inner">
				<span class="image"> <img src="images/ff.jpg" alt="" />
				</span>
				<header class="major">
					<h1>Board Manage</h1>
				</header>
				<div class="content">
					<p>
						게시글을 관리합니다.
					</p>
				</div>
			</div>
		</section>


		<div id="main">
			<!-- Table -->

			<section id="three" class="style3">
				<div class="inner">

					<h2 id="content">게시글 보기</h2>
					<div class="content">
						<p>
					<!-- 	<h3>Text</h3> -->
						<form method="post" action="BoardWriteUIServlet">
							<input type="submit" value="글쓰기" />
							<br>
							<br>
							<input type="checkbox" id="allCheck" name="allCheck">
							<label for="allCheck"><strong>전체선택</strong></label>

						</form>
						<div class="table-wrapper">
							<table border="1">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>

								<tr>
								<tbody>
									<c:set var="ppp" value="${page}" />

									<c:forEach var="xxx" items="${ppp.list}" varStatus="status">

										<tr>
										<td><input type="checkbox" name="check" id="check${xxx.num}" class="check" value="${xxx.num}">
											<label for="check">${xxx.num}</label></td>
											<%-- <td>${xxx.num}</td> --%>
											<td><a href="BoardRetrieveServlet?num=${xxx.num}">${xxx.title}</td>
											<td>${xxx.author}</td>
											<td>${xxx.writeday}</td>
											<td>${xxx.readcnt}</td>

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
											PageDTO pageDTO = (PageDTO) request.getAttribute("page");
											int curPage = pageDTO.getCurPage();
											int perPage = pageDTO.getPerPage();
											int totalRecord = pageDTO.getTotalRecord();

											int totalCount = totalRecord / perPage;
											if (totalRecord % perPage != 0)
												totalCount++;

											for (int i = 1; i <= totalCount; i++) {

												if (curPage == i) {
													out.print(i + "&nbsp;");
												} else {
													out.print("<a href='BoardListServlet2?curPage=" + i + "'>" + i + "</a>&nbsp;");
												}

											}
										%>
									</td>
								</div>
							</div>

						</tr>


					</div>

					<tr>
						<form action="BoardSearchServlet" method="get">

							<div class="row uniform">
								<div class="field half">

									<div class="select-wrapper">
										<select name="searchName">
											<option value="title">제목</option>
											<option value="author">작성자</option>
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
				</p>
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