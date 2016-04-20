<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text {  font-family: "굴림", "Arial"; font-size: 9pt; font-style: normal; line-height: 11pt; color: #000000; text-decoration: none}
	A:link {color: black; text-decoration:none;}  
	A:visited {color: black; text-decoration:none;} 
	A:hover  {color:black; text-decoration:underline;}

</style>

<script type="text/javascript" src="./js/jquery-1.12.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		function frmSearch_onsubmit() {
			if (frmSearch.searchAddr.value.length < 2)
			{
				document.getElementById("div-msg").innerHTML = "<font color=red>검색할 동명이나 도로명을 두글자 이상 입력하십시요.</font>"
				frmSearch.searchAddr.value = "";
				return false;
			}
		}
		function select_onclick(zipcode,addr1,addr2) 
		{
			parent.document.member.member_zipcode.value = zipcode;
			parent.document.member.member_addr1.value =  addr1;
			self.close(); 
			parent.document.member.member_addr2.value= addr2;
			parent.document.member.member_addr2.focus();
//			parent.document.all['zipcodeLayer'].style.display = "none"; 
			parent.closeZipcodelayer();
		}
		function CloseBtn_onclick() 
		{
			parent.closeZipcodelayer()
			parent.document.member.member_addr2.value= "";	
			parent.document.member.member_addr2.focus();	
		}

		function selJibunResult()
		{

			document.getElementById("jibun").className = "zipcode_up" ; 
			document.getElementById("doro").className = "zipcode_down" ; 
			document.frmSearch.displayorder.value="J"

		}

		function selDoroResult()
		{	
			document.getElementById("jibun").className = "zipcode_down" ; 
			document.getElementById("doro").className = "zipcode_up" ; 
			document.frmSearch.displayorder.value="D"
		}

	});
</script>
<link rel="stylesheet" type="text/css" href="/Lib/TextForm.css">
<script src="/lib/jquery.min.1.7.2.js"></script>
</head>


<body>
<form method="post" id="frmSearch" name="frmSearch" action="zipcode.asp" LANGUAGE=javascript onSubmit="return frmSearch_onsubmit()" style="margin:0">
<input type="hidden" name="displayorder" value="D">
<input type="hidden" name="mode" value="M">

<table align="center" width="92%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
  <tr>
    <td >      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td  width="90%"><span class="p_title08">우편번호 찾기</span></td>
          <td width="10%" align="right" ><a href="javascript:parent.closeZipcodelayer();"><img src="images_2015/shopping/closed.gif" border="0"></a></td>
        </tr>
      </table>
     </td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
  <tr>
    <td height="1" bgcolor="#666666"></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>
    
    </td>
  </tr>
  <tr>
    <td>
    
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
      <tr>
          <td width="70%">
            <input type="text" style="width:100%; height:36px" name="searchAddr" id="searchAddr" size="20" value="">
          </td>
          <td width="30%" align="right">
            <input type="image" value="검 색" id="submit1" name="submit1" src="/images_2015/shopping/zip_bt.gif">
          </td>
      </tr>
      </table>
    
    </td>
  </tr>
  <tr>
    <td height="7"></td>
  </tr>
    <tr>
      <td><span class="m_title34">지번(동,읍,면,리) : 예)신대방동 / 도로명(새주소) : 예)신대방길</span></td>
    </tr>
    <tr> 
      <td height="7"></td>
    </tr>
    <tr>
      <td> <span class="m_title31"><div id="div-msg"></div></span> </td>
    </tr>
    <tr> 
      <td height="7"></td>
    </tr>
  <tr>
    <td>
    
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    
    <td width="48%" height="36" align="center">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td style="vertical-align:middle;cursor:pointer;cursor:hand;" align="center" id="jibun" class="zipcode_down" onClick="javascript:selJibunResult();"><span >지번주소</span></td>
	  </tr>
	</table>
    </td>
    <td width="4%"></td>
    <td width="48%" height="36" align="center">
    
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td  style="vertical-align:middle; cursor:pointer;cursor:hand;" align="center" id="doro" class="zipcode_up" onClick="javascript:selDoroResult();">도로명 주소</td>
	  </tr>
	</table>
   
    </td>
  </tr>
</table>
    
    
    </td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>


</form>

</body>
</html>