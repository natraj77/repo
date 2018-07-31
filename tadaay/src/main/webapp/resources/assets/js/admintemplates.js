var rowsSelected = [];

/**
 * A call to retrieve Courses list
 */
//Form Validation For Courses Form
$(document).ready(function () {
	
$('#adminCourseDataForm').validate({
	rules: {
		isActive: {
            required: true
        },
        templateType: {
            required: true
        },
        templateName: {
            required: true
        },
        templateContent: {
            required: true
        }
    },
    messages: {
    	isActive: {
            required: "Active is required"
        },
        templateType: {
            required: "Template Type is required"
        },
        templateName: {
            required: "Template Name is required"
        },
        templateContent: {
            required: "Tempalte Content is required"
        }
    },
   submitHandler: function () {
        saveUpdateAdminCourse();
    }    
});
});
$(document).ready(function () {
    var table = $('#adminCoursesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../admin/getAdminTemplateData",
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
            {"mDataProp": "templateType"},
            {"mDataProp": "templateName"},
            {"mDataProp": "isActive"},
            {
                render: function ( data, type, row ) {
                	return '<input type="button" class="editor-active" value="Preview">';
                },
                className: "dt-body-center"
            },
            {"mDataProp": "templateContent"}
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
	    	        searchPlaceholder: "Search for Templates...",
	    	        sProcessing: "<img src='../resources/images/datapreloader.gif'>"
	    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });
    
 
	$("#adminCoursesDataTable_filter input").unbind()
	.bind(
			"input",
			function(e) { // Bind our desired behavior
				// If the length is 3 or more characters, or the
				// user pressed ENTER, search
				if (this.value.length >= 3 || e.keyCode == 13) {
					// Call the API search function
					$('#adminCoursesDataTable').DataTable().search(
							this.value).draw();
				}
				// Ensure we clear the search if they backspace
				// far enough
				if (this.value == "") {
					$('#adminCoursesDataTable').DataTable().search(
							"").draw();
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
			
			$("#adminCoursesDataTable").on('click', 'input.editor-active', function() {
			var tr = $(this).closest('tr');
			var rowId = tr.index();
			if($(this).prop( 'value' )!='Preview'){
			var row = table.row(tr);
			//alert($(this).prop( 'value' ));
			var $this = $(this);
			var isChecked = $(this).prop( 'checked' );
			//console.log('selected row Id : ' + rowId);
			if (isChecked) {
			rowsSelected.push(rowId); 
			} else {
			var index = rowsSelected.indexOf(rowId);
			rowsSelected.splice(index, 1);
			}
			enableDisableButtons();
			enableDisablecontent();
			}else{
				testMe(rowId);
			}
			});
});
function testMe(obj){
	var table = $('#adminCoursesDataTable').DataTable();
	var data = table.row(obj).data();
	//alert(data.templateContent);
	$("#templateData").html(data.templateContent);
	$("#myModalContent").modal('show');
}
function enableDisablecontent() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$("#panelContent").hide();
	}
	if (rowsSelected.length == 1) {
		$("#panelContent").show();
	} 
	var table = $('#adminCoursesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#isActive1").text(data.isActive);
	$("#templateType1").text(data.templateType);
	$("#templateName1").text(data.templateName);
	$("#id").val(data.templateId);
	
}

function enableDisableButtons() {
	//console.log(rowsSelected);
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
	function saveUpdateAdminCourse() {
	    if($('#id').val()!=''){
	    	alert('Editing Template '+$('#id').val());
	    }else{
	    	alert('Saving a new Template');
	    }
		
	    var $form = $("#adminCourseDataForm");
	    var data = JSON.stringify(getFormData($form));
	    $.ajax({
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        type: 'POST',
	        url: '../saveUpdateTemplateData?id=' + $('#id').val(),
	        dataType: 'json',
	        mimeType: 'application/json',
	        data: data,
	        success: function (returnData) {
	            var table = $('#adminCoursesDataTable').DataTable();
	            var row_index = table.row(this).index();
	            var current_row = table.row(this);
	            $('#adminCoursesDataTable').dataTable().fnDraw();
	        }
	    })
	    $("#myModal").modal('hide');
	}
	
	function getFormData($form) {
	    var unindexed_array = $form.serializeArray();
	    var indexed_array = {};

	    $.map(unindexed_array, function (n, i) {
	        indexed_array[n['name']] = n['value'];
	    });
	    return indexed_array;
	}
	
	function addNewCourse() {
		$("h4.modal-title").text("Add Template");
		$("#isActive").val("");
		$("#templateType").val("");
		$("#templateName").val("");
		$("#templateContent").val("");
		$("#id").val("");
	    $("#myModal").modal('show');
	}
	
	function editCourse() {
		//For editing, always get first element from array.
		$("h4.modal-title").text("Edit Template");
		var table = $('#adminCoursesDataTable').DataTable();
		var data = table.row(rowsSelected[0]).data();
		$("#isActive").val(data.isActive);
		$("#templateType").val(data.templateType);
		$("#templateName").val(data.templateName);
		$("#templateContent").val(data.templateContent);
		$("#id").val(data.templateId);
		$("#myModal").modal("show");
	}
	
	function selectItems(stringFromDB) {
        'use strict';

        var select = document.getElementById("relatedCourses"),
            stringArray = stringFromDB.split(","),
            count = 0,
            i;

        for(count = 0; count < stringArray.length; count += 1) {
            for(i = 0; i < select.options.length; i += 1) {
                if(select.options[i].value === stringArray[count]) {
                	$(":checkbox[value="+select.options[i].value+"]").prop("checked","true");
                }
            }
        }
    }

	
	function deleteCourses() {
		var deleteRows = [];
		var table = $('#adminCoursesDataTable').DataTable();
		for (i = 0; i < rowsSelected.length; i++) {
			var data = table.row(rowsSelected[i]).data();
			deleteRows.push(data.templateId);
		}
		if (confirm('confirm to delete Event')) {
			$.ajax({
				type : 'POST',
				url : '../deleteAdminTemplatesData',
				data : {
					templateIds : deleteRows
				},
				success: function (data) {
					rowsSelected.length = 0;
					enableDisableButtons();
					$("#panelContent").hide();
		            $('#adminCoursesDataTable').dataTable().fnDraw();
		        }
			});
			$("#myModal").modal('hide');
		}

	}
	function selectAllRows() {
		var table = $('#adminCoursesDataTable').DataTable();
		var rows = table.rows().nodes();
	    $('input[type="checkbox"]', rows).prop('checked', true);
	}	
	
	