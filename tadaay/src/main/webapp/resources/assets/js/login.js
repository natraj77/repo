/*
 $("div.signup-btn-content").hide();
$("#sign-btn").click(function(){
	$('.login-type-btns li a').removeClass("login-active");
    $(this).addClass("login-active");
    $(".signup-btn-content").show();
    $(".left-side").addClass('signup-left-side');
    $(".login-btn-content").hide();
});
$("#login-btn").click(function(){
	$('.login-type-btns li a').removeClass("login-active");
    $(this).addClass("login-active");
    $(".login-btn-content").show();
    $(".left-side").removeClass('signup-left-side');
    $(".signup-btn-content").hide();
});
$("div.trainer-login-content").hide();
$("input[name$='userType']").click(function() {
    var test = $(this).val();
    $("div.trainer-login-content").hide();
    $("div.student-login-content").hide();
    $("#" + test).show();
});

Login and Registration*/

function getFormData($form) {
		var unindexed_array = $form.serializeArray();
		var indexed_array = {};
		$.map(unindexed_array, function(n, i) {
			indexed_array[n['name']] = n['value'];
		});
       return indexed_array;
}

function checkForm(){
var $form = $("#registration1");
var data= JSON.stringify(getFormData($form));
data = data.replace('Newpassword','password');
$.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'POST',
	url : '../submitRegistration',
	dataType : 'json',
	mimeType : 'application/json',
	data : data,
	success : function(datas) {
	  if(datas.resp=='error'){
	  $("#errorMsg").html('<font>Email Id Already Registered.Please Follow Forgot Password Link from Login Page</font>');
	  $("#errorMsg").addClass("warning-notify animated fadeInUp").delay(4000).fadeOut('slow');
	  }else{
	  //window.location.href = "static/thanku-registration.jsp";
	  document.getElementById("registration2").email.value = document.getElementById("registration1").emailId.value;
	  $("#thankyou").show();
	  $("#registration1").hide();
	  }
	}
});
}

function submitRegistrationAfterOTP(){
	$.ajax({
		type : 'POST',
		url : '../validateOTPandSaveUser',
		data : {
			emailOTP : $("#registration2 input[name=emailToken]").val()
		},
		mimeType : 'application/json',
		success : function(data) {
			if (data.status == 'SUCCESS') {
				alert('Registration successful.Please login to Access Dashboard');
				var str = window.location.href;
				str = str.replace("Login", "");
				window.location.href = str;
			} else if (data.status == 'FAIL') {
				alert('Registration un successful.Contact Adminstrator ');
				var str = window.location.href;
				str = str.replace("Login", "");
				window.location.href = str;
			} 
		}
	});
}
$("#registration2").validate({
	wrapper : 'div',
	//errorLabelContainer : "#error-note",
	// Specify the validation rules
	rules : {
		emailToken : {
			required : true
		}
	},
    messages : {
		emailToken : {
			required : "Email Token is Required"
		}
	},
	errorPlacement: function(error, element) {
	     error.insertAfter(element);
	   },
	submitHandler : function(form) {
		submitRegistrationAfterOTP();
	}
});


function findUser() {
	$('#loginErrorMsg').html('');
	var emailId = document.getElementById("loginform").emailId.value;
	var password = document.getElementById("loginform").password.value;
	$.ajax({
		type : 'POST',
		url : 'findUser',
		data : {
			emailId : emailId,
			password : password 
		},
		mimeType : 'application/json',
		success : function(data) {
			if (data.status == 'SUCCESS') {
				if($("#callback").val()!='')
				{
					window.location.href = $("#callback").val();
					return;
				}
				// alert('Login SuccessFul');
				if (data.userType == 'P') {
					window.location.href = "trainingInstitute/Dashboard";
				}
				if (data.userType == 'T') {
					window.location.href = "trainer/Dashboard";
				}
				if (data.userType == 'U') {
					window.location.href = "student/Dashboard";
				}
				//For super admin dashboard
				if (data.userType == 'A') {
					window.location.href = "admin/Dashboard";
				}
				//For recruiter dashboard
				if (data.userType == 'R') {
					window.location.href = "recruiter/Dashboard";
				}
			} else if (data.status == 'INCORRECT') {
				 $('#loginErrorMsg').html('<font size="3" color="red">Login Failed</font>');
			} else {
				 $('#loginErrorMsg').html('<font size="3" color="red">Email Id is not registered with US</font>');
			}
		}
	});
}
function performForgotPassword(){
	$('#loginErrorMsg').html('');
	var emailId = $("#loginform input[name=emailId]").val();
	if(emailId==null || emailId==''){
		$('#loginErrorMsg').html('<font size="3" color="red">Please provide EMail Id to proceed');
		return;
	}else{
		$.ajax({
			headers : {
				'Content-Type' : 'application/json'
			},
			type : 'POST',
			url : 'checkForgotPassword?emailId='+emailId,
			mimeType : 'application/json',
			success : function(datas) {
			  if(datas.status=='SUCCESS'){
			  $('#loginErrorMsg').html('<font size="3" color="green">Forgot Password Link sent to '+emailId+'. Please reset Password</font>');
			  }else {
			  $('#loginErrorMsg').html('<font size="3" color="red">Email Id is not registered with US</font>');
			  }
			}
		});
	}
}

$("#loginform").validate({
	invalidHandler: function(f, v) {
		$('#loginErrorMsg').html('');
    },	
	wrapper : 'div',
		//errorLabelContainer : "#error-note",
		// Specify the validation rules
		rules : {
			password : {
				required : true
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
		},
		submitHandler : function(form) {
			findUser();
		}
	});
/* Password Valiadtion */
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

$.validator.addMethod("emailuppercase", function (value) {
    return !  /[A-Z]/.test(value) // has an uppercase letter
}, "The password must contain at least one uppercase letter");

$.validator.addMethod("pwchecknumber", function (value) {
    return /\d/.test(value) // has a digit
}, "The password must contain at least one number");

$("#registration1").validate({
		invalidHandler: function(f, v) {
			$('#loginErrorMsg').html('');
	    },
		wrapper : 'div',
		//errorLabelContainer : "#error-note",
		// Specify the validation rules
		rules : {
			fname : {
				required : true
			},
			lname : {
				required : true
			},
			emailId : {
				required : true,
				emailuppercase:true
			},
			mobile : {
				required : true,
				minlength : 10
			},
			Newpassword : {
				required : true,
				 pwchecklowercase: true,
                pwcheckuppercase: true,
                pwchecknumber: true,
                pwcheckconsecchars: true,
                pwcheckspechars: true,
                minlength: 8,
                maxlength: 20
			},
			retypepassword:{
				required : true,
				equalTo: "#Newpassword"
			},
			accept:{
				required : true
			}
		},

		// Specify the validation error messages
		messages : {
			fname : {
				required : "First Name is a Required field"
			},
			lname : {
				required : "Last Name is a Required field"
			},
			emailId : {
				required : "EmailId is a Required field",
				emailuppercase : "Enter only Lowercase letters"
			},
			mobile : {
				required : "Mobile is a Required field"
			},
			Newpassword : {
				required : "password is a Required field"
			},
			retypepassword : {
				required : "Retype password is a Required field",
				equalTo:"both passwords should be same"
			},
			accept : {
				required : "Please Accept the terms and conditions"
			},
		},
		errorPlacement: function(error, element) {
		     if (element.attr("name") == "fname") {
		         error.insertAfter( $(".fname-error") );
		     }
		     else if (element.attr("name") == "lname") {
		         error.insertAfter( $(".lname-error") );
		     }
		     else if (element.attr("name") == "emailId") {
		         error.insertAfter( $(".email-error") );
		     }
		     else if (element.attr("name") == "mobile") {
		         error.insertAfter( $(".mobile-error") );
		     }
		     else if (element.attr("name") == "Newpassword") {
		         error.insertAfter( $(".password-error") );
		     }
		     else if (element.attr("name") == "retypepassword") {
		         error.insertAfter( $(".repassword-error") );
		     }else {
		         error.insertAfter(element);
		     }
		   },
		submitHandler : function(form) {
			checkForm();
		}
	});
/*otp Verifivation*/
var mobileToken = '';
var emailToken = '';
var userType='';
var emailFail = true;
var mobileFail = true;


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

function sendQuestion(){
	if($("#questionForm input[name=name]").val()=='' || $("#questionForm input[name=email]").val()==''
		 || $("#questionForm input[name=mobile]").val()=='' || $("#questionForm input[name=preferredTimeStart]").val()=='' || $("#questionForm input[name=preferredTimeEnd]").val()==''
			 || $("#questionForm input[name=relevent]").val()=='' || $("#questionForm input[name=coursename]").val()==''|| $("#questionForm textarea#queryId").val()==''){
		alert('Please fill in the form to proceed');
		return;
	}
	$.ajax({
		type : 'POST',
		url : '../submitQuestion',
		data : {
			name : $("#questionForm input[name=name]").val(),
			email : $("#questionForm input[name=email]").val(),
			mobile : $("#questionForm input[name=mobile]").val(),
			relevent : $("#questionForm input[name=relevent]").val(),
			coursename : $("#questionForm input[name=coursename]").val(),
			preferredTimeStart : $("#questionForm input[name=preferredTimeStart]").val(),
			preferredTimeEnd : $("#questionForm input[name=preferredTimeEnd]").val(),
			queryId : $("#questionForm textarea#queryId").val()
		},
		mimeType : 'application/json',
		success : function(data) {
			if (data.status == 'SUCCESS') {
				alert('Recieved the Query .We will get back to you soon...!');
			} else if (data.status == 'FAIL') {
				alert('Problem with Submitting the Query ');
			} 
		}
	});
}
/*
function checkForm(){
 if(userType=='U'){
 	  window.location.href = 'user-profile.jsp';
 }else{
 	  window.location.href = 'institute-profile.jsp';
 }
}*/
