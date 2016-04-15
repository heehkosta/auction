<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeWindow(result) {
		var of = window.opener.document.registerForm;
		if(result=='true'){ //아이디 존재
			of.id.value= "";
			of.id.focus();
		}else{  //아이디 존재하지 않으면
			//of.id.disabled=true;
			of.flag.value = of.id.value;
			of.password.focus();			
		}

		//window.self.close();
		self.close();
	}
</script>

</head>
<%
	String id = request.getParameter("id");
	boolean flag=(Boolean)request.getAttribute("flag");
	String mess = "해당 ID 사용할수 없음!!";
	if(flag==false) mess = "해당 ID 사용할수 있음!!";
		
%>
<body bgcolor="orange">
<b><%= id %></b> : <%= mess %><br><br>
<input type="button" value="확인" onclick="closeWindow('<%=flag %>')">
</body>
</html>

















