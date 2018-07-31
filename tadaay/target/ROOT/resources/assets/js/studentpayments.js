var rowsSelected = [];

$(document).ready(function () {
    var table = $('#studentPaymentsTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showStudentPayments",
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

			            { "mDataProp": "totalFee" },
	                    { "mDataProp": "optedDiscount" },
	                    { "mDataProp": "feePaid" },
	                    { "mDataProp": "feePending" },
	                    { "mDataProp": "mode" },
	                    { "mDataProp": "transactionRef" },
                        {
						"mDataProp" : "id"
					} ],
					"columnDefs" : [ {
						"targets" : [ 7 ],
						"visible" : false,
						"searchable" : false
					}, ],
					'select': {
			 		      'style': 'multi'
			 		   },
			        "language": {
				    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
				    	        searchPlaceholder: "Search for Something..."
				    	},
					"initComplete" : function(settings, json) {
						$('#loadingSpinner').hide();
					}
				});

    // Grab the datatables input box and alter how it is bound to events
    $("#studentPaymentsTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#studentPaymentsTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#studentPaymentsTable').DataTable().search("").draw();
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
    
    $("#studentPaymentsTable").on('click', 'input.editor-active', function() {
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
