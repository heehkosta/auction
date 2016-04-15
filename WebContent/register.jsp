<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
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
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                <form class="form-horizontal" method="post">
                    <fieldset>
                        <legend class="text-center header">Contact us</legend>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="fname" name="name" type="text" placeholder="First Name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="lname" name="name" type="text" placeholder="Last Name" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="email" name="email" type="text" placeholder="Email Address" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                            <div class="col-md-8">
                                <textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>













<h3>회원가입</h3>
<!-- register_action에서 하고있는 기능이  RegisterServletd으로 이동
	 register_result.jsp로 결과를 보낸다.
-->
	<form action="register.do" name="registerForm" 
	method="post" onsubmit="return registerData()">

		1. ID : <input type="text" name="userID">
		<input type="button" value="중복확인" onclick="checkUserID()"><br>
		2. 이름 : <input type="text" name="name"><br>
		3. 패스워드 : <input type="password" name="password"><br>
		4. 카드번호 : <input type="text" name="creditCardNumber"><br>	
		5. 유효일자 : <input type="text" name="expiration"><br>	
		6. CSV : <input type="text" name="csv"><br>	
		7. 카드타입 : <input type="text" name="cardType"><br>	
		
		<input type="hidden" name="flag" value="false">	
		<input type="hidden" name="command" value="register">
		<input type="submit" value="회원가입">
	</form>













</body>
</html>

