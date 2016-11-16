<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>SMART BREADER</title>

<script type="text/javascript" src="assets/js/jquery-3.1.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />

<link rel="stylesheet" href="assets/css/joinstyle.css" media="screen"
	title="no title" charset="utf-8">

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
		
		<c:if test="${sessionScope.login==null}">
				<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet">후기 & 질문</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>

				</ul>
				<ul class="actions vertical">
					<li><a href="MemberFormServlet" class="button special fit">회원가입</a></li>
					<li><a href="LoginFormServlet" class="button fit">LogIn</a></li>
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
			 <c:if test="${!empty sessionScope.list}">	 
						<c:if test="${sessionScope.list.size()!=0}">
					<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet">후기 & 질문</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>

				</ul>
					<ul class="actions vertical">
						<li><a href="MyPetListServlet?userid=${login.userid}" class="button fit">MyPET Page</a></li>
					<li><a href="RequestPetListServlet?requestid=${login.userid}" class="button special fit">신청현황</a></li> 
				
						<li><a href="MyPageServlet" class="button special fit">MyPage</a></li>
						<li><a href="LogOutServlet" class="button fit">LogOut</a></li>
					</ul> 
					
				</c:if>
				</c:if> 
				

				<c:if test="${sessionScope.list.size()==0 or empty sessionScope.list}">
				
					<ul class="links">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="about.jsp">ABOUT US</a></li>
					<li><a href="BoardListServlet">후기 & 질문</a></li>
					<li><a href="nearmenow.jsp">편의시설 검색</a></li>
					<li><a href="PetSearchServlet">근처 애견 검색</a></li>

				</ul>
					<ul class="actions vertical">
						<li><a href="PetFormServlet" class="button fit">PET 등록</a></li>
						<li><a href="MyPageServlet" class="button special fit">MyPage</a></li>
						<li><a href="LogOutServlet" class="button fit">LogOut</a></li>
					</ul>
				
				</c:if>
				
	
					</c:if>
					
		
	</c:if>
		</nav>

		<!-- Banner -->
		<!-- Note: The "styleN" class below should matchsdf that of the header element. -->
		<section id="banner" class="style2">
			<div class="inner">
				<span class="image"> <img src="images/dd.jpg" alt="" />
				</span>
				<header class="major">
					<h1>MY PET PAGE</h1>
				</header>
				<div class="content">
					<p>
						${login.username}님이 등록한 펫입니다.
					</p>
					<ul class="actions">
						<li><a href="#two" class="button next scrolly">GO!</a></li>
					</ul>
				</div>
			</div>
		</section>

		<!-- Main -->

		<div id="main">
			<section id="three" class="style3">
				<div class="inner">

					<h2 id="content">MY PET</h2>
					<div class="content">
						<p>
					
						<form method="post" action="PetFormServlet">
							<input type="submit" value="pet 추가" />

						</form>
						<div class="table-wrapper">
							<table border="1">

								<div class="field2">
									<thead>
										<tr>

											<th>kkc 인증번호</th>
											<th>사진</th>
											<th>이름</th>
											<th>종</th>

										</tr>
									</thead>
									<tbody>



										<c:forEach var="xxx" items="${mlist}" varStatus="status">
									<tr>
												<td>${xxx.p_kkcnumber}</td>
												<td><img src="images/${xxx.p_photo}" height="140px" width="250px"/></td>
												<td><a href="MydogServlet?p_num=${xxx.p_num}">${xxx.p_name}</td>
												<td>${xxx.p_type}</td>
											</tr>
										</c:forEach>


									</tbody>

								</div>
							</table>

						</div>

					</div>

				</div>



			</section>

		</div>

		<script type="text/javascript">
			$(document).ready(function() {

				$("form").on("submit", function(event) {
					var p_kkcnumber = $("#p_kkcnumber").val();
					if (p_kkcnumber == '') {
						alert("kkc 등록번호를 입력하세요");
						return false;
					} else if ($("#p_name").val() == '') {
						alert("이름을 입력하세요");
						return false;
					} else if ($("#p_age").val() == '') {
						alert("나이을 입력하세요");
						return false;
					} else if ($("#p_gender").val() == '') {
						alert("성별을 선택하세요");
						return false;
					} else if ($("#p_birth").val() == '') {
						alert("생일을 입력하세요");
						return false;
					} else if ($("#p_type").val() == '') {
						alert("종을 입력하세요");
						return false;
					} else if ($("#p_feature").val() == '') {
						alert("특징을 입력하세요");
						return false;
					} else if ($("#p_photo").val() == '') {
						alert("사진을 등록하세요");
						return false;
					} else {
						//성공
						//alert("회원가입을 환영합니다");
					}

				});

			});
		</script>




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

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>



</body>
</html>




