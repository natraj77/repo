var rowsSelected = [];
//Form Validation For Branches Form
$(document).ready(function () {
    $('#batchDataForm').validate({
        rules: {
            courseName: {
                required: true
            },
            schedule: {
                required: true
            },
            mode: {
                required: true
            },
            facultyName: {
                required: true
            },
            branchName: {
                required: true
            },
            startDate: {
                required: true
            },
            fee: {
                required: true
            },
            feeDiscount: {
                required: true,
                max:100,
                digits:true
            },
            duration: {
                required: true
            },
            durationType: {
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
            mode: {
                required: "Mode List is required"
            },
            facultyName: {
                required: "Faculty is required"
            },
            branchName: {
                required: "Branch List is required"
            },
            startDate: {
                required: "Date and Time is required"
            },
            fee: {
                required: "Fee is required"
            },
             feeDiscount: {
               required: "Madatory field. Enter 0 if no discount",
               max:"Enter values from 0 to 100"
            },
            duration: {
                required: "Duration is required"
            },
            durationType: {
                required: "Duration Type is required"
            }
        },
        submitHandler: function () {
            saveUpdateBatch();
        }
    });
   /* $('#scheduleSelector').datetimepicker({
    	autoclose: 1
    });*/
    $('#scheduleSelector').datetimepicker();
	$('#rescheduleSelector').datetimepicker();
	
	$('#batchInviteesForm').validate({submitHandler: function () {
		saveUpdateInvitees();
    }});
	
	$('#renameBatchForm').validate({submitHandler: function () {
		saveBatchName();
    }});
});

$(document).ready(function () {
    var table = $('#batchesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showBatches",
        "sPaginationType": "full_numbers",
        "bJQueryUI": true,
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "aoColumns" : [
					    {
			                render: function ( data, type, row ) {
			                    return '<input type="checkbox" class="editor-active">';
			                },
			                className: "dt-body-center"
			            },
			            { "mDataProp": "batchName" },
			            { "mDataProp": "courseName" },
	                    { "mDataProp": "schedule" },
	                    { "mDataProp": "startDate" },
	                    { "mDataProp": "mode" },
	                    {
							"mDataProp" : "duration"
						},{
							"mDataProp" : "durationType"
						} ,
	                    { "mDataProp": "facultyName" },
	                    { "mDataProp": "branchName" },
	                    { "mDataProp": "fee" },
	                    {"mDataProp": "feeDiscount" },
	                    {"mDataProp": "batchStatus" },
                        {
						"mDataProp" : "id"
					},{
						"mDataProp" : "courseId"
					},{
						"mDataProp" : "branchId"
					},{
						"mDataProp" : "facultyId"
					},{
						"mDataProp" : "classTime"
					}],
					"columnDefs" : [ {
						"targets" : [17, 16, 15, 14, 13],
						"visible" : false,
						"searchable" : false
					}, ],
					'select': {
			 		      'style': 'multi'
			 		   },
			 		  "language": {
			    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
			    	        searchPlaceholder: "Search for batches...",
			    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
			    	},
					"initComplete" : function(settings, json) {
						$('#loadingSpinner').hide();
					}
				});

    // Grab the datatables input box and alter how it is bound to events
    $("#batchesDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#batchesDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#batchesDataTable').DataTable().search("").draw();
                }
                return;
            });

    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
    })
    
    $("#batchesDataTable").on('click', 'input.editor-active', function() {
    	 var tr = $(this).closest('tr');
         var row = table.row(tr);
         
         var $this = $(this);
         var isChecked = $(this).prop( 'checked' );
         
    	 var rowId = tr.index();
    	 //console.log('selected row Id : ' + rowId);
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
		$('#scheduleBatchBtn').prop('disabled', true);
		$('#rescheduleBatchBtn').prop('disabled', true);
		$('#inviteesBtn').prop('disabled', true);
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
		$('#scheduleBatchBtn').prop('disabled', false);
		$('#rescheduleBatchBtn').prop('disabled', false);
		$('#inviteesBtn').prop('disabled', false);
		
		
	}
	
	if (rowsSelected.length == 0) {
		$('#deleteBtn').prop('disabled', true);
		$('#cancelBatch').prop('disabled', true);
		$('#completedBatch').prop('disabled', true);
		$('#inprogressBatch').prop('disabled', true);
		$('#archivedBatch').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#deleteBtn').prop('disabled', false);
		$('#cancelBatch').prop('disabled', false);
		$('#completedBatch').prop('disabled', false);
		$('#inprogressBatch').prop('disabled', false);
		$('#archivedBatch').prop('disabled', false);
	} 
}

function rescheduleBatch(batchStatus) {
	var rescheduleRows = [];
	var table = $('#batchesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	var date = '';
	if(batchStatus == 'SCHEDULED'){
		date = $("#rescheduleDate").val();
	}else{
		date = $("#rescheduleDate1").val();
	}
	
	$.ajax({
		type : 'POST',
		url : '../rescheduleBatch',
		data : {
			ids : rescheduleRows,
			batchRescheduleDate : date,
			batchStatus : batchStatus
		},
		success : function(data) {
			rowsSelected.length = 0;
			enableDisableButtons();
			$('#batchesDataTable').dataTable().fnDraw();
		}
	});
	$("#batchreshedule").modal('hide');
	$("#batchschedule").modal('hide');
	
}

function showInvitees() {
	var table = $('#batchesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var batchId = data.id;
	var tbodyStr = '';
	var returnData;
	$.ajax({
		type : 'GET',
		url : '../getLeadBatchStatus?batchId=' + batchId,
		success : function(data) {
			returnData = data.model;
			for (i = 0; i < returnData.length; i++) {
				tbodyStr = tbodyStr +  "<tr><td><input name='chkbox' value='1'" +
          							"id='chkbox_" + returnData[i].id + "' type='checkbox'" +
          								"onclick='collectLeadStatus(" + returnData[i].id + ");' /></td>" +
          						"<td class='text-center'>" + returnData[i].firstName + "</td>" + 
          						"<td class='text-center'>" + returnData[i].lastName + "</td>" + 
          						"<td class='text-center'>" + returnData[i].status + "</td></tr>";
			}
			
			var tableStr = "<table id='studentTable' class='table table-bordered table-hover table-responsive text-center'>" +
				"<thead class='text-center'>" + 
					"<tr>" +	
						"<th><input name='select_all' value='1'" +
							"id='example-select-all' type='checkbox'" +
								"onclick='selectAllRows();' /></th>" +
									"<th class='text-center'>First Name</th>" + 
									"<th class='text-center'>Last Name</th>" + 
									"<th class='text-center'>Status</th>" +
									"</tr>" +
				"</thead>" +
				"<tbody id='leadBatchStatusTBody'></tbody>" +
				"</table>" +
				"Total Count:"+data.totalCnt+"&emsp;Invited:"+data.invitedCnt+"&emsp; Registered:"+data.registeredCnt+"&emsp; Dropped:"+data.droppedCnt;
			

			$("#studentBatchTable").html(tableStr);
			$("#studentTable tbody").append(tbodyStr);
			
		},
		failure : function() {
			console.log('There was an error getting leads');
		}

	});
	$("#batchinvitees").modal('show');
        
}
var leadsSelected = [];
function collectLeadStatus(id) {
	if($("#chkbox_" + id).is(':checked') && leadsSelected.indexOf(id)<0){
		leadsSelected.push(id);
	}
}

function saveUpdateInvitees() {
	var table = $('#batchesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var batchId = data.id;
	console.log('leadsSelected:'+leadsSelected);
	$.ajax({
		type : 'POST',
		url : '../saveUpdateInvitees',
		data : {
			ids : leadsSelected,
			batchId : batchId
		},
		success : function(data) {
			rowsSelected.length = 0;
			enableDisableButtons();
			 var table = $('#batchesDataTable').DataTable();
	         var row_index = table.row(this).index();
	         var current_row = table.row(this);
	         $('#batchesDataTable').dataTable().fnDraw();
		}
	});

	$("#batchinvitees").modal('hide');
}

function markBatchComplete() {
	var rescheduleRows = [];
	var table = $('#batchesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to Complete Batch')) {
		$.ajax({
			type : 'POST',
			url : '../updateBatchData',
			data : {
				ids : rescheduleRows,
				status: 'complete'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#batchesDataTable').dataTable().fnDraw();
			}
		});
	}
}

function markBatchInprogress() {
	var rescheduleRows = [];
	var table = $('#batchesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to mark Batch as In Progress')) {
		$.ajax({
			type : 'POST',
			url : '../updateBatchData',
			data : {
				ids : rescheduleRows,
				status: 'inprogress'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#batchesDataTable').dataTable().fnDraw();
			}
		});
	}
}

function markBatchArchive() {
	var rescheduleRows = [];
	var table = $('#batchesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to Archive Batch')) {
		$.ajax({
			type : 'POST',
			url : '../updateBatchData',
			data : {
				ids : rescheduleRows,
				status: 'archive'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#batchesDataTable').dataTable().fnDraw();
			}
		});
	}

}

function cancelBatch() {
	var rescheduleRows = [];
	var table = $('#batchesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		rescheduleRows.push(data.id);
	}
	if (confirm('Confirm to Cancel Batch')) {
		$.ajax({
			type : 'POST',
			url : '../updateBatchData',
			data : {
				ids : rescheduleRows,
				status: 'cancel'
			},
			success : function(data) {
				rowsSelected.length = 0;
				enableDisableButtons();
				$('#batchesDataTable').dataTable().fnDraw();
			}
		});
	}

}

function closeModal() {
    $("#myModal").modal('hide');
}
function setFacultyId(selected) {
	console.log(selected.value);
	$("#facultyId").val(selected.value);
}
function saveUpdateBatch() {
    alert('Saving a new batch');

    var $form = $("#batchDataForm");
    var data = JSON.stringify(getFormData($form));
    console.log(data);
    $.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: '../saveUpdateBatchData?id=' + $('#id').val(),
        dataType: 'json',
        mimeType: 'application/json',
        data: data,
        success: function (returnData) {
            var table = $('#batchesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#batchesDataTable').dataTable().fnDraw();
        }
    });
    
    
    $("#myModal").modal('hide');
}


function addNewBatch() {
	$("#myModalLabel").text('Add Batch')
	$("#batchName").prop('disabled', false);
	$("#courseName").prop('disabled', false);
	$("#batchName").val("");
	$("#courseName").val("");
	$("#schedule").val("");
	$("#mode").val("");
	$("#duration").val("");
	$("#durationType").val("");
	$("#faculty").val("");
	$("#branchName").val("");
	$("#startDate").val("");
	$("#fee").val("");
	$("#feeDiscount").val("");
    $("#id").val("");
    $("#branchId").val("");
    $("#courseId").val("");
    $("#facultyId").val("");
    $("#classtime").val("");
    $("#myModal").modal('show');
}
function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    indexed_array['courseId'] = $('#courseName').val();
    indexed_array['facultyId'] = $('#facultyName').val();
    indexed_array['branchId'] = $('#branchName').val();
    indexed_array['batchName'] = $('#batchName').val();
    indexed_array['courseName'] = $('#courseName').find('option:selected').text();
    indexed_array['facultyName'] = $('#facultyName').find('option:selected').text();
    indexed_array['branchName'] = $('#branchName').find('option:selected').text();

    return indexed_array;
}

$(document).ready(function () {
    $.ajax({
		type : 'GET',
		url : '../getCourseListForPartnerId',
		success : function(data) {
			//courses
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

function showFacultyForBatches(){
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

function saveBatchName(){
	var table = $('#batchesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var batchId = data.id;
	
	$.ajax({
		type : 'POST',
		url : '../updateBatchName',
		data : {
			batchName : $('#renameBatchName').val(),
			batchId : batchId
		},
		success : function(data) {
			rowsSelected.length = 0;
			enableDisableButtons();
			 var table = $('#batchesDataTable').DataTable();
	         var row_index = table.row(this).index();
	         var current_row = table.row(this);
	         $('#batchesDataTable').dataTable().fnDraw();
		}
	});

	$("#renameBatchname").modal('hide');
}

function editForm() {
	$("#myModalLabel").text('Edit Batch')
	//For editing, always get first element from array.
	var table = $('#batchesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();

	$("#batchName").prop('disabled', true);
	$("#courseName").prop('disabled', true);
	$("#batchName").val(data.batchName);
	$("#courseName option:contains(" + data.courseName + ")").prop('selected', true);
	$("#schedule").val(data.schedule);
	$("#mode").val(data.mode);
	$("#duration").val(data.duration);
	$("#durationType").val(data.durationType);
	$("input[name=durationType][value='"
			+ data.durationType
			+ "']").prop('checked',
	'checked');
	showFacultyForBatches();
	$("#facultyName option:contains(" + data.facultyName + ")").prop('selected', true);
	$("#branchName option:contains(" + data.branchName + ")").prop('selected', true);
	$("#demoStatus").val(data.demoStatus);
	$("#startDate").val(data.startDate);
	$("#fee").val(data.fee);
	$("#feeDiscount").val(data.feeDiscount);
    $("#id").val(data.id);
    $("#batchStatus").val(data.batchStatus);
    $("#branchId").val(data.branchId);
    $("#courseId").val(data.courseId);
    $("#facultyId").val(data.facultyId);
    $("#classTime option:contains(" + data.classTime + ")").prop('selected', true);

    $("#myModal").modal('show');
}
$(document).ready(function () {
    $('#datetimepicker1').datetimepicker();
});

function showArchivedBatches() {
	var tbodyStr = '';
	$.ajax({
		type : 'GET',
		url : '../getArchivedBatchesData',
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				tbodyStr = tbodyStr +  
					"<tr><td class='text-center'>" + data[i].batchName + "</td>" +
					"<td class='text-center'>" + data[i].courseName + "</td>" + 
					"<td class='text-center'>" + data[i].schedule + "</td>" + 
					"<td class='text-center'>" + data[i].startDate + "</td>" +
					"<td class='text-center'>" + data[i].mode + "</td>" +
					"<td class='text-center'>" + data[i].facultyName + "</td>" +
					"<td class='text-center'>" + data[i].branchName + "</td>" +
					"<td class='text-center'>" + data[i].feeDiscount + "</td>" +
					"<td class='text-center'>" + data[i].batchStatus + "</td>" +
					"</tr>";
			}
			
			var tableStr = "<table id='archiveTable' class='table table-bordered table-hover table-responsive text-center'>" +
			"<thead class='text-center'>" + 
				"<tr>" +
								"<th class='text-center'>Batch Name</th>" +
								"<th class='text-center'>Course Name</th>" + 
								"<th class='text-center'>Schedule</th>" + 
								"<th class='text-center'>Start Date</th>" +
								"<th class='text-center'>Mode</th>" +
								"<th class='text-center'>Faculty</th>" +
								"<th class='text-center'>Branch</th>" +
								"<th class='text-center'>Fee Discount</th>" +
								"<th class='text-center'>Status</th>" +
								"</tr>" +
			"</thead>" +
			"<tbody id='leadBatchStatusTBody'></tbody>" +
			"</table>";
			

			$("#batchArchiveTable").html(tableStr);
			$("#archiveTable tbody").append(tbodyStr);
			
		},
		failure : function() {
			console.log('There was an error getting demo archives');
		}

	});
	$("#batchArchives").modal('show');
        
}
