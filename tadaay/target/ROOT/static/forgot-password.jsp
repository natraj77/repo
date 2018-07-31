<!doctype html>
<html class="no-js" lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='header-include.jsp'%>
         <style>
		#registration1 .error {
		    color: red;
		}
		</style>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='header.jsp' %>
<!-- Inner Page Banner Area Start Here -->
<div class="inner-page-banner-area" style="background-image: url('../resources/images/banner/5.jpg');">
    <div class="container">

    </div>  
</div> 
<!-- Inner Page Banner Area End Here -->           
<!-- Faq Page Area Start Here -->
<div class="course-details-inner container">
    <h2 class="title-default-left title-bar-high">
       Forgot Password
    </h2>
    <form id="registration2" class="form-inline">
        <div class="">
            <div class="form-group">
                <input type="email" class="form-control" id="email" placeholder="" disabled>
            </div>
            <div class="form-group">
                 <input class="form-control" id="emailToken" type="text"  placeholder="" required="required">
            </div>
        </div>

        <div class="mT20">
            <div class="form-group">
                <input type="text" class="form-control" id="thanksmobile" name="thanksmobile" placeholder=""  disabled>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="mobileToken" placeholder="" required="required">
            </div>
        </div>
    </form>
</div>
<!-- Faq Page Area End Here -->

<!--  Include Footer  -->
<%@ include file='footer.jsp' %>
</body>
<%@ include file='footer-include.jsp' %>
<script type="text/javascript">
var mobileToken = '';
var emailToken = '';
var userType='';
$(document).ready(function(){
$('#emailToken').css('border-color', 'red');
$('#mobileToken').css('border-color', 'red');
 $.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'GET',
	url : '../getTokensForVerifications',
	dataType : 'json',
	mimeType : 'application/json',
	success : function(datas) {
	emailToken = datas.emailIdToken;
	mobileToken = datas.mobileToken;
	userType = datas.userType;
	  $('#email').val(datas.emailId);
	  $('#thanksmobile').val(datas.mobile);
	  
 }
});		
});
var emailFail = true;
var mobileFail = true;
$("#emailToken").blur(function(){
emailFail = true;
    if ($('#emailToken').val() == '') {
    $('#emailToken').css('border-color', 'red');
      emailFail = true;
	}
	else {
	 if($('#emailToken').val()==emailToken){
	    $('#emailToken').css('border-color', '');
	     emailFail = false;
	    }else{
	  alert('Email OTP validation Failed');
	 }
	}
	if(!mobileFail && !emailFail){
	checkForm();
	}
});

$("#mobileToken").blur(function(){
	 mobileFail = true;
     if ($('#mobileToken').val() == '') {
    $('#mobileToken').css('border-color', 'red');
     mobileFail = true;
	}
	else {
	 //if($('#mobileToken').val()==mobileToken){
	 if(1==1){
	 $('#mobileToken').css('border-color', '');
	  mobileFail = false;
	 }else{
	  alert('Mobile OTP validation Failed');
	 }
	}
	if(!mobileFail && !emailFail){
	checkForm();
	}
});

function checkForm(){
 if(userType=='U'){
 	  window.location.href = 'user-profile.jsp';
 }else{
 	  window.location.href = 'institute-profile.jsp';
 }
}
</script>
</html>