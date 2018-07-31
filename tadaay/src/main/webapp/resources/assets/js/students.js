var rowsSelected = [];
var emailSelected = [];
//Form Validation For Courses Form
$(document).ready(function () {
$('#studentsDataForm').validate({
    rules: {
    	studentName: {
            required: true
        },
        courseName: {
            required: true
        },
        mode: {
            required: true
        },
        status: {
            required: true
        },
        nextInterest: {
            required: true
        },
        joinedDate: {
            required: true
        }
    },
    messages: {
    	studentName: {
            required: "Student Name is required"
        },
        courseName: {
            required: "Batch Name is required"
        },
        mode: {
            required: "Mode is required"
        },
        status: {
            required: "Status is required"
        },
        nextInterest: {
            required: "Next Interest is required"
        },
        joinedDate: {
            required: "Joined Date is required"
        }
    },
    submitHandler: function () {
    	saveStudent();
    }
});

$('#assignTaskForm').validate({
    rules: {
    	taskName: {
            required: true
        }
    },
    messages: {
    	taskName: {
            required: "Task Name is required"
        }
    },
    submitHandler: function () {
    	saveStudentTasks();
    }
});

$('#assignQuizForm').validate({
    rules: {
    	quizName: {
            required: true
        }
    },
    messages: {
    	quizName: {
            required: "Task Name is required"
        }
    },
    submitHandler: function () {
    	saveStudentQuiz();
    }
});
$('#addemailForm').validate({
    submitHandler: function () {
        saveUpdateEmail();
    }
});

$('#addPaymentForm').validate({
    rules: {
    	tpaid: {
            number: true
        },tdiscount: {
        	number: true
        }
    },
    messages: {
    	tpaid: {
    		number: "Please Enter Number only"
        },tdiscount: {
        	number: "Please Enter Number only"
        }
    },
    submitHandler: function () {
    	savePayment();
    }
});

});
$(document).ready(function() {
	var table = $('#studentsDataTable').DataTable({
			"bProcessing" : true,
			"bServerSide" : true,
			"sAjaxSource" : "../showAppStudents",
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
					"className" : 'text-center',
					"mDataProp" : "firstName"
				},
				{
					"className" : 'text-center',
					"mDataProp" : "lastName"
				},
				{
					"className" : 'text-center',
					"mDataProp" : "batchName"
				},
				{
					"className" : 'text-center',
					"mDataProp" : "mode"
				},
				{
					"className" : 'text-center',
					"mDataProp" : "status"
				}, {
				"mDataProp" : "id"
			},{
				"mDataProp" : "email"
			},{
				"mDataProp" : "userId"
			},{
				"mDataProp" : "fee"
			},{
				"mDataProp" : "feeDiscount"
			} ],
			"columnDefs" : [ {
				"targets" : [10, 9, 8, 7, 6 ],
				"visible" : false,
				"searchable" : false
			}, ],
			'select': {
	 		      'style': 'multi'
	 		   },
	 		  "language": {
	    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
	    	        searchPlaceholder: "Search for students...",
	    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
	    	},
			"initComplete" : function(settings, json) {
				$('#loadingSpinner').hide();
			}
		});

					// Grab the datatables input box and alter how it is bound
					// to events
					$("#studentsDataTable_filter input").unbind() // Unbind
					// previous
					// default
					// bindings
					.bind(
							"input",
							function(e) { // Bind our desired behavior
								// If the length is 3 or more characters, or the
								// user pressed ENTER,
								// search
								if (this.value.length >= 3 || e.keyCode == 13) {
									// Call the API search function
									$('#studentsDataTable').DataTable().search(
											this.value).draw();
								}
								// Ensure we clear the search if they backspace
								// far enough
								if (this.value == "") {
									$('#studentsDataTable').DataTable().search(
											"").draw();
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
					    
					    $("#studentsDataTable").on('click', 'input.editor-active', function() {
					    	 var tr = $(this).closest('tr');
					         var row = table.row(tr);
					         
					         var $this = $(this);
					         var isChecked = $(this).prop( 'checked' );
					         
					    	 var rowId = tr.index();
					    	 //console.log('selected row Id : ' + rowId);
					         if (isChecked) {
					        	 rowsSelected.push(rowId);
					        	 emailSelected.push(row.data().email);
					         } else {
					        	 var index = rowsSelected.indexOf(rowId);
					        	 rowsSelected.splice(index, 1);
					        	 emailSelected.splice(index,1);
					         }
					         
					         enableDisableButtons();
					         
					    });

				});
function enableDisableButtons() {
	//console.log(rowsSelected);
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
		$('#quizResultsBtn').prop('disabled', true);
		$('#TaskResultsBtn').prop('disabled', true);
		$('#updatepayBtn').prop('disabled', true);
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
		$('#quizResultsBtn').prop('disabled', false);
		$('#TaskResultsBtn').prop('disabled', false);
		$('#updatepayBtn').prop('disabled', false);
	}
	if (rowsSelected.length == 0) {
		$('#sendemailBtn').prop('disabled', true);
		$('#sendsmsBtn').prop('disabled', true);
		$('#dropStudentBtn').prop('disabled', true);
		$('#assignQuizBtn').prop('disabled', true);
		$('#pushTaskBtn').prop('disabled', true);
		$('#deleteBtn').prop('disabled', true);
	} 
	if (rowsSelected.length >= 1) {
		$('#sendemailBtn').prop('disabled', false);
		$('#sendsmsBtn').prop('disabled', false);
		$('#dropStudentBtn').prop('disabled', false);
		$('#assignQuizBtn').prop('disabled', false);
		$('#pushTaskBtn').prop('disabled', false);
		$('#deleteBtn').prop('disabled', false);
	}
}


function closeModal() {
	$("#myModal").modal('hide');
}

function saveStudentQuiz(){
	alert('Saving a Student quiz record');

	//For editing, always get first element from array.
	var quizesPrepObj = '';
	var quizesArray = [];
	var table = $('#studentsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		quizesPrepObj = new prepareStudentQuizes(data.id, data.userId, $('#quizName').val());
		quizesArray.push(quizesPrepObj);
	}
	var dataObj = JSON.stringify(quizesArray);
	$.ajax({
		type : 'POST',
		url : '../saveStudentQuiz',
		data : {data : dataObj},
		mimeType : 'application/json',
		success : function(returnData) {
			rowsSelected.length = 0;
			enableDisableButtons();
			var table = $('#studentsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#studentsDataTable').dataTable().fnDraw();
		}
	});
	$("#assignQuiz").modal('hide');

}

function saveStudentTasks() {
	alert('Saving a Student tasks record');

	//For editing, always get first element from array.
	var tasksPrepObj = '';
	var tasksArray = [];
	var table = $('#studentsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var leadIds = [];
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		tasksPrepObj = new prepareStudentTasks(data.id, data.userId, $('#taskName').val());
		tasksArray.push(tasksPrepObj);
	}
	var dataObj = JSON.stringify(tasksArray);
	
	$.ajax({
		type : 'POST',
		url : '../saveStudentTask',
		data : {data : dataObj},
		mimeType : 'application/json',
		success : function(returnData) {
			rowsSelected.length = 0;
			enableDisableButtons();
			var table = $('#studentsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#studentsDataTable').dataTable().fnDraw();
		}
	});
	$("#assignTask").modal('hide');

}

function saveStudent() {
	alert('Saving a new student record');

	var $form = $("#studentDataForm");
	var data = JSON.stringify(getFormData($form));
	console.log(data);
	$.ajax({
		headers : {
			'Content-Type' : 'application/json'
		},
		type : 'POST',
		url : '../saveStudentData',
		dataType : 'json',
		mimeType : 'application/json',
		data : data,
		success : function(returnData) {
			$('#studentsDataTable').DataTable().row.add({
				"studentName" : returnData.studentName,
				"courseName" : returnData.courseName,
				"mode" : returnData.mode,
				"status" : returnData.status,
				"nextInterest" : returnData.nextInterest,
				"joinedDate" : returnData.joinedDate,
				"id" : returnData.id
			}).draw(false);
			$("#myModal").modal('hide');
		}
	})

}
function deleteStudents() {
	var deleteRows = [];
	var table = $('#studentsDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete Students')) {
		$.ajax({
			type : 'POST',
			url : '../deleteStudentData',
			data : {
				studentIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#studentsDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}
function addNewStudent() {
	$("#firstName").val("");
	$("#lastName").val("");
	$("#courseName").val("");
	$("#mode").val("");
	$("#status").val("");
    $("#id").val("");

    $("#myModal").modal('show');
}

function getFormData($form) {
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};

	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});

	return indexed_array;
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
            var table = $('#studentsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#studentsDataTable').dataTable().fnDraw();
		},
		failure : function() {
			console.log('There was an error sending email');
		}

	});	
	$("#sendEmail").modal('hide');
}

var courseList = [];

$(document).ready(function() {
	var date_input=$('input[name="joinedDate"]'); //our date input has the name "date"
	var container=$('.bootstrap-iso form').length>800 ? $('.bootstrap-iso form').parent() : "body";
	date_input.datepicker({
		format: 'dd/mm/yyyy',
		container: container,
		todayHighlight: true,
		autoclose: true,
	});
	
	$.ajax({
		type : 'GET',
		url : '../getTasksList',
		success : function(data) {
			//tasks		
			$.each(data, function(index, value) {
				$('#taskName').append(
						$("<option></option>").attr("value", index)
								.text(value));
			});
		},
		failure : function() {
			console.log('There was an error getting tasks list');
		}

	});
	
	$.ajax({
		type : 'GET',
		url : '../getStudentQuizList',
		success : function(data) {
			//quiz		
			$.each(data, function(index, value) {
				$('#quizName').append(
						$("<option></option>").attr("value", index)
								.text(value));
			});
		},
		failure : function() {
			console.log('There was an error getting quiz list');
		}

	});
	
	/*$.ajax({
		type : 'GET',
		url : '../getCourseList',
		success : function(data) {

			for (i = 0; i < data.length; i++) {
				courseList.push(data[i]);
			}
			$("#courseName").autocomplete({
				minLength : 3
			}, {
				source : courseList
			});
			$("#nextInterest").autocomplete({
				minLength : 3
			}, {
				source : courseList
			});
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});*/
});
function editStudent() {
	$("#myModalLabel").text('Edit Student')
	//For editing, always get first element from array.
	var table = $('#studentsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	 $("#firstName").val(data.firstName);
	 $("#lastName").val(data.lastName);
	 $("#courseName").val(data.course);
	 $("#mode").val(data.mode);
	 $("#status").val(data.status);
	 $("#id").val(data.id);
	 $("#batchId").val(data.batchId);
	 $("#myModal").modal('show');
}

function prepareStudentTasks(id, userId, taskId){
	this.id = id;//lead id val
	this.userId = userId;
	this.taskId = taskId;
}

function prepareStudentQuizes(id, userId, taskId){
	this.id = id;//lead id val
	this.userId = userId;
	this.taskId = taskId;
}


function dropStudent(){
	//For editing, always get first element from array.
	var table = $('#studentsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	var leadIds = [];
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		leadIds.push(data.id);
	}
	console.log('leadId:'+leadIds);
	$.ajax({
		type : 'POST',
		url : '../dropStudent',
		data : {
			leadIds : leadIds
		},
		dataType : 'json',
		mimeType : 'application/json',
		success : function(returnData) {
			rowsSelected.length = 0;
			enableDisableButtons();
			var table = $('#studentsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#studentsDataTable').dataTable().fnDraw();
		}
	});
}

function prepareStudentsPayment(id, userId, totalFee, optedDiscount, feePaid, feePending, mode, transactionRef){
	this.studentId = id;
	this.userId = userId;
	this.totalFee = totalFee;
	this.feePaid = feePaid;
	this.feePending = feePending;
	this.optedDiscount = optedDiscount;
	this.mode = mode;
	this.transactionRef = transactionRef;
}

function savePayment() {
	var table = $('#studentsDataTable').DataTable();
	var paymentPrepObj = '';
	var paymentArray = [];
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		paymentPrepObj = new prepareStudentsPayment(data.id, data.userId, $("#tpayment").val(),
				$("#tdiscount").val(), $("#tpaid").val(), $("#balance").val(), $("#paymentmode").val(),
				$("#transactionRef").val());
		paymentArray.push(paymentPrepObj);
	}
	var dataObj = JSON.stringify(paymentArray);
	
	$.ajax({
		type : 'POST',
		url : '../saveStudentPayment',
		data : {
			data : dataObj			
		},
		success : function(returnData) {
			var table = $('#studentsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#studentsDataTable').dataTable().fnDraw();
		}
	});
	$("#updatePayment").modal('hide');
}
function updatePaymentDtls() {
	var table = $('#studentsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	//display total payment based batch fee - fee discount %
	var totalFee = data.fee - ((data.fee*data.feeDiscount)/100);
	console.log('total fee is:'+totalFee);
	$("#tpayment").val(totalFee);
	var paymentDt = '';
	var feePaid = 0;
	var userDiscount = 0;
	$.ajax({
		type : 'POST',
		url : '../getPaymentBalanceForStudent',
		data : {
			userId : data.userId
		},
		success : function(data) {
			console.log('data is:'+data.payObj);
			paymentDt = data.payObj;
			for(var k in paymentDt){
				feePaid += paymentDt[k].feePaid;
			}
			if(paymentDt != null && paymentDt != ''){
				userDiscount = paymentDt[0].optedDiscount;
			}
			$("#tReceived").val(feePaid);
			$("#tdiscount").val(userDiscount);
		},
		failure : function() {
			console.log('There was an error getting faculty list');
		}

	});
}

function calculateBalance(){
	var discount = 0;
	if($("#tdiscount").val() != ''){
		discount = $("#tdiscount").val();
	}
	var paid = 0;
	if($("#tpaid").val() != ''){
		paid = $("#tpaid").val();
	}
	var alreadyPaid = $("#tReceived").val(); 
	var balance = $("#tpayment").val() - discount - alreadyPaid - paid;
	console.log('balance is:'+balance);
	$("#balance").val(balance);
}
