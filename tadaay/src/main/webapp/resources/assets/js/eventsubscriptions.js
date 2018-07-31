
$(document).ready(function () {
    var table = $('#quizQuestionsTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
      /*  "sAjaxSource": "../getQuizList",*/
        "ajax": "../static/eventsubscriptions.json",
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
            {"mDataProp": "firstName"},
            {"mDataProp": "lastName"},
            {"mDataProp": "mobile"},
            {"mDataProp": "email"},
            {"mDataProp": "eventName"},
            {"mDataProp": "status"},
            {"mDataProp": "Id"}
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
    $("#quizQuestionsTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#quizQuestionsTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#quizQuestionsTable').DataTable().search("").draw();
                }
                return;
            });
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
        $('#createBtn').prop('disabled', true);
    })
   
    $("#quizQuestionsTable").on('click', 'input.editor-active', function() {
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
		
		});
    $("#quizQuestionsTable tbody").on('click', '.previewBtn', function() {
        var table = $('#quizQuestionsTable').DataTable();
    	var data = table.row($(this).closest('tr').index()).data();
    	 $("#previewQuestion").modal('show');
    	
    });
});

