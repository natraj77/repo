var rowsSelected = [];
$(document).ready(function () {
    var table = $('#studentQuizeTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showStudentQuizzes",
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

			            { "mDataProp": "courseName" },
	                    { "mDataProp": "assignedBy" },
	                    { "mDataProp": "assignedDate" },
	                    { "mDataProp": "startDate" },
	                    { "mDataProp": "endDate" },
	                    { "mDataProp": "status" },
	                    { "mDataProp": "result" },
	                    { "mDataProp": "score" },
	                    { "mDataProp": "quizIdentifier" },
                        {
						"mDataProp" : "id"
					} ],
					"columnDefs" : [ {
						"targets" : [ 10 ],
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
    $("#studentQuizeTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#branchesDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#branchesDataTable').DataTable().search("").draw();
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
    
    $("#studentQuizeTable").on('click', 'input.editor-active', function() {
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
		$('#startquize').prop('disabled', true);
	} 
	if (rowsSelected.length == 1) {
		$('#startquize').prop('disabled', false);
	}
}

function proceedForQuiz(){
	if(rowsSelected.length>1){
		alert('Please select Only one Record to Proceed');
	}else{
		var table = $('#studentQuizeTable').DataTable();
        var data = table.row(rowsSelected[0]).data();
        if(data.status=='COMPLETED'){
        	alert('The Quiz has already been taken.');
        }else{
        	window.location.href = '../assignedquizterms/'+rowsSelected[0];
        }
	}
}

