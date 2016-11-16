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
<!--[if lte IE 8]><link rel="stylesheet" href="assetssdf/css/ie8.css" /><![endif]-->
</head>
<body class style="font-size:16px;">

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
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style4">
			<div class="inner">
				<span class="image"> <img src="images/rr.jpg" alt="" />
				</span>
				<header class="major">
					<h1>Detail</h1>
				</header>
				<div class="content">
					<p>게시글 수정, 삭제할 수 있습니다.</p>
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
	$(document).on("ready", function() {
		$("#onclick").on("click", function() {
			/* 공백 입력 못하도록 유효성 검가 */
			
			var p3 = $("#boardpw2").val();
			var p4 = ${retrieve.boardpw};
			if (p3 != p4) {
				alert("비밀번호 불일치");
			} else {
				$("form").submit();
			} 

		});
		$(".cancelBtn").on("click", function() {
			/* 클릭시 여기로 이동 */
			var url = "boardlist.jsp";
			$(location).attr("href", url);
		});

		$("#boardpw2").on("keyup", function(event) {
			$("#secret").removeClass();
			var p = $("#boardpw2").val();
			var p2 = ${retrieve.boardpw};

			if (p == p2) {
				$("#secret").text("일치").addClass("blue");
			} else {
				$("#secret").text("불일치").addClass("red");
			}
		});
	});

	function updateBoard(f) {
		f.action = "BoardUpdateServlet";
	}
	function deleteBoard(f) {
		f.action = "BoardDeleteServlet";
	}
	function writeBoard(f) {
		f.action = "CommentWriteServlet";
	}
</script>
		</head>
		<body>
			<div id="main">
				<form method="get" name="myForm">
					<c:if test="${login.userid!='adminkongju@naver.com'}">
						<a href="BoardListServlet">목록보기</a>
					</c:if>
					<c:if test="${login.userid=='adminkongju@naver.com'}">
						<a href="BoardListServlet2">목록보기</a>
					</c:if>
					<input type="hidden" name="num" value="${retrieve.num}">
					글번호:${retrieve.num}&nbsp;작성일:${retrieve.writeday}
					&nbsp;조회수:${retrieve.readcnt}<br>
					<div>
						<h1>${retrieve.boardCategory}내용</h1>

						

					</div>
					<br> <br>
					<div class="field2">

						<div class="col-md-1">카테고리</div>
						<c:if test="${retrieve.boardCategory=='후기글'}">
							<div class="field half" style="width: 150px;">

								<input type="radio" id="demo-priority-low" name="demo-priority"
									checked> <label for="demo-priority-low">후기글</label>
							</div>
							<div class="field half" style="width: 150px;">
								<input type="radio" id="demo-priority-normal"
									name="demo-priority"> <label for="demo-priority-normal">질문글</label>
							</div>
							<br>
							<br>
						</c:if>
						<c:if test="${retrieve.boardCategory=='질문글'}">
							<div class="field half" style="width: 150px;">

								<input type="radio" id="demo-priority-low" name="demo-priority">
								<label for="demo-priority-low">후기글</label>
							</div>
							<div class="field half" style="width: 150px;">
								<input type="radio" id="demo-priority-normal"
									name="demo-priority" checked> <label
									for="demo-priority-normal">질문글</label>
							</div>
							<br>
							<br>
						</c:if>

					</div>
					<div class="field2">

						<div class="col-md-3"></div>
						<div class="col-md-1">제목</div>
						<div class="col-md-5">
							<c:if test="${login.userid != retrieve.userid}">

								<input class="form-control inputTitle" type="text" name="title"
									id="boardtitle" value="${retrieve.title}" readonly="readonly">
							</c:if>
							<c:if test="${login.userid == retrieve.userid}">

								<input class="form-control inputTitle" type="text" name="title"
									id="boardtitle" value="${retrieve.title}">
							</c:if>
						</div>
						<div class="col-md-3 titleHelper"></div>
					</div>


					<br>
					<div class="field2">
						<div class="col-md-3"></div>
						<div class="col-md-1">내용</div>
						<div class="col-md-5">

							<c:if test="${login.userid == retrieve.userid}">
								<textarea class="form-control inputContent" name="content"
									id="content" rows=20>${retrieve.content}</textarea>
							</c:if>
							<c:if test="${login.userid != retrieve.userid}">
								<textarea class="form-control inputContent" name="content"
									id="content" rows=20 readonly="readonly">${retrieve.content}</textarea>
							</c:if>
						</div>
						<div class="col-md-3 contentHelper"></div>
					</div>
					<br>
					<!-- 
					<div class="field2">
						<div class="col-md-3"></div>
						<div class="col-md-1">비밀번호<span id="secret"></span></div>
						<div class="col-md-2">
							<input class="form-control inputPw" type="password" id="boardpw2"
								name="boardpw">
						</div>
						<span id="secret"></span>
						<div class="col-md-3 pwHelper"></div>
						<div class="col-md-3"></div>
					</div> -->
					<div class="field2">
						<div class="col-md-3"></div>
						<c:if test="${login.userid == retrieve.userid}">
							<!-- <div class="col-md-1">
								비밀번호<span id="secret"></span>
							</div> -->
							<div class="col-md-2">비밀번호<span id="secret"></span>
								<input class="form-control inputPw" type="password"
									id="boardpw2" name="boardpw">
							</div>

							<div class="col-md-3 pwHelper"></div>
							<div class="col-md-3"></div>
						</c:if>

						<c:if test="${login.userid != retrieve.userid}">
							<!-- <div class="col-md-1">비밀번호<span id="secret"></span></div> -->
							<!-- <div class="col-md-2">
								<input class="form-control inputPw" type="password"
									id="boardpw2" name="boardpw" readonly="readonly">
							</div> -->

							<div class="col-md-3 pwHelper"></div>
							<div class="col-md-3"></div>
						</c:if>
					</div>
			</div>
			<br>
			<c:if test="${login.userid == retrieve.userid}">
				<div class="field2">
					<div class="col-md-3"></div>
					<div class="col-md-1"></div>
					<ul class="actions">
						<center>
							<button id="onclick" onclick="updateBoard(myForm)">수정</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="special" onclick="deleteBoard(myForm)">삭제</button>
						</center>
					</ul>

					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
				</div>
			</c:if>
			</form>
			<!-- 좌우측의 공간 확보 -->

			<hr />

			<section id="three">
				<div class="field2" style="padding-left: 300px;">
					<table class="table field2">

						<thead>

							<div class="field2">
								<c:set var="retrieve2" value="${retrieve2}" scope="session" />
								<c:set var="retrieve" value="${retrieve}" scope="session" />
								<c:set var="ppp" value="${commentlist}" scope="session" />

								<c:forEach var="xxx" items="${ppp}" varStatus="status">

									<tr id="r1" name="commentParentCode">

										<td colspan=2><strong>${xxx.commentParentName}</strong>

											${xxx.commentwriteday} <a href="javascript:window.open('NotifyServlet?userid=${xxx.userid}&commentParentName=${xxx.commentParentName}','childName','width=800,height=500')" />
											신고 <c:if test="${login.userid == xxx.userid}">
												| <a href="CommentRetrieveServlet?commentNum=${xxx.commentNum}&boardNum=${xxx.boardNum}"
													style="cursor: pointer;">수정</a> | <a
													href="CommentDeleteServlet?commentNum=${xxx.commentNum}&num=${xxx.boardNum}"
													style="cursor: pointer;">삭제</a>
											</c:if>
									</tr>
									<td>${xxx.commentParentText}</td>

								</c:forEach>
							</div>
						</thead>

					</table>

				</div>
			</section>

			<hr />
			<form method="get" action="CommentWriteServlet">
				<div class="field2">
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">

							<input type="hidden" name="userid" value="${login.userid}">
							<input type="hidden" name="num" value="${retrieve.num}">
							<input type="hidden" name="boardNum" value="${retrieve.num}">
							<input type="hidden" name="commentNum"
								value="${retrieve2.commentNum}"> <input type="hidden"
								name="commentwriteday" value="${retrieve2.commentwriteday}">


							<c:if test="${sessionScope.login != null}">
								<input type="text" name="commentParentName"
									id="commentParentName" value="${login.username}"
									placeholder="Name" />
							</c:if>

							<c:if test="${sessionScope.login == null}">
								<input type="text" name="commentParentName"
									id="commentParentName" value="로그인 해주세요" placeholder="Name" />
							</c:if>
						</div>

						<div class="6u$ 12u$(xsmall)">
							<input type="password" name="commentParentPassword"
								id="commentParentPassword" value="" placeholder="password" />
						</div>


						<!-- Break -->
						<div class="12u$">
							<textarea name="commentParentText" id="commentParentText"
								placeholder="Enter your message" rows="6"></textarea>
						</div>
						<!-- Break -->
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="등록" class="special" /></li>
								<li><input type="reset" value="취소" /></li>

							</ul>
						</div>

					</div>
				</div>
			</form>
			<br>
			<%-- <section>
				<div class="field2" style="padding-left: 300px;">
					<form method="post" name="myForm2">

						<input type="hidden" name="commentNum"
							value="${retrieve2.commentNum}">


						<div class="field half first">
							<label for="name">Name</label> 
							<input type="text"
								id="commentParentName" name="commentParentName"
								data-rule-required="true" placeholder="이름" maxlength="10">
						</div>


						<div class="field half">
						<label for="name">Password</label> 
							<input type="password" id="commentParentPassword"
								name="commentParentPassword"
								data-rule-required="true" placeholder="패스워드" maxlength="10">
						</div>



						<div class="field">
							<textarea id="commentParentText" name="commentParentText"
								style="width: 60%" rows="4"></textarea>
						</div>


						<button onclick="writeBoard(myForm2)" id="commentParentSubmit"
							name="commentParentSubmit">확인</button>



					</form>
				</div>
			</section> --%>
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

