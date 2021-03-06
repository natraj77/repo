var rowsSelected = [];

$(document).ready(function () {
    var table = $('#studentDemosTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showStudentsDemo",
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
	                    { "mDataProp": "branchName" },
	                    { "mDataProp": "startDate" },
	                    { "mDataProp": "demoStatus" },
                        {
						"mDataProp" : "id"
					} ],
					"columnDefs" : [ {
						"targets" : [ 5 ],
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
    $("#studentDemosTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#studentDemosTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#studentDemosTable').DataTable().search("").draw();
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
    
    $("#studentDemosTable").on('click', 'input.editor-active', function() {
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
         var sts = false;
         if(row.data().demoStatus === 'ATTENDED DEMO'){
        	 sts=true;
         }
         enableDisableButtons(sts);
         
    });
});

function enableDisableButtons(status) {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
	} 
	if (rowsSelected.length == 1 && !status) {
		$('#editBtn').prop('disabled', false);
	}
}

function editForm() {
	var deleteRows = [];
	var table = $('#studentDemosTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to Drop Student Demos')) {
		$.ajax({
			type : 'POST',
			url : '../updateStudentDemo',
			data : {
				demoIds : deleteRows,
				status : 'DROPPED'
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons(null);
	            $('#studentDemosTable').dataTable().fnDraw();
	        }
		});
	}
}

function selectAllRows() {
	alert('hello');
	var table = $('#studentDemosTable').DataTable();
	var rows = table.rows().nodes();
    $('input[type="checkbox"]', rows).prop('checked', true);
}