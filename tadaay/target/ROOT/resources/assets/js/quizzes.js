var rowsSelected = [];
var quizIds = [];
var noOfQuestions = [];
var quizParams = {};
var divCounter = 0;


//Form Validation For Branches Form
$(document).ready(function () {
	$('#addQuizForm').validate({
	    rules: {
	    	quizName: {
	            required: true
	        },
	        duration: {
	            required: true
	        },
	        description: {
	            required: true
	        },
	        courseName: {
	            required: true
	        },
	        topic: {
	            required: true
	        },
	        level: {
	            required: true
	        },
	        noQuestions: {
	            required: true,
	            number:true
	        }
	    },
	    messages: {
	    	courseName: {
	            required: "Quiz Name is required"
	        },
	        duration: {
	            required: "Duration is required"
	        },
	        description: {
	            required: "Description is required"
	        },
	    	courseName: {
	            required: "Course Name is required"
	        },
	        topic: {
	            required: "Topic is required"
	        },
	        level: {
	            required: "Level is required"
	        },
	        noQuestions: {
	            required: "No of questions is required",
	            number: "Please enter numbers only"
	        }
	    },
	    submitHandler: function () {
	        saveUpdateQuiz();
	    }
	});
	
	buildCourses();

	});

$(document).ready(function () {
    var table = $('#quizzesDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "../getQuizList",
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
            {"mDataProp": "quizName"},
            {"mDataProp": "duration"},
            {"mDataProp": "description"},
            {"mDataProp": "quizId"}
        ],
        "columnDefs": [
            {
                "targets": [4],
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
    	        searchPlaceholder: "Search for quizzes...",
    	        sProcessing: "<img src='../resources/images/course-preload.gif'>"
    	},
        "initComplete": function (settings, json) {
            $('#loadingSpinner').hide();
        }
    });

    // Grab the datatables input box and alter how it is bound to events
    $("#quizzesDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#quizzesDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#quizzesDataTable').DataTable().search("").draw();
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
    
    $("#quizzesDataTable").on('click', 'input.editor-active', function() {
    	 var tr = $(this).closest('tr');
         var row = table.row(tr);
         
         var $this = $(this);
         var isChecked = $(this).prop( 'checked' );
         
    	 var rowId = tr.index();
         if (isChecked) {
        	 rowsSelected.push(rowId); 
         } else {
        	 var index = rowsSelected.indexOf(rowId);
        	 rowsSelected.splice(index, 1);
         }
         
         enableDisableButtons();
         
    });
});


function buildCourses() {
	$.ajax({
		type : 'GET',
		url : '../getQuizCourseNames',
		success : function(data) {
			var htm = '<select id="copycourseName1" name="copycourseName1" class="form-control copycourseName">';
			htm += '<option value="">Choose Course</option>';
			$.each(data, function(index, value) {
				$('#courseName_' + divCounter).append(
						$("<option></option>").attr("value", value).text(value));
				htm += '<option value=' + index + '>' + value + '</option>';
			});
			htm +='</select>';
			$('#coursePositionDiv').append(htm);
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
}

function buildTopics() {
	var courseName = $("#courseName_" + divCounter).val();
	var quizLevel = $("#level_" + divCounter).val();
	
	$.ajax({
		type : 'GET',
		url : '../getTopicsForCourseName?courseName=' + courseName + "&quizLevel=" + quizLevel,
		success : function(data) {
			$.each(data, function(index, value) {
				$('#topic_' + divCounter).append(
						$("<option></option>").attr("value", value).text(value));
			});
		},
		failure : function() {
			console.log('There was an error getting course list');
		}

	});
}
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

function selectQuizId() {
	
	var courseName = $("#courseName_" + divCounter).val();
	var quizLevel = $("#level_" + divCounter).val();
	var topic = $("#topic_" + divCounter).val();
	
	if (courseName != '' && quizLevel != '' && topic != '') {
		$.ajax({
			type : 'GET',
			url : '../getQuizIdForSelection?courseName=' + courseName + "&quizLevel=" + quizLevel + "&topic=" + topic,
			success : function(data) {
				console.log('id : ' + data);
				quizIds.push(data);
			},
			failure : function() {
				console.log('There was an error getting course list');
			}

		});	
	}
}


function createNewQuiz() {
	$(".noOfQuestions").each(function() {
		noOfQuestions.push($(this).val())
	});
	var url = '../createNewQuiz?quizName=' + $("#quizName").val() + "&duration=" + $("#duration").val() + "&description=" + $("#description").val() + "&questionItems=" + noOfQuestions.length;
	
    var $form = $("#addQuizForm");
    var questions = JSON.stringify(getFormData($form));

	$.ajax({
        headers: {
            'Content-Type': 'application/json'
        },
        type: 'POST',
        url: url,
        dataType: 'json',
        mimeType: 'application/json',
        data : questions, 
        success: function (returnData) {
        	alert('Your new quiz has been saved');
            var table = $('#quizzesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#quizzesDataTable').dataTable().fnDraw();
            //$('#addQuizForm')[0].reset();
        }
    })
}

function saveUpdateQuiz() {
    console.log('Update Quiz ' + $("#quizEditId").val());

    $.ajax({
        type: 'POST',
        url: '../updateQuiz?quizId=' + $('#quizEditId').val() + "&quizName=" + $('#quizNameEdit').val() + "&duration=" + $('#durationEdit').val() + "&description=" + $('#descriptionEdit').val(),
        mimeType: 'application/json',
        success: function (returnData) {
            var table = $('#quizzesDataTable').DataTable();
            var row_index = table.row(this).index();
            var current_row = table.row(this);
            $('#quizzesDataTable').dataTable().fnDraw();
        }
    })
    
    
    $("#myModal").modal('hide');
}


function addNewQuiz() {
    $("#name").val("");
    $("#courseName").val("");
    $("#level").val("");
    $("#topic").val("");
    $("#duration").val("");
    $("#noQuestions").val("");
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
	var table = $('#quizzesDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	console.log(data);

    $("#quizNameEdit").val(data.quizName);
    $("#durationEdit").val(data.duration);
    $("#descriptionEdit").val(data.description);
    $("#quizEditId").val(data.quizId);

    $("#myModal").modal('show');
}

function deleteQuizzes() {
	var deleteRows = [];
	var table = $('#quizzesDataTable').DataTable();
	for (i = 0; i < rowsSelected.length; i++) {
		var data = table.row(rowsSelected[i]).data();
		deleteRows.push(data.quizId);
	}
	if (confirm('confirm to delete Quizzes')) {
		$.ajax({
			type : 'POST',
			url : '../deleteQuizData',
			data : {
				quizIds : deleteRows
			},
			success: function (data) {
				console.log('deleted successfully');
				rowsSelected.length = 0;
				enableDisableButtons();
	            $('#quizzesDataTable').dataTable().fnDraw();
	        }
		});
		
	    $("#myModal").modal('hide');
	}

}

function addQuestionDiv() { 
	
	var currentCourseName = $("#courseName_" + divCounter).val();
	var currentLevelName = $("#level_" + divCounter).val();
	var currentTopicName = $("#topic_" + divCounter).val();
	var currentNoOfQuestions = $("#noQuestions_" + divCounter).val();
	
	if (currentCourseName == '' || currentLevelName == '' || currentTopicName == '' || currentNoOfQuestions == '') {
		alert('Please fill all required fields before adding more questions');
		
		return;
	}
	
	divCounter ++;
	buildCourses();
	
	var html = '<div class="after-add-more" id="quizSectionDiv_' + divCounter + '">' +
					      		'<div class="col-sm-12 row form-group">	' +
					      	 		'<div class="col-sm-4 no-padding">' +
					      	 			'<div class="search-input">' +
					                    	'<div class="courseposition">' +
					                    		'<select id="courseName_' + divCounter + '" name="courseName_' + divCounter + '" class="form-control">' +
					                    			 '<option value="">Choose Course</option>' +
					                    		'</select>' +
					                    	'</div>' +
					                    '</div>' +
								 	'</div>' +
								 	'<div class="col-sm-2 no-padding">' +
					      	 			'<select class="form-control" id="level_' + divCounter + '" name="level_' + divCounter + '" onChange="buildTopics();">' +
											'<option value="">Choose Level</option>' +
											'<option>Begginer</option>' +
											'<option>Intermediate</option>' +
											'<option>Advanced</option>' +
										'</select>' +
								 	'</div>' +
								 	'<div class="col-sm-3">' +
					      	 			'<select id="topic_' + divCounter + '" name="topic_' + divCounter + '" class="form-control" onChange="selectQuizId();">' +
					                    			 '<option value="">Choose Topic</option>' +
					                    		'</select>' +
								 	'</div>' +
								 	
								 	'<div class="col-sm-2 no-padding">' +
					      	 			'<div class="col-sm-8 no-padding"><input type="text" class="form-control noOfQuestions" id="noQuestions_' + divCounter + '" name="noQuestions_' + divCounter + '" placeholder="Questions"></div>' +
					      	 			'<div class="col-sm-4 no-padding"><input type="text" class="form-control" value="100" readonly></div>'+
								 	'</div>' +
								 	'<input type="hidden" id="quizId_' + divCounter + '" name="quizId_' + divCounter + '">' +
									  '<div class="col-sm-1"> ' +
										'<button class="btn btn-danger removebtn" type="button" onclick="removeQuestionDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
									  '</div>' +
								'</div>' +
							'</div> ';
	
	$("#quizSectionDiv").after(html);
	
}

function removeQuestionDiv() {
	$("#quizSectionDiv_" + divCounter).remove();
	divCounter --;
}

function selectAllRows() {
	
}