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
		#registration4 .error {
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
  <h2 class="title-default-left title-bar-high">Institute Profile</h2>

  <div class="profile-page-area">
    <div class="container">
      <div class="row panel-group" id="faq-accordian">
        <div class="col-sm-12 col-xs-12">
        <form id="registration4">
          <div class="faq-box-wrapper">
            <div class="faq-box-item panel panel-default">
              <div class="panel-heading active">
                <div class="panel-title faq-box-title">
                  <h3>
                    <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#institute">
                      <span class="faq-box-count">1</span> Institute.
                    </a>
                  </h3>
                </div>
              </div>
              <div aria-expanded="false" id="institute" role="tabpanel" class="panel-collapse collapse in">
                <div class="panel-body faq-box-body">

                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Institute Name</label>
                        <input type="text" class="form-control" placeholder="Institute Name" id="instName" name="instName">
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Established</label>
                        <input type="text" id="inst_date_str" class="form-control" style="height:30px;" placeholder="Established - mm/dd/yyyy" size="57" name="inst_date_str">
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Founder</label>
                        <input type="text" class="form-control" placeholder="Founder" id="instFounder" name="instFounder">
                      </div>
                    </div>
                  </div>
                   <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" placeholder="password" id="password1" name="password1">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Retype Password</label>
                        <input type="password" class="form-control" placeholder="Retype Password" id="rpassword" name="rpassword" >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="faq-box-wrapper">
            <div class="faq-box-item panel panel-default">
              <div class="panel-heading">
                <div class="panel-title faq-box-title">
                  <h3>
                    <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#officeAddress">
                      <span class="faq-box-count">2</span> Office Address
                    </a>
                  </h3>
                </div>
              </div>
              <div aria-expanded="false" id="officeAddress" role="tabpanel" class="panel-collapse collapse">
                <div class="panel-body faq-box-body">

                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Flat No.</label>
                        <input type="text" class="form-control" placeholder="Flat No." id="flatno" name="flatno">
                      </div>

                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Apartment Name</label>
                        <input type="text" class="form-control" placeholder="Apartment Name" id="aprtmentName" name="aprtmentName">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Area</label>
                        <input type="text" class="form-control" placeholder="Area" id="area" name="area">
                      </div>
                    </div>

                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Country</label>
                        <select class="form-control" id="country" name="country">
                          <option value="">-Country-</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                    <div class="form-group">
                        <label>State</label>
                        <select class="form-control" id="state" name="state">
                          <option value="">-State-</option>
                        </select>
                      </div>
                      
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>City</label>
                          <select class="form-control" id="city" name="city">
                          <option value="">-City-</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Pin code</label>
                        <input type="text" class="form-control" placeholder="Pin code" id="officePincode" name="officePincode">
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
          <div class="faq-box-wrapper">
            <div class="faq-box-item panel panel-default">
              <div class="panel-heading">
                <div class="panel-title faq-box-title">
                  <h3>
                    <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#contactPerson">
                      <span class="faq-box-count">3</span> Contact Person.
                    </a>
                  </h3>
                </div>
              </div>
              <div aria-expanded="false" id="contactPerson" role="tabpanel" class="panel-collapse collapse">
                <div class="panel-body faq-box-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" placeholder="Name" id="contactPerson" name="contactPerson">
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" placeholder="email" id="contactEmail" name="contactEmail">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Landline No.</label>
                      <input type="text" class="form-control" placeholder="Landline No." id="contactLandLine" name="contactLandLine">
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Mobile</label>
                        <input type="text" class="form-control" placeholder="Mobile" id="contactMobile" name="contactMobile">
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>

      
          <div class="text-right">
            <button class="default-big-btn"  id="save" onclick="expandAllandValidate()">Save</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>

</div>

<!-- Faq Page Area End Here -->
<!--  Include Footer  -->
<%@ include file='footer.jsp' %>
</body>
<%@ include file='footer-include.jsp' %>
<script type="text/javascript">
function expandAllandValidate(){
    $("#contactPerson").addClass("panel-collapse collapse in");
    $("#officeAddress").addClass("panel-collapse collapse in");
    $("#institute").addClass("panel-collapse collapse in");

};
 $( function() {
    $( "#inst_date_str" ).datepicker();
} );
$.validator.addMethod("lettersonly", function(value, element) 
{
return this.optional(element) || /^[a-z ]+$/i.test(value);
}, "Letters and spaces only please");

$("#registration4").validate({
		wrapper : 'div',
		//errorLabelContainer : "#error-note",
		// Specify the validation rules
		rules : {
			instName : {
				required : true,
				lettersonly: true
			},
			flatno : {
				required : true,
				lettersonly: false
			},
			aprtmentName : {
				required : true,
				lettersonly: true
			},
			area : {
				required : true,
				lettersonly: true
			},
			city : {
				required : true
			},
			state: {
              required : true
            },
            country: {
              required : true
            },
            pincode: {
              required : true,
			  lettersonly: false
			},password1 : {
				required : true,
			},
			rpassword : {
				required : true,
				equalTo: "#password1"
			},
		},

		// Specify the validation error messages
		messages : {
			instName : {
				required : "Institute Name is a Required field"
			},
			flatno : {
				required : "Office Flat No is a Required field"
			},aprtmentName : {
				required : "Office Aprt Name is a Required field"
			},area : {
				required : "Office Area is a Required field"
			},city : {
				required : "Office City is a Required field"
			},state : {
			required : "Office State is a Required field"
			},country : {
			required : "Country is a Required field"
			},pincode : {
			required : "Office Pincode is a Required field"
			},password1 : {
				required : "Password is a Required field"
			},rpassword : {
				required : "Re Password is a Required field"
			}
		},
		submitHandler : function(form) {
			checkForm();
		}
	});
function getFormData($form) {
		var unindexed_array = $form.serializeArray();
		var indexed_array = {};
		$.map(unindexed_array, function(n, i) {
			indexed_array[n['name']] = n['value'];
			if(n['name']=='password1'){
			indexed_array['password'] = n['value'];
			}
		});
       return indexed_array;
}

function checkForm(){
var $form = $("#registration4");
var data= JSON.stringify(getFormData($form));
$.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'POST',
	url : '../submitRegistrationAndSave',
	dataType : 'json',
	mimeType : 'application/json',
	data : data,
	success : function(datas) {
	  if(datas.status=='SUCCESS'){
	  alert('Your Profile has been Successfully Created.');
	  window.location.href = 'index.jsp';
	  }else{
	  alert('Problem Occured During Profile Creation. Please contact Our Representative.');
	  }
	}
});
}
$( document ).ready(function() {
    $.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'GET',
	url : '../getDomainCntryData',
	dataType : 'json',
	mimeType : 'application/json',
	success : function(datas) {
	  for (i in datas)
		{
		  for (j in datas[i]) {
			  var option = new Option(datas[i][j], j);
	            $('#country').append($(option));
		  }
		}
	
	}
});
});

$("#country").change(function () {
 var cntrySelected = $(this).val();
 $.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'GET',
	url : '../getStatesByCountry?cntryId='+cntrySelected,
	dataType : 'json',
	mimeType : 'application/json',
	success : function(datas) {
	console.log(datas);
	  for (i in datas)
		{
		    var option = new Option(datas[i], i);
            $('#state').append($(option));
		}
	
	}
});
});
   
$("#state").change(function () {
 var stateId = $(this).val();
 $.ajax({
	headers : {
		'Content-Type' : 'application/json'
	},
	type : 'GET',
	url : '../getCitiesByStates?stateId='+stateId,
	dataType : 'json',
	mimeType : 'application/json',
	success : function(datas) {
	console.log(datas);
	  for (i in datas)
		{
		    var option = new Option(datas[i], i);
            $('#city').append($(option));
		}
	}
});
});         

</script>
</html>
