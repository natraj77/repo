var rowsSelected = [];
//Form Validation For Faculty Form
$(document).ready(function () {
    $('#facultyForm').validate({
        rules: {
            courseName: {
                required: true
            },
            modeDesc: {
                required: true
            }
        },
        messages: {
            courseName: {
                required: "Course is required"
            },
            modeDesc: {
                required: "Mode is required"
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
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "aoColumns" : [
					    {
			                render: function ( data, type, row ) {
			                    return '<input type="checkbox" class="editor-active">';
			                },
			                className: "dt-body-center"
			            },

					{"mDataProp" : "fName"},
					{"mDataProp" : "lName"},
					{
                      "className" : 'text-center',
						"mDataProp" : "mobile"
					}, {
                      "className" : 'text-center',
						"mDataProp" : "emailId"
					}, {
                      "className" : 'text-center',
						"mDataProp" : "courseName"
					},{
				        "className" : 'text-center',
							"mDataProp" : "mode"
						},{
						"mDataProp" : "id"
					},{
						"mDataProp" : "facultId"
					}  ],
					"columnDefs" : [ {
						"targets" : [ 8,7 ],
						"visible" : false,
						"searchable" : false
					}, ],
					'select': {
			 		      'style': 'multi'
			 		   },
			 		  "language": {
			    		  "sSearch":'<i class="fa fa-search" aria-hidden="true"></i>',
			    	        searchPlaceholder: "Search for Faculty...",
			    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
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
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
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
function newFacultyData() {
    alert('Saving a new Faculty');

    var $form = $("#facultyForm");
    var facultyObj = JSON.stringify(getFormData($form));
    $.ajax({
        type: 'POST',
        url: '../saveUpdateFacultyData?id=' + $('#id').val(),
        mimeType: 'application/json',
        data:{data : facultyObj},
        success: function (returnData) {
            var table = $('#facultyDataTable').DataTable();
            var table = $('#facultyDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
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
    indexed_array['courseId'] = $('#courseName').val();
    indexed_array['mode'] = $('#modeDesc').val();
    return indexed_array;
}
var courseList = [];
var facultyData = '';

$(document).ready(function () {
    $.ajax({
		type : 'GET',
		url : '../getCourseListAndId',
		success : function(data) {
			$.each(data, function (index, value) {
                $('#courseName').append($("<option></option>").attr("value", index).text(value));
            });
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
    
    $("#searchLead").keyup(function(){
		if($(this).val().length>=2){
			if(facultyData == ''){
				$.ajax({
					type : 'POST',
					url : '../getFacultyListForPartner',
					data:'searchText='+$(this).val(),
					success : function(data) {
						facultyData = data.faculty;
					}
				});
			}
			filterData(facultyData,$("#searchLead").val().toUpperCase());
		}else{
			$("#lead-suggestion").hide();
		}
	});
});
var selectedUser = '';
function filterData(collectionData,containsStr){
	$("#lead-suggestion").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].emailId.toUpperCase().indexOf(containsStr)>=0){
			htmlTxt = htmlTxt + '<li onClick="selectFaculty(this,\''+collectionData[k].fName+'\',\''+collectionData[k].lName+'\',\''+collectionData[k].mobile+'\',\''+collectionData[k].emailId+'\',\''+collectionData[k].facultId+'\');" value="'+collectionData[k].id+'">'+collectionData[k].emailId+'</li>';
	    }
	}
	$("#lead-suggestion").html('<ul id="country-list">'+htmlTxt+'</ul>');
	$("#searchLead").css("background","#FFF");
}

function selectFaculty(val, fName, lName, mobile, emailId, facultId) {
	selectedUser = val.value;
	$("#facultId").val(facultId);
	$("#fName").val(fName);
	$("#lName").val(lName);
	$("#mobile").val(mobile);
	$("#emailId").val(emailId);
	$("#lead-suggestion").hide();
}

function checkSelectedUser(){
	if(selectedUser==''){
		alert('No Facuty Found at this time. please select from list of options from Search result.');
	}
}

function addNewFaculty() {
	$("#myModalLabel").text('Add Faculty')
	$("#search-input *").prop('disabled', false);
    $("#name").val("");
    $("#courseName").val("");
    $("#mobile").val("");
    $("#emailId").val("");
    $("#modeDesc").val("");
    $("#id").val("");

    $("#myModal").modal('show');
}
function editFaculty() {
	$("#myModalLabel").text('Edit Faculty')
	$("#search-input *").prop('disabled', true);
	//For editing, always get first element from array.
	var table = $('#facultyDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
    $("#fName").val(data.fName);
    $("#lName").val(data.lName);
    
    $('#courseName option[value='+data.courseId+']').prop('selected', true);
    $("#mobile").val(data.mobile);
    $("#emailId").val(data.emailId);
    $("#modeDesc").val(data.mode);
    $("#id").val(data.id);
    $("#facultId").val(data.facultId);
    $("input[name=isPrivate][value='"
			+ data.isPrivate
			+ "']").prop('checked',
	'checked');
    $("#myModal").modal('show');

}
function deleteFaculty() {
	var deleteRows = [];
	var table = $('#facultyDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete Faculty')) {
		$.ajax({
			type : 'POST',
			 url: '../deleteFacultyData',
			data : {
				facultyIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#facultyDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}
		