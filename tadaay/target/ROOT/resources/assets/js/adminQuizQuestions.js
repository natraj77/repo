var rowsSelected = [];
//Form Validation For Branches Form
$(document).ready(function () {
	$('#quizQuestionsForm').validate({
	    rules: {
	    	courseName: {
	            required: true
	        },
	        topic: {
	            required: true
	        },
	        level: {
	            required: true
	        },
	        question: {
	            required: true
	        },
	        option1: {
	            required: true
	        },
	        option2: {
	            required: true
	        },
	        correctAnswer: {
	            required: true
	        }
	    },
	    messages: {
	    	courseName: {
	            required: "Course Name is required"
	        },
	        topic: {
	            required: "Topic is required"
	        },
	        level: {
	            required: "Level is required"
	        },
	        question: {
	            required: "question is required"
	        },
	        option1: {
	            required: "first Option is required"
	        },
	        option2: {
	            required: "Second Option is required"
	        },
	        correctAnswer: {
	            required: "Answers is required"
	        }
	    },
	    submitHandler: function () {
	        saveUpdateQuestion();
	    }
	});
});

$(document).ready(function () {
    var table = $('#quizQuestionsTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
      /*  "sAjaxSource": "../getQuizList",*/
        "ajax": "../static/quizquestions.json",
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
            {"mDataProp": "topic"},
            {"mDataProp": "level"},
            {"mDataProp": "question"},
            {"mDataProp": "option1"},
            {"mDataProp": "option2"},
            {"mDataProp": "option3"},
            {"mDataProp": "option4"},
            {"mDataProp": "option5"},
            {"mDataProp": "option6"},
            {"mDataProp": "correctAnswer"},
            {"mDataProp": "Id"}
        ],
        "columnDefs": [
            {
                "targets": [2,3,5,6,7,8,9,10,11,12],
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
    $("#quizQuestionsTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#quizQuestionsTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#quizQuestionsTable').DataTable().search("").draw();
                }
                return;
            });
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
        rowsSelected.length = 0;
        $('input:checkbox').removeAttr('checked');
        $('#editBtn').prop('disabled', true);
        $('#deleteBtn').prop('disabled', true);
        $('#createBtn').prop('disabled', true);
        $("#panelContent").hide();
    })
   
    $("#quizQuestionsTable").on('click', 'input.editor-active', function() {
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
    $("#quizQuestionsTable tbody").on('click', '.previewBtn', function() {
        var table = $('#quizQuestionsTable').DataTable();
    	var data = table.row($(this).closest('tr').index()).data();
    	 $("#previewQuestion").modal('show');
    	
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

function addNewQuestion() {
    $("#courseName").val("");
    $("#topic").val("");
    $("#level").val("");
    $("#question").val("");
    $("#answer").val("");
    $("#id").val("");

    $("#myModal").modal('show');
}

function editForm() {
	//For editing, always get first element from array.
	var table = $('#quizQuestionsTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	console.log(data);

    $("#courseName").val(data.courseName);
    $("#topic").val(data.topic);
    $("#level").val(data.level);
    $("#question").val(data.question);
    $("#answer").val(data.answer);
	$("#id").val(data.id);
    $("#myModal").modal('show');
}



function saveUpdateQuestion(){
	
}
var selectedCourse = '';
var collectionData = '';
$(document).ready(function() {
	$("#coursename").keyup(function(){
		selectedCourse = '';
		if($(this).val().length>=2){
			if(collectionData==''){
				$.ajax({
				type: "POST",
				url: "../fetchSuggestions",
				data:'searchText='+$(this).val(),
				beforeSend: function(){
					$("#coursename").css("background","#FFF  no-repeat 165px");
				},
				success: function(data){
					collectionData = data.courses;
					}
				
				});
			}
			filterData(collectionData,$("#coursename").val().toUpperCase());
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
	$("#coursename").css("background","#FFF");
}

function selectCourse(val,courseIdentifier) {
	selectedCourse = courseIdentifier;
	$("#coursename").val(selectedCourse);
	$("#dmnCourseId").val(val.value);
	$("#course-box").hide();
}

function checkSelectedCourse(){
	if(selectedCourse==''){
		alert('No Courses Found at this time. please select from list of options from Search result.');
	}
}
function enableDisablecontent() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$("#panelContent").hide();
	}
	if (rowsSelected.length == 1) {
		$("#panelContent").show();
	} 
	var table = $('#quizQuestionsTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	$("#panelcourseName").text(data.courseName);
	$("#panelTopic").text(data.topic);
	$("#panelLevel").text(data.level);
	$("#panelOption1").text(data.option1);
	$("#panelOption2").text(data.option2);
	$("#panelOption3").text(data.option3);
	$("#panelOption4").text(data.option4);
	$("#panelOption5").text(data.option5);
	$("#panelOption6").text(data.option6);
	$("#panelCorrectAnswer").text(data.correctAnswer); 
	$("#id").val(data.id);
	
}