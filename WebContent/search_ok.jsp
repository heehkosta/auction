<!-- BOOTSTRAP SECTION -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<title>find_ok.jsp</title>


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
/* 	$(document).ready(function() {

	});//ready */
	
	
	
	jQuery(document).ready(function($) {
	    $(".clickable-row").click(function() {
	        window.document.location = $(this).data("href");
	    });
	});
</script>











</head>
<body>



	<div class="container">
		<h2>Basic Table</h2>
		<p> 아이템 목록 </p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ItemID</th>
					<th>Name</th>
					<th>Buy_Price</th>
					<th>First_Bid</th>
					<th>Started</th>
					<th>Ends</th>
					<th>SellerID</th>
					<th>Location</th>
					<th>Country</th>
					<th>Latitude</th>
					<th>Longitude</th>
				</tr>
			</thead>
			<tbody>
			
			<!-- 클릭할 시에 컨트롤러로 들어가야한다. 이때 id 번호를 가지고 들어가야 한다.  -->
				<c:forEach items="${list}" var="item" varStatus="vs">
					<!-- 변수에 ${item.itemID}를 넣고, 다음줄의 id에 변수를 대입한다. -->
					<%-- <c:set var="id" value="${item.itemID}"/> --%>
					<tr class='clickable-row' data-href='DispatcherServlet.do?command=search&&id=${item.itemID}'>
						<td>${item.itemID}</td>
						<td>${item.name}</td>
						<td>${item.buy_Price}</td>
						<td>${item.first_Bid}</td>
						<td>${item.started}</td>
						<td>${item.ends}</td>
						<td>${item.sellerID}</td>
						<%-- <td>${item.description}</td> --%>
						<td>${item.location}</td>
						<td>${item.country}</td>
						<td>${item.latitude}</td>
						<td>${item.longitude}</td>

					</tr>
				</c:forEach>


			</tbody>
		</table>
	</div>



	
</body>
</html>