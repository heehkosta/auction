<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
    
<%@page import="java.net.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 
 아래 주소로 배송하시겠습니까?<br>
우편번호: <%= code %> <br>
 주소: <%= address %> <br>





<form action="address_ok.jsp" method="get">
   
  <button type="submit">Submit</button><br>
</form>


</body>

</html>