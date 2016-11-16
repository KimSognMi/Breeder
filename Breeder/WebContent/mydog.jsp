<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>

<html>
<head>
<title>SMART BREADER</title>

<script type="text/javascript">
	function photo() {
	var photo2 = document.getElementById("imagePreview2");
	console.log('${mydog.p_photo}');
	
		 photo2.innerHTML = "<img height='340px' width='620px' src='images/"+'${mydog.p_photo}'+"' />";

	}
	
	function remove(){
		${'imagePreview2'}.remove();
	}
</script>

<script type="text/javascript" src="assets/js/jquery-3.1.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />

<link rel="stylesheet" href="assets/css/joinstyle.css" media="screen"
	title="no title" charset="utf-8">

<script>


	function PetdeleteBoard(f) {
		f.action = "PetDeleteServlet?userid=${login.userid}&p_num=${mydog.p_num}";

	}
</script>
</head>
<body onload="photo()" class style="font-size:16px;">

	<!-- Wrapper-->
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
					<li><a href="MemberFormServlet" class="button special fit">회원관리</a></li>
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
								<li><a href="MyPetListServlet?userid=${login.userid}"
									class="button fit">MyPET Page</a></li>
								<li><a
									href="RequestPetListServlet?requestid=${login.userid}"
									class="button special fit">신청현황</a></li>

								<li><a href="MyPageServlet" class="button special fit">MyPage</a></li>
								<li><a href="LogOutServlet" class="button fit">LogOut</a></li>
							</ul>

						</c:if>
					</c:if>


					<c:if
						test="${sessionScope.list.size()==0 or empty sessionScope.list}">

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
		<section id="banner" class="style2">
			<div class="inner">
				<span class="image"> <img src="images/dd.jpg" alt="" />
				</span>
				<header class="major">
					<h1>MY PET</h1>
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
			<section id="two">
				<form name="myForm" method="post" action="PetUpdateServlet"
					enctype="multipart/form-data">

					<form name="myForm" method="get" action="PetUpdateServlet"
						enctype="multipart/form-data">

						<!-- <article class="container"> -->
						<div class="col-md-6 col-md-offset-3">


							<input type="hidden" name="p_num" id="p_num"
								value="${mydog.p_num}">
							<div class="field2">
								<h5>kkc 등록번호</h5>
								<input type="text" class="form-control"
									value="${mydog.p_kkcnumber}" name="p_kkcnumber"
									id="p_kkcnumber" readonly="readonly">
							</div>
							<input type="hidden" class="form-control" name="userid"
								id="userid" readonly="readonly" value="${login.userid}">
							<div class="field2">
								<!-- <label for="username">이름</label>  -->
								<h5>이름</h5>
								<input type="text" class="form-control" name="p_name"
									value="${mydog.p_name}" id="p_name">
							</div>
							<br>
							<div class="field half2">
								<h5>나이</h5>
								<input type="text" class="form-control" name="p_age" id="p_age"
									placeholder="나이" value="${mydog.p_age}">
							</div>
							<div class="row uniform">
								<div class="field2_1">

									<h5>성별</h5>
									<br>
									<c:if test="${mydog.p_gender=='남'}">
										<div class="field half">

											<input type="radio" id="남" name="p_gender" value="남" checked>
											<label for="남">남(♂)</label>
										</div>
										<div class="field halfs">

											<input type="radio" id="여" name="p_gender" value="여">
											<label for="여">여(♀)</label>
										</div>
									</c:if>
									<c:if test="${mydog.p_gender=='여'}">
										<div class="field half">

											<input type="radio" id="남" name="p_gender" value="남">
											<label for="남">남(♂)</label>
										</div>
										<div class="field halfs">

											<input type="radio" id="여" name="p_gender" value="여" checked>
											<label for="여">여(♀)</label>
										</div>
									</c:if>

								</div>
							</div>
							<div class="field3 ">
								<!-- <label for="passwd2">비밀번호 확인</label> -->
								<h5>
									생일</span>
								</h5>
								<input type="text" class="form-control" name="p_birth"
									id="p_birth" placeholder="생일" value="${mydog.p_birth}">
							</div>
							<div class="field3">
								<!-- 	<label for="InputPhone">휴대폰 번호</label> -->
								<h5>종</h5>
								<input type="text" class="form-control" id="p_type"
									name="p_type" placeholder="종" value="${mydog.p_type}">
							</div>
							<div class="field2">
								<h5>특징</h5>
								<textarea name="p_feature" id="p_feature"
									placeholder="특징을 입력 해 주세요" rows="5">${mydog.p_feature}</textarea>
							</div>

							<div class="field2">
								<h5>사진</h5>

								<input id="image" type="file" name="theFile"
									onchange="InputImage();" onclick="remove()"><br> <br>

								<%-- 		<c:url value="images/${mydog.p_photo}" var="imageURL"/>
							<div id="imagePreview"  src="<c:out value="${imageURL}"/>" /> --%>
								<!-- <a href="javascript:photo()">d</a> -->
								<div id="imagePreview2"></div>
								<div id="imagePreview"></div>

								<br>

							</div>

							<div class="field3 ">
								<!-- <label for="passwd2">비밀번호 확인</label> -->
								<h5>
									모견 KKCNumber</span>
								</h5>

								<input type="text" class="form-control" name="mom_kkc"
									id="mom_kkc" placeholder="모견 KKCNumber"
									value="${mydog.mom_kkc}">

							</div>

							<div class="field3 ">
								<!-- <label for="passwd2">비밀번호 확인</label> -->
								<h5>
									부견 KKCNumber</span>
								</h5>
								<input type="text" class="form-control" name="papa_kkc"
									id="papa_kkc" placeholder="부견 KKCNumber"
									value="${mydog.papa_kkc}">

							</div>
						</div>

						<br>

						<div class="field2">
							<div class="col-md-3"></div>
							<div class="col-md-1"></div>
							<ul class="actions">
								<center>
									<input type="submit" value="수정">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="special" onclick="PetdeleteBoard(myForm)">삭제</button>
								</center>
							</ul>

							<div class="col-md-3"></div>
							<div class="col-md-3"></div>
						</div>
						<br>
					</form>
			</section>
		</div>



		<script type="text/javascript">
		var InputImage = (function loadImageFile() {
			if (window.FileReader) {
				var ImagePre;
				var ImgReader = new window.FileReader();
				var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

				ImgReader.onload = function(Event) {
					if (!ImagePre) {
						var newPreview = document
								.getElementById("imagePreview");
						ImagePre = new Image();
						ImagePre.style.width = "550px";
						ImagePre.style.height = "340px"; //세로
						newPreview.appendChild(ImagePre);
					}
					ImagePre.src = Event.target.result;

				};

				return function() {

					var img = document.getElementById("image").files;

					if (!fileType.test(img[0].type)) {
						alert("이미지 파일을 업로드 하세요");
						return;
					}

					ImgReader.readAsDataURL(img[0]);
				}

			}

			document.getElementById("imagePreview").src = document
					.getElementById("image").value;

		})();

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
					//alert("정상 처리되었습니다.");
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




