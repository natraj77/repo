$(document).ready(function () {
	$.ajax({
		type : 'GET',
		url : '../getProfileInfo',
		data : {
			id : userId
		},
		success : function(data) {
			//console.log(data);
			
			$("#password").val(data.password);
			$("#instName").val(data.instituteName);
			$("#phone").val(data.phoneNumber);
			$("#email").val(data.email);
			$("#about").val(data.about);
			$("#founder").val(data.inst_founder);
			$("#inst_date_str").val(data.inst_estbl);
			$("#media_website").val(data.media_website);
			$("#media_fb").val(data.media_fb);
			$("#media_tw").val(data.media_tw);
			$("#media_gplus").val(data.media_gplus);
			$("#media_in").val(data.media_in);
			$("#media_p").val(data.media_p);
			$("#media_insta").val(data.media_insta);
			$("#firstName").val(data.fname);
			$("#lastName").val(data.lname);
			//alert(data.educationList);
			prepareEducationGrid(data.educationList);
			prepareExperienceGrid(data.experienceList);
			prepareSkillSetGrid(data.skillSetList);
			
			
		}
	});
    $('#editprofile').validate({
        rules: {
        	instName: {
                required: true
            },
            firstName: {
                required: true
            },
            lastName: {
                required: true
            },
            phone: {
                required: true,
                number:true,
                maxlength:10,
                minlength:10
            },
            email: {
                required: true,
                email:true
            },
            about: {
                required: true
            },
            founder: {
                required: true
            },
            inst_date_str: {
                required: true
            }
        },
        messages: {
        	instName: {
                required: "Institute Name is required"
            },
            firstName: {
                required: "First Name is required"
            },
            lastName: {
                required: "Last Name is required"
            },
            phone: {
                required: "Phone Number is required"
            },
            email: {
                required: "Email is required"
            },
            about: {
                required: "About is required"
            },
            founder: {
                required: "Founder is required"
            },
            inst_date_str: {
                required: "Established is required"
            }
        },
        submitHandler: function () {
            //saveProfile();
        	//alert('aa');
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

    $.validator.addMethod("pwchecknumber", function (value) {
        return /\d/.test(value) // has a digit
    }, "The password must contain at least one number");
    $('#change_password').validate({
   	 rules: {
   		password: {
                required: true
            },
            new_password: {
            	required : true,
				 pwchecklowercase: true,
               pwcheckuppercase: true,
               pwchecknumber: true,
               pwcheckconsecchars: true,
               pwcheckspechars: true,
               minlength: 8,
               maxlength: 20
                
            },
            confirm_password: {
                required: true,
                equalTo: "#new_password"
                
            }
        },
        messages: {
        	password: {
                required: "Password is required"
            },
            new_password: {
                required: "New Password is required"
            },
            confirm_password: {
                required: "Confirm Password required",
                equalTo:"both passwords should be same"
            }
        },
        submitHandler: function () {
        	savePassword()
        }
   });
    $('#experienceForm').validate({
    	 rules: {
    		skills: {
                 required: true
             },
             years: {
                 required: true,
             },
             company: {
                 required: true,
             },
             designation: {
                 required: true
             },
             joiningDate: {
                 required: true
             },
             lastDate: {
                 required: true
             }
         },
         messages: {
      	   skills: {
                 required: "course is required"
             },
             years: {
                 required: "Years is required"
             },
             company: {
                 required: "Company required"
             },
             designation: {
                 required: "Designation is required"
             },
             joiningDate: {
                 required: "Joining Date is required"
             },
             lastDate: {
                 required: "Last Date is required"
             }
         },
         submitHandler: function(form) {
             form.submit();
           }
    });
    $('#educationForm').validate({
    	 rules: {
    		collegeName: {
                 required: true
             },
             degree: {
                 required: true,
             },
             specialization: {
                 required: true,
             },
             percentage: {
                 required: true
             },
             passedOut: {
                 required: true
             }
         },
         messages: {
        	 collegeName: {
                 required: "College Name is required"
             },
             degree: {
                 required: "Degree is required"
             },
             specialization: {
                 required: "Specialization required"
             },
             percentage: {
                 required: "Percentage is required"
             },
             passedOut: {
                 required: "Passed Out year  is required"
             }
         },
         submitHandler: function () {
             saveEducation();
         }
    });
});

function performCssChange(obj){
	if(obj.value==''){
		obj.style.borderColor =  'red';
	}else{
		obj.style.borderColor =  '';
	}
}
function performValidationsForEducation(){
	var validation = true; //alert(eduDivCounter);
	for(var temp=0;temp<=eduDivCounter;temp++){
		$("#collegeName_"+temp).css('border-color', '');
		if($("#collegeName_"+temp).val()==null || $("#collegeName_"+temp).val()==''){
			$("#collegeName_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#degree_"+temp).css('border-color', '');
		if($("#degree_"+temp).val()==null || $("#degree_"+temp).val()==''){
			$("#degree_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#specialization_"+temp).css('border-color', '');
		if($("#specialization_"+temp).val()==null || $("#specialization_"+temp).val()==''){
			$("#specialization_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#percentage_"+temp).css('border-color', '');
		if($("#percentage_"+temp).val()==null || $("#percentage_"+temp).val()==''){
			$("#percentage_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#passedOut_"+temp).css('border-color', '');
		if($("#passedOut_"+temp).val()==null || $("#passedOut_"+temp).val()==''){
			$("#passedOut_"+temp).css('border-color', 'red');
			validation = false;
		}
		//alert(temp);
	}
	return validation;
}

function performValidationsForExperience(){
	var validation = true; //alert(eduDivCounter);
	for(var temp=0;temp<=divCounter;temp++){
		$("#company_"+temp).css('border-color', '');
		if($("#company_"+temp).val()==null || $("#company_"+temp).val()==''){
			$("#company_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#designation_"+temp).css('border-color', '');
		if($("#designation_"+temp).val()==null || $("#designation_"+temp).val()==''){
			$("#designation_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#joiningDate_"+temp).css('border-color', '');
		if($("#joiningDate_"+temp).val()==null || $("#joiningDate_"+temp).val()==''){
			$("#joiningDate_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#lastDate_"+temp).css('border-color', '');
		if($("#lastDate_"+temp).val()==null || $("#lastDate_"+temp).val()==''){
			$("#lastDate_"+temp).css('border-color', 'red');
			validation = false;
		}
		//alert(temp);
	}
	return validation;
}

function performValidationsForSkillSet(){
	var validation = true; //alert(eduDivCounter);
	for(var temp=0;temp<=skilldivCounter;temp++){
		$("#skills_"+temp).css('border-color', '');
		if($("#skills_"+temp).val()==null || $("#skills_"+temp).val()==''){
			$("#skills_"+temp).css('border-color', 'red');
			validation = false;
		}
		$("#years_"+temp).css('border-color', '');
		if($("#years_"+temp).val()==null || $("#years_"+temp).val()==''){
			$("#years_"+temp).css('border-color', 'red');
			validation = false;
		}
		
	}
	return validation;
}

function prepareEducationGrid(jsonData){
	for(var data in jsonData){
		if(data!=0){
		addeducationDiv();
		$("#collegeName_"+data).val(jsonData[data][0]);
		$("#degree_"+data).val(jsonData[data][1]);
		$("#specialization_"+data).val(jsonData[data][2]);
		$("#percentage_"+data).val(jsonData[data][3]);
		$("#passedOut_"+data).val(jsonData[data][4]);
		}else{
			$("#collegeName_0").val(jsonData[0][0]);
			$("#degree_0").val(jsonData[0][1]);
			$("#specialization_0").val(jsonData[0][2]);
			$("#percentage_0").val(jsonData[0][3]);
			$("#passedOut_0").val(jsonData[0][4]);
		}
	}
}
function prepareSkillSetGrid(jsonData){
	for(var data in jsonData){
		if(data!=0){
		addSkillSetDiv();
		$("#skills_"+data).val(jsonData[data][0]);
		$("#years_"+data).val(jsonData[data][1]);
		}else{
			$("#skills_0").val(jsonData[0][0]);
			$("#years_0").val(jsonData[0][1]);
		}
	}
}

function prepareExperienceGrid(jsonData){
	for(var data in jsonData){
		if(data!=0){
		addExperienceDiv();
		$("#company_"+data).val(jsonData[data][0]);
		$("#designation_"+data).val(jsonData[data][1]);
		$("#joiningDate_"+data).val(jsonData[data][2]);
		$("#lastDate_"+data).val(jsonData[data][3]);
		}else{
			$("#company_0").val(jsonData[0][0]);
			$("#designation_0").val(jsonData[0][1]);
			$("#joiningDate_0").val(jsonData[0][2]);
			$("#lastDate_0").val(jsonData[0][3]);
		}
	}
}


function saveProfile() {
    var institute = $("#instName").val(); 
	if($("#instName").val()==undefined){
		institute = '';
     }
	var founder = $("#founder").val(); 
	if($("#founder").val()==undefined){
		founder = '';
     }
	var inst_date_str = $("#inst_date_str").val(); 
	if($("#inst_date_str").val()==undefined){
		inst_date_str = '';
     }
	var firstName = $("#firstName").val(); 
	if($("#firstName").val()==undefined){
		firstName = '';
     }
	var lastName = $("#lastName").val(); 
	if($("#lastName").val()==undefined){
		lastName = '';
     }
	$.ajax({
		type : 'POST',
		url : '../saveProfilePersonalInfo',
		data : {
			id : userId,
			instituteName : institute,
			phone : $("#phone").val(),
			email : $("#email").val(),
			about : $("#about").val(),
			founder : founder,
			establishedDate : inst_date_str,
			fname : firstName,
			lname : lastName
		},
		success : function(data) {
			alert('successfully updated user profile');
		}
	});
	
}

function savePassword() {
	$.ajax({
		type : 'POST',
		url : '../savePassword',
		data : {
			id : userId,
			new_password : $("#new_password").val()
		},
		success : function(data) {
			alert('successfully updated user profile');
		}
	});
}

function saveExperienceDetails() {
		if(!performValidationsForExperience()){
	    	return;
	    }
	    var $form = $("#experienceForm");
	    var experienceDtls = JSON.stringify(getFormData($form));
	    // performValidationsForEducation();
	    console.log(divCounter);
		$.ajax({
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        type: 'POST',
	        url: "../saveExperienceDetails?items=" + divCounter,
	        dataType: 'json',
	        mimeType: 'application/json',
	        data : experienceDtls, 
	        success: function (returnData) {
	        	alert('Experience details have been saved');
	        }
	    })
}

function saveSkillSetDetails() {
	if(!performValidationsForSkillSet()){
    	return;
    }
    var $form = $("#skillSetForm");
    var experienceDtls = JSON.stringify(getFormData($form));
    // performValidationsForEducation();
    console.log(divCounter);
	$.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: "../saveSkillSetDetails?items=" + skilldivCounter,
        dataType: 'json',
        mimeType: 'application/json',
        data : experienceDtls, 
        success: function (returnData) {
        	alert('SkillSet details have been saved');
        }
    })
}

function saveEducationDetails() {
		if(!performValidationsForEducation()){
	    	return;
	    }
	    var $form = $("#educationForm");
	    var educationDtls = JSON.stringify(getFormData($form));
	    $.ajax({
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        type: 'POST',
	        url: "../saveEducationDetails?items=" + eduDivCounter,
	        dataType: 'json',
	        mimeType: 'application/json',
	        data : educationDtls, 
	        success: function (returnData) {
	        	alert('Education details have been saved');
	        }
	    })
}

function saveSocialMedia() {
	console.log( $("#media_website").val());
	console.log( $("#media_fb").val());
	console.log( $("#media_tw").val());
	console.log( $("#media_gplus").val());
	console.log( $("#media_in").val());
	console.log( $("#media_p").val());
	console.log( $("#media_insta").val());
	
	$.ajax({
		type : 'POST',	
		url : '../saveSocialMedia',
		data : {
			id : userId,
			media_website : $("#media_website").val(),
			media_fb : $("#media_fb").val(),
			media_tw : $("#media_tw").val(),
			media_gplus : $("#media_gplus").val(),
			media_in : $("#media_in").val(),
			media_p : $("#media_p").val(),
			media_insta : $("#media_insta").val()
		},
		success : function(data) {
			alert('successfully updated user profile');
		}
	});
}

//Load plan details for the user.
$(document).ready(function() {
	console.log('Loading the plans here...');
	var table = $('#plansDataTable').DataTable({
		"bProcessing" : true,
		"bServerSide" : true,
		"sAjaxSource" : "../showPlans",
		"sPaginationType" : "full_numbers",
		"bJQueryUI" : true,
		"lengthMenu" : [ [ 5, 10, 25, 50, -1 ], [ 5, 10, 25, 50, "All" ] ],
		"aoColumns" : [

		{
			"mDataProp" : "planName"
		}, {
			"mDataProp" : "subscriptionDate"
		}, {
			"mDataProp" : "expiredDate"
		}, {
			"mDataProp" : "isExpired"
		}, {
			"mDataProp" : "id"
		}

		],
		"columnDefs" : [ {
			"targets" : [ 4 ],
			"visible" : false,
			"searchable" : false
		}, ],
		"initComplete" : function(settings, json) {
		}
	});
});


var skilldivCounter = 0;
function addSkillSetDiv() { 
	skilldivCounter ++;
	var html = '<div class="form-group control-group after-add-more" id="skillSetSectionDiv_' + skilldivCounter + '">'+
  	'<label for="instName" class="control-label">Key Skills</label>'+
  		'<div class="col-sm-12 row form-group">	'+
  	 		'<div class="col-sm-6 no-padding">'+
			 	'<select class="form-control" onchange="performCssChange(this);" id="skills_' + skilldivCounter + '" name="skills_' + skilldivCounter + '">'+
				'<option value="">Select</option>'+
				'<option>Java</option>'+
				'<option>AWS</option>'+
				'<option>Linux</option>'+
				'</select>'+
		' </div>'+
		' <div class="col-sm-5">'+
		 '	<select class="form-control" onchange="performCssChange(this);" id="years_' + skilldivCounter + '" name="years_' + skilldivCounter + '">'+
			'	<option value="">Select</option>'+
			'	<option>0</option>'+
			'	<option>1</option>'+
			'	<option>2</option>'+
			'	<option>3</option>'+
			'	<option>4</option>'+
			'	<option>5</option>'+
			'	<option>6</option>'+
			'	<option>7</option>'+
			'	<option>8</option>'+
			'	<option>9</option>'+
			'	<option>10</option>'+
		'	</select>'+
		' </div>'+
		'<input type="hidden" id="skilLSetId_' + skilldivCounter + '" name="skilLSetId_' + skilldivCounter + '">' +
		'<div class="col-sm-1">'+	
	 		'<button class="btn btn-danger removebtn" type="button" onclick="removeSkillSetDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
	 	'</div>'+
	'	</div>'+
	
				 
		'</div> ';
	$("#skillSetSectionDiv").after(html);
}



function removeSkillSetDiv() {
	$("#skillSetSectionDiv_" + skilldivCounter).remove();
	skilldivCounter --;
}

function removeExperienceDiv() {
	$("#experienceSectionDiv_" + divCounter).remove();
	divCounter --;
}



var divCounter = 0;
var eduDivCounter = 0;
function addExperienceDiv() { 
	divCounter ++;
	var html = '<div style="border-top:1px solid #ccc;margin-top:10px;padding-top:10px"class="after-add-more" id="experienceSectionDiv_' + divCounter + '">' +
					'<div class="form-group">'+
					 	'<label for="company" class="control-label">Company Name</label>'+
					 	'<input type="text" class="form-control" onblur="performCssChange(this);"  id="company_' + divCounter + '" name="company_' + divCounter + '">'+
					'</div>'+
					'<div class="form-group">'+
						 '<label for="joiningDate" class="control-label">Designation</label>'+
						'<input type="text" class="form-control" onblur="performCssChange(this);"  id="designation_' + divCounter + '" name="designation_' + divCounter + '">'+
					'</div>'+
					'<div class="form-group">'+
					'<div class="col-lg-12">'+
						'<div class="row">'+
							'<div class="col-lg-6 no-padding">'+
								'<div class="form-group">'+
									 '<label for="instName" class="control-label">Joining Date</label>'+
									 '<div class="input-group date" id="joiningDateSelector_' + divCounter + '">'+
					                    '<input class="form-control" onblur="performCssChange(this);"  type="text" id="joiningDate_' + divCounter + '" name="joiningDate_' + divCounter + '">'+
					                    '<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>'+
					                '</div>'+
								'</div>'+
							'</div>'+
							'<div class="col-lg-6">'+
								'<div class="form-group">'+
									 '<label for="lastDate" class="control-label">Last date</label>'+
									 '<div class="input-group date" id="lastDateSelector_' + divCounter + '">'+
					                    '<input class="form-control" onblur="performCssChange(this);"  type="text" id="lastDate_' + divCounter + '" name="lastDate_' + divCounter + '">'+
					                    '<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>'+
					                '</div>'+
								'</div>'+
							'</div>'+
					'</div>'+
					'</div>'+
				 	'<input type="hidden" id="experienceId_' + divCounter + '" name="experienceId_' + divCounter + '">' +
					'<div>'+	
				 		'<button class="btn btn-danger removebtn" type="button" onclick="removeExperienceDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
				 	'</div>'+
				'</div> ';
	$("#experienceSectionDiv").after(html);
	$('#joiningDateSelector_' + divCounter + '').datetimepicker({
		format: 'DD/MM/YYYY'
	});
	$('#lastDateSelector_' + divCounter + '').datetimepicker({
		format: 'DD/MM/YYYY'
	});
}
function removeExperienceDiv() {
	$("#experienceSectionDiv_" + divCounter).remove();
	divCounter --;
}
function addeducationDiv() { 
	eduDivCounter ++;
	var html = '<div style="border-top:1px solid #ccc;margin-top:10px;padding-top:10px"class="after-add-more" id="educationSectionDiv_' + eduDivCounter + '">' +
						'<div class="form-group">'+
					 	'<label for="company" class="control-label">College Name</label>'+
					 	'<input type="text" onblur="performCssChange(this);" class="form-control" id="collegeName_' + eduDivCounter + '" name="collegeName_' + eduDivCounter + '">'+
					'</div>'+
					'<div class="form-group">'+
					'<div class="col-lg-12">'+
						'<div class="row">'+
							'<div class="col-lg-6 no-padding">'+
								'<div class="form-group">'+
									 '<label for="instName" class="control-label">Degree</label>'+
									 '<select id="degree_' + eduDivCounter + '" onchange="performCssChange(this);" name="degree_' + eduDivCounter + '" class="form-control">' +
		                			 '<option value="">Select</option>' +
		                				'<option>SSC</option>' +
										'<option>Intermediate</option>' +
										'<option>Diploma</option>' +
										'<option>Degree</option>' +
										'<option>BTech / BE</option>' +
										'<option>MCA</option>' +
										'<option>MBA</option>' +
										'<option>MTech</option>' +
		                			 '</select>' +
								'</div>'+
							'</div>'+
							'<div class="col-lg-6">'+
								'<div class="form-group">'+
									 '<label for="instName" class="control-label">Specialization</label>'+
									 '<select id="specialization_' + eduDivCounter + '" onchange="performCssChange(this);" name="specialization_' + eduDivCounter + '" class="form-control">' +
									 	'<option value="">Select</option>' +
									 	'<option>MPC</option>' +
										'<option>Bipc</option>' +
										'<option>MEC</option>' +
										'<option>ECE</option>' +
										'<option>CSE</option>' +
										'<option>EEE</option>' +
			               			 '</select>' +
								'</div>'+
							'</div>'+
					'</div>'+
					'</div>'+
					'<div class="form-group">'+
					'<div class="col-lg-12">'+
						'<div class="row">'+
							'<div class="col-lg-6 no-padding">'+
								'<div class="form-group">'+
									 '<label for="instName" class="control-label">Percantage</label>'+
									 '<input type="text" class="form-control" onblur="performCssChange(this);" id="percentage_' + eduDivCounter + '" name="percentage_' + eduDivCounter + '">'+
								'</div>'+
							'</div>'+
							'<div class="col-lg-6">'+
								'<div class="form-group">'+
									 '<label for="lastDate" class="control-label">Passed Out Year</label>'+
									 '<div class="input-group date" name="passedOutDateSelector_' + eduDivCounter + '" id="passedOutDateSelector_' + eduDivCounter + '">'+
					                    '<input class="form-control valid" type="text" onblur="performCssChange(this);" id="passedOut_' + eduDivCounter + '" name="passedOut_' + eduDivCounter + '">'+
					                    '<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>'+
					                '</div>'+
								'</div>'+
							'</div>'+
					'</div>'+
					'</div>'+
				 	'<input type="hidden" id="educationId_' + eduDivCounter + '" name="educationId_' + eduDivCounter + '">' +
					'<div>'+	 
				 		'<button class="btn btn-danger removebtn" type="button" onclick="removeEducationDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
				 	'</div>'+
				'</div> ';
	$("#educationSectionDiv").after(html);
	$('#passedOutDateSelector_' + eduDivCounter + '').datetimepicker({
        format: 'YYYY'
	});
}
function removeEducationDiv() {
	$("#educationSectionDiv_" + eduDivCounter).remove();
	eduDivCounter --;
}


function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

var languagedivCounter = 0;
function addlanguageDiv() { 
	languagedivCounter ++;
	var html = '<div class="after-language-more" id="languageSectionDiv_' + languagedivCounter + '">'+
			  		'<div class="col-sm-12 row form-group">'+
					'<div class="col-sm-4 no-padding">'+
						 '<div class="form-group">'+
							'<input type="text" class="form-control" id="language_' + languagedivCounter + '" name="language_' + languagedivCounter + '" placeholder="language">'+
			         '</div>'+
			 	'</div>'+
			 	'<div class="col-sm-6">'+
			      '<label class="radio-inline">'+
			        '<input type="checkbox" name="read_' + languagedivCounter + '" id="read_' + languagedivCounter + '" value="y"> Read'+
			      '</label>'+
			      '<label class="radio-inline">'+
			        '<input type="checkbox" name="write_' + languagedivCounter + '" id="write_' + languagedivCounter + '" value="y"> Write'+
			      '</label>'+
			      '<label class="radio-inline">'+
			        '<input type="checkbox" name="speak_' + languagedivCounter + '" id="speak_' + languagedivCounter + '" value="y"> Speak'+
			      '</label>'+
			    '</div>'+
			 	'<input type="hidden" id="languageId_' + languagedivCounter + '" name="languageId_' + languagedivCounter + '">'+
				  '<div class="col-sm-1"> '+
					'<button class="btn btn-danger removebtn" type="button" onclick="removelanguageDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
				  '</div>'+
			'</div>'+
			'</div>';
	$("#languageSectionDiv").after(html);
}



function removelanguageDiv() {
	$("#languageSectionDiv_" +languagedivCounter).remove();
	languagedivCounter --;
}

var certificationdivCounter = 0;
function addCertificationDiv() { 
	/*var currentcertificateName = $("#certificateName_" + certificationdivCounter).val();
	var currentissuedBy = $("#issuedBy_" + certificationdivCounter).val();
	
	if (currentcertificateName == '' || currentissuedBy == '') {
		alert('Please fill all required fields before adding more Certifications');
		
		return;
	}*/
	certificationdivCounter ++;
	var html = '<div class="after-certification-more" id="certificationSectionDiv_' + certificationdivCounter + '">'+
			  		'<div class="col-sm-12 row form-group">'+
					'<div class="col-sm-4 no-padding">'+
						 '<div class="form-group">'+
							'<input type="text" class="form-control" id="certificateName_' + certificationdivCounter + '" name="certificateName_' + certificationdivCounter + '" placeholder="Certification Name">'+
			         '</div>'+
			 	'</div>'+
			 	'<div class="col-sm-6">'+
			 	 	'<div class="form-group">'+
	 					'<input type="text" class="form-control" id="issuedBy_' + certificationdivCounter + '" name="issuedBy_' + certificationdivCounter + '" placeholder="Issued By">'+
	 				'</div>'+
			    '</div>'+
			 	'<input type="hidden" id="certificationId_' + certificationdivCounter + '" name="certificationId_' + certificationdivCounter + '">'+
				  '<div class="col-sm-1"> '+
					'<button class="btn btn-danger removebtn" type="button" onclick="removecertificationDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
				  '</div>'+
			'</div>'+
			'</div>';
	$("#certificationSectionDiv").after(html);
}



function removecertificationDiv() {
	$("#certificationSectionDiv_" +certificationdivCounter).remove();
	certificationdivCounter --;
}

function setOtherPhotos(selected){
	console.log(selected);
	alert('photo'+document.getElementById("altImg").src);
	//commonProfile(formData);
}

function saveProfilePhoto(){
	var formData = new FormData($('#prflImage')[0]);
	commonProfile(formData);
}
function newPhoto(){
	$('upload').val("");
}
function removePhoto(){
	$.ajax({
        type: 'POST',
        url: '../removePrflPhoto',
        data : '',
        processData: false,
        contentType: false,
        success: function () {
        	alert('Profile Photo removed is sucessfully');
        }
    });
}
function commonProfile(formData){
	$.ajax({
        type: 'POST',
        url: '../photoUploadPrfl',
        data : formData,
        processData: false,
        contentType: false,
        success: function () {
        	alert('Trainer Profile Photo is sucessfully uploded');
        }
    });
	$("#myModal").modal('hide');
}

function uploadTrainerLogos(selected){
    var formData = new FormData($('#fileUploadLogoForm')[0]);
    
    $.ajax({
        type: 'POST',
        url: '../photoUploadLogo',
        data : formData,
        processData: false,
        contentType: false,
        success: function () {
        	alert('Trainer Logos are sucessfully uploded');
        }
    });
}

function uploadTrainerImages(selected){
    var formData = new FormData($('#fileUploadForm')[0]);
    $.ajax({
        type: 'POST',
        url: '../photoUploadImage',
        data : formData,
        processData: false,
        contentType: false,
        success: function () {
        	alert('Trainer Images are sucessfully uploded');
        }
    });
}