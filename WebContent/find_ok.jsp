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

<title>검색 결과</title>


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
    <div>  <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="fa fa-gift bigicon"></span> 4 - Items in Cart<span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-cart" role="menu">
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_1.jpg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: 27$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-danger  fa fa-close"></button>
                    </span>
                </span>
              </li>
<li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_2.jpg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: 3$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-danger  fa fa-close"></button>
                    </span>
                </span>
              </li>
                            <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_3.jpeg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: 12$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-danger  fa fa-close"></button>
                    </span>
                </span>
              </li>
<li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_4.jpg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: 7$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-danger  fa fa-close"></button>
                    </span>
                </span>
              </li>              
              <li class="divider"></li>
              <li><a class="text-center" href="#">View Cart</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>



 <div class="container">
        <div class="row style_featured">
            <div class="col-md-4">
                <div>
                    <img src="./img/Team1.png" alt="" class="img-rounded img-thumbnail" />
                    <h2>Item A</h2>
                    <p style="text-align: left;">
                        <span class="fa fa-info-circle"></span>
                        A quality item for purchase. Features state of the art technology
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-bank "></span>
                        0% Financing available
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-calendar "></span>
                        12 months full warranty
                    </p>
                    <a href="#" class="btn btn-success" title="More">more »</a>
                </div>
            </div>
            <div class="col-md-4">
                <div>
                    <img src="http://www.prepbootstrap.com/Content/images/template/featureditems/product_002.jpg" alt="" class="img-rounded img-thumbnail"/>
                    <h2>Item A</h2>
                    <p style="text-align: left;">
                        <span class="fa fa-info-circle"></span>
                        A quality item for purchase. Features state of the art technology
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-bank "></span>
                        0% Financing available
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-calendar "></span>
                        21 months full warranty
                    </p>
                    <a href="#" class="btn btn-success" title="More">more »</a>
                </div>
            </div>
            <div class="col-md-4">
                <div>
                    <img src="http://www.prepbootstrap.com/Content/images/template/featureditems/product_003.jpg" alt="" class="img-rounded img-thumbnail"/>
                    <h2>Item A</h2>
                    <p style="text-align: left;">
                        <span class="fa fa-info-circle"></span>
                        A quality item for purchase. Features state of the art technology
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-bank "></span>
                        0% Financing available
                    </p>
                    <p style="text-align: left;">
                        <span class="fa fa-calendar "></span>
                        4 months full warranty
                    </p>
                    <a href="#" class="btn btn-success" title="More">more »</a>
                </div>
            </div>
        </div>
    </div>








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