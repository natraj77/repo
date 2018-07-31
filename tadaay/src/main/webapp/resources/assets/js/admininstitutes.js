var rowsSelected = [];
$(document).ready(function () {
    var table = $('#adminInsituteDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showAdminInstitute",
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
            {"mDataProp": "instName"},
            {"mDataProp": "mobile"},
            {"mDataProp": "email"},
            {"mDataProp": "status"},
            {"mDataProp": "joineddate"},
            {"mDataProp": "lastLogin"},
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
	    	        searchPlaceholder: "Search for Institutes..."
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#adminInsituteDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#adminInsituteDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#adminInsituteDataTable').DataTable().search("").draw();
                }
                return;
            });
    		
		$("#adminInsituteDataTable").on('click', 'input.editor-active', function() {
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
		enableDisablecontent();
		
		});
});
function enableDisableButtons() {
	if (rowsSelected.length == 0) {
		$('#sendemailBtn').prop('disabled', true);
		$('#sendsmsBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#sendemailBtn').prop('disabled', false);
		$('#sendsmsBtn').prop('disabled', false);
	} 
	
}
