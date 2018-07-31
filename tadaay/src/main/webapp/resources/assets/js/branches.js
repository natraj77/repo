var rowsSelected = [];

$.validator.addMethod("commachars", function (value) {
    return ! (/(,)/.test(value)) // does not contain 3 consecutive identical chars
}, "The address must not comma");
//Form Validation For Branches Form
$(document).ready(function () {
	
    $('#branchDataForm').validate({
        rules: {
            name: {
                required: true
            },
            addressLine1: {
                required: true,
                commachars: true
            },
            addressLine2: {
                required: true,
                commachars: true
            },
            location: {
                required: true,
                commachars: true
            },
            city: {
                required: true
            },
            state: {
                required: true
            },
            pinCode: {
                required: true,
                minlength:6,
                maxlength:6,
                number: true
            },
            contactName: {
                required: true
            },
            mobile: {
                required: true,
                minlength:10,
                maxlength:10,
                number: true
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            name: {
                required: "Name is required"
            },
            addressLine1: {
                required: "Flat is required"
            },
            addressLine2: {
                required: "Apartment is required"
            },
            location: {
                required: "Area is required"
            },
            city: {
                required: "City is required"
            },
            state: {
                required: "State is required"
            },
            pinCode: {
                required: "Pin Code is required",
                number: "Please Enter Number only"
            },
            contactName: {
                required: "Contact Name is required"
            },
            mobile: {
                required: "Mobile is required",
                number: "Please Enter Number only"
            },
            email: {
                required: "Email is required",
                email: "Please enter a valid email"
            }
        },
        submitHandler: function () {
            saveUpdateBranch();
        }
    });
});

$(document).ready(function () {
    var table = $('#branchesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../showBranches",
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
            {"mDataProp": "name"},
            {"mDataProp": "address"},
            {"mDataProp": "contact"},
            {"mDataProp": "city"},
            {"mDataProp": "id"}
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
    	        searchPlaceholder: "Search for Branches...",
    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#branchesDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 3 || e.keyCode == 13) {
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
    
    $("#branchesDataTable").on('click', 'input.editor-active', function() {
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
function saveUpdateBranch() {
    alert('Saving a new branch');

    var $form = $("#branchDataForm");
    var data = JSON.stringify(getFormData($form));
    $.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: '../saveUpdateBranchData?id=' + $('#id').val(),
        dataType: 'json',
        mimeType: 'application/json',
        data: data,
        success: function (returnData) {
            var table = $('#branchesDataTable').DataTable();
            var table = $('#branchesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#branchesDataTable').dataTable().fnDraw();
        }
    })
    
    
    $("#myModal").modal('hide');
}


function addNewBranch() {
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
	$("#myModalLabel").text('Edit Branch')
	//For editing, always get first element from array.
	var table = $('#branchesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	//console.log(data);

    $("#name").val(data.name);
    //alert(data.name);
    $("#addressLine1").val(data.addressLine1);
    $("#addressLine2").val(data.addressLine2);
    $("#location").val(data.location);
    $("#city option:contains(" + data.city + ")").prop('selected', true);
    $("#state").val(data.state);
    $("#pinCode").val(data.pinCode);

    $("#contactName").val(data.contactName);
    $("#mobile").val(data.mobile);
    $("#email").val(data.email);

    $("#id").val(data.id);
    $("#myModal").modal('show');
}

function deleteBranches() {
	var deleteRows = [];
	var table = $('#branchesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.id);
	}
	if (confirm('confirm to delete branches')) {
		$.ajax({
			type : 'POST',
			url : '../deleteBranchData',
			data : {
				branchIds : deleteRows
			},
			success: function (data) {
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#branchesDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}

function selectAllRows() {
	
}
$(document).ready(function () {
		
	$.ajax({
		headers : {
			'Content-Type' : 'application/json'
		},
		type : 'GET',
		url : '../getCities',
		dataType : 'json',
		mimeType : 'application/json',
		success : function(datas) {
		console.log(datas);
		  for (i in datas)
			{
			    var option = new Option(datas[i], i);
	            $('#city').append($(option));
			}
		}
	});
});