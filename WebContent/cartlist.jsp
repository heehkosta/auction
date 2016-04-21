<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



<html>
<head>

<title>everyday NEW dahong</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/css" href="/Lib/TextForm.css">
<script src="/lib/jquery.min.1.7.2.js"></script>
<script src="/lib/jquery.bpopup.min.js"></script>

<script language="JavaScript">
<!--
function DelCartAll()
{
	if (confirm("장바구니에 담긴 모든 상품이 삭제됩니다. 장바구니를 비우시겠습니까?"))
	{
		document.location.href="DelCartAll.asp";
	}
}

function checkStock(str)
{
	intGqty = str.value;
	intGcnt = str.id;
	
	if (eval(intGcnt-intGqty)<0)
	{
		alert("최대 주문 가능 수량은 " + intGcnt + "개  입니다");
		str.value = intGcnt;
	}
}

function goPrevPage()
{
	history.go(-2)
}


function updateNormal()
{
	document.cartNormal.action="EditCart.asp"
	document.cartNormal.submit();
}

function updateDelay()
{

	document.CartDelay.action="EditCart.asp"
	document.CartDelay.submit();
}

function formatNumber(str)
{
	number = numOffMask(str.value);

	if (isNaN(number))
		str.value = "";
	else
		str.value = numOnMask(number);
}

function numOffMask(str)
{
	var tmp = str.split(",");
	tmp = tmp.join("");
	return tmp;
}

function numOnMask(str)
{

	if (str < 0) {
		str = Math.abs(str);
		sign = "-";
	} else {
		sign = "";
	}

	str = str + "";
	var idx = str.indexOf(".");

	if (idx < 0) {
		var txtInt = str;
		var txtFloat = "";
	} else {
		var txtInt = str.substring(0,idx);
		var txtFloat = str.substring(idx);
	}

	if (txtInt.length > 3) {
		var c=0;
		var myArray = new Array();
			for(var i=txtInt.length; i>0; i=i-3) {
			myArray[c++] = txtInt.substring(i-3,i);
 			}
		myArray.reverse();
 		txtInt = myArray.join(",");
 		}
 		str = txtInt + txtFloat;

	return sign + str;
}

function SelectedCartNormalDel()
{
	if ( $("#dumyNormal").length > 0 ) 
	{
		var f = document.cartNormal;

		var k=0

		if (f.checkcart.length==undefined) // 한개일 경우..
		{  
			if (f.checkcart.checked==true)
				k++;
		}
		else // 여러개일경우
		{
			for(i=0;i<f.checkcart.length;i++)
			{
				if (f.checkcart[i].checked)
					k++;
			}
		}

		if (k==0)
		{
			alert("삭제하실 상품을 선택해주세요.");
		}
		else
		{
			if (confirm("선택하신 상품을 삭제하시겠습니까?"))
			{
				f.action="DelCartSelected.asp"
				f.submit();
			}
		}  
	}
	else
	{
		alert("장바구니가 비어있습니다");
	}


}

function SelectedCartDelayDel()
{
	var f = document.CartDelay;

	var k=0

	if (f.checkcart.length==undefined) // 한개일 경우..
	{  
		if (f.checkcart.checked==true)
			k++;
	}
	else // 여러개일경우
	{
		for(i=0;i<f.checkcart.length;i++)
		{
			if (f.checkcart[i].checked)
				k++;
		}
	}

	if (k==0)
	{
		alert("삭제하실 상품을 선택해주세요.");
	}
	else
	{
		if (confirm("선택하신 상품을 삭제하시겠습니까?"))
		{
			f.action="DelCartSelected.asp"
			f.submit();
		}
	}  


}

function num_only( Ev )
{
	if (window.event) // IE코드
		var code = window.event.keyCode;
	else // 타브라우저
		var code = Ev.which;

	if ((code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46)
	{
		window.event.returnValue = true;
		return;
	}

	if (window.event)
		window.event.returnValue = false;
	else
		Ev.preventDefault();	
}


function layerPopWishListOnOff(nVal)
{
	if (nVal==0)
	{
		document.all['layerPopOption'].style.display = "none"; 
	}
	else
	{
		document.all['layerPopOption'].style.display = ""; 
	}
}

function GetOptionSize(seq)
{
	$("#div_cart_"+seq+"_size").load("cart_selectgoodcolor.asp?seq="+seq+"&gcolor="+escape(encodeURIComponent($("#Cart_"+seq+"_Color").val())) );
}

function DeleteCartGood(seq)
{
	document.location.href="DelCart.asp?seq="+seq;
}

// -->
</script>


<!-- Normal 카트 스크립트 시작 -->
<script type="" language="JavaScript">
<!--
function layerApplyOption(seq)
{	
	Gcolor = $("#Cart_"+seq+"_Color").val();
	Gsize = $("#Cart_"+seq+"_Size").val();

	if (Gsize=="")
	{
		alert("사이즈를 선택해주세요.");
		return;
	}
	document.location.href="CartUpdate.asp?seq="+seq+"&Gcolor=" + escape(encodeURIComponent(Gcolor)) + "&Gsize=" + escape(encodeURIComponent(Gsize));
}


function allcheck()
{
	$('input:checkbox[name=seq]').each(function(){
		$(this).prop('checked', true);
	});
}	

function disallcheck()
{
	$('input:checkbox[name=seq]').each(function(){
		$(this).prop('checked', false);
	});
}	


function setAllCheckNormal()
{
	if ( $("#allcheck1").prop("checked")==true )
	{
		$(".checkcart1").each(function() {
			$(this).prop('checked', true);
		});
	}
	else
	{
		$(".checkcart1").each(function() {
			$(this).prop('checked', false);
		});
	}

	ComputeGamountNormal();

}	

function ComputeGamountNormal()
{
	var f = document.cartNormal;
	var d = document.dumyNormal;

	var goodamount=0;
	var deliveryfee=0;
	var saleamount=0;
	var settleamount=0;
	var temp=0;
	var argGamount=0;
	var argRamount=0;
	var argGqty=0;
	var checkcnt = 0;
	var expressdeliverycnt = 0;


	$(".checkcart1:checked").each(function() {
		temp =$(this).val();
		array_data = temp.split("/");
		argGamount = array_data[0];
		argRamount = array_data[1];
		argGqty = array_data[2];
		argexpressdelivery = array_data[4];

		goodamount = goodamount + eval(argGamount*argGqty);
		saleamount = saleamount + eval(argRamount*argGqty);
		settleamount = settleamount + eval(argGamount*argGqty-argRamount*argGqty);
		checkcnt = checkcnt + 1
		if (argexpressdelivery=="Y")
			expressdeliverycnt = expressdeliverycnt + 1		
	});

	if ( $("#dumyNormal").length > 0 ) 
	{
		if(checkcnt == expressdeliverycnt)
		{
			$("#div_cart_normal_info_3").show();
			$("#div_cart_normal_info_4").hide();
			d.ExpressDelivery.value = "Y";
		}
		else if(checkcnt != expressdeliverycnt && expressdeliverycnt>0)
		{
			$("#div_cart_normal_info_3").hide();
			$("#div_cart_normal_info_4").show();
			d.ExpressDelivery.value = "N";
		}
		else if(expressdeliverycnt==0)
		{
			$("#div_cart_normal_info_3").hide();
			$("#div_cart_normal_info_4").hide();
			d.ExpressDelivery.value = "N";
		}

		if ($(".checkcart1").length==checkcnt)
			$("#allcheck1").prop("checked", true);
		else if (checkcnt ==0 )
			$("#allcheck1").prop("checked", false);


		if(eval(goodamount) == 0)
		{
			$("#div_cart_normal_info_1").hide();
			$("#div_cart_normal_info_2").show();
			$("#div_cart_normal_info_3").hide();
			d.ExpressDelivery.value = "N";
		}
		else
		{
			$("#div_cart_normal_info_1").show();
			$("#div_cart_normal_info_2").hide();
		}

	/* 상품금액 3만원 미만 배송비 계산 시작 */

		if(eval(settleamount) < 50000)
			deliveryfee = 2500;
		
		settleamount = eval(settleamount + deliveryfee);
	/* 상품금액 3만원 미만 배송비 계산 끝 */

		f.goodamount.value = eval(goodamount);
		f.deliveryfee.value = eval(deliveryfee);
		f.totsaleamount.value = eval(saleamount);
		f.settleamount.value = eval(settleamount);

		formatNumber(f.goodamount);
		formatNumber(f.deliveryfee);
		formatNumber(f.settleamount);
		formatNumber(f.totsaleamount);
	}
}

function CheckCartNormalSeq()
{
	var argSeq=0;
	var temp="";
	var argCnt = 0;
	
	if ( $("#dumyNormal").length > 0 ) {
		document.dumyNormal.cartseq.value = "";

		if (document.cartNormal.checkcart.length)
		{
			for (var i=0; i<document.cartNormal.checkcart.length ; i++)
			{
				if(document.cartNormal.checkcart[i].checked)
				{
					temp =document.cartNormal.checkcart[i].value;
					array_data = temp.split("/");
					argSeq = array_data[3];

					if (argCnt==0)
						document.dumyNormal.cartseq.value = argSeq;
					else
						document.dumyNormal.cartseq.value = document.dumyNormal.cartseq.value+','+argSeq;

					argCnt++;

				}
			}
		}
		else { 
				if(document.cartNormal.checkcart.checked)
				{
					temp =document.cartNormal.checkcart.value;
					array_data = temp.split("/");
					document.dumyNormal.cartseq.value = array_data[3];
				}
		}
	}
}


//-->	
</script>

<script language="JavaScript">
<!--
function OrderCartNormalAll()
{
	if ( $("#dumyNormal").length > 0 ) 
	{
		var f = document.cartNormal;
		setAllCheckNormal();

		GoodAmount = numOffMask(f.goodamount.value);

		CheckCartNormalSeq();
		if (eval(GoodAmount > 0))
		{	
			
			document.dumyNormal.action="../Member/LoginForm_non.asp";	
			

			document.dumyNormal.submit();
		}
		else
			alert("장바구니 상품중 선택하신 상품이 없습니다.")
	}
	else
	{
		alert("장바구니가 비어있습니다.")
	}
}

function OrderCartNormal()
{
	if ( $("#dumyNormal").length > 0 ) 
	{
		var f = document.cartNormal;
		GoodAmount = numOffMask(f.goodamount.value);

		CheckCartNormalSeq();

		if (eval(GoodAmount > 0))
		{
			
			document.dumyNormal.action="../Member/LoginForm_non.asp";	
			
			document.dumyNormal.submit();
		}
		else
			alert("장바구니 상품중 선택하신 상품이 없습니다.")
	}
	else
	{
		alert("장바구니가 비어있습니다.")
	}
}

function CartNormal2Concern()
{

	CheckCartNormalSeq();

	if (document.dumyNormal.cartseq.value != "")
	{
		document.dumyNormal.action="../Concern/Cart2Concern.asp";
		document.dumyNormal.submit();
	}
	else
		alert("장바구니 상품중 선택하신 상품이 없습니다.")
}

// -->
</script>
<!-- Normal 카트 스크립트 종료 -->

</head><center>
<body   bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >


      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><script>
//	openWin = window.open('../notice.htm','gongzi',"scrollbars,resizable,width=540,height=500,scrollbars=yes, resizable=no");			
</script>
<script language="JavaScript">
/* if(parent.frames.length <= 0) { top.location.href="/"; }*/
</script>

<script language="javascript">

function open_ftc_info()
{
	var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1278649753";
	window.open(url, "communicationViewPopup", "width=750, height=700;");
}


function Right(e) {

    if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
        return false;
    else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) {
        alert("오른쪽 마우스는 사용하실수 없습니다.");
        return false;
    }
    return true;
}

document.onmousedown=Right;

if (document.layers) {
    window.captureEvents(Event.MOUSEDOWN);
    window.onmousedown=Right;
}

</script>

<script language="javascript">

function preMember()
{
		alert("다홍. \n\r 회원가입이나 로그인해주시기바랍니다!");
}

function loginForm()
{	
		if(confirm("다홍. \n\r로그인/회원가입 화면으로 이동 하시겠습니까?"))						
		location = "../Member/LoginForm.asp";
}
</script>

<script language="JavaScript">
/* if(parent.frames.length <= 0) { top.location.href="/"; }*/
// 쿠키값 가져오기
function getCookie(key)
{
  var cook = document.cookie + ";";
  var idx =  cook.indexOf(key, 0);
  var val = "";
 
  if(idx != -1)
  {
    cook = cook.substring(idx, cook.length);
    begin = cook.indexOf("=", 0) + 1;
    end = cook.indexOf(";", begin);
    val = unescape( cook.substring(begin, end) );
  }
 
  return val;
}
 
// 쿠키값 설정
function setCookie(name, value, expiredays)
{
  var today = new Date();
  today.setDate( today.getDate() + expiredays );
  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
} 

</script>

<script language="JavaScript">
<!--
function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>


<script language="javascript">
	function openwindow(name, url, width, height, scrollbar) {
		scrollbar_str = scrollbar ? 'yes' : 'no';
		window.open(url, name, 'width='+width+',height='+height+',scrollbars='+scrollbar_str);
	}
</script>

<script language="JavaScript" type="TEXT/JAVASCRIPT">
<!--
function newsread(no)
{
	var url;
	url ="../my/NewsRead.asp?no="+no;
	window.open(url,'mypop','width=620,height=500,scrollbars=yes');
	return;
}

function newsread2(no)
{
	var url;
	url ="../my/NipponNewsRead.asp?no="+no;
	window.open(url,'mypop','width=620,height=500,scrollbars=yes');
	return;
}

function newsread3(no)
{
	var url;
	url ="../my/MDNewsRead.asp?no="+no;
	window.open(url,'mypop','width=620,height=500,scrollbars=yes');
	return;
}

function gotoMydahong()
{
	location = "../My/MyDahong.asp";	
}

function gotoMemo()
{
	location = "../My/MyMemo.asp";	
}

function GiftGoodView()
{
	var url;
	url ="../my/GiftGoodView.asp";
	window.open(url,'GiftGood','width=620,height=500,scrollbars=yes');
	return;
}

function gotoPurchase()
{
	var url;
	url ="../GiftTicket/GiftTicketInfo.html";
	window.open(url,'GiftTicket','width=700,height=600,scrollbars=no');
	return;
}
 -->




</script>

<script language="javascript">


function gotoItemMain(arg)
{
	location = "../Shopping/ItemShopping_main.asp?a="+arg;	
	
}

function gotoConceptGoodView(Gserial)
{
	location = "../Shopping/GoodView_Concept.asp?Gserial="+Gserial;	
	
}

function gotoCoordiView(Gserial)
{
	location = "../Shopping/GoodView_Coordi.asp?Gserial="+Gserial;	
	
}

function openCoordiView(Gserial)
{
	url = "../Shopping/GoodView_Coordi.asp?Gserial="+Gserial;	
	window.open(url,'_blank');
	
}

function gotoItemGood(arg)
{
	location = "../Shopping/ItemShopping_detail.asp?b="+arg;	
	
}

function gotoMDGoodView(Gserial)
{
	location = "../NShopping/GoodView_Item.asp?Gserial="+Gserial;	
}

function gotoCOSGoodView(Gserial)
{
	location = "../NShopping/GoodView_CItem.asp?Gserial="+Gserial;	
}

function gotoZinifGoodView(Gserial)
{
	location = "../NShopping/GoodView_ZItem.asp?Gserial="+Gserial;	
}

function gototeamGoodView(Gserial)
{
	location = "../NShopping/GoodView_team.asp?Gserial="+Gserial;	
}

function gotoMDGabalGoodView(Gserial, Gseq)
{
	location = "../Shopping/GoodView_Gabal.asp?Gserial="+Gserial+"&gseq=" + Gseq;	
}

function gotoNormalGoodView(Gserial)
{
	location = "../Shopping/GoodView_NItem.asp?Gserial="+Gserial;	
}


function gotoDahongGoodView(Gserial)
{
	location = "../Shopping2/GoodView_Dahong.asp?Gserial="+Gserial;	
}

function openCatGoodView(Gserial)
{
	url =  "../Shopping2/GoodView_Cat.asp?Gserial="+Gserial;	
	window.open(url,'_blank');
}

function gotoBrandGoodView(Gserial)
{
	location = "../Shopping2/GoodView_Brand.asp?Gserial="+Gserial;	
}

function gotoKeywordGoodView(Gserial)
{
	location = "../Nshopping/GoodView_Keyword.asp?Gserial="+Gserial;	
}


function gotoSaleGoodView(Gserial)
{
	location = "../Shopping/GoodView_Sale.asp?Gserial="+Gserial;	
}


function gotoItemGoodView(Gserial)
{
	location = "../NShopping/GoodView_Item.asp?Gserial="+Gserial;	
}

function gotoSummerGoodView(Gserial)
{
	location = "../NShopping/GoodView_Summer.asp?Gserial="+Gserial;	
}

function gotoCatGoodView(Gserial)
{
	location = "../Shopping2/GoodView_Cat.asp?Gserial="+Gserial;	
}

function gototeamGoodView(Gserial)
{
	location = "../NShopping/GoodView_team.asp?Gserial="+Gserial;	
}

function gotomonoGoodView(Gserial)
{
	location = "../Shopping2/GoodView_monomori.asp?Gserial="+Gserial;	
}

function gotoCatCoordiView(Gserial)
{
	location = "../Nshopping/GoodView_StyleBook.asp?Gserial="+Gserial;	
	
}


function gotoBigGoodView(Gserial)
{
	location = "../Shopping/GoodView_Big.asp?Gserial="+Gserial;	
}

function gotoItemShoppingMain(arg)
{
	location = "../Shopping/ItemShopping_main.asp?a="+arg;	
}


function gotoBigShoppingDetail(arg)
{
	location = "../Shopping/ItemShopping_BigDetail.asp?b="+arg;	
}


function gotoSaleShoppingDetail(arg)
{
	location = "../Shopping/ItemShopping_SaleDetail.asp?a="+arg;	
}



function openItemGoodView(Gserial)
{
	url = "/Nshopping/GoodView_Item.asp?Gserial="+Gserial;	
	window.open(url,'_blank');
}

function openDahongGoodView(Gserial)
{
	url = "../Shopping2/GoodView_Dahong.asp?Gserial="+Gserial;	
	window.open(url,'_blank');
}


function openSummerGoodView(Gserial)
{
	url = "../NShopping/GoodView_Summer.asp?Gserial="+Gserial;	
	window.open(url,'_blank');
}


function zoomPicture(arg)
{
   target = "../Shopping/zoomPicture.asp?Gserial=" + arg;
   window.open(target,"Picture","status=no,toolbar=no,scrollbars=no,resizable=no,width=780,height=780")
}

function gotoAlert()
{
	alert("경고창")
}

function addBookMark(){
window.external.AddFavorite('http://www.dahong.co.kr', 'everyday NEW dahong')
}


function bookmarksite(title,url) {
	if (window.sidebar) // firefox 
		window.sidebar.addPanel(title, url, ""); 
	else if(window.opera && window.print) // opera 
	{ 
		var elem = document.createElement('a'); 
		elem.setAttribute('href',url); 
		elem.setAttribute('title',title); 
		elem.setAttribute('rel','sidebar'); 
		elem.click(); 
	} 
	else if(window.external && ('AddFavorite' in window.external)) // ie
		window.external.AddFavorite(url, title);
	else if(window.chrome) // chrome
	{ 
		alert('ctrl+D 를 눌러서 북마크에 추가해주세요!'); 
	}
}


</script>

<script language="JavaScript" type="TEXT/JAVASCRIPT">
<!--
function size()
{
	var url;
	url ="/shopping/images6/main/size.asp"
	window.open(url,'mypop','width=720,height=500,scrollbars=yes');
	return;
}
 -->
</script>


<script language="JavaScript" type="TEXT/JAVASCRIPT">
<!--
function model()
{
	var url;
	url ="http://model.dahong.co.kr/Model_Register_Form_new.asp"
	window.open(url,'mypop','width=738,height=600,scrollbars=yes');
	return;
}
 -->
</script>


<script language="JavaScript" type="TEXT/JAVASCRIPT">
<!--
function photo_re()
{
	var url;
	url ="/photojenic/10th/10photot_list.htm"
	window.open(url,'mypop','width=670,height=700,scrollbars=yes');
	return;
}
 -->
</script>


<script language="JavaScript" type="TEXT/JAVASCRIPT">
<!--
function event0108()
{
	var url;
	url ="/event/event_20070108.htm"
	window.open(url,'mypop','width=617,height=700,scrollbars=yes');
	return;
}
 -->
</script>

<script language="javascript">
function CyworldConnect(gserial)
{
	window.open('http://api.cyworld.com/openscrap/post/v1/?xu=http://www.dahong.co.kr/XML/CyworldConnect.asp?gserial='+gserial+'&sid=ksBrwWMJBeUecZF3gfMjvBNotcUtZCnN', 'cyopenscrap', 'width=450,height=410');
}

</script>

  
<script src="/flashpatch.js"></script>

<style type="text/css">

<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

<script language='javascript'>
function div_promotion_onoff(state)
	{
		if (state==1)
		{
			document.getElementById('div_promotion').style.display='';
		}
		else
		{
			document.getElementById('div_promotion').style.display='none';
		}
	}

	function goto_promotion()
	{
		document.location.href='http://www.dahong.co.kr/Nshopping/promotion_list.asp';
	}

</script>


    <script type="text/JavaScript">
<!--
function div_event_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_event').style.display='';
	}
	else
	{
		document.getElementById('div_event').style.display='none';
	}
}

function div_notice_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_notice').style.display='';
	}
	else
	{
		document.getElementById('div_notice').style.display='none';
	}
}

function div_zzim_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_zzim').style.display='';
	}
	else
	{
		document.getElementById('div_zzim').style.display='none';
	}
}

function div_cart_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_cart').style.display='';
	}
	else
	{
		document.getElementById('div_cart').style.display='none';
	}
}

function div_menu_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_menu').style.display='';
	}
	else
	{
		document.getElementById('div_menu').style.display='none';
	}
}

function div_allmenu_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_allmenu').style.display='';
	}
	else
	{
		document.getElementById('div_allmenu').style.display='none';
	}
}

function div_search_onoff(state)
{
	if (state==1)
	{
		document.getElementById('div_search').style.display='';
	}
	else
	{
		document.getElementById('div_search').style.display='none';
	}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
<!-- 상단 메뉴 시작-->

<table width="1190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="300" height="182" valign="top">
<a href="http://www.dahong.co.kr/" onFocus="this.blur();"><img src="/images_2015/top/logo_2015.gif" border="0" /></a>
    </td>
    <td width="470" valign="bottom" align="right" style="padding-right:5px;">
<!--중간배너시작-->

<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="http://www.secondleeds.com?src=image&kw=000001" target="_blank"><img src="/images_2015/top/se_top0418.jpg" border="0"></a></td>
  </tr>
</table>

<!--중간배너종료-->
    </td>
    <td width="420" align="right" valign="top">
<!-- 상단 우측 메뉴 시작-->
<table width="420" height="182" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" align="right">
<!--레이어 메뉴 시작-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31" align="right" valign="bottom" style="padding-right:4px">
        
        <span class="top04"><a href="http://www.dahong.co.kr/Member/LoginForm.asp">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.dahong.co.kr/member/AgreementJob.asp">회원가입 (쿠폰4장)</a></span>
        </td>
      </tr>
      <tr>
        <td height="5" align="right"></td>
      </tr>
      <tr>
        <td align="right"><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" valign="top">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>  
            <td align="center" style="padding-left:4px; padding-right:0px;">
            <div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-137px;top:46px;display:none" id="div_search"  onmouseout="div_search_onoff(0)" onMouseOver="div_search_onoff(1)">
                    <!-- 상품검색 ------------------------------------------------------------------------------------------------------------------------------------>
                    
						<table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
						  <tr>
                          <td height="100" align="right" >
							<table border="0" cellspacing="0" cellpadding="0" width="254">
							  <tr>
								<td height="90" align="center" background="/images_2015/top/topmenu_s_0c.gif" ><table width="147" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <script language="JavaScript" type="TEXT/JAVASCRIPT">
	<!--
	function SearchOk() 
	{
			if ( document.search.textfield.value.length == 0 ) 
			{
				alert("상품명을 입력해 주세요"); 
				document.search.textfield.focus();
				return ;		
			}
					
		document.search.submit();
	}
	
	
	function isSerchEnter()
	{
			if (event.keyCode == 13) SearchOk()
	}
	-->
                </script>
                    <form name="search" method="post" action = "/Nshopping/reference_products.asp" style="MARGIN: 0px" >
                      <td height="23" background="/images_2013/top/top_search_bg.jpg">&nbsp;<input name="textfield" type="text" class="text"  style="border-top: 0px dotted #FFFFFF; border-bottom: 0px dotted #FFFFFF; border-left: 0px dotted #FFFFFF; border-right: 0px dotted #FFFFFF; color: #333333; FONT-FAMILY: 굴림; FONT-SIZE: 9pt" onKeyPress="isSerchEnter()" size="20" maxlength="30"></td>
                      <td width="23"><img src="/images_2013/top/top_search_but.jpg" width="23" height="23" onClick="javascript:SearchOk();" style="cursor:hand"  ALT=""  /></td>
                      </form>
                    </tr>
                </table></td>
							  </tr>
							</table>
						  </td>
						  </tr>
						</table>

                     
                    <!-- 상품검색 ------------------------------------------------------------------------------------------------------------------------------------>
                    </div>
			
			<img src="/images_2015/top/topmenu_s_00.gif" border="0" style="cursor:hand"  onclick="javascript:location='#'" onMouseOver="div_search_onoff(1)" onMouseOut="div_search_onoff(0)" /> </div></td>

            <td align="center" style="padding-left:4px; padding-right:4px;"><div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-190px;top:46px;display:none" id="div_event"  onmouseout="div_event_onoff(0)" onMouseOver="div_event_onoff(1)">
                    <!-- 디스토리 & 이벤트 ------------------------------------------------------------------------------------------------------------------------------------>
                    
						<table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						  <tr><td height="90" align="right" >
							<table border="0" cellspacing="0" cellpadding="0" width="254" height="100">
							  <tr>
								<td ><a href="/Ncommunity/dstory_list.asp"><img src="/images_2015/top/topmenu_s_1c.gif" width="254" height="90" border="0"></a></td>
							  </tr>
							</table>
						  </td>
						  </tr>
						</table>
                     
                    <!-- 디스토리 & 이벤트 ------------------------------------------------------------------------------------------------------------------------------------>
                    </div>
					<img src="/images_2015/top/topmenu_s_02.gif" border="0" style="cursor:hand"  onclick="javascript:location='/Ncommunity/dstory_list.asp'" onMouseOver="div_event_onoff(1)" onMouseOut="div_event_onoff(0)" /> </div></td>
            <td align="center" style="padding-left:4px; padding-right:4px;">
				<div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-240px;top:46px;display:none" id="div_notice"  onmouseout="div_notice_onoff(0)" onMouseOver="div_notice_onoff(1)">
					<!-- 쿠폰존 & 멤버쉽 ------------------------------------------------------------------------------------------------------------------------------------>
                    
						<table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						  <tr><td height="90" align="right" >
							<table border="0" cellspacing="0" cellpadding="0" width="254" height="100">
							  <tr>
								<td ><a href="/my/myCouponBook_guest.asp"><img src="/images_2015/top/topmenu_s_2c.gif" width="254" height="90" border="0"></a></td>
							  </tr>
							</table>
						  </td>
						  </tr>
						</table>
                     
                    <!-- 쿠폰존 & 멤버쉽 ------------------------------------------------------------------------------------------------------------------------------------>
					</div>
					<img src="/images_2015/top/topmenu_s_03.gif" onMouseOver="div_notice_onoff(1)" onMouseOut="div_notice_onoff(0)"  onclick="javascript:location='/my/myCouponBook_guest.asp'" style="cursor:hand" />				</div>			</td>

            <td align="center" style="padding-left:4px; padding-right:4px;">
				<div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-290px;top:46px;display:none" id="div_zzim"  onmouseout="div_zzim_onoff(0)" onMouseOver="div_zzim_onoff(1)">
                    <!-- 관심상품 ------------------------------------------------------------------------------------------------------------------------------------>
                    
						<table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						  <tr><td height="100" align="right" >
							<table border="0" cellspacing="0" cellpadding="0" width="254" height="100">
							  <tr>
								<td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="90" align="center" valign="bottom" background="/images_2015/top/topmenu_s_3c.gif"><table width="100" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="34" align="center" valign="top"><a href="/my/myzzim2.asp"><span class="top08">[ <span id="div_FavoritesCnt">0</span> ]</span></a></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                </table></td>
							  </tr>
							</table>
						  </td>
						  </tr>
						</table>
                        
                    <!-- 관심상품 ------------------------------------------------------------------------------------------------------------------------------------>                    
					</div>
					<img src="/images_2015/top/topmenu_s_04.gif"  onMouseOver="div_zzim_onoff(1)" onMouseOut="div_zzim_onoff(0)"  onclick="javascript:location='/my/myzzim2.asp'" style="cursor:hand" />				</div>			</td>
            <td align="center" style="padding-left:4px; padding-right:4px;">
				<div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-340px;top:46px;display:none" id="div_cart"  onmouseout="div_cart_onoff(0)" onMouseOver="div_cart_onoff(1)">
                    <!-- 장바구니 ------------------------------------------------------------------------------------------------------------------------------------>
                    
						<table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						  <tr><td height="100" align="right" >
							<table border="0" cellspacing="0" cellpadding="0" width="254" height="100">
							  <tr>
								<td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="90" align="center" valign="bottom" background="/images_2015/top/topmenu_s_4c.gif"><table width="100" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="34" align="center" valign="top"><a href="/cart/mycart.asp"><span class="top08">[ <span id="div_CartCnt">1</span> ]</span></a></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                </table></td>
							  </tr>
							</table>
						  </td>
						  </tr>
						</table>
                        
                    <!-- 장바구니 ------------------------------------------------------------------------------------------------------------------------------------>                    
					</div>
					<img src="/images_2015/top/topmenu_s_05.gif"  onMouseOver="div_cart_onoff(1)" onMouseOut="div_cart_onoff(0)"  onclick="javascript:location='/cart/mycart.asp'" style="cursor:hand"/>				</div>			</td>
            <td align="center" style="padding-left:4px; padding-right:0px;" onMouseOver="div_menu_onoff(1)" onMouseOut="div_menu_onoff(0)" >
				<div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-390px;top:46px;display:none" id="div_menu"  onmouseout="div_menu_onoff(0)" onMouseOver="div_menu_onoff(1)">
                    <!-- 메뉴 ------------------------------------------------------------------------------------------------------------------------------------>
                    
						<table width="420" border="0" cellpadding="0" cellspacing="0" background="/images_2015/top/topmenu_bg.gif">
						  <tr><td height="103" align="right" >
							<table border="0" cellspacing="0" cellpadding="0" width="254" height="103">
							  <tr>
								<td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="8" align="center" valign="bottom"></td>
                                  </tr>
                                  <tr>
                                    <td align="center" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><a href="/customer/Tracking.asp"><img src="/images_2015/top/topmenu_s_5c_01.gif" width="99" height="21" border="0"></a></td>
                                        <td><a href="/Ncs/message1.asp"><img src="/images_2015/top/topmenu_s_5c_02.gif" width="73" height="21" border="0"></a></td>
                                        <td><a href="/my/mydahong.asp"><img src="/images_2015/top/topmenu_s_5c_03.gif" width="82" height="21" border="0"></a></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td height="11" align="center"></td>
                                  </tr>
                                  <tr>
                                    <td height="63" align="center" valign="bottom" onMouseOver="div_allmenu_onoff(1)" onMouseOut="div_allmenu_onoff(0)">
				<div style="position:relative; z-index:100" > 
					<div style="position:absolute;left:-148px;top:34px;display:none" id="div_allmenu"  onmouseout="div_allmenu_onoff(0)" onMouseOver="div_allmenu_onoff(1)">
                    <!-- 메뉴 ------------------------------------------------------------------------------------------------------------------------------------>
                                 <table width="420" border="0" cellpadding="0" cellspacing="0" bgcolor="#E2E2E2" >
                                  <tr>
                                    <td width="1" align="center" valign="bottom"></td>
                                    <td align="center" valign="top" bgcolor="#FFFFFF">
                                    <table width="380" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="25">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="center">
                                        
                                        
                                        <table width="380" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="175" valign="top" height="25"><span class="top09"><font color="FF0066">DAHONG</font></span></td>
                                            <!-- 사장님 지시 사항으로 히든처리
                                            <td width="20%" valign="top"><span class="top09"><font color="#B18BD8">GIRLS</font></span></td>
                                            -->
                                            <!-- 사장님 지시 사항으로 히든처리
                                            <td width="175" valign="top"><span class="top09"><font color="#9CA970">SECOND LEEDS</font></span></td>
                                            -->
                                            <td width="175" valign="top"><span class="top09">MYPAGE</span></td>
                                            <td width="105" valign="top"><span class="top09">C/S</span></td>
                                          </tr>
                                          <tr>
                                            <td valign="top">
                                            <span class="top10">
                                              <a href="/Nshopping/itemShopping_New.asp?Site=D">NEW 10%</a><br>
                                              <a href="/Nshopping/itemShopping_weekly.asp?Site=D">BEST SELLER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=1&Site=D">TOP</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=318&Site=D">SHIRTS &amp; BLOUSE</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=3&Site=D">OUTER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=321&Site=D">SKIRT</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=4&Site=D">DRESS</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=5&Site=D">PANTS</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=6&Site=D">BAG &amp; SHOES</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=8&Site=D">ACC</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=9&Site=D">INNER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=41&Site=D">BIKINI</a><br>
                                              <a href="/Ncs/Recently_Review.asp?Site=D">상품후기</a><br>
                                              <a href="/Nshopping/ItemShopping_express.asp?Site=D">당일발송</a><br>
											  <a href="/Nshopping/promotion_list.asp">기획전 리스트</a>                                            
                                              </span>                                              
                                              </td>
                                            <!-- 사장님 지시 사항으로 히든처리
                                            <td valign="top">
                                            <span class="top10">
                                              <a href="/Nshopping/itemShopping_New.asp?Site=A">NEW 10%</a><br>
                                              <a href="/Nshopping/itemShopping_weekly.asp?Site=A">BEST SELLER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=60&Site=A">TOP</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=61&Site=A">KNIT</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=62&Site=A">OUTER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=63&Site=A">DRESS</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=64&Site=A">BOTTOM</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=65&Site=A">BAG &amp; SHOES</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=67&Site=A">ACC</a><br>
                                              <a href="/Ncs/Recently_Review.asp?Site=A">상품후기</a>                                            
                                               </span>                                              
                                               </td>
                                            
                                            <td valign="top">
                                            <span class="top10">
                                              <a href="/Nshopping/itemShopping_New.asp?Site=L">NEW 10%</a><br>
                                              <a href="/Nshopping/itemShopping_weekly.asp?Site=L">BEST SELLER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=104&Site=L">TOP</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=108&Site=L">BLOUSE</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=111&Site=L">OUTER</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=116&Site=L">DRESS &amp; SKIRT</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=118&Site=L">PANTS</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=123&Site=L">BAG &amp; SHOES</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=126&Site=L">ACC</a><br>
                                              <a href="/Nshopping/ItemShopping_main.asp?a=324&Site=L">SUMMER</a><br>
                                              <a href="/Ncs/Recently_Review.asp?Site=L">상품후기</a></p>
                                             </span>                                            
                                             </td>
                                              --> 
                                            <td valign="top">
                                            <span class="top10">
                                              <a href="/my/myzzim2.asp">관심상품 리스트</a><br>
                                              <a href="/cart/mycart.asp">장바구니</a><br>
                                              <a href="/my/MyOrder.asp">주문조회(후기작성)</a><br>
                                              <a href="/my/myMessage_qna.asp">내 게시글조회</a><br>
                                              <a href="/my/ModifyForm.asp">개인정보수정</a><br>
                                              <a href="/my/myCash.asp">예치금조회</a><br>
                                              <a href="/my/myEmoney.asp">적립금조회</a><br>
                                              <a href="/my/myCoupon.asp">할인쿠폰조회</a><br><br>
                                            </span>
                                            <span class="top09">SNS</span><br>
                                            <span class="top10">
                                             <a href="https://www.facebook.com/dahongmall" target="_blank">페이스북</a><br>
                                             <a href="https://www.instagram.com/love_dahong/" target="_blank">인스타그램</a><br>
                                             <a href="https://story.kakao.com/ch/dahong" target="_blank">카카오스토리</a>                                            </span>                                            </td>
                                            <td valign="top">
                                            <span class="top10">
                                              
                                              <a href="/Member/LoginForm.asp">로그인</a><br>
                                              
                                              <a href="/member/AgreementJob.asp">회원가입</a><br>
                                              <a href="/Ncommunity/dstory_list.asp">디스토리 &amp; 이벤트</a><br>
                                              <a href="/my/myCouponBook_guest.asp">할인혜택</a><br>
                                              <a href="/customer/Tracking.asp">주문/배송조회</a><br>
                                              <a href="/Ncs/message1.asp">질문과답변</a><br>
                                              <a href="/Ncs/FaqList.asp?Select=1">자주묻는질문</a><br>
                                              <a href="/Ncs/notice.asp">공지사항</a><br>
                                              <a href="/Nshopping/Shopping_OnlyYou.asp">개인결제</a><br>
                                              <a href="/NShopping/itemshopping_today.asp">최근본상품</a><br>
                                              <a href="/introduction/introduction3.asp">이용약관</a><br>
                                              <a href="/introduction/introduction2.asp">개인정보취급방침</a><br>
                                              <a href="/Ncommunity/Model_Register.asp">모델지원</a><br>
                                              <a href="/introduction/Recruit.asp">채용공고</a><br>
                                              <a href="mailto:tmdwnekdk@hanmail.net">제휴문의</a><br>
                                              <a href="/Ncommunity/celeb_list.asp">연예인협찬</a><br>
                                            </span>                                              </td>
                                          </tr>
                                        </table>
                                        
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table></td>
                                    <td width="1" height="450" align="center" valign="bottom"></td>
                                  </tr>
                                  <tr>
                                    <td height="1" align="center" valign="bottom"></td>
                                    <td height="1" align="center" valign="bottom"></td>
                                    <td height="1" align="center" valign="bottom"></td>
                                  </tr>
                                 </table>
                                 </div>
                                 <img src="/images_2015/top/topmenu_s_5c_04.gif" onMouseOver="div_allmenu_onoff(1)" onMouseOut="div_allmenu_onoff(0)"  onclick="javascript:location='#'" style="cursor:hand" /></div>                                    </td>
                                  </tr>
                                </table></td>
							  </tr>
							</table>
						  </td>
						  </tr>
						</table>
                        
                    <!-- 메뉴 ------------------------------------------------------------------------------------------------------------------------------------>                    
					</div>
					<img src="/images_2015/top/topmenu_s_06.gif"  onMouseOver="div_menu_onoff(1)" onMouseOut="div_menu_onoff(0)"  onclick="javascript:location='#'" style="cursor:hand" />				</div>			</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
      </tr>
    </table>
<!--레이어 메뉴 종료-->
    </td>
  </tr>
  <tr>
    <td valign="bottom" align="right">
<!--기존 배너 히든
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="bottom">&nbsp;</td>
                
                <td align="right" valign="bottom" >
                <a href="http://www.dahong.co.kr/Nshopping/ItemShopping_Keyword.asp?a=266"><img src="/images_2015/top/0215top_knitsale.jpg" border="0"></a></td> 
                
                <td align="right" valign="bottom" >
                <a href="http://www.secondleeds.com?src=image&kw=000001" target="_blank"><img src="/images_2015/top/0302top_2nd.jpg" border="0"></a>
                </td>            
              </tr>
            </table>
-->
    </td>
  </tr>
</table>

<!-- 상단 우측 메뉴 종료-->
    </td>
  </tr>
</table>

    
<!-- 상단 메뉴 종료-->
  </td>
  </tr>
  <tr><td height="2" align="center" bgcolor="#000000"> </td></tr>



  <tr>
    <td height="60" align="center">
    
    <table border="0" cellspacing="0" cellpadding="0">
      
      <tr>
        <td align="center">
        
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
		  <tr>
			<td style="padding-right:29px" ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/itemShopping_New.asp?Site=D"><font color="#E82055">NEW10%</font></a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/itemShopping_weekly.asp?Site=D">BEST</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=1&psize=L&Site=D">TOP</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=318&psize=L&Site=D">SHIRTS & BLOUSE</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=3&psize=L&Site=D">OUTER</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=321&psize=L&Site=D">SKIRT</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=4&psize=L&Site=D">DRESS</a><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=4&psize=L&Site=D"></a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=5&psize=L&Site=D">PANTS</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=6&psize=L&Site=D">BAG &amp; SHOES</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=8&psize=L&Site=D">ACC</a></span></td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=9&psize=L&Site=D">INNER</a></span></td>
			<td style="padding-right:29px"  >
            <!--뉴 아이콘 붙은 비키니메뉴
            <div style="position:relative;">
            <span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=41&psize=L&Site=D">SUMMER</a></span>
			<div style="position:absolute;left:6px;top:-30px; width:33px"><img src="/images_2015/main/sunnybunny_nicon.png"></div>
			</div>
             --->
            <span class="top03"><a href="http://www.dahong.co.kr/Nshopping/ItemShopping_main.asp?a=41&psize=L&Site=D">SUMMER</a></span>
            </td>
			<td style="padding-right:29px"  ><span class="top03"><a href="http://www.dahong.co.kr/Ncs/Recently_Review.asp?Site=D">REVIEW</a></span></td>
			<td align="right" ><span class="top03"><a href="http://www.dahong.co.kr/my/myCouponBook_guest.asp">할인혜택</a></span></td>
		  </tr>
		</table></td>
      </tr>
    </table>
    </td>
  </tr>

  <tr>
    <td height="1" bgcolor="#FFFFFF"></td>
  </tr>

  <tr>
    <td height="45" align="center">&nbsp;</td>
  </tr>

</table>





</td>
        </tr>
      </table>
      
<!-- 장바구니 내용테이블 시작-->
          <table width="1140" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" valign="top">

<table width="100%" border="0" cellspacing="0" cellpadding="0">

 <tr>
  <td align="center"><img src="./img/title_cart.gif" width="500" height="50"></td>
 </tr>
 <tr>
  <td height="40">&nbsp;</td>
 </tr>
</table>




    <!-- 일반 장바구니 테이블 시작-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
   
<table width="100%" border="0" cellspacing="0" cellpadding="0">


<form name="dumyNormal" id="dumyNormal" method="post">
  <input type="hidden" name="deliveryfee" value="2500">
  <input type="hidden" name="kind" value="1">
  <input type="hidden" name="cartseq" value="">
  <input type="hidden" name="mode" value="C">
  <input type="hidden" name="ExpressDelivery" value="N">
  <input type="hidden" name="CartCnt" value="1">
  <tr>
    <td height="1" bgcolor="#dfdfdf"></td>
  </tr>
  <tr >
    <td height="45" align="center">
      <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td width="10%" ><label><input type="checkbox" name="allcheck" id="allcheck1" value="T" checked onClick="setAllCheckNormal();">&nbsp;전체선택 </label></td>                                
         <td width="24%" style="padding-left:40px;"><span class="style17">상품명</span></td> 
         <td width="22%" align="center" style="padding-left:15px;"><span class="style17">카테고리</span></td>                                
         <td width="16%" align="center"><span class="style17">판매가</span></td>                                
         <td width="12%" align="center"><span class="style17">적립금</span></td>                               
         <td width="16%" style="padding-left:102px;"><span class="style17">수량</span></td>                                
        </tr>
      </table>
     </td>
   </tr>
 <tr>
  <td height="1" bgcolor="#d9d9d9"></td>
 </tr>
</form>
</table>

  
  
 <form name="cartNormal" id="cartNormal" method="post">  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  

  <tr bgcolor="#FFFFFF">
  
  <!-- ///////////////////////////////////////////////////////////////////////// -->
    <!-- ///////////////////////장바구니 상품목록 ///////////////////// -->
    <c:forEach items="${cartlist}" var="cart">
    <td align="center" valign="top" style="padding-top:7px; padding-bottom:7px;">

<!-- 상품 내용 시작-->
 
<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" >
	
<input type="hidden" name="seq" value="22301780">
    <input type="checkbox" name="checkcart" value="44000/0/1/22301780/N" checked onClick="ComputeGamountNormal();" class="checkcart1">
	
    </td>
    <td width="29%" >
    
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80px"><img src="img/clothes/${cart.itemID}.gif" width="80px"  onClick="JavaScript:openItemGoodView('689280')" ></td>
    <td width="20"></td>
    <td>
    <span class="m_title07">
		
			<B>${cart.name}</B>
		
    </span>
    </td>
  </tr>
</table>

    </td>
    <td width="66%">
    
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td  width="33%" align="center" style="padding-left:20px" >
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><span class="m_title07">${cart.category}</span></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
		  
  <tr>
    <td align="center"><a href="javascript:layerPopOpen('22301780');"><img src="/images_2015/cart/cart_bt01.gif" border="0"></a></td> </tr>
		  
</table>


    </td>
    <td width="25%" align="center" >
	<span class="m_title07">	
	${cart.buy_Price}원 
	
	</span>
	</td>
    <td width="18%" align="center" ><span class="m_title07">원</span></td>
    <td width="28%" align="right" >
    
    


<table width="120" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
		
        <td align="center">
		  <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="25"><img src="/images_2015/cart/cart_minus.gif" style="cursor:hand" onClick="chg_cart_ea(cartNormal.gqty_1,'dn');updateNormal();"></td>
              <td width="23" style="padding-left:5px; padding-right:5px;"><input type="text" name="gqty_1" size="2" value="1" id="999"  style="IME-MODE: disabled; height:22px; width:23px;" onKeyDown = "num_only(event)"></td>
              <td align="right" width="25">
				<img src="/images_2015/cart/cart_plus.gif" style="cursor:hand" onClick="chg_cart_ea(cartNormal.gqty_1,'up');updateNormal();">			  </td>
            </tr>
          </table>		 
          </td>
		
      </tr>
    </table>    </td>
  </tr>
</table>
         
    
    </td>
  </tr>
<!-- 품절시 나타나는 부분 시작--> 

</table>

    
    </td>
  </tr>
</table>


	
    
    <!--상품내용 종료-->
    
<!-- 일반 장바구니 옵션 변경 레이어 팝업창 시작-->    
<!--    
		<div id="layerPopOption_22301780" style="position:relative; width:100%;  left:0px; top:30%; z-index:200; display:none; ">
		<table width="90%" border="0" cellspacing="0" cellpadding="15" align="center" bgcolor="#f7f7f7" style="border:1 solid #DFDFDF">
		  <tr>
			<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td height="40"><span class="p_title08">옵션변경</span></td>
			  </tr>
			  <tr>
				<td height="1" bgcolor="#DFDFDF"></td>
			  </tr>
			  
			  <tr>
				<td height="60"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="20%"><span class="m_title21">· COLOR</span></td>
					<td width="80%">
						<select name="Cart_22301780_Color" id="Cart_22301780_Color" style="height:32px; width:100%" onChange="GetOptionSize('22301780')">
						
						  <option value="네이비" selected>네이비</option>
					    
						  <option value="백아이보리" >백아이보리</option>
					    
						  <option value="소라" >소라</option>
					    
						  <option value="인디핑크" >인디핑크</option>
					    
						</select>
					</td>
				  </tr>
				</table></td>
			  </tr>
			  <tr>
				<td height="1" bGcolor="#DFDFDF"></td>
			  </tr>
			  
			  <tr>
				<td height="60"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="20%"><span class="m_title21">· SIZE</span></td>
					<td width="80%">
					<div id="div_cart_22301780_size">
						<select name="Cart_22301780_Size" id="Cart_22301780_Size" style="height:32px; width:100%">
						  <option value="">- 옵션을 선택해 주세요 -</option>
						
						  <option value="ONE SIZE" selected>ONE SIZE</option>
					    
						</select>
					</div>
					</td>
				  </tr>
				</table></td>
			  </tr>


			  <tr>
				<td height="60">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="48%" align="center" bgcolor="#000000"  onclick="layerApplyOption('22301780')"><span class="m_title22">적용하기</span></td>
					<td width="4%" align="center">&nbsp;</td>
					<td width="48%" align="center" onClick="layerPopClose('layerPopOption_22301780')"><p class="button-wm17"><span class="m_title21">닫기</span></p></td>
				  </tr>
				</table></td>
			  </tr>
			</table>
            </td>
		  </tr>
		</table>
		</div> 

    
<!-- 일반 장바구니 옵션 변경 레이어 팝업창 종료-->
    </td>
    </tr>
    </c:forEach>
    <!-- ////////////장바구니 상품 종료 //////////////////// -->
    <!-- /////////////////////////////////////////////////////////////// -->
  <tr><td height="1" background="/images_2013/cart/cart_bar_2.gif"></td></tr>
  
  
  
  
  <tr bgcolor="#fafafa">
    <td>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>

<script type="" language="JavaScript">
<!--
function layerPopAllClose()
{


	document.all['layerPopOption_22301780'].style.display = "none"; 



}
//-->	
</script> 

	<div id=div_cart_normal_info_1  style="display:"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td width="100%" align="right" style="padding-right:33px;">
    
    <table border="0" cellspacing="0" cellpadding="0">
     <tr><td height="15"></td></tr>
     <tr>
    <td align="right">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" style="padding-left:10px"><span class="t02">총상품금액&nbsp;&nbsp;:</span></td>
          <td width="150" align="right" style="padding-right:10px">
          
            <span class="t02"><input type="text" name="goodamount" readonly value="${sum}" style=" width:100; height:25;font-size:13px; font-weight:bold; background-color:transparent; border:0;text-align:right; vertical-align:middle;line-height:22px;"> <b>원</b></span></td>
        </tr>
      </table>
      </td>
  </tr>
  <tr>
    <td align="right">
							
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" style="padding-left:10px"><span class="t02">배송비&nbsp;&nbsp;:</span></td>
          <td width="150" align="right" style="padding-right:10px">
          <span class="t02"><input type="text" name="deliveryfee" readonly value="2,500" style="width:100; height:25;font-size:13px;font-weight:bold;background-color:transparent; border:0;text-align: right; vertical-align:middle;line-height:22px;"> <b>원</b></span></td>
        </tr>
      </table></td>
  </tr>

  <tr>
    <td align="right">
							
      <table  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" style="padding-left:10px"><span class="t02">할인금액&nbsp;&nbsp;:</span></td>
          <td width="150" align="right" style="padding-right:10px">
          <span class="t02"><input type="text" name="totsaleamount" size="8" readonly value="0" style="width:100; height:25;font-size:13px; color:#f92b82; font-weight:bold;background-color:transparent; border:0;text-align: right; vertical-align:middle;line-height:22px;"> <b><font color="#f92b82">원</font></b></span></td>
        </tr>
      </table></td>
  </tr>

  <tr>
    <td align="right">
							
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" style="padding-left:10px"><span class="t02"><b>결제예정금액&nbsp;&nbsp;:</b></span></td>
          <td width="150" align="right" style="padding-right:10px">
          <span class="t02"><input type="text" name="settleamount" size="8" readonly value="${sum+2500	}" style="width:100; height:25;font-size:13px;font-weight:bold;background-color:transparent; border:0;text-align: right; vertical-align:middle;line-height:22px;"> <b>원</b></span></td>
        </tr>
      </table>
      </td>
  </tr>
     <tr><td height="15"></td></tr>
</table>    
</td>
  </tr>
</table>

  					</div>
					<!-- 장바구니 비었을때-->
                    <div id=div_cart_normal_info_2  style="display:none" align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr><td height="10"></td></tr>
                    <tr>
  					<td height="100" align="center"><font color="#000000">※ 장바구니에 선택한 상품이 없습니다.</font></td>
  				    </tr>
					</table>
                    </div> 
					<!-- 장바구니 비었을때-->
                    
					<!-- 당일배송 상품 주문시-->
					<div id=div_cart_normal_info_3  style="display:none" align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr><td height="10"></td></tr>
                    <tr>
  					<td align="center"><font color="#FF0066">※ 선택하신 상품들은 당일발송 주문 가능합니다.</font></td>
  				    </tr>
					</table>
                     </div>
					<!-- 당일배송 상품 주문시-->
                    
					<!-- 일반배송+당일배송 상품 주문시-->
					<div id=div_cart_normal_info_4  style="display:none" align="center"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr><td height="10"></td></tr>
                    <tr>
  					<td align="center"><font color="#FF0066">※ 당일발송 / 일반배송을 함께 주문하시면 일반배송으로 처리됩니다.</font></td>
  				    </tr>
                    <tr><td height="10"></td></tr>
					</table>
                    </div>
					<!-- 일반배송+당일배송 상품 주문시-->    </td>
  </tr>
</table>    
   </td>
  </tr>
  <tr>
  <td height="1" bgcolor="#dfdfdf"></td>
  </tr>

</table>   
  </form>
  
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="15"></td>
  </tr>
</table>
 
  
<!-- 버튼 테이블 시작-->
<table width="1140" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="400"><table width="307" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="97" height="30" align="center" style="border:1 solid #d2d2d2;cursor:pointer;cursor:hand;" onClick="javascript:SelectedCartNormalDel();"><font color="#353535"><b>선택삭제</b></font></td>
        <td width="8" align="center"></td>
        <td width="97" align="center" style="border:1 solid #d2d2d2;cursor:pointer;cursor:hand;" onClick="javascript:DelCartAll();"><font color="#353535"><b>전체삭제</b></font></td>
        <td width="8" align="center"></td>
        <td width="97" align="center" style="border:1 solid #d2d2d2;cursor:pointer;cursor:hand;" onClick="location.href='http://www.dahong.co.kr'" ><font color="#353535"><b>쇼핑계속</b></font></td>
      </tr>
    </table></td>
    <td width="740" align="right">
    <table width="460" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="225" height="45" align="center" bgcolor="3f4248" style="cursor:pointer;cursor:hand;" onClick="javascript:OrderCartNormalAll();"><font color="#ffffff"><b>전체상품 구매하기</b></font></td>
        <td width="10" ></td>
        <td width="225" align="center" bgcolor="a6aab2" style="cursor:pointer;cursor:hand;" onClick="javascript:OrderCartNormal();"><font color="#ffffff"><b>선택상품 구매하기</b></font></td>
      </tr>
    </table></td>
  </tr>
</table>
<!-- 버튼 테이블 종료-->

    
    </td>
  </tr>
  <tr>
  <td height="100"></td>
  </tr>
</table>
    <!-- 일반 장바구니 테이블 종료-->


    
<table width="100%" border="0" cellspacing="0" cellpadding="25" style="border:1 solid #dfdfdf;">

  <tr>
   <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="20">&gt; 장바구니에는 5일간 보관을 원칙으로 하며, 주문 후 유효한 결제시간이 지날 경우 구매내역이 자동삭제됩니다.</td>
     </tr>
     <tr>
       <td height="20">&gt; 쿠폰사용은 로그인 후 구매과정에서 적용되며, 무료배송은 5만원이상 구매시 적용됩니다.</td>
     </tr>
     <tr>
       <td height="20">&gt; 비회원으로 구매하시면 적립금 , 할인쿠폰이 지급되지 않습니다. </td>
     </tr>
   </table>
   </td>
  </tr>
</table>

    
    
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="150">&nbsp;</td>
  </tr>
</table>


              </td>
            </tr>
          </table> 
<!-- 장바구니 내용테이블 종료-->       

    
   

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="150" align="center" valign="bottom" bgcolor="#FFFFFF"><a href="#top"><img src="/images_2015/main/bottom_top.gif" border="0" /></a></td>
  </tr>
  <tr>
    <td height="3" bgcolor="#333333"></td>
  </tr>
  <tr>
    <td height="150" align="center" bgcolor="#FFFFFF" ><table width="1190" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><a href="/Ncs/message1.asp">질문과답변</a></td>
        <td align="center"><a href="/Ncs/Recently_Review.asp?site=D">상품후기</a></td>
        <td align="center"><a href="/my/myCouponBook_guest.asp">할인혜택</a></td>
        <td align="center"><a href="/Ncs/notice.asp">공지사항</a></td>
        <td align="center"><a href="/Nshopping/Shopping_OnlyYou.asp">개인결제</a></td>
        <td align="center"><a href="/customer/order_search.asp">주문조회</a></td>
        <td align="center"><a href="/NShopping/itemshopping_today.asp">최근본상품</a></td>
        <td align="center"><a href="/my/myzzim2.asp">관심상품</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="400" align="center" bgcolor="#333333">
    
    <table width="1100" border="0" cellspacing="0" cellpadding="3" >
  <tr align="left">
    <td width="40%"><span class="bottom01">CALL CENTER</span></td>
    <td width="15%"><span class="bottom01">INFO</span></td>
    <td width="15%"><span class="bottom01">FAMILY SITE</span></td>
    <td width="30%"><span class="bottom01">COMPANY</span></td>
  </tr>
  <tr>
    <td rowspan="8" valign="top" align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><span class="bottom03">1577-6654</span></td>
      </tr>
      <tr>
        <td height="40"><span class="bottom02">10:00 ~ 17:00 / LUNCH. 12:00 ~ 13:00<br />
          SAT , SUN , HOLIDAY OFF</span></td>
      </tr>
      <tr>
        <td height="26">&nbsp;</td>
      </tr>
      <tr>
        <td height="25"><span class="bottom04">반품주소</span></td>
      </tr>
      <tr>
        <td>
        <span class="bottom04">서울시 서대문구 서대문우체국 사서함 소포영업과 다홍앤지니프 앞<br>우편번호 : 120-600</span>
        </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="left" style="cursor:pointer;cursor:hand;" onClick="document.location.href='/introduction/introduction3.asp'"><span class="bottom02">&gt; 이용약관</span></td>
    <td align="left" style="cursor:pointer;cursor:hand;" onClick="document.location.href='http://www.zinif.com'"><span class="bottom02">&gt; MENS ZINIF</span></td>
    <td align="left"><span class="bottom02">&gt; 회사명 : (주)다홍앤지니프</span></td>
  </tr>

  <tr>
    <td align="left" style="cursor:pointer;cursor:hand;" onClick="document.location.href='/introduction/introduction2.asp'"><span class="bottom02">&gt; <font color="#FFFFFF">개인정보취급방침</font></span></td>
     <td align="left" >&nbsp;</td>
    <td align="left"><span class="bottom02">&gt; 대표이사 : 이동환</span></td>
  </tr>

  <tr>
    <td align="left" style="cursor:pointer;cursor:hand;" onClick="document.location.href='/Ncommunity/Model_Register.asp'"><span class="bottom02">&gt; 모델지원</span></td>
    <td align="left">&nbsp;</td>
    <td align="left"><span class="bottom02">&gt; 주소 : 서울 강남 논현 200-7 어반하이브 10층<br>
          <font color="333333">&gt; </font><font color="#FFFFFF">교환 및 반품은 반드시 좌측의 교환반품 주소로<br> 
          <font color="333333">&gt; </font>보내주세요</font></span></td>

  </tr>
  <tr>
    <td align="left" style="cursor:pointer;cursor:hand;" onClick="document.location.href='/introduction/Recruit.asp'"><span class="bottom02">&gt; 채용공고</span></td>
    <td align="left"><span class="bottom01">SNS</span></td>
    <td align="left"><span class="bottom02">&gt; 사업자등록번호 : 211-88-67647</span></td>
  </tr>
  <tr>
    <td align="left" style="cursor:pointer;cursor:hand;" onClick="document.location.href='/Ncs/FaqList.asp?Select=1'"><span class="bottom02">&gt; FAQ</span></td>
    <td rowspan="2" align="left"><a href="https://www.facebook.com/dahongmall" target="_blank" onClick="_gaq.push(['_trackEvent', 'SNS', 'Click', 'Facebook']);"><img src="/images_2015/main/icon_sns01f.png" width="40" height="32" border="0"></a><a href="https://instagram.com/love_dahong/" target="_blank" onClick="_gaq.push(['_trackEvent', 'SNS', 'Click', 'Instagram']);"><img src="/images_2015/main/icon_sns02i.png" width="40" height="32" border="0"></a><a href="https://story.kakao.com/ch/dahong" target="_blank" onClick="_gaq.push(['_trackEvent', 'SNS', 'Click', 'Kakao Story']);"><img src="/images_2015/main/icon_sns03k.png" width="40" height="32" border="0"></a></td>
    <td align="left"><span class="bottom02">&gt; 통신판매신고번호 : 제2011-서울강남-03049호</span></td>
  </tr>
  <tr>
    <td align="left"><span class="bottom02" onClick="document.location.href='mailto:webbox@dahong.co.kr'" style="cursor:pointer;cursor:hand;">&gt; 제휴문의</span></td>
    <td align="left"><span class="bottom02">&gt; 개인정보보호 책임자 : 박경서 [</span><a href="http://ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2011322016230203049&amp;area1=&amp;area2=&amp;currpage=1&amp;searchKey=04&amp;searchVal=2118867647&amp;stdate=&amp;enddate=" target="_blank"><span class="bottom02">사업자정보확인</span></a><span class="bottom02">]</span></td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left" style="padding-top:15px; padding-left:12px;"><img src="/images_2015/main/important.jpg"></td>
  </tr>
</table>

    
    </td>
  </tr>
  </table>

<!-- 페이지 탑 시작 -->

<!-- 페이지 탑 종료 -->

<Script language="javascript">
//	document.write(parent.document.referrer);
</script>

		                          
<!-- AceCounter Log Gathering Script V.72.2013010701 -->
<script language='javascript'>
if(typeof _GUL == 'undefined'){
var _GUL = 'gtc1.acecounter.com';var _GPT='8080'; var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };
document.writeln("<scr"+"ipt language='javascript' src='/acecounter/acecounter_V70.js'></scr"+"ipt>");
}
</script>
<noscript><img src='https://gtc1.acecounter.com:8080/?uid=AS4A32151314840&je=n&' border=0 width=1 height=1></noscript>
<!-- AceCounter Log Gathering Script End --> 

<!-- http://www.dahong.co.kr 공통 스크립트 -->
<!-- NHN Conversion Tracking System Gathering Script V.11.20100308 -->
<script type='text/javascript'>
if( typeof _TGCD == 'undefined'){
var _TGCD = 'AH6A35241441424'; var _JV="AMZ2008090201"; var _TGUL = 'cts5.acecounter.com';var _TGPT='80';
var _bn=navigator.appName; var _UD='undefined';var _UN='unknown'; var _TDC = document.cookie ;
function _TIDV(a){return (typeof a!=_UD)?1:0}; function _TIX(s,t){return s.indexOf(t)};function _TGV(b,a,c,d){ var f = b.split(c);for(var i=0;i<f.length; i++){ if( _TIX(f[i],(a+d))==0) return f[i].substring(_TIX(f[i],(a+d))+(a.length+d.length),f[i].length); }	return ''; };function _XV(b,a,c,d,e){ var f = b.split(c);var g='';for(var i=0;i<f.length; i++){ if( _TIX(f[i],(a+d))==0){ try{eval(e+"=f[i].substring(_TIX(f[i],(a+d))+(a.length+d.length),f[i].length);");}catch(_e){}; continue;}else{ if(g) g+= '&'; g+= f[i];}; } return g;};
function _TNOB(a){return (a!=_UD&&a>0)?new Object(a):new Object()}; function _TNIM(){return new Image()}; function _TIL(a){return a!=_UD?a.length:0}; function _LST(a,b){if(_TIX(a,b)) a=a.substring(0,_TIL(a));return a}; function _CST(a,b){if(_TIX(a,b)>0) a=a.substring(_TIX(a,b)+_TIL(b),_TIL(a));return a}; function _UL(a){a=_LST(a,'#');a=_CST(a,'://');return a}; function _AA(a){return new Array(a?a:0)}; 
function _TAGC(nm) { var cn = nm + "="; var nl = cn.length; var cl = _TDC.length; var i = 0; while ( i < cl ) { var j = i + nl; if ( _TDC.substring( i, j ) == cn ){ var val = _TDC.indexOf(";", j ); if ( val == -1 ) val = _TDC.length; return unescape(_TDC.substring(j, val)); }; i = _TDC.indexOf(" ", i ) + 1; if ( i == 0 ) break; } return ''; }; function _TASC( nm, val, exp ,dm ){var expd = new Date(); if ( exp ){ expd.setTime( expd.getTime() + ( exp * 1000 )); document.cookie = nm+"="+ escape(val) + "; expires="+ expd.toGMTString() +"; path=/; domain="+dm+"; "; }else{ document.cookie = nm + "=" + escape(val)+"; path=/; domain="+dm+"; ";};}; function SetUID() {     var newid = ''; var d = new Date(); var t = Math.floor(d.getTime()/1000); newid = 'UID-' + t.toString(16).toUpperCase(); for ( var i = 0; i < 16; i++ ){ var n = Math.floor(Math.random() * 16).toString(16).toUpperCase(); newid += n; }       return newid; }; 
var _TFCV = _TAGC("CTSFCID"); if ( !_TFCV ) { _TFCV = SetUID(); _TASC( "CTSFCID", _TFCV , 86400 * 30 * 12 , _CDM ); _TFCV=_TAGC("CTSFCID");}
var _NIU = _TNIM(); var _d=_rf=_fwd=_arg=_bv=_rl=_Tak=_xrl=_rft='',_je='n',_bR='blockedReferrer';
if( !_TIDV(_CDM)) var _CDM = document.domain; if( _CDM == '' ) var _CDM = document.domain; if( !_TIDV(_RFL)) var _RFL = ''; if( !_TIDV(_CNM)) var _CNM = ''; if( !_TIDV(_CNV)) var _CNV = ''; if( typeof _CNV == 'string' ) _CNV = _CNV.replace(/[^0-9]/g,'');
function _S_TAG(s){ var o = new RegExp(); o= /[<][^>]*[>]/gi; return s.replace(o,""); }
function _G_TAG(n,a,d){ var b=document.getElementsByTagName(n);if( b.length <= 0 ) return ''; for(var c=0;c<b.length; c++ ){ if( typeof b[c].innerHTML != _UD && _TIX(b[c].innerHTML.toString().replace(/ /g,''),a) >= 0 ){ if( typeof b[c+d].innerHTML != _UD ){ return b[c+d].innerHTML; };};}; return '';};
if( typeof _CNM == _UD || _CNM == '' ){ if( _CNV == '' && document.URL.indexOf('orderend') > 0){ /* for Makeshop */ try{ _CNV=document.getElementById('mk_totalprice').innerHTML;}catch(_e){}; if(_CNV.replace(/[^0-9]/g,'')=='') _CNV = _G_TAG('b','결제금액',1); _CNV = _S_TAG(_CNV); _CNV = _CNV.replace(/[^0-9]/g,''); }; if( _CNV == '' && document.URL.indexOf('cart_result') > 0){ /* Whois */ var _CNVT = _G_TAG('td','결제금액',0); _CNVT = _CNVT.toLowerCase(); _CNV = _CNVT.substring(_CNVT.indexOf('결제금액')+1,_CNVT.indexOf('</td>',_CNVT.indexOf('결제금액')+5)); _CNV = _S_TAG(_CNV); _CNV = _CNV.replace(/[^0-9]/g,''); }; if( _CNV == '' && document.URL.indexOf('order_result') > 0){ /* Cafe24 */ var _CNVT = _G_TAG('td','총구매액',0); _CNVT = _CNVT.toLowerCase(); _CNV = _CNVT.substring(_CNVT.indexOf('총구매액'),_CNVT.indexOf('</b>',_CNVT.indexOf('총구매액'))); _CNV = _S_TAG(_CNV); _CNV = _CNV.replace(/[^0-9]/g,''); }; if( typeof ovt_amount != _UD && ovt_amount != ''){ _CNV = ovt_amount ;}; if( _CNV != '' ){ _CNM = "구매완료"; }; };
_je = (navigator.javaEnabled()==true)?'1':'0';_bn=navigator.appName; if(_bn.substring(0,9)=="Microsoft") _bn="MSIE";
_bN=(_bn=="Netscape"),_bI=(_bn=="MSIE"),_bO=(_TIX(navigator.userAgent,"Opera")>-1);if(_bO)_bI=''; if((_bn=="MSIE")&&(parseInt(_bv)==2)) _bv=3.01;_rf=document.referrer;var _prl='';var _frm=false;
function _TPT(){return location.protocol=="https:"?"https://"+_TGUL:"http://"+_TGUL+":"+_TGPT}; function _NA(a){return new Array(a?a:0)}; 
function CTS_PL(a){if(!_TIL(a))a=_UL(document.URL); _arg = _TPT()+'/?ouid='+_TGCD+'&sv='+_JV+"&FCV="+_TFCV; _NIU.src = _arg+"&url="+escape(a)+"&ref="+escape(_rf)+"&je="+_je+"&ad_key="+escape(_Tak)+"&dm="+_CDM+"&dvt="+_DVT+"&cnm="+escape(_CNM)+"&cnv="+_CNV+"&rft="+escape(_rft)+"&RID="+Math.random()+"&"; setTimeout("",300); };
if( top && typeof top == 'object' &&_TIL(top.frames)){eval("try{_rl=top.document.URL;}catch(_e){_rl='';};"); if( _rl != document.URL ) _frm = true;};
if(_frm){ eval("try{_prl = top.document.URL;}catch(_e){_prl=_bR;};"); if(_prl == '') eval("try{_prl=parent.document.URL;}catch(_e){_prl='';};"); 
if( _TIX(_prl,'#') > 0 ) _prl=_prl.substring(0,_TIX(_prl,'#')); _prl=_LST(_prl,'#'); if( _TIX(_rf,'#') > 0 ) _rf=_rf.substring(0,_TIX(_rf,'#')); _prl=_LST(_prl,'/');_rf=_LST(_rf,'/');
if( _rf == '' ) eval("try{_rf=parent.document.URL;}catch(_e){_rf=_bR;}"); if(_rf==_bR||_prl==_bR){ _rf='',_prl='';}; if( _rf == _prl ){ eval("try{_rf=top.document.referrer;}catch(_e){_rf='';}"); 
if( _rf == ''){ _rf = 'bookmark';};if( _TIX(document.cookie,'CTSN_CK='+escape(_rf)) > -1 ){ _rf = _prl;} else{ if(_TIX(_prl,'?') > 0){ _prl = _prl.substring(_TIX(_prl,'?')+1,_prl.length); }; 
if( _TIX(_prl.toUpperCase(),'NVAR=') >= 0 ){ _Tak = 'NVAR='+_TGV(_prl.toUpperCase(),'NVAR','&','=')+'&NVKWD='+_TGV(_prl.toUpperCase(),'NVKWD','&','=')+'&NVADKWD='+_TGV(_prl.toUpperCase(),'NVADKWD','&','=')+'&NVADID='+_TGV(_prl.toUpperCase(),'NVADID','&','=').toLowerCase(); }; 
document.cookie='CTSN_CK='+escape(_rf)+';path=/;'; };};} else{ _rf=_LST(_rf,'#'); };
if(document.URL.indexOf('NVAR=')>0 && ( _TIX(_Tak,'NVAR=') < 0 ) ){ _prl =document.URL.substring(document.URL.indexOf('?')+1,document.URL.length); _Tak = 'NVAR='+_TGV(_prl.toUpperCase(),'NVAR','&','=')+'&NVKWD='+_TGV(_prl.toUpperCase(),'NVKWD','&','=')+'&NVADKWD='+_TGV(_prl.toUpperCase(),'NVADKWD','&','=')+'&NVADID='+_TGV(_prl.toUpperCase(),'NVADID','&','=').toLowerCase(); }; _rl=document.URL; var _trl = _rl.split('?'); if(_trl.length>1){ _trl[1] = _XV(_trl[1],'FWDRL','&','=','_rf'); _rf = unescape(_rf); _fwd = _TGV(_trl[1],'FWDIDX','&','='); _rl=_trl.join('?'); }; if( _RFL != '' ) _rf = _RFL; _rl = _UL(_rl); _rf = _UL(_rf); if( _rl.length > 512 ) _rl = _rl.substring(0,512);if( _rf.length > 512 ) _rf = _rf.substring(0,512); _CKURL = _TAGC("CTSCKURL"); _CKURLC = _TAGC("CTSCKURLC"); var _DVT = '1'; _rf_dm = _rf.split('/'); 
if( _CKURL != _Tak && _Tak != '' && (_rf_dm.length > 0 && _rf_dm[0].indexOf(_CDM) < 0) ) _TASC( "CTSCKURL", _Tak , 86400 * 15 , _CDM ); 
var _CKDVT = _TAGC("CTSCKDVT"); if( _CKDVT == '' ){ if( _CKURL != '' && ( _CKURLC =='' || _TGV(_CKURLC,'CTSREF','&','=') == '' ) ){ _DVT = '2';}; if( _Tak != '' && (_rf_dm.length > 0 && _rf_dm[0].length > 0 && _rf_dm[0].indexOf(_CDM) < 0) ) _DVT = '1' ; _TASC( "CTSCKDVT", _DVT , 0 , _CDM ); }else{ _DVT = _CKDVT; }; if( _Tak == '' ) _Tak = _CKURL; if( _CKURLC == '' && _Tak != '' && (_rf_dm.length > 0 && _rf_dm[0].indexOf(_CDM) < 0) ){	_Tak += '&CTSREF='+_rf; _TASC( "CTSCKURLC", _Tak , 0 , _CDM ); };
if( _CNM != '' ){ _rft = _TGV(_CKURLC,'CTSREF','&','='); }; if( typeof _rf==_UD||( _rf == '' )) _rf = 'bookmark' ;
if(_CDM=='none'){CTS_PL(_rl);}else{ if( _Tak != '' ) CTS_PL(_rl); };
}
</script>
<!-- NHN Conversion Tracking System Gathering Script End -->


<!-- 공통스크립트 끝 -->

<!-- Google Code for &#51204;&#54872;X -->
<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1056158760;
var google_conversion_label = "WbHZCLC8sAIQqOjO9wM";
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1056158760/?value=0&amp;label=WbHZCLC8sAIQqOjO9wM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>





<script language = "javascript" src = "https://pgweb.dacom.net/WEB_SERVER/js/escrowValid.js"></script>
<!-- 다홍 구글 애널리틱스 -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  var pluginUrl =  '//www.google-analytics.com/plugins/ga/inpage_linkid.js';
  _gaq.push(['_require', 'inpage_linkid', pluginUrl]);
  _gaq.push(['_setAccount', 'UA-38777331-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- 다홍 구글 애널리틱스 -->


<script type='text/javascript' id='cmclog_script' src='https://cmclog-001.cafe24.com/weblog.js?uid=zinif24&uname=zinif24'></script>

<!-- 리포트2.0 로그분석코드 시작 -->
<script type="text/javascript">
var JsHost = (("https:" == document.location.protocol) ? "https://" : "http://");
var uname = escape('다홍');
document.write(unescape("%3Cscript id='log_script' src='" + JsHost + "zinif24.weblog.cafe24.com/weblog.js?uid=zinif24&uname="+uname+"' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- 리포트2.0  로그분석코드 완료 -->

<!-- 네이버 웹로그 분석 시작 -->
<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<script type="text/javascript">
var _NGUL = "wcs.naver.net/wcslog.js";
var _NPR = location.protocol=="https:"?"https://"+_NGUL:"http://"+_NGUL;
document.writeln("<scr"+"ipt type='text/ja"+"vascript' src='"+ _NPR +"'></scr"+"ipt>");
</script>


<!-- 네이버 웹로그 분석 종료 -->

<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_4e569f5a85b7";
if (!_nao) var _nao={};
wcs.inflow();
wcs_do(_nao);
</script>

<!-- 타게팅게이트 시작 -->
<!-- WIDERPLANET  SCRIPT START 2015.8.28 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",   /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
				*주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"23019",	/*광고주 코드*/
		ty:"Home",	/*트래킹태그 타입*/
		device:"web"	/*디바이스 종류 (web 또는 mobile)*/
		
	};
}));
</script>
<script type="text/javascript" async src="//astg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2015.8.28 -->
<!-- 타게팅게이트 종료 -->

<!-- 스타일닷컴 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치.항상 하단에 위치해야함 --> 
<script type="text/javascript">
//<![CDATA[
// sta1.com trace script Ver.1.0
var S_sta1_script_domain = "dahong.co.kr";
var S_sta1_script_ver = "1.0";var S_sta1_script_check_num = 1;var S_sta1_script_location = "trace.sta1.co.kr";function S_cimgs() { return new Image(); }function S_pt(url){return document.location.protocol == "https:" ? "https://"+url : "http://"+url; }var S_sta1_cimg_url = S_sta1_script_location + "/script/" + S_sta1_script_domain + "/check.gif?r=" + Math.random();var S_sta1_script_url = S_sta1_script_location + "/script/" + S_sta1_script_domain + "/script.php?r=" + Math.random();function S_sta1_cbScIm(url){var S_sta1_load_check_time;var S_sta1_load_check_clearTimer = function() {if (S_sta1_load_check_time) {clearTimeout(S_sta1_load_check_time);S_sta1_load_check_time = null;}
};var S_sta1_load_check_handleFail = function() {this.onload = this.onabort = this.onerror = function() {};S_sta1_load_check_clearTimer();if (this.src === url) {this.src = "#sta1";}
};var S_sta1_load_check_img = S_cimgs();S_sta1_load_check_img.onerror = S_sta1_load_check_img.onabort = S_sta1_load_check_handleFail;S_sta1_load_check_img.onload = function() {ld_sta1_cbScSt();S_sta1_load_check_clearTimer();};S_sta1_load_check_img.src = url;S_sta1_load_check_time = setTimeout(function(theImg) {return function() {S_sta1_load_check_handleFail.call(theImg);};}(S_sta1_load_check_img), 3000);return(S_sta1_load_check_img);}function ld_sta1_cbScSt(){var S_sta1_html_head = document.getElementsByTagName("head")[0];var S_sta1_script= document.createElement("script");S_sta1_script.type= "text/javascript";var S_sta1_loaded = false;S_sta1_script.onreadystatechange= function () {if (this.readyState == "loaded" || this.readyState == "complete"){ if (S_sta1_loaded) { return; } S_sta1_loaded = true; }
};S_sta1_script.src = S_pt(S_sta1_script_url);S_sta1_script.charset = "utf-8";S_sta1_html_head.appendChild(S_sta1_script);}S_sta1_cbScIm(S_pt(S_sta1_cimg_url));
//]]>
</script></td>
        </tr>
        </table>

<div id="layerPopOption" style="position:relative; width:455px; height:300px; z-index:200; display:none;"></div>

     
<script type="" language="JavaScript">
<!--

function layerPopOpen(seq)
{
	url = "Cart_Option.asp?seq=" + seq;
	$('#layerPopOption').bPopup({
		position: ['auto', 'auto'],
		content:'iframe',
		iframeAttr:"name='hidden_iframe' id='hidden_iframe' frameborder='0' width='100%' height='100%'",
		loadUrl:url
//		contentContainer:'.scrollable',
	});
}

function layerPopClose()
{
	$('#layerPopOption').bPopup().close();
	$('#layerPopOption').html('');
}



function chg_cart_ea(obj,str,idx)
{

	if (obj.length) obj = obj[idx];

	var step =1;
	var min = 1;
	var max = 99;

	if (isNaN(obj.value) || obj.value == '') {
		alert ("구매수량은 숫자만 가능합니다");
		obj.value=step;
		obj.focus();
	} else {

		var ea = parseInt(obj.value);

		if (str=='up') {
			ea = ea + step
		}
		else if (str == 'set') {
			// nothing to do.
		}
		else {
			ea = ea - step
		}

		if (ea < min) {
			ea = min;
		}
		else if (max && ea > max) {
			ea = max;
		}

		var remainder = ea % step

		if (remainder > 0) {
			ea = ea - remainder;
		}

		if (ea < 0) ea=step;

		obj.value = ea;

	}
}

//-->	
</script>      

<!--  장바구니 크리테오 페이지 트래커  시작 -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
window.criteo_q = window.criteo_q || [];
window.criteo_q.push(	
        { event: "setAccount", account: 6665 },
{ event: "setSiteType", type: "d" },
        { event: "viewBasket", item: [ 
              { id: "689280", price: 44000, quantity: 1 } 
]});
</script>
<!--  장바구니 크리테오 페이지 트래커  종료 -->

<!-- 타게팅게이트 시작 -->
<!-- WIDERPLANET  SCRIPT START 2015.8.28 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",  	/*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
				 *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"23019",
		ty:"Cart",
		device:"web"
		,items:[
			{ i: "689280", t: "루루 베이직 자켓 " } 
		]
	};
}));
</script>
<script type="text/javascript" async src="//astg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- 타게팅게이트 종료 -->

    </body></center>
</html>

