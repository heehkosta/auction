<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<!-- login_action에 있는 로직이 이제 LoginServlet으로 이동.. 
	 로그인 성공--login_ok.jsp로 이동
	 로그인 실패--login_fail.jsp로 이동
-->

<div class="container">

<div class="page-header">
    <h1>Login</h1>
</div>

<!-- Simple Login - START -->
<form class="col-md-12" action="DispatcherServlet.do" name="loginForm">
    <div class="form-group">
        <input type="text" class="form-control input-lg" placeholder="ID" name="userID">
    </div>
    <div class="form-group">
        <input type="password" class="form-control input-lg" placeholder="Password" name="password">
    </div>
   <input type="hidden" name="command" value="login">
    <div class="form-group">
        <button class="btn btn-primary btn-lg btn-block">Log In</button>
        <span class="pull-right"><a href="#">New Registration</a></span>
    </div>
</form>

</body>
</html>	











