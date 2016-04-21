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
	AccountVO vo = (AccountVO)session.getAttribute("vo");
	if(vo != null){
%>
<!--  수정하기 위해서는 로긴 상태에서 해야한다...세션에 수정하고자 하는 vo가 바인딩 되어 있어야 한다-->
<form action="DispatcherServlet.do" method="post" name="updateForm">
		아이디 :<input type="text" name="userID" value="<%=vo.getUserID()%>" readonly="readonly">  <br><br>
		이 름 :<input type="text" name="name" value="<%=vo.getName() %>">  <br><br>
		패스워드 :<input type="text" name="password" value="<%=vo.getPassword() %>">  <br><br>
		패스워드 확인 :<input type="text" name="password" value="<%=vo.getName() %>">  <br><br>
		
		카드번호 :<input type="text" name="creditCardNumber" value="<%=vo.getCreditCardNumber() %>">  <br><br>
		유효기간 :<input type="text" name="expiration" value="<%=vo.getExpiration() %>">  <br><br>
		CSV :<input type="text" name="csv" value="<%=vo.getCsv() %>">  <br><br>
		카드종류 :<input type="text" name="cardType" value="<%=vo.getCardType() %>">  <br><br>
		
		<input type="hidden" name="command" value="update">
		<input type="submit" value="회원정보 수정하기">
</form>
<%}else{ %>
	<script type="text/javascript">
		alert("로그인 상태가 아니라서 정보수정 불가!!");
		location.href="login.jsp";
	</script>
<%} %>
</body>
</html>

















