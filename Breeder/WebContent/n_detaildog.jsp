<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>

<html>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 380px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(20, 20, 20, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 5px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#dog {
	color: #fff;
	width: 200px;
	font-size: 70%;
}

#dogphoto {
	margin-left: 7%;
	margin-top: 7%;
	width: 48%;
	height: 50%;
}

#dogform {
	 margin-left: 10%;
 margin-right: 10%;
	margin-top: 7%;
}
</style>
<head>
<title>Near Me Dog</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<script type="text/javascript">


function send(f) {

	alert("신청완료");

	f.action ="RequestPetServlet";

	
	
}
	
	function reset_close() {
		close();
	}
	function photo() {
		var photo2 = document.getElementById("dogphoto");
		console.log('${petdetail.p_photo}');

		photo2.innerHTML = "<img style='width: 180%;' src='images/"
				+ '${petdetail.p_photo}' + "' />";
	}
</script>
<body onload="photo()">
	<div id="dogphoto"></div>
	<form name="dogform" action="RequestPetServlet">
	
	<c:set var="petdetail" value="${petdetail}" scope="session" />
		<input type="text" name="p_name" id="p_name" value="${petdetail.p_name}"/>
		<input type="text" name="userid" id="userid" value="${petdetail.userid}"/>
		<input type="text" name="p_gender" id="p_gender" value="${petdetail.p_gender}"/>
		<input type="text" name="p_age" id="p_age" value="${petdetail.p_age}"/>
		<input type="text" name="p_feature" id="p_feature" value="${petdetail.p_feature}"/>
		<input type="hidden" name="p_num" id="p_num" value="${petdetail.p_num}"/>
		<input type="hidden" name="p_photo" id="p_photo" value="${petdetail.p_photo}"/>
		<input type="text" name="requestid" id="requestid" value="${login.userid}"/>
		
		
		<input type="hidden" name="p_kkcnumber" value="${petdetail.p_kkcnumber}"/>
		<input type="hidden" name="p_birth" value="${petdetail.p_birth}"/>
		<input type="hidden" name="p_type" value="${petdetail.p_type}"/>
		<input type="hidden" name="agree" id="agree" value="대기중"/>
		<input type="hidden" name="phone" id="phone" value="${mypage.phone}"/>
		

	<div>내용</div>
		<textarea id="r_content" name="r_content" rows=2></textarea>
		<br>
		<input type="hidden" value="${petdetail.p_num}"/>
		<button style="margin-left: 25%;" id="onclick" onClick="send(dogform)">확인</button>
		<button style="margin-left: 2%;" onClick="javascript:reset_close()">취소</button>
		<br>
	</form>
	<script type="text/javascript">
		var InputImage = (function loadImageFile() {
			if (window.FileReader) {
				var ImagePre;
				var ImageReader = new window.FileReader();
				var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
			}

		})();
	</script>


</body>
</html>