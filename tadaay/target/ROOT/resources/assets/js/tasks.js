var rowsSelected = [];
var studentIds = [];
var batchIds = [];
var taskNames = [];

//Form Validation For Branches Form
$(document).ready(function () {
	
    $('#taskDataForm').validate({
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
            saveUpdateTask();
        }
    });
    
    $("#file-task")
    .fileinput(
    		{
    			uploadUrl : "../singleUpload?uploadType=task",
    			'showPreview' : true,
    			'minFileCount' : '1',
    			'validateInitialCount' : true,
    			'allowedFileExtensions' : [
    					'jpg',
    					'png',
    					'gif',
    					'pdf' ],
    			'uploadAsync' : true,
    			'elErrorContainer' : '#errorBlock',
    			slugCallback: function (text) {
    				return String(text).replace(/[\[\]\/\{}:;#%=\*\+\?\\\^\$\|<>&\"]/g, '_');
    			},
    			uploadExtraData : function() {
    				return {
    					uploadCourseName : $("#taskName").val()
    				};
    			}
    		});
    $("#file-task").on('fileuploaded',
    		function(event, data, previewId, index) {
    	console.log(data.files[0].name);
    	console.log($("#taskName").val());
    	$("#fileName").val(data.files[0].name);
    		});
    
    $.ajax({
		type : 'GET',
		url : '../getTaskNames',
		success : function(data) {
			for(var i=0;i<data.length;i++){
				taskNames.push(data[i]);
			}
		},
		failure : function() {
			console.log('There was an error getting task names');
		}
	});
});

function saveUpdateTask() {
	alert('Saving New Task');
    $.ajax({
        type: 'POST',
        url: '../saveUpdateTask',
        data : {
        	id : $("#id").val(),
			fileName : $("#fileName").val(),
			taskDescription : $("#taskDescription").val(),
			taskName : $("#taskName").val()
			
		},
        success: function (returnData) {
            var table = $('#tasksDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#tasksDataTable').dataTable().fnDraw();
        }
    })
}

$(document).ready(function () {
    var table = $('#tasksDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showAppTasks",
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
            {
                "className": 'text-center',
                "orderable": false,
                "data": null,
                "defaultContent": '<a class="btn btn-primary previewBtn" data-toggle="modal" id="previewBtn" ><i class="fa fa-eye"></i>Preview</a>'
            },
            
            {"mDataProp": "id"}
        ],
        "columnDefs": [
            {
                "targets": [3],
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
    	        searchPlaceholder: "Search for tasks...",
    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#tasksDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#tasksDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#tasksDataTable').DataTable().search("").draw();
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
    
    $("#tasksDataTable").on('click', 'input.editor-active', function() {
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
    
    $("#tasksDataTable tbody").on('click', '.previewBtn', function() {
        var table = $('#tasksDataTable').DataTable();
    	var data = table.row($(this).closest('tr').index()).data();
    	console.log(data.id);
    	$.ajax({
    		type : 'GET',
    		url : '../getTaskContentURI?taskId=' + data.id,
    		success: function (data) {
    			console.log("file path  " + data.filePath);
    			console.log("file extension  " + data.fileExtension);
    			url = "../appContent/" + data.filePath + "/" +  data.fileName;
    			
    			 window.open(url,'Task Content','addressbar=no,directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=350');
    		}
    	});
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
		$('#studentBtn').prop('disabled', true);
		$('#batchBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#deleteBtn').prop('disabled', false);
		$('#studentBtn').prop('disabled', false);
		$('#batchBtn').prop('disabled', false);
	} 
}

function closeModal() {
    $("#myModal").modal('hide');
}

function assignTasksToStudents() {
    var $form = $("#sudenttaskForm");
    var data = JSON.stringify(getFormData($form));
    var taskIds = [];
	var table = $('#tasksDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		taskIds.push(data.id);
	}
	console.log(studentIds);
	console.log(taskIds);
    $.ajax({
        type: 'POST',
        url: '../assignTaskToStudents',
		data : {
			studentIds : studentIds,
			taskIds : taskIds
		},
		dataType : 'json',
		mimeType : 'application/json',
        success: function (returnData) {
        	alert('Successfully assigned tasks to students');
       }
    })
    
    $("#assignstudent").modal('hide');

}

function assignTasksToBatches() {
    var $form = $("#batchtaskForm");
    var data = JSON.stringify(getFormData($form));
    var taskIds = [];
	var table = $('#tasksDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		taskIds.push(data.id);
	}
	console.log(batchIds);
	console.log(taskIds);
	$.ajax({
        type : 'POST',
        url : '../assignTasksToBatches',
		data : {
			batchIds : batchIds,
			taskIds : taskIds
		},
        success: function(data) {
        	alert('Successfully assigned tasks to batches');
       }, 
       failure: function (returnData) {
    	   console.log('call unsuccessful');
       }
    });

    $("#assignbatch").modal('hide');

}

function addNewTask() {
    $("#name").val("");
    $("#preview").val("");
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
	var table = $('#tasksDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	

    $("#name").val(data.name);
    $("#id").val(data.id);

    $("#myModal").modal('show');
}

function deleteTasks() {
	var deleteRows = [];
	var table = $('#tasksDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete Task')) {
		$.ajax({
			type : 'POST',
			url : '../deleteTaskData',
			data : {
				taskIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#tasksDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}

function selectAllRows() {
	
}

function buildStudentList() {
	var htm = '';
	$("#studentList").append(htm);
	$.ajax({
		type : 'GET',
		url : '../getStudentListAndId',
		success : function(data) {
			$.each(data, function(index, value) {
				htm += '<option value=' + index + '>' + value + '</option>';
			});
			$('#studentList').append(htm);
			$('#studentList').multiselect('rebuild');
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
}

function buildBatchList() {
	var htm = '';
	$("#batchList").append(htm);
	$.ajax({
		type : 'GET',
		url : '../getBatchListAndId',
		success : function(data) {
			$.each(data, function(index, value) {
				htm += '<option value=' + index + '>' + value + '</option>';
			});
			$('#batchList').append(htm);
			$('#batchList').multiselect('rebuild');
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});	
}

function validateTaskName(selected){
	if(taskNames.indexOf(selected.value) > -1){
		alert('Task already available, Please create new task');
		$(taskName).css('border', '1px solid red'); 
	}
}

$(document).ready(function() {
    $('#studentList').multiselect({ 
      includeSelectAllOption: true,
      nonSelectedText:'Select Student',
        enableFiltering:true, 
        onChange: function() {
            var selected = this.$select.val();
            console.log('selected : ' + selected);
            if ($('#studentList option:selected').text() != null || $('#studentList option:selected').text() != '') {
            	console.log($('#studentList option:selected').text());
            	//studentIds.push(selected);
            	studentIds = selected;
            }
        }
        
        
  });
   $('#batchList').multiselect({ 
        includeSelectAllOption: true,
        nonSelectedText:'Select Batch',
          enableFiltering:true,
          onChange: function() {
              var selected = this.$select.val();
              console.log('selected : ' + selected);
              if ($('#batchList option:selected').text() != null || $('#batchList option:selected').text() != '') {
            	  console.log($('#batchList option:selected').text());
            	  //batchIds.push(selected);
            	  batchIds = selected;
              }
          }
          
    });
});


