var rowsSelected = [];
//Form Validation For Faculty Form
$(document).ready(function () {
    $('#rulesForm').validate({
        rules: {
        	rulename: {
                required: true
            },
            action: {
                required: true,
            },
            template: {
                required: true,
            }
        },
        messages: {
        	rulename: {
                required: "Rule Name is required"
            },
            action: {
                required: "Action is required",
            },
            template: {
                required: "Template is required",
            }
        },
        submitHandler: function () {
            newFacultyData();
        }
    });
});

/**
 *	A call to retrieve Companies list
 */
var editor; // use a global for the submit and return data rendering in the examples
var dataSet = '';
$(document).ready(function () {
    var table = $('#facultyDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../getFacultyList",
        "sPaginationType": "full_numbers",
        "bJQueryUI": true,
        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
        "aoColumns" : [
					    {
			                render: function ( data, type, row ) {
			                    return '<input type="checkbox" class="editor-active">';
			                },
			                className: "dt-body-center"
			            },

					{"mDataProp" : "name"}, 
					{
                      "className" : 'text-center',
						"mDataProp" : "mobile"
					}, {
                      "className" : 'text-center',
						"mDataProp" : "emailId"
					}, {
                      "className" : 'text-center',
						"mDataProp" : "courseDesc"
					},{
				        "className" : 'text-center',
							"mDataProp" : "mode"
						},{
						"mDataProp" : "id"
					} ],
					"columnDefs" : [ {
						"targets" : [ 6 ],
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
    $("#facultyDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#facultyDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#facultyDataTable').DataTable().search("").draw();
                }
                return;
            });
    /*$("#facultyDataTable").on('click', 'td.details-control', function () {
     var tr = $(this).closest('tr');
     var row = table.row( tr );
     
     if ( row.child.isShown() ) {
     // This row is already open - close it
     row.child.hide();
     tr.removeClass('shown');
     }
     else {
     // Open this row
     row.child( format(row.data()) ).show();
     tr.addClass('shown');
     $("#uploadContent_" + row.data().id).fileinput({
     'showPreview' : false,
     'minFileCount' : '1',
     'validateInitialCount' : true,
     'allowedFileExtensions' : [ 'jpg', 'png', 'gif', 'pdf' ],
     'uploadAsync' : true,
     'elErrorContainer' : '#errorBlock'
     });
     $("#uploadVideos_" + row.data().id).fileinput({
     'showPreview' : false,
     'minFileCount' : '1',
     'validateInitialCount' : true,
     'allowedFileExtensions' : [ 'wmv', 'mpeg' ],
     'uploadAsync' : true,
     'elErrorContainer' : '#errorBlock'
     });
     }
     } );*/
    $("#facultyDataTable").on('click', 'a.editor_edit', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        $("#name").val(row.data().name);
        $("#courseList").val(row.data().courseId);
        $("#mobile").val(row.data().mobile);
        $("#emailId").val(row.data().emailId);
        $("#modeList").val(row.data().mode);
        $("#id").val(row.data().id);
        $("#myModal").modal('show');

    }
    );
    $("#facultyDataTable").on(
            'click',
            'a.editor_delete',
            function () {
                if (confirm('confirm to delete course')) {
                    var $form = $("#domainDataForm");
                    var data = JSON.stringify(getFormData($form));
                    $.ajax({
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        type: 'POST',
                        url: '../deleteFacultyData',
                        data: data,
                        dataType: 'json',
                        mimeType: 'application/json',
                        success: function (data) {
                            alert('Course Deleted successfully');
                            $('#facultyDataTable').dataTable().fnDraw();
                        }

                    });
                    $("#myModal").modal('hide');
                }
            });
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    })
    $('#myModal').on('shown.bs.modal', function (e) {
        var invoker = $(e.relatedTarget);
        if (invoker[0] && invoker[0].className === 'btn btn-primary') {
            $("#id").val("");
        }
    })
    $("#facultyDataTable").on('click', 'input.editor-active', function() {
      	 var tr = $(this).closest('tr');
           var row = table.row(tr);
           
           var $this = $(this);
           var isChecked = $(this).prop( 'checked' );
           
           //alert(isChecked);
      	 var rowId = row.data().id - 1; //Rows indexes start from 0, but row id starts at 1. So subtract 1.
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


/* Formatting function for row details - modify as you need */
function format(d) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
            '<div class="row"><div class="col-md-6"><div class="form-group"><label for="name">Upload Content<span class="required"></span></label></div></div><div class="col-md-6"><div class="form-group"><input type="file" class="form-control btn btn-custom" id="uploadContent_' + d.id + '" name="file" data-upload-url="../singleUpload?uploadType=Content&courseId=' + d.id + '" multiple /><div id="errorBlock" class="help-block"></div></div></div></div>' +
            '<div class="row"><div class="col-md-6"><div class="form-group"><label for="name">Upload Videos<span class="required"></span></label></div></div><div class="col-md-6"><div class="form-group"><input type="file" class="form-control btn btn-custom" id="uploadVideos_' + d.id + '" name="file" data-upload-url="../singleUpload?uploadType=Videos&courseId=' + d.id + '" multiple /><div id="errorBlock" class="help-block"></div></div></div></div>' +
            '</table>';
}

function newFacultyData() {
    var $form = $("#facultyForm");
    var data = JSON.stringify(getFormData($form));
    if (getFormData($form).name == '') {
        alert('Please enter name');
        return;
    }
    if (getFormData($form).mobile == '') {
        alert('Please enter mobile');
        return;
    }
    if (getFormData($form).emailId == '') {
        alert('Please enter emailId');
        return;
    }

    $.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: '../saveUpdateFacultyData',
        dataType: 'json',
        mimeType: 'application/json',
        data: data,
        success: function (returnData) {
            $('#facultyDataTable').dataTable().fnDraw();
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
    indexed_array['courseId'] = $('#courseList').val();
    indexed_array['mode'] = $('#modeList').val();
    return indexed_array;
}
var courseList = {};

$(document).ready(function () {
    $.ajax({
        type: 'GET',
        url: '../getCourseListAndId',
        success: function (data) {
            $.each(data, function (index, value) {
                $('#courseList').append($("<option></option>").attr("value", index).text(value));
            });
        },
        failure: function () {
            console.log('There was an error getting course list');
        }

    });
});

function editFaculty() {
	//For editing, always get first element from array.
	var table = $('#facultyDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
    $("#name").val(data.name);
    $("#courseList").val(data.courseId);
    $("#mobile").val(data.mobile);
    $("#emailId").val(data.emailId);
    $("#modeList").val(data.mode);
    $("#id").val(data.id);
    $("#myModal").modal('show');

}

		