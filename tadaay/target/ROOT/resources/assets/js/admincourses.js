var rowsSelected = [];

/**
 * A call to retrieve Courses list
 */
//Form Validation For Courses Form
$(document).ready(function () {
	$.validator.addMethod("checkuppercase", function (value) {
	    return ! /[A-Z]/.test(value) // has an uppercase letter
	}, "Only Lowecase letters");
	$.validator.addMethod("checkspechars", function (value) {
	    
	    return ! /[!@#$%^&*()_=\[\]{};':"\\|,.<>\/?+]/.test(value)
	}, "The password must not contain special character");
	
	$.validator.addMethod("noSpace", function(value, element) { 
		  return value.indexOf(" ") < 0 && value != ""; 
		}, "No space please and don't leave it empty");
	
$('#adminCourseDataForm').validate({
    rules: {
    	domain: {
            required: true
        },
    	category: {
            required: true
        },
        subCategory: {
            required: true
        },
        courseName: {
            required: true
        },
        keywords: {
            required: true
        },
        imagePath: {
            required: true
        },
        featured: {
            required: true
        },
        level: {
            required: true
        },
        courseTitle: {
            required: true
        },
        courseDesc: {
            required: true
        },
        compImagePath: {
            required: true
        },
        smallimagePath: {
            required: true
        },
        addCourseInfo: {
            required: true
        },
        metaCourseTitle: {
            required: true
        },
        metaDescription: {
            required: true
        },
        metaKeywords: {
            required: true
        },
        courseIdentifier: {
            required: true,
            checkuppercase:true,
            checkspechars:true,
            noSpace:true
        },
        priortyNo: {
            required: true
        }
    },
    messages: {
    	domain: {
            required: "domain is required"
        },
        category: {
            required: "category is required"
        },
        subCategory: {
            required: "subCategory is required"
        },
        courseName: {
            required: "courseName is required"
        },
        keywords: {
            required: "keywords Content is required"
        },
        imagePath: {
            required: "imagePath is required"
        },
        featured: {
            required: "featured course is required"
        },
        level: {
            required: "level is required"
        },
        courseTitle: {
            required: "courseTitle  is required"
        },
        courseDesc: {
            required: "courseDesc is required"
        },
        compImagePath: {
            required: "competeImagePath is required"
        },
        smallimagePath: {
            required: "small image path is required"
        },
        addCourseInfo : {
            required: "addCourseInfo is required"
        },
        metaCourseTitle: {
            required: "metaCourseTitle is required"
        },
        metaDescription: {
            required: "metaDescription  is required"
        },
        metaKeywords: {
            required: "metaKeywords  is required"
        },
        courseIdentifier: {
            required: "courseIdentifier  is required"
        },
        priortyNo: {
            required: "priortyNo  is required"
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
        "sAjaxSource": "../admin/getCoursesInfo",
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
            {"mDataProp": "courseName"},
            {"mDataProp": "domain"},
            {"mDataProp": "category"},
            {"mDataProp": "subCategory"},
            {"mDataProp": "level"},
            {"mDataProp": "courseIdentifier"},
            {"mDataProp": "courseTitle"}
        ],
        "columnDefs": [
            {
                "targets": [6],
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
	    	        searchPlaceholder: "Search for Courses...",
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
	$("#panelimagePath").text(data.imagePath);
	$("#panelDetailtimagePath").text(data.compImagePath);
	$("#panelsmallimagePath").text(data.smallimagePath);
	$("#panelDescription").text(data.courseDesc);
	$("#courseContent").text(data.courseContent);
	$("#panelMetaTitle").text(data.metaCourseTitle);
	$("#panelpanelKeywords").text(data.metaKeywords);
	$("#panelMetaDesc").text(data.metaDescription);
	$("#panelRelatedCourse").text(data.relatedCourses);
	$("#panelFeaturedCourse").text(data.featured); 
	$("#id").val(data.id);
	
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
	    alert('Saving a new Course');
	    var $form = $("#adminCourseDataForm");
	    var data = JSON.stringify(getFormData($form));
	    $.ajax({
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        type: 'POST',
	        url: '../saveUpdateDmnCourseData?id=' + $('#id').val(),
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
	    indexed_array['featured'] = $("#adminCourseDataForm input[name='featured']:checked").val();

	    var selected = $("#relatedCourses option:selected");
        var message = "";
        selected.each(function () {
            message += $(this).val() + ",";
        });
        if(message!=""){
        	message = message.substring(0, message.length-1);
        	indexed_array['relatedCourses'] = message;
        }
	    return indexed_array;
	}
	
	function addNewCourse() {
		$("h4.modal-title").text("Add Course");
		$("#domain").val("");
		$("#category").val("");
		$("#subCategory").val("");
		$("#courseName").val("");
		$("#keywords").val("");
		$("#imagePath").val("");
		$("#featured").val("");
		$("#level").val("");
		$("#courseTitle").val("");
		$("#courseDesc").val("");
		$("#compImagePath").val("");
		$("#smallimagePath").val("");
		$("#addCourseInfo").val("");
		$("#relatedCourses").val("");
		$("#metaCourseTitle").val("");
		$("#metaDescription").val("");
		$("#metaKeywords").val("");
		$("#courseIdentifier").val("");
		$("#priortyNo").val("");
		$("#id").val("");
		$('#relatedCourses').multiselect('rebuild');
	    $("#myModal").modal('show');
	}
	
	function editCourse() {
		//For editing, always get first element from array.
		$("h4.modal-title").text("Edit Course");
		var table = $('#adminCoursesDataTable').DataTable();
		var data = table.row(rowsSelected[0]).data();
		$("#domain").val(data.domain);
		$("#category").val(data.category);
		$("#subCategory").val(data.subCategory);
		$("#courseName").val(data.courseName);
		$("#keywords").val(data.keywords);
		$("#imagePath").val(data.imagePath);
		if(data.featured=='Y'){
			$("input[name=featured][value='Y']").prop("checked",true);
		}else{
			$("input[name=featured][value='N']").prop("checked",true);
		}
		$("#level").val(data.level);
		$("#courseTitle").val(data.courseTitle);
		$("#courseDesc").val(data.courseDesc);
		$("#compImagePath").val(data.compImagePath);
		$("#smallimagePath").val(data.smallimagePath);
		$("#addCourseInfo").val(data.addCourseInfo);
		$("#relatedCourses").val(data.relatedCourses);
		$("#metaCourseTitle").val(data.metaCourseTitle);
		$("#metaDescription").val(data.metaDescription);
		$("#metaKeywords").val(data.metaKeywords);
		$("#courseIdentifier").val(data.courseIdentifier);
		$("#priortyNo").val(data.priortyNo);
		$("#courseIdentifier").val(data.courseIdentifier);
		$("#id").val(data.id);
		var str = selectItems(data.relatedCourses);
		$('#relatedCourses').multiselect('select', str);

	    $("#myModal").modal("show");
	}
	
	function selectItems(stringFromDB) {
        var stringArray = stringFromDB.split(",");
        return stringArray;
    }

	
	function deleteCourses() {
		var deleteRows = [];
		var table = $('#adminCoursesDataTable').DataTable();
		for (i = 0; i < rowsSelected.length; i++) {
			var data = table.row(rowsSelected[i]).data();
			deleteRows.push(data.id);
		}
		if (confirm('confirm to delete Course')) {
			$.ajax({
				type : 'POST',
				url : '../deleteAdminCourseData',
				data : {
					courseIds : deleteRows
				},
				success: function (data) {
					rowsSelected.length = 0;
					enableDisableButtons();
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
	
	