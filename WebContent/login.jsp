<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<!-- login_action에 있는 로직이 이제 LoginServlet으로 이동.. 
	 로그인 성공--login_ok.jsp로 이동
	 로그인 실패--login_fail.jsp로 이동
-->
<form action="DispatcherServlet.do" name="loginForm">
	아이디 : <input type="text" name="userID"><br>
	패스워드 : <input type="password" name="password"><br>
	<input type="hidden" name="command" value="login">
	<input type="submit" value="전송">
</form>
</body>
</html>	











