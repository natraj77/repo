var rowsSelected = [];
var leadsSelected = [];
var branches;
var courses;
var faculty;
var batches;
var selectedLead = '';
var courseArray = [];
//Form Validation For Lead Form
var courseContentObj = '';
var courseContentArray = [];
var emailSelected = [];

var collectionData = '';
$(document).ready(function() {
	//hiding the import and export buttons as functionality not implementing
	$("#exportToExcelBtn").hide();
	$("#importExcelBtn").hide();
	
	$("#searchLead").keyup(function(){
		selectedLead = '';
		if($(this).val().length>=2){
			if(collectionData==''){
				$.ajax({
				type: "POST",
				url: "../getStudentListForPartner",
				data:'searchText='+$(this).val(),
				beforeSend: function(){
					$("#searchLead").css("background","#FFF  no-repeat 165px");
				},
				success: function(data){
					collectionData = data.leadsObj;
				}
				
				});
			}
			filterData(collectionData,$("#searchLead").val().toUpperCase());
		}else{
			$("#lead-suggestion").hide();
		}		
	});
});

$(document).ready(function() {
	$('#course').multiselect({
        includeSelectAllOption: true,
        enableFiltering:true,
        enableCaseInsensitiveFiltering: true,
        maxHeight: 200,
        onChange: function() {
            var selected = this.$select.val();
            if ($('#course option:selected').text() != null || $('#course option:selected').text() != '') {
            	if(null != selected && courseArray.indexOf(selected) < 0) {
            		courseArray = selected;
                }
            }
        }
    });
	
	var htm = '';
	$("#course").append(htm);
	$.ajax({
		type : 'GET',
		url : '../getCourseListForPartnerId',
		success : function(data) {
			//courses			
			$.each(data, function(index, value) {
				htm += '<option value=' + index + '>' + value + '</option>';
			});
			$('#course').append(htm);
			$('#course').multiselect('rebuild');
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
});

var selectedUser = '';
function filterData(collectionData,containsStr){
	$("#lead-suggestion").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].email.toUpperCase().indexOf(containsStr)>=0){
			htmlTxt = htmlTxt + '<li onClick="selectLead(this,\''+collectionData[k].firstName+'\',\''+collectionData[k].lastName+'\',\''
			+collectionData[k].mobile+'\',\''+collectionData[k].email+'\',\''+collectionData[k].userId+'\');" value="'+collectionData[k].id+'">'+collectionData[k].email+'</li>';
	    }
	}
	$("#lead-suggestion").html('<ul id="country-list">'+htmlTxt+'</ul>');
	$("#searchLead").css("background","#FFF");
}

function selectLead(val, fName, lName, mobile, emailId, userId) {
	selectedUser = val.value;
	//$("#facultId").val(facultId);
	$("#firstName").val(fName);
	$("#lastName").val(lName);
	$("#mobile").val(mobile);
	$("#email").val(emailId);
	$("#userId").val(userId);
	$("#lead-suggestion").hide();
}

$(document).ready(function () {
	/*$('#preferredTimeStart').timepicker();
	$('#preferredTimeEnd').timepicker();
	
	$('.timepicker').timepicker({
	    timeFormat: 'h:mm p',
	    interval: 60,
	    minTime: '10',
	    maxTime: '6:00pm',
	    defaultTime: '11',
	    startTime: '10:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});*/
	
	$.ajax({
		type : 'GET',
		url : '../getDetailsForBatchFormation',
		success : function(data) {
			/*//courses
			courses = data[0];
			for (i = 0; i < courses.length; i++) {
				$("#batchCourseName").append(new Option(courses[i].name, courses[i].id))
			}
			//branches
			branches = data[1];
			for (i = 0; i < branches.length; i++) {
				$('#batchBranchName').append(new Option(branches[i].name, branches[i].id));
			}
			//faculty
			faculty = data[2];
			for (i = 0; i < faculty.length; i++) {
				$('#batchFacultyName').append(new Option(faculty[i].name, faculty[i].id));
			}*/
			//batches
			batches = data;
			console.log(batches);
			for (i = 0; i < batches.length; i++) {
				$('#existingBatchesBatch').append(new Option(batches[i].batchName, batches[i].batchId));
			}
		},
		failure : function() {
			console.log('There was an error getting details for batch formation');
		}

	});
	
	
    $('#leadDataForm').validate({
        rules: {
            firstName: {
                required: true
            },
            lastName: {
                required: true
            },
            course: {
                required: true
            },
            branchName: {
                required: true
            },
            mode: {
                required: true
            },
            schedule: {
                required: true
            },
            preferredTimeStart: {
                required: true
            },
            preferredTimeEnd: {
                required: true
            },
            /*source: {
                required: false
            },*/
            mobile: {
                required: true,
                number: true
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            firstName: {
                required: "First Name is required"
            },
            lastName: {
                required: "Last Name Flat is required"
            },
            course: {
                required: "Course is required"
            },
            branchName: {
                required: "Branch Name is required"
            },
            mode: {
                required: "Mode is required"
            },
            schedule: {
                required: "Schedule is required"
            },
            preferredTimeStart: {
                required: "Preferred Time is required"
            },
            preferredTimeEnd: {
                required: "Preferred Time is required"
            },
            /*source: {
                required: "Source is required"
            },*/
            mobile: {
                required: "Mobile is required",
                number: "Please Enter Number only"
            },
            email: {
                required: "Email is required",
                email: "Please enter a valid email"
            }
        },
        submitHandler: function () {
            saveUpdateLead();
        }
    });
    
    $('#batchDataForm').validate({
        rules: {
            courseName: {
                required: true
            },
            schedule: {
                required: true
            },
            modeList: {
                required: true
            },
            faculty: {
                required: true
            },
            branchList: {
                required: true
            },
            fee: {
            	 required: true
            },
            feeDiscount: {
                required: true
            },
            status: {
                required: true
            }
        },
        messages: {
            courseName: {
                required: "Course Name is required"
            },
            schedule: {
                required: "Schedule is required"
            },
            modeList: {
                required: "Mode List is required"
            },
            faculty: {
                required: "Faculty is required"
            },
            branchList: {
                required: "Branch List is required"
            },
            fee: {
            	required: "Fee is required"
            },
             feeDiscount: {
               required: "Fee Discount List is required"
            },
            status: {
                required: "Status is required"
             }
        },
        submitHandler: function () {
            saveUpdateBatch();
        }
    });
    $('#existingBatchForm').validate({
        rules: {
            batch: {
                required: true
            }
        },
        messages: {
            batch: {
                required: "Batch is required"
            }
        },
        submitHandler: function () {
            saveExistingBatch();
        }
    });
    $('#addemailForm').validate({
        submitHandler: function () {
            saveUpdateEmail();
        }
    });
    $('#addsmsForm').validate({
        rules: {
        	smstemplate: {
                required: true
            }
        },
        messages: {
        	smstemplate: {
                required: "SMS Template is required"
            }
        },
        submitHandler: function () {
            saveUpdateSms();
        }
    });
    $('#existingDemoForm').validate({
        rules: {
        	existingDemosDemo: {
                required: true
            }
        },
        messages: {
        	existingDemosDemo: {
                required: "Demo is required"
            }
        },
        submitHandler: function () {
            saveUpdateDemo();
        }
    });
});


$(document).ready(function() {
	var table = $('#leadsDataTable').DataTable({
			"bProcessing" : true,
			"bServerSide" : true,
			"sAjaxSource" : "../showLeads",
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"lengthMenu" : [ [ 10, 25, 50, -1 ],
					[ 10, 25, 50, "All" ] ],
			"aoColumns" : [
			    {
	                render: function ( data, type, row ) {
	                    return '<input type="checkbox" class="editor-active">';
	                },
	                className: "dt-body-center"
	            },

	            {
					"mDataProp" : "firstName"
				},
				{
					"mDataProp" : "lastName"
				},
				{
					"mDataProp" : "course"
				},
				{
					"mDataProp" : "mobile"
				},
				{
					"mDataProp" : "email"
				},
				{
					"mDataProp" : "mode"
				},
				{
					"mDataProp" : "schedule"
				},
				{
					"mDataProp" : "branchName"
				},
				{
					"mDataProp" : "preferredTime"
				},
				{
					"mDataProp" : "source"
				},
				{
					"mDataProp" : "comments"
				}, {
				"mDataProp" : "id"
			},{
				"mDataProp" : "userId"
			},{
				"mDataProp" : "courseId"
			},{
				"mDataProp" : "branchId"
			} ],
			"columnDefs" : [ {
				"targets" : [ 15,14,13,12 ],
				"visible" : false,
				"searchable" : false
			}, ],
			'select': {
	 		      'style': 'multi'
	 		   },
	 		  "language": {
	    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
	    	        searchPlaceholder: "Search for Leads...",
	    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
	    	},
			"initComplete" : function(settings, json) {
				$('#loadingSpinner').hide();
			}
		});
    // Grab the datatables input box and alter how it is bound to events
    $("#leadsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 1 || e.keyCode == 20) {
                    // Call the API search function
                    $('#leadsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#leadsDataTable').DataTable().search("").draw();
                }
                return;
            });

    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        leadsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
    })
    
    $("#leadsDataTable").on('click', 'input.editor-active', function() {
    	 var tr = $(this).closest('tr');
         var row = table.row(tr);
         
         var $this = $(this);
         var isChecked = $(this).prop( 'checked' );
         
    	 var rowId = tr.index();
    	 //console.log('selected row Id : ' + rowId);
    	 console.log(row.data());
         if (isChecked) {
        	 rowsSelected.push(rowId); 
        	 leadsSelected.push(row.data().id);
        	 emailSelected.push(row.data().email);
        	 courseContentObj = new prepareCourseContent(row.data().id, row.data().courseId, row.data().courseName, row.data().email);
        	 courseContentArray.push(courseContentObj);
         } else {
        	 var index = rowsSelected.indexOf(rowId);
        	 var leadIndex = leadsSelected.indexOf(row.data().id);
        	 rowsSelected.splice(index, 1);
        	 leadsSelected.splice(leadIndex, 1);
        	 courseContentArray.splice(index,1);
        	 emailSelected.splice(index,1);
         }
         
         enableDisableButtons();
         
    });
});

function enableDisableButtons() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
	}
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
	}

	if (rowsSelected.length == 0) {
		$('#formBatchBtn').prop('disabled', true);
		$('#extBatchBtn').prop('disabled', true);
		$('#sendemailBtn').prop('disabled', true);
		$('#sendsmsBtn').prop('disabled', true);
		$('#sendcontentBtn').prop('disabled', true);
		$('#sendVideoBtn').prop('disabled', true);
		$('#extdemoBtn').prop('disabled', true);
		$('#deleteBtn').prop('disabled', true);
		$('#invalidBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#formBatchBtn').prop('disabled', false);
		$('#extBatchBtn').prop('disabled', false);
		$('#sendemailBtn').prop('disabled', false);
		$('#sendsmsBtn').prop('disabled', false);
		$('#sendcontentBtn').prop('disabled', false);
		$('#sendVideoBtn').prop('disabled', false);
		$('#extdemoBtn').prop('disabled', false);
		$('#deleteBtn').prop('disabled', false);
		$('#invalidBtn').prop('disabled', false);
	}
}

function closeModal() {
    $("#myModal").modal('hide');
}

function sendCourse(){
	console.log('courseArray:'+courseContentArray);
	var dataObj = JSON.stringify(courseContentArray);
    $.ajax({
        type: 'POST',
        url: '../sendCourseContent?id=' + $('#id').val(),
        mimeType: 'application/json',
        data:{data : dataObj},
        success: function (returnData) {
        	if(returnData.status == 'Failure'){
        		alert('Course Content is not available');
        	}
            var table = $('#leadsDataTable').DataTable();
            var table = $('#leadsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#leadsDataTable').dataTable().fnDraw();
        }
    });
}

function sendVideo(){
	var dataObj = JSON.stringify(courseContentArray);
    $.ajax({
        type: 'POST',
        url: '../sendVideoContent?id=' + $('#id').val(),
        mimeType: 'application/json',
        data:{data : dataObj},
        success: function (returnData) {
        	if(returnData.status == 'Failure'){
        		alert('Video Content is not available');
        	}
            var table = $('#leadsDataTable').DataTable();
            var table = $('#leadsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#leadsDataTable').dataTable().fnDraw();
        }
    });
	
}

function saveUpdateEmail(){
	var emailList =  Array.from(new Set(emailSelected));
	console.log('emailSelected:'+emailList);
	$.ajax({
		type : 'POST',
		url : '../sendAnEmailForLeads',
		mimeType : 'application/json',
		data : {
			emailIds : emailList,
			comments : $('#emailContent').val()
		},
		success : function(data) {
            var table = $('#leadsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#leadsDataTable').dataTable().fnDraw();
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});	
	$("#sendEmail").modal('hide');
}

function saveUpdateDemo(){
console.log('Selected demo is : ' + $("#existingDemosDemo").val());
	
	$.ajax({
		type : 'POST',
		url : '../addToExistingDemo',
		data : {
			leadIds : leadsSelected,
			demoId : $('#existingDemosDemo').val()
		},
		dataType : 'json',
		mimeType : 'application/json',
		success : function(data) {
            var table = $('#leadsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#leadsDataTable').dataTable().fnDraw();
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
	$("#existingDemo").modal('hide');
}

function saveExistingBatch(){
console.log('Selected batch is : ' + $("#existingBatchesBatch").val());
	
	$.ajax({
		type : 'POST',
		url : '../addToExistingBatch',
		mimeType : 'application/json',
		data : {
			leadIds : leadsSelected,
			batchId : $('#existingBatchesBatch').val()
		},
		success : function(data) {
            var table = $('#leadsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#leadsDataTable').dataTable().fnDraw();
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});	
	$("#existingBatch").modal('hide');
}

function saveUpdateBatch(){
if (confirm('Convert selected leads to batch')) {
		$.ajax({
			type : 'POST',
			url : '../createBatchFromLeads',
			mimeType : 'application/json',
			data : {
				leadIds : leadsSelected,
				courseId : $('#batchCourseName').val(),
				courseName : $('#batchCourseName').text(),
				branchId : $('#batchBranchName').val(),
				facultyId : $("#batchFacultyName").val(),
				mode : $("#modeList").val(),
				fee : $("#fee").val(),
				discount : $("#feeDiscount").val(),
				status : $("#status").val(),
				dateTime : $("#date").val(),
				schedule : $("#batchSchedule").val(),
				batchName : $("#batchName").val(),
				duration : $("#duration").val(),
				durationType : $("input[name='durationType']:checked").val()
			},
			success : function(data) {
	            var table = $('#leadsDataTable').DataTable();
	            var row_index = table.row(this).index();
	            var current_row = table.row(this);
	            $('#leadsDataTable').dataTable().fnDraw();
			},
			failure : function() {
				console.log('There was an error getting course list');
			}

		});
		$("#formBatch").modal('hide');
	}
}

function saveUpdateLead() {
	alert('Saving a new lead');
	
    var leadPrepObj = '';
    var leadArray = []; 
    if($("#editField").is(':visible')){
    	courseArray[0] = $("#courseId").val();
    }
    for(var i=0 ; i<courseArray.length; i++){
    	leadPrepObj = new prepareLeadJson($('#id').val(),
    			$('#userId').val(),
    			courseArray[i],
    			$('#branchName').val(),
    			//$("#branchName option:selected").text(),
    			$('#preferredTimeStart').val(),
    			$('#source').val(),
    			$('#comments').val(),
    			$('#mode').val(),
    			$('#schedule').val(),
    			$('#preferredTimeEnd').val()
    			);
    	leadArray.push(leadPrepObj);
    }
    var dataObj = JSON.stringify(leadArray);
    $.ajax({
        type: 'POST',
        url: '../saveUpdateLeadData?id=' + $('#id').val(),
        mimeType: 'application/json',
        data:{data : dataObj},
        success: function (returnData) {
            var table = $('#leadsDataTable').DataTable();
            var table = $('#leadsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#leadsDataTable').dataTable().fnDraw();
        }
    });
    
    $("#myModal").modal('hide');
}

function prepareLeadJson(id, userId, courseId, branchId, startTime, source, comments, mode, schedule, endTime){
	this.id = id;
	this.userId = userId;
	this.courseId = courseId;
	this.branchName = branchId;
	this.preferredTimeStart = startTime;
	this.source = source;
	this.comments = comments;
	this.mode = mode;
	this.schedule = schedule;
	this.preferredTimeEnd = endTime;
}

function prepareCourseContent(id, courseId, courseName, email){
	this.id = id;
	this.courseId = courseId;
	this.email = email;
	this.courseName = courseName;
}


function addNewLead() {
	$("#myModalLabel").text('Add Lead')
	$("#search-input *").prop('disabled', false);
	$("#courseName").prop('disabled', false);
    $("#firstName").val("");
    $("#lastName").val("");
    $("#course").val("");
    $("#branchName").val("");
    $("#mode").val("");
    $("#schedule").val("");
    $("#preferredTimeStart").val("");
    $("#preferredTimeEnd").val("");
    $("#source").val("");
    $("#mobile").val("");
    $("#email").val("");
    $("#comments").val("");
    $("#id").val("");
    $("#editField").hide();
	$("#addField").show();
	$("#courseName").val("");
	$("#courseId").val("");
    $("#myModal").modal('show');
}

function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    indexed_array['mode'] = $('#mode').val();
    return indexed_array;
}

$(document).ready(function() {
	$.ajax({
		type : 'GET',
		url : '../getBranchListForPartnerId',
		success : function(data) {

			$.each(data, function(index, value) {
				$('#branchName').append(
						$("<option></option>").attr("value", index)
								.text(value));
			});
		},
		failure : function() {
			console.log('There was an error getting branch list');
		}

	});
});

function editForm() {
	$("#myModalLabel").text('Edit Lead');
	$("#editField").show();
	$("#addField").hide();
	//For editing, always get first element from array.
	$("#search-input *").prop('disabled', true);
	$("#courseName").prop('disabled', true);
	var table = $('#leadsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#userId").val(data.userId);
	$("#firstName").val(data.firstName);
	$("#lastName").val(data.lastName);
	$("#mobile").val(data.mobile);
	$("#courseName").val(data.course);
	$("#courseId").val(data.courseId);
	$("#course:checkbox[value='"+data.course+"']").prop("checked","true");
	$("#mode").val(data.mode);
	$("#schedule").val(data.schedule);
	$("#email").val(data.email);
	$("#branchName option:contains("+data.branchName+")").prop('selected', true);
	$("#preferredTimeStart").val(data.preferredTimeStart);
	$("#preferredTimeEnd").val(data.preferredTimeEnd);
	 $("#source").val(data.source);
	$("#comments").val(data.comments);
	$("#id").val(data.id);
	$("#myModal").modal("show");
}

function deleteLeads() {
	var deleteRows = [];
	var table = $('#leadsDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete leads')) {
		$.ajax({
			type : 'POST',
			url : '../deleteLeadData',
			data : {
				leadIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				leadsSelected.length = 0;
				enableDisableButtons();
	            $('#leadsDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}
var sourceList = '';
$(document).ready(function () {
    //$('#preferredTimeStart').datetimepicker();
    //$('#preferredTimeEnd').datetimepicker();
    $('#datetimepicker1').datetimepicker();
    
    $('#preferredTimeStart').datetimepicker({
    	format: 'hh:mm A'
    })
     $('#preferredTimeEnd').datetimepicker({
    	format: 'hh:mm A'
    })
    
    $.ajax({
		url: "../ShowSourceSuggestion",
		method: "GET",
		success: function(data) {
			sourceList = data.sourceObj;
			console.log('sourceList'+sourceList);
			$("#source").autocomplete({
		        source: sourceList
		    });
		},
		error: function(data) {
			console.log(data);
		}
	});
});

/*function showBatchForm() {
	$("#formBatch").modal('show');
}*/

/*function showExistingBatchesForm() {
	
}*/

function addToExistingBatch() {
	
}

function formABatchFromLeads() {
}

function showDemoPanel() {
	$.ajax({
		type : 'GET',
		url : '../getDemoList',
		success : function(data) {
			console.log(data);
			$.each(data, function (index, value) {
	            $('#existingDemosDemo').append($("<option></option>").attr("value", index).text(value));
	        });
			if (jQuery.isEmptyObject(data)) {
				alert('There are no open demos scheduled right now');
				$("#existingDemo").modal('hide');
				return false;
			}
			$("#existingDemo").modal('show');
		},
		failure : function() {
			console.log('There was an error getting branch list');
		}
	});	
}

function showBatchPanel(){	
	var table = $('#leadsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#batchCourseName").append(new Option(data.course, data.courseId));
	$("#batchCourseName option:contains("+data.course+")").prop('selected', true);
	$("#modeList").val(data.mode);
	$("#batchBranchName").append(new Option(data.branchName, data.branchId));
	$("#batchBranchName option:contains("+data.branchName+")").prop('selected', true);
	$("#batchSchedule").val(data.schedule);
	$("#id").val(data.id);
	
	$.ajax({
		type : 'POST',
		url : '../getFacultyListForPartnerId',
		data : {
			courseId : $("#batchCourseName").val()
		},
		success : function(data) {
			$.each(data, function(index, value) {
				$('#batchFacultyName').append(
						$("<option></option>").attr("value", index)
								.text(value));
			});
		},
		failure : function() {
			console.log('There was an error getting faculty list');
		}

	});
}

/**
 * This method calls the url to add leads to a demo.
 * @returns
 */
function addLeadToDemo() {
	
} 


/**
 * Method to export all rows data to excel sheet.
 * @returns
 */
function exportLeadData() {
	
	$.ajax({
		type : 'GET',
		url : '../exportLeadsToExcel',
		async : false,
		success : function(data) {
			//$('#demosDataTable').dataTable().fnDraw();
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});	
	
}

function checkSelectedLead(){
	if(selectedLead==''){
		alert('No Lead Found at this time. please select from list of options from Search result.');
	}
}

function markInvalidLead(){
	var invalidRows = [];
	var table = $('#leadsDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		invalidRows.push(data.id);
	}
	if (confirm('Confirm to mark lead invalid')) {
		$.ajax({
			type : 'POST',
			url : '../updateLeadData',
			data : {
				ids : invalidRows,
				status: 'invalid'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#leadsDataTable').dataTable().fnDraw();
			}
		});
	}
}