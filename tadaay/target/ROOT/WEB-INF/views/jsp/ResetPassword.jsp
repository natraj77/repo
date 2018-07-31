<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
  </head>
  <body onload="onLoadExecute();">
	<div id="main-wrapper">
  <div class="container-fluid">
  <div class="login-logo-area">
	          <a href="<%=request.getContextPath()%>/" class="logo-text"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/logo.png" alt="courses" width="160px"></a>
	        </div>
    <div class="row">
      <div class="col-md-6 left-side">
        <div class="signup-text-block">
          <h2>Reset Password</h2>
          <div class="content-block-bg">
	         <!--  <div id="U" class="user-signup-content">
		          <h3>create an account and </h3>
			 <p>find courses</p>
				<p>find trainers</p>
				<p>find reviews</p>
				<p>request course content</p>
				<p>request demo</p>
				<p>enroll online</p>		         
	          </div>
	          <div id="P" class="partner-signup-content">
	          <h3>create an account and</h3>
			 	<p> find leads</p>
				<p> form batches</p>
				<p> start tracking payments</p>
				<p> assign quizzes</p>
				<p> assign tasks to your students</p>	
	          </div> -->
          </div>
        </div>
      </div>
      <div class="col-md-6 right-side">
       <%-- <form id="resetpasswordform">
	       	<div class="row">
	            <label class="col-sm-5 control-label">Login type :</label>
	            <div class="radio col-sm-7">
	              <label class="radio-inline">
	                <input type="radio" name="userTypeU"  id="userTypeU" value="U"> User
	              </label>
	              <label class="radio-inline">
	                <input type="radio" name="userTypeP"  id="userTypeP" value="P"> Partner
	              </label>
	            </div>
	          </div>
	        <span class="signup-input input-block">
	          <input type="email" class="input_field input_field-name" value="${emailId}" disabled name="emailId">
	          <label class="input_label input_label-name border-color" for="email">
	            <span class="input_label-content label-name">E-mail</span>
	          </label>
	        </span>
	        <span class="signup-input input-block">
	          <input type="password" class="input_field input_field-name" id="newpassword">
	          <label class="input_label input_label-name border-color" for="newpassword">
	            <span class="input_label-content label-name">New Password</span>
	          </label>
	        </span>
	         <span class="signup-input input-block">
	          <input type="password" class="input_field input_field-name" id="confirmpassword">
	          <label class="input_label input_label-name border-color" for="confirmpassword">
	            <span class="input_label-content label-name">confirm Password</span>
	          </label>
	        </span>
	        <div class="cta">
	          <button class="btn btn-primary pull-left">
	            Submit
	          </button>
	        </div>
        </form> --%>
        <form id="resetpasswordform">
	        <span class="signup-input input-block">
	         <input type="email" class="input_field input_field-name" value="${emailId}" disabled name="emailId">
	          <label class="input_label input_label-name border-color" for="emailId">
	            <span class="input_label-content label-name">E-mail</span>
	          </label>
	        </span>
	         <span class="signup-input input-block">
	          <input class="input_field input_field-name" type="password" id="password" name="password"/>
	          <label class="input_label input_label-name border-color" for="mobile">
	            <span class="input_label-content label-name">New Password</span>
	          </label>
	        </span>
	         <span class="signup-input input-block">
	          <input class="input_field input_field-name" type="password" id="confirmpassword" name="confirmpassword"/>
	          <label class="input_label input_label-name border-color" for="mobile">
	            <span class="input_label-content label-name">Confirm Password</span>
	          </label>
	        </span>
	        <div class="cta">
	          <button class="btn btn-primary pull-left">
	            Submit
	          </button>
	        </div>
         </form>
      </div>
    </div>
  </div>
  </div>
<%@ include file='/static/footer-include.jsp' %>
<script type="text/javascript">
$.validator.addMethod("pwcheckspechars", function (value) {
    
    return /[!@#$%^&*()_=\[\]{};':"\\|,.<>\/?+-]/.test(value)
}, "The password must contain at least one special character");

$.validator.addMethod("pwcheckconsecchars", function (value) {
    return ! (/(.)\1\1/.test(value)) // does not contain 3 consecutive identical chars
}, "The password must not contain 3 consecutive identical characters");

$.validator.addMethod("pwchecklowercase", function (value) {
    return /[a-z]/.test(value) // has a lowercase letter
}, "The password must contain at least one lowercase letter");

$.validator.addMethod("pwcheckrepeatnum", function (value) {
    return /\d{2}/.test(value) // has a lowercase letter
}, "The password must contain at least one lowercase letter");

$.validator.addMethod("pwcheckuppercase", function (value) {
    return /[A-Z]/.test(value) // has an uppercase letter
}, "The password must contain at least one uppercase letter");

$.validator.addMethod("pwchecknumber", function (value) {
    return /\d/.test(value) // has a digit
}, "The password must contain at least one number");

$("#resetpasswordform").validate({
	wrapper : 'div',
	//errorLabelContainer : "#error-note",
	// Specify the validation rules
	rules : {
		password : {
			required : true,
			 pwchecklowercase: true,
             pwcheckuppercase: true,
             pwchecknumber: true,
             pwcheckconsecchars: true,
             pwcheckspechars: true,
             minlength: 8,
             maxlength: 20
		},
		confirmpassword : {
			required : true,
			equalTo: "#password"
		},
		emailId : {
			required : true
		}
	},

	// Specify the validation error messages
	messages : {
		emailId : {
			required : "EmailId is a Required field"
		},
		password : {
			required : "Password is a Required field"
		},
		confirmpassword : {
			required : "Password is a Required field",
			equalTo:"both passwords should be same"
		},
	},
	submitHandler : function(form) {
		testme();
	}
});

function onLoadExecute(){
	var datatoSend = $("#resetpasswordform input[name=emailId]").val();
	$.ajax({
		type : 'POST',
		url : 'getDecryptedData',
		data : {
			emailId : datatoSend
		},
		mimeType : 'application/json',
		success : function(datas) {
			$("#resetpasswordform input[name=emailId]").val(datas.data);
		}
	});
	
}
function testme(){
	 $("#resetpasswordform input[name=emailId]").prop("disabled", false);
     var $form = $("#resetpasswordform");
     var data= JSON.stringify(getFormData($form));
     $("#resetpasswordform input[name=emailId]").prop("disabled", true);
     $.ajax({
			headers : {
				'Content-Type' : 'application/json'
			},
			type : 'POST',
			url : 'submitPassword',
			dataType : 'json',
			mimeType : 'application/json',
			data : data,
			success : function(datas) {
			  if(datas.status=='SUCCESS'){
			   alert('Password has been successfull Updated. Please relogin now');
			   window.location.href = "<%=request.getContextPath()%>/static/index.jsp";
			  }else {
			   alert('Password Updation failed. Please contact our representative');
			  }
			}
		});
     return false;
    }   
function getFormData($form) {
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};
	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});
   return indexed_array;
}
  </script>
</body>	       
</html>
<!--  Include Footer  -->
