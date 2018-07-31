var rowsSelected = [];
var videoUrl = '';
var contentUrl = '';
/**
 * A call to retrieve Courses list
 */
//Form Validation For Courses Form
$(document).ready(function () {
$('#courseDataForm').validate({
    rules: {
    	name: {
            required: true
        },
        modeType: {
            required: true
        }
    },
    messages: {
    	name: {
            required: "Course is required"
        },
        modeType: {
            required: "Mode is required"
        }
    },
    submitHandler: function () {
        saveUpdateCourse();
    }
          
       
     
});

$("#file-course")
.fileinput(
		{
			uploadUrl : "../singleUpload?uploadType=course",
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
			uploadExtraData : function() {
				return {
					uploadCourseName : ''
				};
			}
		});

$("#file-videos")
.fileinput(
		{
			uploadUrl : "../singleUpload?uploadType=course",
			'showPreview' : true,
			'minFileCount' : '1',
			'validateInitialCount' : true,
			'allowedFileExtensions' : [
					'mp4'],
			'uploadAsync' : true,
			'elErrorContainer' : '#errorBlock',
			uploadExtraData : function() {
				return {
					uploadCourseName : ''
				};
			}
		});

$("#file-course").on('fileuploaded',
		function(event, data, previewId, index) {
		$("#contentPath").val(data.response.content);
		});
$("#file-videos").on('fileuploaded',
		function(event, data, previewId, index) {
		$("#videoPath").val(data.response.content);
		});

/*$.ajax({
	type : 'GET',
	url : '../getCourseListAndId',
	success : function(data) {

		$.each(data, function (index, value) {
            $('#uploadCourseName').append($("<option></option>").attr("value", value).text(value));
        });
		$.each(data, function (index, value) {
            $('#uploadCourseDemoName').append($("<option></option>").attr("value", value).text(value));
        });
		
	},
	failure : function() {
		console.log('There was an error getting course list');
	}

});*/

$.ajax({
	type : 'GET',
	url : '../getDetailsForBatchFormation',
	success : function(data) {
		//courses
		courses = data[0];
		for (i = 0; i < courses.length; i++) {
			$("#uploadCourseName").append(new Option(courses[i].name, courses[i].id));
			$("#uploadCourseDemoName").append(new Option(courses[i].name, courses[i].id));
			
		}
	},
	failure : function() {
		console.log('There was an error getting course list');
	}

});
});
/**
 * A call to retrieve Courses list
 */
$(document).ready(function() {
						var table = $('#coursesDataTable').DataTable({
								"bProcessing" : true,
								"bServerSide" : true,
								"sAjaxSource" : "../showAppCourses",
								"sPaginationType" : "full_numbers",
								"bJQueryUI" : true,
								"lengthMenu" : [ [ 10, 25, 50, -1 ],
										[ 10, 25, 50, "All" ] ],
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
									"mDataProp" : "online"
								},
								{
                                    "className" : 'text-center',
									"mDataProp" : "classroom"
								},
								{
                                    "className" : 'text-center',
									"mDataProp" : "corporate"
								},
								{
					                "className": 'text-center',
					                "orderable": false,
					                "data": null,
					                "defaultContent": '<a class="btn btn-primary contentpreviewBtn" data-toggle="modal" id="previewBtn" ><i class="fa fa-eye"></i></a>'
					            },
					            {
					                "className": 'text-center',
					                "orderable": false,
					                "data": null,
					                "defaultContent": '<a class="btn btn-primary videopreviewBtn" data-toggle="modal" id="previewBtn" ><i class="fa fa-eye"></i></a>'
					            },
					            {
                                    "className" : 'text-center',
									"mDataProp" : "id"
								}
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
						    	        searchPlaceholder: "Search for Courses...",
						    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
						    	},
								"initComplete" : function(settings, json) {
									$('#loadingSpinner').hide();
								}
							});

					// Grab the datatables input box and alter how it is bound
					// to events
					$("#coursesDataTable_filter input").unbind() // Unbind
																	// previous
																	// default
																	// bindings
					.bind(
							"input",
							function(e) { // Bind our desired behavior
								// If the length is 3 or more characters, or the
								// user pressed ENTER, search
								if (this.value.length >= 3 || e.keyCode == 13) {
									// Call the API search function
									$('#coursesDataTable').DataTable().search(
											this.value).draw();
								}
								// Ensure we clear the search if they backspace
								// far enough
								if (this.value == "") {
									$('#coursesDataTable').DataTable().search(
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
    })
	$('#myModal').on('shown.bs.modal', function (e) {
		var invoker = $(e.relatedTarget);
		if (invoker[0] && invoker[0].className === 'btn btn-primary') {
			$("#id").val("");
		}
	})
	$("#coursesDataTable").on('click', 'input.editor-active', function() {
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
	 $("#coursesDataTable tbody").on('click', '.contentpreviewBtn', function() {
	        var table = $('#coursesDataTable').DataTable();
	    	var data = table.row($(this).closest('tr').index()).data();
	    	contentUrl = "../appContent/" + data.courseContent;
	    	$("#courseFrameContent").prop('src',contentUrl);
	    	$("#myModalContent").modal('show');
	    });
	 $("#coursesDataTable tbody").on('click', '.videopreviewBtn', function() {
	        var table = $('#coursesDataTable').DataTable();
	    	var data = table.row($(this).closest('tr').index()).data();
	    	videoUrl = "../appContent/" + data.videoContent;
	    	$("#course-video").find("#videoFrameContent").prop('src', videoUrl);
	    	$("#course-video").load();
	    	$("#myModalVideo").modal('show');
	    });
});

function enableDisableButtons() {
	//console.log(rowsSelected);
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
		$('#uploadCourse').prop('disabled', true);
		$('#uploadVideo').prop('disabled', true);
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
		$('#uploadCourse').prop('disabled', false);
		$('#uploadVideo').prop('disabled', false);
	}
	
	if (rowsSelected.length == 0) {
		$('#deleteBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#deleteBtn').prop('disabled', false);
	} 
}

	function getFormData($form) {
	    var unindexed_array = $form.serializeArray();
	    var indexed_array = {};

	    $.map(unindexed_array, function (n, i) {
	        indexed_array[n['name']] = n['value'];
	    });
	    return indexed_array;
	}
	
	function saveUpdateCourse() {
	    alert('Saving a new Course');

	    var $form = $("#courseDataForm");
	    var courseObj = JSON.stringify(getFormData($form));
	    $.ajax({
	        type: 'POST',
	        url: '../saveUpdateCourseData?id=' + $('#id').val(),
	        mimeType: 'application/json',
	        data:{data : courseObj},
	        success: function (returnData) {
	            var table = $('#coursesDataTable').DataTable();
	            var table = $('#coursesDataTable').DataTable();
	            var row_index = table.row(this).index();
	            var current_row = table.row(this);
	            $('#coursesDataTable').dataTable().fnDraw();
	        }
	    })
	    
	    
	    $("#myModal").modal('hide');
	}
	function addNewCourse() {
		$("#myModalLabel").text('Add Course')
	    $("#name").val("");
	    $("input[name=online][value='']").prop('checked','unchecked');
	    $("input[name=classroom][value='']").prop('checked','unchecked');
	    $("input[name=corporate][value='']").prop('checked','unchecked');

	    $("#id").val("");

	    $("#myModal").modal('show');
	}
	
	function editCourse() {
		$("#myModalLabel").text('Edit Course')
		//For editing, always get first element from array.
		var table = $('#coursesDataTable').DataTable();
		var data = table.row(rowsSelected[0]).data();
		
		$("#name").val(data.name);
		$("input[name=online][value='"
						+ data.online
						+ "']").prop('checked',
				'checked');
		$("input[name=classroom][value='"
				+ data.classroom
				+ "']").prop('checked',
		'checked');
		$("input[name=corporate][value='"
				+ data.corporate
				+ "']").prop('checked',
		'checked');
		$("#id").val(data.id);
		$("#dmnCourseId").val(data.dmnCourseId);
		$("input[name=realtimeProjs][value='"
				+ data.realtimeProjs
				+ "']").prop('checked',
		'checked');
		$("input[name=placementAssistance][value='"
				+ data.placementAssistance
				+ "']").prop('checked',
		'checked');
		$("input[name=feeInInstallments][value='"
				+ data.feeInInstallments
				+ "']").prop('checked',
		'checked');
		$("input[name=labAssistance][value='"
				+ data.labAssistance
				+ "']").prop('checked',
		'checked');
		$("#myModal").modal("show");
	}
	function deleteCourses() {
		var deleteRows = [];
		var table = $('#coursesDataTable').DataTable();
		for (i = 0; i < rowsSelected.length; i++) {
			var data = table.row(rowsSelected[i]).data();
			deleteRows.push(data.id);
		}
		if (confirm('confirm to delete Course')) {
			$.ajax({
				type : 'POST',
				url : '../deleteCourseData',
				data : {
					courseIds : deleteRows
				},
				success: function (data) {
					rowsSelected.length = 0;
					enableDisableButtons();
		            $('#coursesDataTable').dataTable().fnDraw();
		        }
			});
			
		    $("#myModal").modal('hide');
		}

	}
	
	function showCourseContent() {
		$("#courseContent").modal("show");
		$("#file-course").val(null);
	}
	
	function showCourseDemos() {
		$("#demoVideo").modal("show");
		$("#file-videos").val(null);
	}
	var selectedCourse = '';
	var collectionData = '';
	$(document).ready(function() {
		$("#name").keyup(function(){
			selectedCourse = '';
			if($(this).val().length>=2){
				if(collectionData==''){
					$.ajax({
					type: "POST",
					url: "../fetchSuggestions",
					data:'searchText='+$(this).val(),
					beforeSend: function(){
						$("#name").css("background","#FFF  no-repeat 165px");
					},
					success: function(data){
						collectionData = data.courses;
						}
					
					});
				}
				filterData(collectionData,$("#name").val().toUpperCase());
			}else{
				$("#course-box").hide();
			}
			
		});
	});
	
	function filterData(collectionData,containsStr){
		$("#course-box").show();
		var htmlTxt = '';
		for(var k in collectionData){
			if(collectionData[k].courseName.toUpperCase().indexOf(containsStr)>=0){
				htmlTxt = htmlTxt + '<li onClick="selectCourse(this,\''+collectionData[k].courseName+'\');" value="'+collectionData[k].id+'">'+collectionData[k].courseName+'</li>';
		    }
		}
		$("#course-box").html('<ul id="country-list" >'+htmlTxt+'</ul>');
		$("#name").css("background","#FFF");
	}

	function selectCourse(val,courseIdentifier) {
		selectedCourse = courseIdentifier;
		$("#name").val(selectedCourse);
		$("#dmnCourseId").val(val.value);
		$("#course-box").hide();
	}

	function checkSelectedCourse(){
		if(selectedCourse==''){
			alert('No Courses Found at this time. please select from list of options from Search result.');
		}
	}
	
	function saveCourseContent() {
	    var table = $('#coursesDataTable').DataTable();
		var data = table.row(rowsSelected[0]).data();
	    $.ajax({
            type: 'POST',
            url: '../saveUpdateCourseContent?id=' + data.id,
            data : {
            	courseId : data.id,
            	source : 'course',
				content : $("#contentPath").val()
			},
            success: function (returnData) {
            	var table = $('#coursesDataTable').DataTable();
	            var row_index = table.row(this).index();
	            var current_row = table.row(this);
	            $('#coursesDataTable').dataTable().fnDraw();
            }
        });
	    $("#courseContent").modal('hide');
	}
	
	function saveVideoContent(){
		var table = $('#coursesDataTable').DataTable();
		var data = table.row(rowsSelected[0]).data();
	    $.ajax({
            type: 'POST',
            url: '../saveUpdateCourseContent?id=' + data.id,
            data : {
            	courseId : data.id,
            	source : 'video',
				content : $("#videoPath").val()
			},
            success: function (returnData) {
            	var table = $('#coursesDataTable').DataTable();
	            var row_index = table.row(this).index();
	            var current_row = table.row(this);
	            $('#coursesDataTable').dataTable().fnDraw();
            }
        });
	    $("#demoVideo").modal('hide');
	}