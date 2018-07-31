var rowsSelected = [];

/**
 * A call to retrieve Courses list
 */
$(document).ready(function () {
    var table = $('#adminCoursesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../admin/getStudentTaskData",
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
            {"mDataProp": "taskName"},
            {"mDataProp": "assignedBy"},
            {"mDataProp": "assignedDate"},
            {"mDataProp": "startDate"},
            {"mDataProp": "endDate"},
            {"mDataProp": "taskStatus"},
            {"mDataProp": "result"},
            {
            	"className": 'text-center',
                "data": null,
                "defaultContent": '<a class="btn btn-primary taskPreviewBtn" data-toggle="modal" id="previewBtn" ><i class="fa fa-eye"></i></a>'
            },
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [9],
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
	    	        searchPlaceholder: "Search for Tasks...",
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
			});
			
			$('#myModal').on('shown.bs.modal', function (e) {
			var invoker = $(e.relatedTarget);
			if (invoker[0] && invoker[0].className === 'btn btn-primary') {
			$("#id").val("");
			}
			});
			
			$("#adminCoursesDataTable").on('click', 'input.editor-active', function() {
			var tr = $(this).closest('tr');
			var rowId = tr.index();
			if($(this).prop( 'value' )!='Preview'){
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
			var table = $('#adminCoursesDataTable').DataTable();
			var data = table.row(rowId).data();
			if(data.taskStatus.toUpperCase() === 'COMPLETED'){
				$('#editBtn').prop('disabled', true);
			}
			}else{
				testMe(rowId);
			}
			});
						
			 $("#adminCoursesDataTable tbody").on('click', '.taskPreviewBtn', function() {
			        var table = $('#adminCoursesDataTable').DataTable();
			    	var dataSet = table.row($(this).closest('tr').index()).data();
			    	console.log(dataSet.taskStatus);
			    	if("COMPLETED" !== dataSet.taskStatus){
			    		$.ajax({
				    		type : 'GET',
				    		url : '../getTaskContentURI?taskId=' + dataSet.taskId,
				    		success: function (data) {
				    			console.log("file path  " + data.filePath);
				    			console.log("file extension  " + data.fileExtension);
				    			url = "../appContent/" + data.filePath + "/" +  data.fileName;
				    			$("#courseFrameContent").prop('src',url);
				    			$("#myModalContent").modal('show');
				    		    $.ajax({
						    		type : 'POST',
						    		url : '../updateStartDateForTask?taskId='+dataSet.id,
						    		success: function (data) {
						    			console.log("Success  " + data.status);
						    			rowsSelected.length = 0;
							            $('#adminCoursesDataTable').dataTable().fnDraw();
						    		}
						    	});
				    			
				    			
				    		}
				    	});
			    	}else{
			    		alert('Task Aready Completed, Please Select Appropriate Task');
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

function completeTasks() {
	var deleteRows = [];
	var table = $('#adminCoursesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to Update Tasks')) {
		$.ajax({
			type : 'POST',
			url : '../completeTaskAction',
			data : {
				taskIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
	            $('#adminCoursesDataTable').dataTable().fnDraw();
	        }
		});
	}
}

function selectAllRows() {
	var table = $('#adminCoursesDataTable').DataTable();
	var rows = table.rows().nodes();
    $('input[type="checkbox"]', rows).prop('checked', true);
}