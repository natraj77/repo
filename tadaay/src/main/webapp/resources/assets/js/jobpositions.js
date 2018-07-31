var rowsSelected = [];
var leadsSelected = [];
var branches;
var courses;
var faculty;
var batches;
var selectedLead = '';
var courseArray = [];
//Form Validation For Lead Form
var courseContentObj = '';
var courseContentArray = [];
var emailSelected = [];

var collectionData = '';
$(document).ready(function() {
	$("#searchApplicant").keyup(function(){
		selectedLead = '';
		if($(this).val().length>=2){
			if(collectionData==''){
				$.ajax({
				type: "POST",
				url: "../getStudentListForPartner",
				data:'searchText='+$(this).val(),
				beforeSend: function(){
					$("#searchApplicant").css("background","#FFF  no-repeat 165px");
				},
				success: function(data){
					collectionData = data.leadsObj;
				}
				
				});
			}
			filterData(collectionData,$("#searchApplicant").val().toUpperCase());
		}else{
			$("#applicant-suggestion").hide();
		}		
	});
});
var selectedUser = '';
function filterData(collectionData,containsStr){
	$("#applicant-suggestion").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].email.toUpperCase().indexOf(containsStr)>=0){
			htmlTxt = htmlTxt + '<li onClick="selectLead(this,\''+collectionData[k].firstName+'\',\''+collectionData[k].lastName+'\',\''
			+collectionData[k].mobile+'\',\''+collectionData[k].email+'\',\''+collectionData[k].userId+'\');" value="'+collectionData[k].id+'">'+collectionData[k].email+'</li>';
	    }
	}
	$("#applicant-suggestion").html('<ul id="country-list">'+htmlTxt+'</ul>');
	$("#searchApplicant").css("background","#FFF");
}
function selectLead(val, fName, lName, mobile, emailId, userId) {
	selectedUser = val.value;
	$("#firstName").val(fName);
	$("#lastName").val(lName);
	$("#mobile").val(mobile);
	$("#email").val(emailId);
	$("#userId").val(userId);
	$("#applicant-suggestion").hide();
}
$(document).ready(function () {
    var table = $('#jobPositionsDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
      /*  "sAjaxSource": "../getQuizList",*/
        "ajax": "../static/jobpositions.json",
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
            {"mDataProp": "jobId"},
            {"mDataProp": "jobTitle"},
            {"mDataProp": "noPositions"},
            {"mDataProp": "createdDate"},
            {"mDataProp": "closedDate"},
            {"mDataProp": "active"},
            {"mDataProp": "jobType"},
            {"mDataProp": "Id"}
        ],
        "columnDefs": [
            {
                "targets": [8],
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
    $("#jobPositionsDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#jobPositionsDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#jobPositionsDataTable').DataTable().search("").draw();
                }
                return;
            });
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
        $('#activateBtn').prop('disabled', true);
        $('#deactivateBtn').prop('disabled', true);
        $('#applicantsBtn').prop('disabled', true);
    })
   
    $("#jobPositionsDataTable").on('click', 'input.editor-active', function() {
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
		
		enableDisableButtons()
		
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
		$('#activateBtn').prop('disabled', true);
		$('#deactivateBtn').prop('disabled', true);
		$('#applicantsBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#deleteBtn').prop('disabled', false);
		$('#activateBtn').prop('disabled', false);
		$('#deactivateBtn').prop('disabled', false);
		$('#applicantsBtn').prop('disabled', false);
	} 
}

function editForm() {
	//For editing, always get first element from array.
	var table = $('#jobPositionsDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	console.log(data);
    $("#noPositions").val(data.noPositions);
	$("#id").val(data.id);
    $("#myModal").modal('show');
}



