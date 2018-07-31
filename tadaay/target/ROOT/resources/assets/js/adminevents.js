var rowsSelected = [];

/**
 * A call to retrieve Courses list
 */
//Form Validation For Courses Form
$(document).ready(function () {
	
$('#adminCourseDataForm').validate({
	rules: {
    	title: {
            required: true
        },
        organizer: {
            required: true
        },
        description: {
            required: true
        },
        recurring: {
            required: true
        },
        venue: {
            required: true
        },
        location: {
            required: true
        },
        city: {
            required: true
        },
        schedule: {
            required: true
        },
        imagePath: {
            required: true
        },
        country: {
            required: true
        },
        template: {
            required: true
        },
        metaTitle: {
            required: true
        },
        metaDescription: {
            required: true
        },
        metaKeywords: {
            required: true
        },
        isActive: {
            required: true
        },eventIdentifier: {
            required: true
        }
    },
    messages: {
    	title: {
            required: "title is required"
        },
        organizer: {
            required: "organizer is required"
        },
        description: {
            required: "description is required"
        },
        recurring: {
            required: "recurring is required"
        },
        venue: {
            required: "venue Content is required"
        },
        location: {
            required: "location is required"
        },
        city: {
            required: "city course is required"
        },
        schedule: {
            required: "schedule is required"
        },
        imagePath: {
            required: "imagePath  is required"
        },
        country: {
            required: "country is required"
        },
        template: {
            required: "template is required"
        },
        metaTitle : {
            required: "metaTitle is required"
        },
        metaDescription: {
            required: "metaDescription is required"
        },
        metaKeywords: {
            required: "metaKeywords  is required"
        },
        isActive: {
            required: "isActive  is required"
        },eventIdentifier: {
        	required: "Event Identifier  is required"
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
        "sAjaxSource": "../admin/getEventsInfo",
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
            {"mDataProp": "title"},
            {"mDataProp": "organizer"},
            {"mDataProp": "description"},
            {"mDataProp": "recurring"},
            {"mDataProp": "venue"},
            {"mDataProp": "location"},
            {"mDataProp": "city"}
        ],
        "columnDefs": [
            {
                "targets": [7],
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
	    	        searchPlaceholder: "Search for Events...",
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
			enableDisablecontent();
			
			});
});

function enableDisablecontent() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$("#panelContent").hide();
	}
	if (rowsSelected.length == 1) {
		$("#panelContent").show();
	} 
	var table = $('#adminCoursesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#title1").text(data.title);
	$("#organizer1").text(data.organizer);
	$("#description1").text(data.description);
	$("#recurring1").text(data.recurring);
	$("#venue1").text(data.venue);
	$("#location1").text(data.location);
	$("#city1").text(data.city);
	$("#schedule1").text(data.schedule);
	$("#imagePath1").text(data.imagePath);
	$("#country1").text(data.country);
	$("#template1").text(data.template);
	$("#metaTitle1").text(data.metaTitle);
	$("#metaDescription1").text(data.metaDescription);
	$("#metaKeywords1").text(data.metaKeywords);
	$("#isActive1").text(data.isActive);
	$("#eventIdentifier1").text(data.eventIdentifier);
	
	$("#id").val(data.id);
	
}

function enableDisableButtons() {
	//console.log(rowsSelected);
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
		$('#subscriberBtn').prop('disabled', true)
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
		$('#subscriberBtn').prop('disabled', false);
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
	    	alert('Editing Event '+$('#id').val());
	    }else{
	    	alert('Saving a new Event');
	    }
		
	    var $form = $("#adminCourseDataForm");
	    var data = JSON.stringify(getFormData($form));
	    $.ajax({
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        type: 'POST',
	        url: '../saveUpdateEventsData?id=' + $('#id').val(),
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
	    indexed_array['isActive'] = $('input[name=isActive]:checked', '#adminCourseDataForm').val();
	    indexed_array['recurring'] = $('input[name=recurring]:checked', '#adminCourseDataForm').val();
	    return indexed_array;
	}
	
	function addNewCourse() {
		$("h4.modal-title").text("Add Event");
		$("#title").val("");
		$("#organizer").val("");
		$("#description").val("");
		$("input[name=recurring][value='Y']").prop("checked",true);
		$("input[name=isActive][value='Y']").prop("checked",true);
		$("#venue").val("");
		$("#location").val("");
		$("#city").val("");
		$("#schedule").val("");
		$("#imagePath").val("");
		$("#country").val("");
		$("#template").val("");
		$("#metaTitle").val("");
		$("#metaDescription").val("");
		$("#metaKeywords").val("");
		$("#eventIdentifier").val("");
		$("#id").val("");
	    $("#myModal").modal('show');
	}
	
	function editCourse() {
		//For editing, always get first element from array.
		$("h4.modal-title").text("Edit Event");
		var table = $('#adminCoursesDataTable').DataTable();
		var data = table.row(rowsSelected[0]).data();
		$("#title").val(data.title);
		$("#organizer").val(data.organizer);
		$("#description").val(data.description);
		$("#venue").val(data.venue);
		$("#location").val(data.location);
		$("#city").val(data.city);
		$("#country").val(data.country);
		$("#schedule").val(data.schedule);
		$("#imagePath").val(data.imagePath);
		$("#template").val(data.template);
		$("#metaTitle").val(data.metaTitle);
		$("#metaDescription").val(data.metaDescription);
		$("#metaKeywords").val(data.metaKeywords);
		$("#eventIdentifier").val(data.eventIdentifier);
		$("#id").val(data.id);
		if(data.recurring=='Y'){
			$("input[name=recurring][value='Y']").prop("checked",true);
		}else{
			$("input[name=recurring][value='N']").prop("checked",true);
		}
		
		if(data.isActive=='Y'){
			$("input[name=isActive][value='Y']").prop("checked",true);
		}else{
			$("input[name=isActive][value='N']").prop("checked",true);
		}
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
			deleteRows.push(data.id);
		}
		if (confirm('confirm to delete Event')) {
			$.ajax({
				type : 'POST',
				url : '../deleteAdminEventsData',
				data : {
					eventIds : deleteRows
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
	
	