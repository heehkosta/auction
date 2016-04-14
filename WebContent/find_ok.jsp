<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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









<script type="text/javascript" src="./js/jquery-1.12.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});//ready
</script>



</head>
<body>

	<!--  ${ list} -->

	<%-- 	<c:forEach items="${list}" var="i" varStatus="vs">
		${vs.count}. ${i.name}<br>

	</c:forEach>
 --%>

	<div class="container">
		<h2>Basic Table</h2>
		<p> 아이템 목록 </p>
		<table class="table">
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
				<c:forEach items="${list}" var="item" varStatus="vs">
					<tr>
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