<%@page import="model.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	AccountVO vo  = (AccountVO)session.getAttribute("mvo");
%>
	
	<b><%= vo.getName() %> 님, </b>로그인 성공!!<p>
	<a href="index.html">메인화면으로 가기</a>
</body>
</html>
























