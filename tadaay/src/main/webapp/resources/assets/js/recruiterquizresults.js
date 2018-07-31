var rowsSelected = [];
$(document).ready(function () {
    var table = $('#quizResultsDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showQuizzes",
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
            {"mDataProp": "studentName"},
            {"mDataProp": "quizeName"},
            {"mDataProp": "status"},
            {"mDataProp": "result"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [5],
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
    $("#quizResultsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#quizResultsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#quizResultsDataTable').DataTable().search("").draw();
                }
                return;
            });
    $("#quizResultsDataTable").on('click', 'input.editor-active', function() {
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
