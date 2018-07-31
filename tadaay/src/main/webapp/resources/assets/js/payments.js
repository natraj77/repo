var rowsSelected = [];


//Form Validation For Branches Form
$(document).ready(function () {
    $('#paymentDataForm').validate({
        rules: {
           studentName: {
                required: true
            },
            courseName: {
                required: true
            },
            totalFee: {
                required: true
            },
            feePaid: {
                required: true
            },
            feePending: {
                required: true
            },
            mode: {
                required: true
            },
            transactionRef: {
                required: true
            },
            optedDiscount: {
                required: true
            }
        },
        messages: {
        	studentName: {
                required: "Student Name is required"
            },
            courseName: {
                required: "Course Name is required"
            },
            totalFee: {
                required: "Total Fee is required"
            },
            feePaid: {
                required: "Fee Paid is required"
            },
            feePending: {
                required: "Fee Pending is required"
            },
            mode: {
                required: "Mode is required"
            },
            transactionRef: {
                required: "Transaction ref is required"
             },
             optedDiscount: {
               required: "Opted Discount is required"
            }
        },
        submitHandler: function () {
        	saveUpdatePayment();
        }
    });
});
$(document).ready(function() {
	var table = $('#paymentsDataTable').DataTable({
		"bProcessing" : true,
		"bServerSide" : true,
		"sAjaxSource" : "../showPayments",
		"sPaginationType" : "full_numbers",
		"bJQueryUI" : true,
		"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
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
		},{
			"className" : 'text-center',
			"mDataProp" : "lastName"
		} , {
			"className" : 'text-center',
			"mDataProp" : "totalFee"
		}, {
			"className" : 'text-center',
			"mDataProp" : "optedDiscount"
		},{
			"className" : 'text-center',
			"mDataProp" : "feePaid"
		}, {
			"className" : 'text-center',
			"mDataProp" : "feePending"
		}, {
			"className" : 'text-center',
			"mDataProp" : "mode"
		}, {
			"className" : 'text-center',
			"mDataProp" : "transactionRef"
		},  
		{
			"mDataProp" : "id"
		},
		{
			"mDataProp" : "studentId"
		}],
		"columnDefs" : [ {
			"targets" : [ 10, 9 ],
			"visible" : false,
			"searchable" : false
		}
		],
		'select': {
		      'style': 'multi'
		   },
		   "language": {
	    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
	    	        searchPlaceholder: "Search for payments...",
	    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
	    	},
		"initComplete" : function(settings, json) {
			$('#loadingSpinner').hide();
		}
	});


    // Grab the datatables input box and alter how it is bound to events
    $("#paymentsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#paymentsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#paymentsDataTable').DataTable().search("").draw();
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
    
    $("#paymentsDataTable").on('click', 'input.editor-active', function() {
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
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
	}
	
	if (rowsSelected.length == 0) {
		$('#deleteBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#deleteBtn').prop('disabled', false);
	} 
}

function closeModal() {
    $("#myModal").modal('hide');
}
function saveUpdatePayment() {
    alert('Saving a new Payment');

    var $form = $("#paymentDataForm");
    var data = JSON.stringify(getFormData($form));
    $.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: '../saveUpdatePaymentData',
        dataType: 'json',
        mimeType: 'application/json',
        data: data,
        success: function (returnData) {
            var table = $('#paymentsDataTable').DataTable();
            var table = $('#paymentsDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#paymentsDataTable').dataTable().fnDraw();
        }
    })
    
    
    $("#myModal").modal('hide');
}


function addNewPayment() {

	$("#studentName").val("");
	$("#courseName").val("");
	$("#totalFee").val("");
	$("#feePaid").val("");
	$("#feePending").val("");
	$("#mode").val("");
	$("#transactionReft").val("");

	$("#optedDiscount").val("");

	$("#id").val("");
	$("#studentId").val("");

	$("#myModal").modal('show');
}

function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    //indexed_array['studentId'] = $('#studentList').val();
	//indexed_array['courseId'] = $('#courseName').val();
	//return indexed_array;

    return indexed_array;
}
/*$(document).ready(
		function() {
			$.ajax({
				type : 'GET',
				url : '../getStudentListAndId',
				success : function(data) {
					$.each(data, function(index, value) {
						console.log("Index = " + index + " value = " + value);
						$('#studentList').append(
								$("<option></option>").attr("value", index)
										.text(value));
					});
				},
				failure : function() {
					console.log('There was an error getting course list');
				}

			});
		});*/

var courseList = {};

$(document).ready(function () {
    $.ajax({
        type: 'GET',
        url: '../getCourseListAndId',
        success: function (data) {
            $.each(data, function (index, value) {
                $('#courseName').append($("<option></option>").attr("value", value).text(value));
            });
        },
        failure: function () {
            console.log('There was an error getting course list');
        }

    });
});

function editForm() {
	//For editing, always get first element from array.
	var table = $('#paymentsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	console.log(data);
	$("#studentName").val(data.studentName);
	$("#courseName").val(data.courseName);
	$("#totalFee").val(data.totalFee);
	$("#feePaid").val(data.feePaid);
	$("#feePending").val(data.feePending);
	$("#transactionRef").val(data.transactionRef);
	$("#optedDiscount").val(data.optedDiscount);
	$("#mode").val(data.mode);
	$("#id").val(data.id);
	$("#studentId").val(data.studentId);
	$("#myModal").modal("show");
}
function deletePayment() {
	var deleteRows = [];
	var table = $('#paymentsDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete branches')) {
		$.ajax({
			type : 'POST',
			url : '../deletePaymentData',
			data : {
				branchIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#paymentsDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}

function selectAllRows() {
	
}