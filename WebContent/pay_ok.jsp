<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
    
<%@page import="java.net.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<title>pay_ok.jsp</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script type="text/javascript" src="./js/jquery-1.12.3.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>

<body>

<% 
String code = URLDecoder.decode(request.getParameter("code"),"UTF-8");
String address = URLDecoder.decode(request.getParameter("address"),"UTF-8");		
%>


<%-- 아래 주소로 배송하시겠습니까?<br>
우편번호: ${param.code} <br>
 주소: ${param.address}
  --%>
 <nav class="navbar navbar-inverse" style="width: 100%; background-color: #00001E; border: 0">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color: white;">HeeHMALL</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp" style="color: white;">Home</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<div>
 <h3 align="center">아래 주소로 배송하시겠습니까?</h3><br>
<h5 align="center">우편번호: <%= code %> </h5>
<h5 align="center"> 주소: <%= address %></h5> <br>
</div>

<form action="address_ok.jsp" method="get">
   
<center>  <button type="submit">Submit</button></center><br>
</form>


</body>

</html>