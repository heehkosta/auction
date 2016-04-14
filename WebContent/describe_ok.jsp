<!DOCTYPE html> 
<html> 
<head> 
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<style type="text/css"> 
  html { height: 100% } 
  body { height: 100%; margin: 0px; padding: 0px } 
  #map_canvas { height: 100% } 
</style> 
<script type="text/javascript" 
    src="http://maps.google.com/maps/api/js?sensor=false"> 
</script> 
<script type="text/javascript"> 
  function initialize() { 
    var latlng = new google.maps.LatLng(${item.latitude}, ${item.longitude}); 
    var myOptions = { 
      zoom: 14, // default is 8  
      center: latlng, 
      mapTypeId: google.maps.MapTypeId.ROADMAP 
    }; 
    var map = new google.maps.Map(document.getElementById("map_canvas"), 
        myOptions); 
  } 

</script> 
</head> 
<body onload="initialize()"> 
  <div id="map_canvas" style="width:100%; height:100%"></div> 
</body> 
</html>



<%-- 
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
	jQuery(document).ready(function($) {

	});
</script>

</head>




<body>

	
<div class="container">
    <div class="row">
    	<div class="col-md-12">
			
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail" >
					<h4 class="text-center"><span class="label label-info">Apple</span></h4>
					<img src="http://placehold.it/650x450&text=iPhone 6" class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3>iPhone 6</h3>
							</div>
							<div class="col-md-6 col-xs-6 price">
								<h3>
								<label>${item.buy_Price}</label></h3>
							</div>
						</div>
						<p>32GB, 64Bit, 1080HD, 4.7 inches, iOS 8</p>
						<div class="row">
							<div class="col-md-6">
								<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
							</div>
							<div class="col-md-6">
								<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
						</div>

						<p> </p>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-4">
				
						${item.description}
				
			</div>
         
            
        </div> 

	</div>
</div>


	<div class="container">
		<div class="row style_featured">
			<div class="col-md-4">
				<div>
					<table>
						<tr>${item.itemID}</tr>
						<tr>${item.name}</tr>
						<tr>${item.buy_Price}</tr>
						<tr>${item.first_Bid}</tr>
						<tr>${item.started}</tr>
						<tr>${item.ends}</tr>
						<tr>${item.sellerID}</tr>

						<tr>${item.location}</tr>
						<tr>${item.country}</tr>
						<tr>${item.latitude}</tr>
						<tr>${item.longitude}</tr>

						<tr>${item.description}</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html> --%>