var rowsSelected = [];


//Form Validation For Branches Form
$(document).ready(function () {
	
    $('#emailTemplateDataForm').validate({
        rules: {
        	templateName: {
                required: true
            },
            file: {
                required: true
            },
        	isActive: {
                required: true
            }
        },
        messages: {
        	templateName: {
                required: "Name is required"
            },
            file: {
                required: true
            },
            isActive: {
                required: "file is required"
            }
        },
        submitHandler: function () {
            saveUpdateemailTemplate();
        }
    });
    $("#emailtemplate")
    .fileinput(
    		{
    			uploadUrl : "../singleUpload?uploadType=template",
    			'showPreview' : true,
    			'minFileCount' : '1',
    			'validateInitialCount' : true,
    			'allowedFileExtensions' : [
    					'htm',
    					'html'],
    			'uploadAsync' : true,
    			'elErrorContainer' : '#errorBlock',
    			uploadExtraData : function() {
    				return {
    					uploadCourseName : $("#templateName").val()
    				};
    			}
    		});
    $("#emailtemplate").on('fileuploaded',
    		function(event, data, previewId, index) {
    	console.log(data.files[0].name);
    	console.log($("#templateName").val());
	        $.ajax({
	            type: 'POST',
	            url: '../saveUpdateEmailTemplateData?id=' + $('#id').val(),
	            data : {
					fileName : data.files[0].name,
					templateName : $("#templateName").val(),
					isActive : $("#isActive").val()
					
				},
	            success: function (returnData) {
	                var table = $('#emailTemplatesDataTable').DataTable();
	                var row_index = table.row(this).index();
	                var current_row = table.row(this);
	                $('#emailTemplatesDataTable').dataTable().fnDraw();
	            }
	        })
    		});
    $("#emailtemplate").on('fileuploaded',
    		function(event, data, previewId, index) {
    		$("#myModal").modal("hide");
    		});

});

$(document).ready(function () {
    var table = $('#emailTemplatesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showEmailTemplates",
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
            {"mDataProp": "templateName"},
            {"mDataProp": "fileName"},
            {"mDataProp": "isActive"},
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [4],
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
    $("#emailtemplatesDataTable_filter input")
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
    
    $("#emailTemplatesDataTable").on('click', 'input.editor-active', function() {
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
function saveUpdateemailTemplate() {
    alert('Saving a new Email Template');

    var $form = $("#emailTemplateDataForm");
    var data = JSON.stringify(getFormData($form));
    $.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: '../saveUpdateemailTemplateData?id=' + $('#id').val(),
        dataType: 'json',
        mimeType: 'application/json',
        data: data,
        success: function (returnData) {
            var table = $('#emailTemplatesDataTable').DataTable();
            var table = $('#emailTemplatesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#emailTemplatesDataTable').dataTable().fnDraw();
        }
    })
    
    
    $("#myModal").modal('hide');
}


function addNewTemplate() {
    $("#emailtemplate").val("");

    $("#id").val("");

    $("#myModal").modal('show');
}

function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['templateName']] = n['value'];
    });

    return indexed_array;
}

function editTemplateForm() {
	//For editing, always get first element from array.
	var table = $('#emailTemplatesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	//console.log(data);

    $("#templateName").val(data.templateName);
    $("#fileName").val(data.fileName);
    $("#isActive").val(data.isActive);

    $("#id").val(data.id);

    $("#myModal").modal('show');
}

function deleteTemplate() {
	var deleteRows = [];
	var table = $('#emailTemplatesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete Email Template')) {
		$.ajax({
			type : 'POST',
			url : '../deleteTemplateData',
			data : {
				ids : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#emailTemplatesDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}

function selectAllRows() {
	
}