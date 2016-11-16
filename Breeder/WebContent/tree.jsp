<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="css/tree.css" />
<title>Insert title here</title>

</head>
<body>

<div class="tree">


	<ul>
		<li>
			<a>Grand Parent <br> 
			<c:if test="${pettree.gmom_photo !=null and pettree.gpapa_photo !=null}">
			<img src="images/${pettree.gmom_photo}" height="120px" width="190px" alt="" /> &nbsp; <img src="images/${pettree.gpapa_photo}" height="120px" width="190px" alt="" />
			</c:if>
			<c:if test="${pettree.gmom_photo ==null and pettree.gpapa_photo ==null}">
			<img src="images/no.jpg"  height="100px" width="100px" alt="" /> &nbsp; <img src="images/no.jpg"  height="100px" width="100px" alt="" />
			</c:if>
			<c:if test="${pettree.gmom_photo !=null and pettree.gpapa_photo ==null}">
			<img src="images/${pettree.gmom_photo}" height="120px" width="190px" alt="" /> &nbsp; <img src="images/no.jpg"  height="100px" width="100px" alt="" />
			</c:if>
			<c:if test="${pettree.gmom_photo ==null and pettree.gpapa_photo !=null}">
			<img src="images/no.jpg"  height="100px" width="100px" alt="" /> &nbsp; <img src="images/${pettree.gpapa_photo}" height="120px" width="190px" alt="" />
			</c:if>
			
			</a>
			
			<ul>
				 <li>
				 
					<a href="#">엄마 형제 <br> 
					<c:if test="${pettree.mp_photo !=null}">
					<img src="images/${pettree.mp_photo}"  height="120px" width="190px" alt="" /> 
						</c:if>
						<c:if test="${pettree.mp_photo ==null}">
						<img src="images/no.jpg"  height="100px" width="100px" alt="" />
						</c:if>
					</a>
				
					<!-- <ul>
						<li>
							<a href="#">Grand Child <br> <img src="images/oo.jpg"  height="120px" width="190px" alt="" /> </a>
						</li>
					</ul> -->
				</li> 
				<li>
					<a href="#">MAMA PAPA <br>
					
					<c:if test="${pettree.mom_photo !=null and pettree.papa_photo !=null}">
			<img src="images/${pettree.mom_photo}" height="120px" width="190px" alt="" /> &nbsp; <img src="images/${pettree.papa_photo}" height="120px" width="190px" alt="" />
			</c:if>
			<c:if test="${pettree.mom_photo ==null and pettree.papa_photo ==null}">
			<img src="images/no.jpg"  height="100px" width="100px" alt="" /> &nbsp; <img src="images/no.jpg"  height="100px" width="100px" alt="" />
			</c:if>
			<c:if test="${pettree.mom_photo !=null and pettree.papa_photo ==null}">
			<img src="images/${pettree.mom_photo}" height="120px" width="190px" alt="" /> &nbsp; <img src="images/no.jpg"  height="100px" width="100px" alt="" />
			</c:if>
			<c:if test="${pettree.mom_photo ==null and pettree.papa_photo !=null}">
			<img src="images/no.jpg"  height="100px" width="100px" alt="" /> &nbsp; <img src="images/${pettree.papa_photo}" height="120px" width="190px" alt="" />
			</c:if>
					
					</a>
					<ul>
						<li><a href="#">Grand Child <br> 
						
<c:if test="${pettree.pp_photo !=null}">
					<img src="images/${pettree.pp_photo}"  height="120px" width="190px" alt="" /> 
						</c:if>
						<c:if test="${pettree.pp_photo ==null}">
						<img src="images/no.jpg"  height="100px" width="100px" alt="" />
						</c:if>						
						</a></li>
						<li>
							<a href="#">I ${pettree.p_name} <br> <img src="images/${pettree.p_photo}"  height="120px" width="190px" alt="" /></a>
							<!-- <ul>
								<li>
									<a href="#">Great Grand Child</a>
								</li>
								<li>
									<a href="#">Great Grand Child</a>
								</li>
								<li>
									<a href="#">Great Grand Child</a>
								</li>
							</ul> -->
						</li>
						<li><a href="#">Grand Child <br> 
						<c:if test="${pettree.pp_photo !=null}">
					<img src="images/${pettree.pp_photo}"  height="120px" width="190px" alt="" /> 
						</c:if>
						<c:if test="${pettree.pp_photo ==null}">
						<img src="images/no.jpg"  height="100px" width="100px" alt="" />
						</c:if>	
						
						</a></li>
					</ul>
				</li>
				<!-- <li>
					<a href="#">Child <br> <img src="images/ll.jpg" height="130px" width="230px" alt="" /> </a>
					
				</li> -->
			</ul>
		</li>
	</ul>
	
</div>

</body>
</html>