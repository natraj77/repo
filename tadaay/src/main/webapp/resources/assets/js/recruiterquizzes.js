var rowsSelected = [];


//Form Validation For Branches Form
$(document).ready(function () {
	
    $('#quizeDataForm').validate({
        rules: {
            name: {
                required: true
            },
            courseName: {
                required: true
            },
            level: {
                required: true
            },
            topic: {
                required: true
            },
            duration: {
                required: true
            },
            noQuestions: {
                required: true
            }
        },
        messages: {
            name: {
                required: "Name is required"
            },
            courseName: {
                required: "Course is required"
            },
            level: {
                required: "Level is required"
            },
            topic: {
                required: "Topic is required"
            },
            duration: {
                required: "Duration is required"
            },
            noQuestions: {
                required: "No of Questions is required"
            }
        },
        submitHandler: function () {
            saveUpdateQuize();
        }
    });
});

$(document).ready(function () {
    var table = $('#quizzesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showRecruiterQuizzes",
        "sPaginationType": "full_numbers",
        "bJQueryUI": true,
        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
        "aoColumns": [
            {
                render: function ( data, type, row ) {
                    return '<input type="checkbox" class="editor-active">';
                },
                className: "dt-body-center"
            },
            {"mDataProp": "name"},
            {"mDataProp": "courseName"},
            {"mDataProp": "level"},
            {"mDataProp": "topic"},
            {"mDataProp": "duration"},
            {"mDataProp": "noQuestions"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [7],
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
    $("#quizzesDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#quizzesDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#quizzesDataTable').DataTable().search("").draw();
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
    
    $("#quizzesDataTable").on('click', 'input.editor-active', function() {
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
function saveUpdateQuiz() {
    alert('Saving a new Quiz');

    var $form = $("#quizDataForm");
    var data = JSON.stringify(getFormData($form));
    $.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: '../saveUpdateQuizData?id=' + $('#id').val(),
        dataType: 'json',
        mimeType: 'application/json',
        data: data,
        success: function (returnData) {
            var table = $('#quizzesDataTable').DataTable();
            var table = $('#quizzesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#quizzesDataTable').dataTable().fnDraw();
        }
    })
    
    
    $("#myModal").modal('hide');
}


function addNewQuiz() {
    $("#name").val("");
    $("#courseName").val("");
    $("#level").val("");
    $("#topic").val("");
    $("#duration").val("");
    $("#noQuestions").val("");
    $("#id").val("");

    $("#myModal").modal('show');
}

function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

function editForm() {
	//For editing, always get first element from array.
	var table = $('#quizzesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	//console.log(data);

    $("#name").val(data.name);
    //alert(data.name);
    $("#courseName").val(data.courseName);
    $("#level").val(data.level);
    $("#topic").val(data.topic);
    $("#duration").val(data.duration);
    $("#noQuestions").val(data.noQuestions);
    $("#id").val(data.id);

    $("#myModal").modal('show');
}

function deleteQuizzes() {
	var deleteRows = [];
	var table = $('#quizzesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete Quizzes')) {
		$.ajax({
			type : 'POST',
			url : '../deleteRecruiterQuizData',
			data : {
				quizeIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#quizzesDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}
