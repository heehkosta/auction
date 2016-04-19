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




  function initialize(latitude, longitude) { 

    var latlng = new google.maps.LatLng(latitude,longitude); 
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




<%-- <body onload="initialize('${item.latitude}', '${item.longitude}')" > --%>
<body onload="initialize('${param.latitude}', '${param.longitude}')" >
  <div id="map_canvas" style="width:100%; height:100%"></div> 
  
  
  
  
</body> 
</html>