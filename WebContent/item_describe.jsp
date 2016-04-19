<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- BOOTSTRAP SECTION -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<title>item_describe.html</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script type="text/javascript" src="./js/jquery-1.12.3.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>




<!-- JQUERY SECTION -->


<script type="text/javascript">
var now = new Date();
$(function() {

    $( "#datepicker1" ).datepicker();
    $( "#datepicker2" ).datepicker({
    	minDate : now
    });
	
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
  <div class="col-sm-6">
      <div class="carousel-inner">
      ${item.itemID }
          <img src="img/clothes/${item.itemID}.PNG" alt="Image" style="height: 500px;">
     </div>
 </div>
  <div class="col-sm-6">
    <div style="margin-top: 10px;">
      <font size="5px">${item.name}</font><br>
      <font size="2px" color="gray"> &nbsp;&nbsp;Item ID : ${item.itemID}</font><br>
      <font size="2px" color="gray"> &nbsp;&nbsp;판매자 ID : ${item.sellerID}</font>
    </div>
    
    <div style="margin-top: 30px;">
      <font size="4px"><b>입찰 가격 </b>: ${item.buy_Price}원</font><br>
      <font size="4px"><b>낙찰 가격 </b>: ${item.first_Bid}원</font>
    </div>
    <div style="margin-top: 30px;">
<p><b>올린 시간 </b>: <input type="text" id="datepicker1"></p>
<p><font color="red"><b>종료 시간 </b></font>: <input type="text" id="datepicker2"></p>
    
   
    <div style="margin-top: 30px;">
      <h4><b>상세설명</b></h4><p>
	   <h5>${item.description}</h5>
    </div>
    <div style="margin-top: 30px;" >
    	<h4><b>Country</b></h4>
    	<h5>${item.country}</h5>
    	
    	<h4><b>Location</b></h4>
    	<a href="map.jsp"><h5>${item.location }</h5></a>
    </div>
     <div style="margin-top: 30px;">
    	<a href="addressApi.jsp"><button type="button" class="btn btn-primary" style="background-color: #444444; border: 0;">즉시구매</button></a>
  		<a href="DispatcherServlet.do?command=addcart&itemId=${item.itemID}">
  		<button type="button" class="btn btn-success" style="background-color: #888888; border: 0;">장바구니</button>
  		</a>
    </div>
  </div>
  </div>
        </div>   
      </div>

</body>
</html>