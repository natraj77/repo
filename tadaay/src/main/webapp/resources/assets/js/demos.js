var rowsSelected = [];
var leadsSelected = [];

//Form Validation For Branches Form
$(document).ready(function() {
	$('#demoDataForm').validate({
		rules : {
			courseName : {
				required : true
			},
			mode : {
				required : true
			},
			name : {
				required : true
			},
			branchName : {
				required : true
			},
			fee : {
				required : true
			}
		},
		messages : {
			courseName : {
				required : "Course Name is required"
			},

			mode : {
				required : "Mode List is required"
			},
			name : {
				required : "Faculty is required"
			},
			branchName : {
				required : "Branch List is required"
			},
			fee : {
				required : "Fee Discount List is required"
			}
		},
		submitHandler : function() {
			saveUpdateDemo();
		}
	});

	$('#startDateSelector').datetimepicker();
	$('#rescheduleSelector').datetimepicker();
});

$(document).ready(function() {
	var table = $('#demosDataTable').DataTable({
		"bProcessing" : true,
		"bServerSide" : true,
		"sAjaxSource" : "../showAllDemos",
		"sPaginationType" : "full_numbers",
		"bJQueryUI" : true,
		"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
		"aoColumns" : [ {
			render : function(data, type, row) {
				return '<input type="checkbox" class="editor-active">';
			},
			className : "dt-body-center"
		},

		{
			"mDataProp" : "courseName"
		}, {
			"mDataProp" : "mode"
		}, {
			"mDataProp" : "facultyName"
		}, {
			"mDataProp" : "branchName"
		}, {
			"mDataProp" : "demoStatus"
		}, {
			"mDataProp" : "startDate"
		}, {
			"mDataProp" : "fee"
		}, {
			"mDataProp" : "id"
		},{
			"mDataProp" : "branchId"
		},{
			"mDataProp" : "courseId"
		},{
			"mDataProp" : "facultyId"
		}

		],
		"columnDefs" : [ {
			"targets" : [ 11, 10, 9, 8 ],
			"visible" : false,
			"searchable" : false
		}, ],
		'select': {
 		      'style': 'multi'
 		   },
 		  "language": {
    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
    	        searchPlaceholder: "Search for Demos...",
    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
    	},
		"initComplete" : function(settings, json) {
			$('#loadingSpinner').hide();
		}
	});

	// Grab the datatables input box and alter how it is bound to events
	$("#demosDataTable_filter input").unbind() // Unbind previous default bindings
	.bind("input", function(e) { // Bind our desired behavior
		// If the length is 3 or more characters, or the user pressed ENTER, search
		if (this.value.length >= 1 || e.keyCode == 13) {
			// Call the API search function
			$('#demosDataTable').DataTable().search(this.value).draw();
		}
		// Ensure we clear the search if they backspace far enough
		if (this.value == "") {
			$('#demosDataTable').DataTable().search("").draw();
		}
		return;
	});

	$('#myModal').on('hidden.bs.modal', function() {
		$(this).find('form').trigger('reset');
	})
	$('#myModal').on('shown.bs.modal', function(e) {
		var invoker = $(e.relatedTarget);
		if (invoker[0] && invoker[0].className === 'btn btn-primary') {
			$("#id").val("");
		}
	});

	$('#myModal').on('hidden.bs.modal', function() {
		$(this).find('form').trigger('reset');
		rowsSelected.length = 0;
	})

	$("#demosDataTable").on('click', 'input.editor-active', function() {
		var tr = $(this).closest('tr');
		var row = table.row(tr);

		var $this = $(this);
		var isChecked = $(this).prop('checked');

		var rowId = tr.index();
		//console.log('selected row Id : ' + rowId);
		console.log(row.data());
		if (isChecked) {
			rowsSelected.push(rowId);
		} else {
			var index = rowsSelected.indexOf(rowId);
			rowsSelected.splice(index, 1);
		}

		enableDisableButtons();

	});
});

function enableDisableButtons() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
		$('#rescheduleBtn').prop('disabled', true);
		$('#attendeesBtn').prop('disabled', true);
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
		$('#rescheduleBtn').prop('disabled', false);
		$('#attendeesBtn').prop('disabled', false);
		
		
	}
	
	if (rowsSelected.length == 0) {
		$('#cancelDemoBtn').prop('disabled', true);
		$('#completedBtn').prop('disabled', true);
		$('#archivedBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#cancelDemoBtn').prop('disabled', false);
		$('#completedBtn').prop('disabled', false);
		$('#archivedBtn').prop('disabled', false);
	} 
}
function addNewDemo() {
	$("#myModalLabel").text('Add Demo');
	$("#courseName").prop('disabled', false);
	$("#courseName").val("");
	$("#mode").val("");
	$("#branchName").val("");
	$("#startDate").val("");
	$("#facultyName").val("");
	$("#demoStatus").val("");
	$("#fee").val("");
    $("#id").val("");
    $("#branchId").val("");
    $("#courseId").val("");
    $("#facultyId").val("");
    $("#myModal").modal('show');
}

function setFacultyId() {
	$("#facultyId").val($("#name").val());
}

/**
 * Method to save or update demo data
 * Calls the controller URL
 * @returns
 */
function saveUpdateDemo() {
	var $form = $("#demoDataForm");
	var data = JSON.stringify(getFormData($form));
	console.log(data);
	$.ajax({
		headers : {
			'Content-Type' : 'application/json'
		},
		type : 'POST',
		url : '../saveUpdateDemoData',
		dataType : 'json',
		mimeType : 'application/json',
		data : data,
		success : function(returnData) {
			var table = $('#demosDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
			$('#demosDataTable').dataTable().fnDraw();
		}
	})

	$("#facultyName").empty();
	$("#myModal").modal('hide');

}

/**
 * Method to show edit modal and then show selected data
 * @returns
 */
function showEditDemo() {
	$("#myModalLabel").text('Edit Demo')
	var table = $('#demosDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#id").val(data.id);
	$("#courseName option:contains(" + data.courseName + ")").prop('selected', true);
	$("#courseName").prop('disabled', true);
	$("#mode").val(data.mode);
	showFacultyDemos();
	$("#facultyName option:contains(" + data.facultyName + ")").prop('selected', true);
	$("#branchName option:contains(" + data.branchName + ")").prop('selected', true);
	$("#demoStatus").val(data.demoStatus);
	$("#startDate").val(data.startDate);
	$("#fee").val(data.fee);
	$("#branchId").val(data.branchId);
    $("#courseId").val(data.courseId);
    $("#facultyId").val(data.facultyId);
	$("#myModal").modal('show');
}


/**
 * Method to mark the attendees who responded to the email
 * sent for the demo and then attended the demo.
 * @returns
 */


function rescheduleDemo() {
	var rescheduleRows = [];
	var table = $('#demosDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	
	console.log($("#rescheduleDate").val());
	
	$.ajax({
		type : 'POST',
		url : '../rescheduleDemo',
		data : {
			ids : rescheduleRows,
			demoresheduleDate : $("#rescheduleDate").val()
		},
		success : function(data) {
			rowsSelected.length = 0;
			enableDisableButtons();
			$('#demosDataTable').dataTable().fnDraw();
		}
	});

	$("#demoReschedule").modal('hide');
}

/**
 * Function to form a new batch and to set the status of the batch
 * Based on the selected date, whether current date or the future date.
 */
function formANewDemo() {
	var plyBatchNo = $("#plyBatchNo").val();
	var batchID = $("#batchID").val();
	var demoStartDate = $("#demoStartDate").val();
	console.log('demoStartDate : ' + demoStartDate);
	alert('Starting a new batch with batchID : ' + plyBatchNo
			+ ', with start date :' + demoStartDate);

	$.ajax({
		type : 'POST',
		url : '../formNewBatch?plyBatchNo=' + plyBatchNo + '&batchId='
				+ batchID + '&demoStartDate=' + demoStartDate,
		async : false,
		dataType : 'json',
		mimeType : 'application/json',
		success : function(data) {
			$('#demosDataTable').dataTable().fnDraw();
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
	$("#startDateModal").modal('hide');

}


function cancelDemo() {
	var rescheduleRows = [];
	var table = $('#demosDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to Cancel demo')) {
		$.ajax({
			type : 'POST',
			url : '../updateDemoData',
			data : {
				ids : rescheduleRows,
				status : 'cancel'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#demosDataTable').dataTable().fnDraw();
			}
		});
	}

}

function getFormData($form) {
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};

	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});
	indexed_array['courseId'] = $('#courseName').val();
    indexed_array['facultyId'] = $('#facultyName').val();
    indexed_array['branchId'] = $('#branchName').val();
    
    indexed_array['courseName'] = $('#courseName').find('option:selected').text();
    indexed_array['facultyName'] = $('#facultyName').find('option:selected').text();
    indexed_array['branchName'] = $('#branchName').find('option:selected').text();
	return indexed_array;
}

var courseList = [];
var branchList = [];
$(document).ready(
		function() {
			$.ajax({
				type : 'GET',
				url : '../getCourseListForPartnerId',
				success : function(data) {
					$.each(data, function(index, value) {
						$('#courseName').append(
								$("<option></option>").attr("value", index).text(value));
					});
				},
				failure : function() {
					console.log('There was an error getting course list');
				}

			});

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

function showAttendees() {
	var table = $('#demosDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var demoId = data.id;
	var tbodyStr = '';
	var returnData;
	$.ajax({
		type : 'GET',
		url : '../getLeadDemoStatus?demoId=' + demoId,
		success : function(data) {
			returnData = data;
			for (i = 0; i < data.length; i++) {
				tbodyStr = tbodyStr +  "<tr><td><input name='chkbox' value='1'" +
          							"id='chkbox_" + data[i].id + "' type='checkbox'" +
          								"onclick='collectLeadStatus(" + data[i].id + ");' /></td>" +
          						"<td class='text-center'>" + data[i].firstName + "</td>" + 
          						"<td class='text-center'>" + data[i].lastName + "</td>" + 
          						"<td class='text-center'>" + data[i].email + "</td>" + 
          						"<td class='text-center'>" + data[i].mobile + "</td>" + 
          						"<td class='text-center'>" + data[i].status + "</td></tr>";
			}
			
			var tableStr = "<table id='studentTable' class='table table-bordered table-hover table-responsive text-center'>" +
				"<thead class='text-center'>" + 
					"<tr>" +	
						"<th><input name='select_all' value='1'" +
							"id='example-select-all' type='checkbox'" +
								"onclick='selectAllRows();' /></th>" +
									"<th class='text-center'>First Name</th>" + 
									"<th class='text-center'>Last Name</th>" + 
									"<th class='text-center'>Email Id</th>" + 
									"<th class='text-center'>Mobile</th>" + 
									"<th class='text-center'>Status</th>" +
									"</tr>" +
				"</thead>" +
				"<tbody id='leadDemoStatusTBody'></tbody>" +
				"</table>";
			

			$("#studentDemoTable").html(tableStr);
			$("#studentTable tbody").append(tbodyStr);
			for (i = 0; i < returnData.length; i++) {
				if (data[i].inviteStatus == 'ATTENDED DEMO') $("#chkbox_" + data[i].leadId).prop("checked", true);
			}
			
		},
		failure : function() {
			console.log('There was an error getting faculty list');
		}

	});
	$("#demoattendees").modal('show');
        
}

function showFacultyDemos(){
	var courseId = $("#courseName").val();
	if(courseId != ''){
		//emptying the faculties for showing latest values from database
		$("#facultyName").find("option:not(:first)").remove();
		$.ajax({
			type : 'POST',
			url : '../getFacultyListForPartnerId',
			data : {
				courseId : courseId
			},
			success : function(data) {
				$.each(data, function(index, value) {
					$('#facultyName').append(
							$("<option></option>").attr("value", index)
									.text(value));
				});
			},
			failure : function() {
				console.log('There was an error getting faculty list');
			}

		});
	}
}


function showArchivedDemos() {
	var tbodyStr = '';
	$.ajax({
		type : 'GET',
		url : '../getArchivedDemos',
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				tbodyStr = tbodyStr +  
          						"<tr><td class='text-center'>" + data[i].courseName + "</td>" + 
          						"<td class='text-center'>" + data[i].mode + "</td>" + 
          						"<td class='text-center'>" + data[i].facultyName + "</td>" +
          						"<td class='text-center'>" + data[i].branchName + "</td>" +
          						"<td class='text-center'>" + data[i].demoStatus + "</td>" +
          						"<td class='text-center'>" + data[i].dateTime + "</td>" +
          						"<td class='text-center'>" + data[i].fee + "</td>" +
          						"</tr>";
			}
			
			var tableStr = "<table id='archiveTable' class='table table-bordered table-hover table-responsive text-center'>" +
				"<thead class='text-center'>" + 
					"<tr>" +	
									"<th class='text-center'>Course Name</th>" + 
									"<th class='text-center'>Mode</th>" + 
									"<th class='text-center'>Faculty</th>" +
									"<th class='text-center'>Branch</th>" +
									"<th class='text-center'>Demo Status</th>" +
									"<th class='text-center'>Start Date</th>" +
									"<th class='text-center'>Fee</th>" +
									"</tr>" +
				"</thead>" +
				"<tbody id='leadDemoStatusTBody'></tbody>" +
				"</table>";
			

			$("#demoArchiveTable").html(tableStr);
			$("#archiveTable tbody").append(tbodyStr);
			
		},
		failure : function() {
			console.log('There was an error getting demo archives');
		}

	});
	$("#demoArchives").modal('show');
        
}

function collectLeadStatus(id) {
	leadsSelected.push(id);
}

function saveUpdateAttendees() {
	var table = $('#demosDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var demoId = data.id;
	
	$.ajax({
		type : 'POST',
		url : '../saveUpdateAttendees',
		data : {
			ids : leadsSelected,
			demoId : demoId
		},
		success : function(data) {
			rowsSelected.length = 0;
			enableDisableButtons();
			$('#demosDataTable').dataTable().fnDraw();
		}
	});

	$("#demoattendees").modal('hide');
}


/**
 * Mark Demo Complete
 * @returns
 */
function markDemoComplete() {
	var rescheduleRows = [];
	var table = $('#demosDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to Complete demo')) {
		$.ajax({
			type : 'POST',
			url : '../updateDemoData',
			data : {
				ids : rescheduleRows,
				status: 'complete'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#demosDataTable').dataTable().fnDraw();
			}
		});
	}

}

/**
 * Mark Archive Complete
 * @returns
 */
function markDemoArchive() {
	var rescheduleRows = [];
	var table = $('#demosDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to Archive demo')) {
		$.ajax({
			type : 'POST',
			url : '../updateDemoData',
			data : {
				ids : rescheduleRows,
				status: 'archive'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#demosDataTable').dataTable().fnDraw();
			}
		});
	}

}