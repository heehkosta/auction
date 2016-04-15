<!-- BOOTSTRAP SECTION -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<title>describe_ok.jsp</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>




<!-- JSTL SECTION -->

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!-- JQUERY SECTION -->

<script type="text/javascript" src="./js/jquery-1.12.3.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {

	});
</script>

</head>
<body>

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
					<li><a href="index.html" style="color: white;">Home</a></li>
					<li><a href="#" style="color: white;">Sell</a></li>
					<li><a href="#" style="color: white;">Buy</a></li>
					<li><a href="#" style="color: white;">Search</a></li>
				</ul>
			</div>
		</div>
	</nav>

<div class="container">
<div class="row">
  <div class="col-sm-8">
      <div class="carousel-inner">
          <img src="img/clo01.PNG" alt="Image" style="height: 500px;">
     </div>
 </div>
  <div class="col-sm-4">
    <div style="margin-top: 30px;">
      <h4>핑크셔츠</h4>
      <h5 style="margin-top: 20px;">Price : 30,000</h5>
    </div>
    <div style="margin-top: 20px;">
       <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="width: 100px;">사이즈
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">S</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">M</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">L</a></li>
    </ul>
  </div>
    </div>
    <div  style="margin-top: 30px; margin-bottom: 40px;">
    	<button type="button" class="btn btn-primary" style="background-color: #444444; border: 0;">즉시구매</button>
  		<a href="DispatcherServlet.do?command=addcart&itemId=${item.itemID}">
  		<button type="button" class="btn btn-success" style="background-color: #888888; border: 0;">장바구니</button>
  		</a>
    </div>
    <div style="margin-top: 30px;">
      <h4>상세설명</h4><p>
	   <h5>청바지가 잘 어울리는 여자</h5>
         <h5>   밥을 많이 먹어도 배 안 나오는 여자</h5>
          <h5>  는 존재하지 않지</h5>
    </div>
  </div>
        </div>   
      </div>
    </div>

</body>
</html>