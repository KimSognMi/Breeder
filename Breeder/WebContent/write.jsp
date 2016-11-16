<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>


<html>
<head>
<title>Landing - Forty by HTML5 UP</title>
<meta charset="utf-8" />
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
		<!-- Note: The "styleN" class below should msdfatch that of the banner element. -->
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
				
					<c:if test="${login.userid =='adminkongju@naver.com'}">관리자계정
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
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style4">
			<div class="inner">
				<span class="image"> <img src="images/rr.jpg" alt="" />
				</span>
				<header class="major">
					<h1>Welcome</h1>
				</header>
				<div class="content">
					<p>Please login.</p>
				</div>
			</div>
		</section>

		<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="jquery-2.2.3.js"></script>
<title>글쓰기</title>
<style>
h1 {
	text-align: center;
}
</style>
<script>
	$(document).ready(function() {
		$("form").on("submit", function() {
			/* /* 공백 입력 못하도록 유효성 검가 */
			/* if ("" == $(".inputTitle").val()) {
				$(".titleHelper").text("제목을 입력해주세요");
				$(".contentHelper").text("");
				$(".pwHelper").text("");
			} else if ("" == $(".inputContent").val()) {
				$(".titleHelper").text("");
				$(".contentHelper").text("내용을 입력해주세요");
				$(".pwHelper").text("");
			} else if ("" == $(".inputPw").val()) {
				$(".titleHelper").text("");
				$(".contentHelper").text("");
				$(".pwHelper").text("비밀번호를 입력해주세요");
				/* } else if($(".inputPw").val() == ${retrieve.boardpw}){
					
				} */

			/*} else {
				alert("정상 등록되었습니다."); */
			/*} */
			
			 
			if($("#title").val()==''){
				alert("title 입력");
			
			}else if($("#content").val()==''){
				alert("content 입력");
			}else if($("#boardpw1").val()==''){
				alert("boardpw 입력");
		
			}else{
				alert("글등록완료")
			} 

		});
		$(".cancelBtn").on("click", function() {
			/* 클릭시 여기로 이동 */

			var url = "boardlist.jsp";
			$(location).attr("href", url);

		});

		$(".radioClick").click(function() {
			var boardCategory = document.getElementsByName("boardCategory");
			var str = "";
			for (var i = 0; i < boardCategory.length; i++) {
				var c = boardCategory[i];
				if (c.checked) {
					str += c.value + "&nbsp;"
				}
			}
			console.log(str);
			document.getElementById("title").innerHtml = str;

		});

	});
</script>
		</head>
		<body>
			<form action="BoardWriteServlet" method="post">
				<c:if test="${login.userid!='adminkongju@naver.com'}">
					<a href="BoardListServlet">목록보기</a>
				</c:if>
				<c:if test="${login.userid=='adminkongju@naver.com'}">
					<a href="BoardListServlet2">목록보기</a>
				</c:if>
				<div>
					<h1>게시글 등록</h1>
					<c:set var="write" value="${write}" scope="session"/>
					<input type="hidden" name="author" value="${login.username}">
					<input type="hidden" name="userid" value="${login.userid}">
				</div>
				<br> <br>
				<div class="field2">


					<div class="col-md-1">카테고리</div>

					<div class="field half" style="width: 150px;">

						<input type="radio" class="radioClick" id="boardCategory"
							name="boardCategory" value="후기글" checked> <label
							for="boardCategory">후기글</label>
					</div>
					<div class="field half" style="width: 150px;">
						<input type="radio" class="radioClick" id="boardCategory1"
							name="boardCategory" value="질문글"> <label
							for="boardCategory1">질문글</label>
					</div>
					<br> <br>
				</div>

				<div class="field2">
					<div class="col-md-3"></div>
					<div class="col-md-1">제목</div>
					<div class="col-md-5">
						<c:if test="${login.userid=='adminkongju@naver.com'}">
							<a href="BoardListServlet2">목록보기</a>
						</c:if>

						<input class="inputDisplay" type="text" id="title" name="title" id="title">
					</div>
					<div class="col-md-3 titleHelper"></div>
				</div>
				<br>

				<div class="field2">
					<div class="col-md-3"></div>
					<div class="col-md-1">내용</div>
					<div class="col-md-5">
						<textarea class="form-control inputTitle" id="content" name="content" rows=20></textarea>
					</div>
					<div class="col-md-3 contentHelper"></div>
				</div>
				<br>

				<div class="field2">
					<div class="col-md-3"></div>
					<div class="col-md-1">비밀번호</div>
					<div class="col-md-2">
						<input class="form-control inputPw" type="password" id="boardpw1" name="boardpw">
					</div>
					<div class="col-md-3 pwHelper"></div>
					<div class="col-md-3"></div>
				</div>
				<br>

				<div class="field2">
					<div class="col-md-3"></div>
					<div class="col-md-1"></div>
					<ul class="actions">
					<center>
						<li><input type="submit" value="등록" class="special" /></li>
						 &nbsp;&nbsp;&nbsp;&nbsp;<li><input type="reset" value="취소" /></li></center>
					</ul>

					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
				</div>
			</form>
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