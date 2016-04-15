<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
  #container1 {
    background-color: #e2dada;
}

.centered-form {
    margin-top: 120px;
    margin-bottom: 120px;
}

.centered-form .panel {
    background: rgba(255, 255, 255, 0.8);
    box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
<script type="text/javascript">
	function registerData(){
		var f=document.registerForm;
		if(f.userID.value==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if(f.name.value==""){
			alert("이름을 입력하세요");
			return false;
		}
		if(f.password.value==""){
			alert("패스워드를 입력하세요");
			return false;
		}
		
		if(f.creditCardNumber.value==""){
			alert("주소를 입력하세요");
			return false;
		}
		
		if(f.expiration.value==""){
			alert("유효일자를 입력하세요");
			return false;
		}
		
		if(f.csv.value==""){
			alert("CSV를 입력하세요");
			return false;
		}
		
		if(f.cardType.value==""){
			alert("카드타입을 입력하세요");
			return false;
		}
		
		
		if(f.flag.value=="false"){
			alert("아이디 중복확인하세요");
			return false;
		}
		if(f.userID.value != str){
			alert("userID 값이 중복확인 한 이후에 변경됬습니다!!");
			f.userID.value="";
			f.password.value="";
			f.name.value="";
			f.address.value="";
			f.userID.focus();
			return false;
		}			
	}//registerData()
	//1)이떄는 확인 버튼을 누르면 안된다.
	var str="";
	function checkUserID(){ //여기서 id 중복체크를 하겠다
		//여기서 비지니스 로직을 바로 사용하지 말고
		//새창 띄워서 거기서 비지니스 로직을 돌리는게 맞다.
		str = document.registerForm.userID.value;
		window.open("DispatcherServlet.do?command=userIDcheck&userID="+str, "", "width=300, height=200, top=100,left=400");
		
	}//
	//IdcheckServlet에서는 idcheck.jsp로 결과를 보낸다.
	
</script>
</head>
<body>
<div class="container">

<div class="page-header">
    <h1>Registration Form</small></h1>
</div>

<!-- Registration Form - START -->
 <div class="container" id="container1">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Please Register</h3>
                    </div>
                    <div class="panel-body">
<form role="form" action="register.do" name="registerForm" method="post" onsubmit="return registerData()">
                            <div class="form-group">
                                <input type="text" name="userID" id="Id" class="form-control input-sm" placeholder="ID" size="50">
                            
                            </div>
                            <div>
<input type="button" value="Confirm Repetition " onclick="checkUserID()" class="btn btn-info btn-block">
                            </div><br>
                            <div class="form-group">
                                <input type="text" name="name" id="name" class="form-control input-sm" placeholder="name">
                            </div>

                            <div class="form-group">
                                <input type="password" name="password" id="password" class="form-control input-sm" placeholder="password">
                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="creditCardNumber" id="creditCardNumber" class="form-control input-sm" placeholder="Card Number">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="expiration" id="expiration" class="form-control input-sm" placeholder="Card Valid Date">
                                    </div>
                                </div>
                            </div>
                            
                                                        <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="csv" id="csv" class="form-control input-sm" placeholder="csv">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="cardType" id="cardType" class="form-control input-sm" placeholder="Card Type">
                                    </div>
                                </div>
                            </div>
		<input type="hidden" name="flag" value="false">	
		<input type="hidden" name="command" value="register">
                            <input type="submit" value="Register" class="btn btn-info btn-block">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>











	













</body>
</html>

