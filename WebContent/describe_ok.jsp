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
<div class="mix">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header menuitem">
      <a class="navbar-brand" href="index.html">Hee Mall</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="#">판매하기</a></li>
        <li><a href="#">구매하기</a></li>
        <li class="active"><a href="find_ok.jsp">검색 결과</a></li>
      </ul>
    </div>
  </div>
</nav>
</div>


        <div class="row style_featured">
            <div class="col-md-4">
                <div>
                    <img src="./img/clo01.PNG" alt="" width="450" height="450" class="img-rounded img-thumbnail" align="center" />
                    <h2>분홍셔츠</h2>
                    <p style="text-align: left;">
                        <span class="fa fa-info-circle"></span>
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
</p>
                    <p style="text-align: left;">
                        <span class="fa fa-bank "></span>
                        가격 : 25,000
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-calendar "></span>
                        상세설명 : 파스텔톤의 여리여리한 핏의 분홍색 셔츠
                    </p>
                </div>
            </div>
        </div>

	
	
	
</body>
</html>