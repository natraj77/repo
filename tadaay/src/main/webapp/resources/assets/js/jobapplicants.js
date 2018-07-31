var rowsSelected = [];
/*$(document).ready(function () {
	$('#jobApplicantForm').validate({
	    rules: {
	    	fName: {
	            required: true
	        },
	        lName: {
	            required: true
	        },
	        jobTitle: {
	            required: true
	        }
	    },
	    messages: {
	    	fName: {
	            required: "First Name is required"
	        },
	        lName: {
	            required: "Last Name is required"
	        },
	        jobTitle: {
	            required: "Position Title is required"
	        }
	    },
	    submitHandler: function () {
	        saveUpdateJobApplicant();
	    }
	});
});*/

$(document).ready(function () {
    var table = $('#jobApplicantsDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
      /*  "sAjaxSource": "../getQuizList",*/
        "ajax": "../static/jobapplicants.json",
        "sPaginationType": "full_numbers",
        "bJQueryUI": true,
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "aoColumns": [
            {
                render: function ( data, type, row ) {
                    return '<input type="checkbox" class="editor-active">';
                },
                className: "dt-body-center"
            },
            {"mDataProp": "fName"},
            {"mDataProp": "lName"},
            {"mDataProp": "jobTitle"},
            {"mDataProp": "receivedDate"},
            {"mDataProp": "finalResult"},
            {"mDataProp": "Id"}
        ],
        "columnDefs": [
            {
                "targets": [6],
                "visible": false,
                "searchable": false,
                'checkboxes': {
   		            'selectRow': true
   		         }
            },
        ],
        'select': {
 		      'style': 'multi'
 		   },
        "language": {
	    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
	    	        searchPlaceholder: "Search for Something..."
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#jobApplicantsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#jobPositionsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#jobPositionsDataTable').DataTable().search("").draw();
                }
                return;
            });
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
		$('input:checkbox').removeAttr('checked');
		$('#editBtn').prop('disabled', true);
		$('#deleteBtn').prop('disabled', true);
		$("#panelContent").hide();
		})
		$('#myModal').on('shown.bs.modal', function (e) {
		var invoker = $(e.relatedTarget);
		if (invoker[0] && invoker[0].className === 'btn btn-primary') {
		$("#id").val("");
		}
		})
   
    $("#jobApplicantsDataTable").on('click', 'input.editor-active', function() {
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
		enableDisableButtons()
		enableDisablecontent();
		});
});

function enableDisablecontent() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$("#panelContent").hide();
	}
	if (rowsSelected.length == 1) {
		$("#panelContent").show();
	} 
	var table = $('#jobApplicantsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#panelTitle").text(data.jobTitle);
	$("#panelStatus").text(data.finalResult);
	$("#panelTitle").text(data.jobTitle);
	$("#id").val(data.id);
	
}
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
