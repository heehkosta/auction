<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${cartlist}" var="cart">
ItemID :${cart.itemID}<br>
Name :${cart.name}<br>
Buy_Price :${cart.buy_Price}<br>
<br><br>
</c:forEach>

<a href="index.html">홈으로</a>
<a href="DispatcherServlet.do?command=deleteallcart">장바구니 비우기</a>
<a href="DispatcherServlet.do?command=deletecart&&itemId=1044100897">1044100897지우기</a>

</body>
</html>