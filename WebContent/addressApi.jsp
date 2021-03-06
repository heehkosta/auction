<%@ page language="java" contentType="text/html"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

var postcode;
var roadAddress;
	function bindAddress(){		
	
		postcode = document.getElementById('sample4_postcode').value;
		roadAddress = document.getElementById('sample4_roadAddress').value;
		/* var jibunAddress = document.getElementById('sample4_jibunAddress').value;  */
		
		
	
		/* location.href="DispatcherServlet.do?command=pay&code="+
				encodeURI(encodeURIComponent(postcode))+
						"&address="+encodeURI(encodeURIComponent(roadAddress)); */
		location.href="pay_ok.jsp?code="+
		encodeURI(encodeURIComponent(postcode))+
				"&address="+encodeURI(encodeURIComponent(roadAddress));
	}	
	
	 function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
	                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

	                } else {
	                    document.getElementById('guide').innerHTML = '';
	                }
	            }
	        }).open();
	        
	    }//sample4_execDaumPostcode
	
</script>

</head>
<body>

<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="e0e0e0">
  <tr>
    <td height="40" bgcolor="#fafafa" style="padding-left:25px;"><b><span class="m_title24">주소 입력</span></b></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" style="padding-top:20px; padding-bottom:20px;">
    
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="e0e0e0">
  <tr>
    <td bgcolor="#FFFFFF" align="center">    

    </td>
  </tr>

  <tr>
    <td bgcolor="#FFFFFF" align="center">    
			<table width="97%" border="0" cellspacing="0" cellpadding="5">
			  <tr>
				<td width="150" style="padding-left:9px;"><span class="m_title10">우편번호</span></td>
				<td width="60">
				<input type="text" id="sample4_postcode" name="member_zipcode" id="member_zipcode" readonly value=""  size="7" style=" height:24px; width:60px; border:1 solid #CCCCCC; 굴림; FONT-SIZE: 9pt" >
                </td>
				<td>
			  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				</td>
			  </tr>
			</table>  
    </td>
  </tr>
  
  <tr>
    <td bgcolor="#FFFFFF" align="center">    
<table width="97%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="150" style="padding-left:9px;"><span class="m_title10">주소 </span></td>
    <td>
<span class="m_title10">
<input type="text" id="sample4_roadAddress" name="member_addr1" id="member_addr1" readonly Value=""  size="30" style="HEIGHT: 24px; WIDTH: 200px; border:1 solid #CCCCCC; 굴림; FONT-SIZE: 9pt">
</span>
    </td>
  </tr>
</table>    
    </td>
  </tr>
  
  <tr>
    <td bgcolor="#FFFFFF" align="center">    
<table width="97%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="150" style="padding-left:9px;"><span class="m_title10">나머지 주소 </span></td>
    <td>
    <span class="m_title10">
    <input type="text" id="sample4_jibunAddress" name="member_addr2" id="member_addr2" Value="" size="30" style="HEIGHT: 24px; WIDTH: 200px; border:1 solid #CCCCCC; 굴림; FONT-SIZE: 9pt">
    </span>
    </td>
  </tr>
  <td align="left">
  <input type="button" onclick="bindAddress()" value="이 주소 사용하기">
  </td>
</table>    
    </td>
  </tr>
</table>   
    </td>
  </tr>
</table>
</body>
</html>