
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
<!--[if lte IE 8]><link rel="styleshesdfet" href="assasdfets/css/ie8.css" /><![endif]-->
</head> 
<body>
 
<%--  <c:if test="${result!=null }">
 <script type="text/javascript">
     alert("회원가입을 환영합니다.");fdff
  </script>
  </c:if> --%>
    
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt">
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
					<li><a href="LoginFormServlet">후기 & 질문</a></li>
					<li><a href="LoginFormServlet">편의시설 검색</a></li>
					<li><a href="LoginFormServlet">근처 애견 검색</a></li>
				
				</ul>
				<ul class="actions vertical">
					<li><a href="MemberFormServlet" class="button special fit">회원가입</a></li>
					<li><a href="LoginFormServlet" class="button fit">로그인</a></li>
				</ul>
			</c:if>

			<c:if test="${sessionScope.login!=null}">
				
					<c:if test="${login.userid =='adminkongju@naver.com'}">관리자계정
						<ul class="links">
							<li><a href="index.jsp">HOME</a></li>
							<li><a href="about.jsp">ABOUT US</a></li>
							<li><a href="BoardListServlet2">BOARD</a></li>
							<li><a href="PetCafeFormServlet">NEAR ME NOW</a></li>
							<li><a href="PetSearchServlet">NEAR ME DOG</a></li>
						
						</ul>
						<ul class="actions vertical">
							<li><a href="MemberListServlet" class="button special fit">Manage Member</a></li>
							<li><a href="LogOutServlet" class="button fit">Log Out</a></li>
						</ul>
				
				
				       
				</c:if>  
			
						<c:if test="${login.userid!='adminkongju@naver.com'}">
			 <c:if test="${!empty sessionScope.list}">	 
						<c:if test="${sessionScope.list.size()!=0}">
					<ul class="links">
						<li><a href="index.jsp">HOME</a></li>
						<li><a href="about.jsp">ABOUT US</a></li>
		
						<li><a href="BoardListServlet">후기 & 질문</a></li>
						<li><a href="PetCafeFormServlet">편의시설 검색</a></li>
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
						<li><a href="BoardListServlet">BOARD</a></li>
						<li><a href="PetCafeFormServlet">NEAR ME NOW</a></li>
						<li><a href="PetSearchServlet">NEAR ME DOG</a></li>
						
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
		<section id="banner" class="major">
			<div class="inner">
				<header class="major">
					<h1>Hi, my name is BREEDER</h1>
				</header>
				<div class="content">
					<p>
						안녕하세요<br> SMART BREEDER
					</p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">Get
								Started</a></li>
					</ul>  
				</div>
			</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image"> <img src="images/pp.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="about.jsp" class="link">ABOUT US</a>
						</h3>
						<p>우리는 SMART BREEDER 입니다</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/aa.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="BoardListServlet" class="link">BOARD</a>
						</h3>
						<p>여기는 게시판입니다</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/bb.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="PetCafeFormServlet" class="link">NEAR ME NOW</a>
						</h3>
						<p>근처의 편의시설을 찾아보세요</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/uu.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="PetSearchServlet" class="link">NEAR ME DOG</a>
						</h3>
						<p>반려견의 짝을 찾아보세요</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/gg.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="MyPetListServlet?userid=${login.userid}" class="link">MYPET</a>
						</h3>
						<p>등록된 반려견을 볼 수 있어요</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/hh.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="RequestPetListServlet?requestid=${login.userid}" class="link">PET-REQUEST</a>
						</h3>
						<p>신청 현황을 확인하세요</p>
					</header>
				</article>
			</section>

			<!-- Two --
							<section id="two">
								<div class="inner">
									<header class="major">
										<h2>Massa libero</h2>
									</header>
									<p>Nullam et orci eu lorem consequat tincidunt vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus pharetra. Pellentesque condimentum sem. In efficitur ligula tate urna. Maecenas laoreet massa vel lacinia pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus amet pharetra et feugiat tempus.</p>
									<ul class="actions">
										<li><a href="landing.html" class="button next">Get Started</a></li>
									</ul>
								</div>
							</section>  -->

		</div>


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
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>