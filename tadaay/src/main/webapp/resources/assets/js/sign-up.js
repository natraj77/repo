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
$.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'POST',
	url : '<%=request.getContextPath()%>/submitRegistration',
	dataType : 'json',
	mimeType : 'application/json',
	data : data,
	success : function(datas) {
	  if(datas.resp=='error'){
	  $("#errorMsg").html('<font size="3" color="red">Email Id Already Registered.Please Follow Forgot Password Link</font>');
	  }else{
	  window.location.href = "<%=request.getContextPath()%>/static/thanku-registration.jsp";
	  }
	}
});
}

function findUser(){
var userType= document.getElementById("loginform").userType.value;
var emailId= document.getElementById("loginform").emailId.value ;
var password= document.getElementById("loginform").password.value ;
var params = 'userType='+userType+'&emailId='+emailId+'&password='+password;
$.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'POST',
	url : '<%=request.getContextPath()%>/findUser?userType='+userType+'&emailId='+emailId+'&password='+password,
	mimeType : 'application/json',
	success : function(datas) {
	  if(datas.status=='SUCCESS'){
	   //alert('Login SuccessFul');
	   if(userType=='P'){
	   window.location.href = "<%=request.getContextPath()%>/static/dashboard.html";
	   }
	  }else if(datas.status=='INCORRECT'){
	   alert('Login Failed');
	  }else{
	  alert('Email Id is not registered with US');
	  }
	}
});
}
function performForgotPassword(){
	var emailId = $("#loginform input[name=emailId]").val();
	var userType = $("#loginform input[name=userType]").val();
	if(emailId==null || emailId==''){
		alert("Please provide EMail Id to proceed");
		return;
	}else{
		$.ajax({
			headers : {
				'Content-Type' : 'application/json'
			},
			type : 'POST',
			url : '<%=request.getContextPath()%>/checkForgotPassword?userType='+userType+'&emailId='+emailId,
			mimeType : 'application/json',
			success : function(datas) {
			  if(datas.status=='SUCCESS'){
			  alert('Forgot Password Link sent to '+emailId+'. Please reset Password');
			  }else {
			   alert('Email Id is not registered with US');
			  }
			}
		});
	}
}


$("#loginform").validate({
		wrapper : 'div',
		//errorLabelContainer : "#error-note",
		// Specify the validation rules
		rules : {
			password : {
				required : true,
				minlength : 5
			},
			emailId : {
				required : true,
				minlength : 10
			}
		},

		// Specify the validation error messages
		messages : {
			emailId : {
				required : "EmailId is a Required field",
				minlength : "Cannot be less than five characters"
			},
			password : {
				required : "Password is a Required field"
			},
		},
		submitHandler : function(form) {
			findUser();
		}
	});

$("#registration1").validate({
		wrapper : 'div',
		//errorLabelContainer : "#error-note",
		// Specify the validation rules
		rules : {
			emailId : {
				required : true,
				minlength : 5
			},
			mobile : {
				required : true,
				minlength : 10
			}
		},

		// Specify the validation error messages
		messages : {
			emailId : {
				required : "EmailId is a Required field",
				minlength : "Cannot be less than five characters"
			},
			mobile : {
				required : "Mobile is a Required field"
			},
		},
		submitHandler : function(form) {
			checkForm();
		}
	});
