var rowsSelected = [];
//Form Validation For Branches Form
$(document).ready(function () {
	$('#jobDescriptionForm').validate({
	    rules: {
	    	jobTile: {
	            required: true
	        },
	        description: {
	            required: true
	        },
	        jobRole: {
	            required: true
	        },
	        skill: {
	            required: true
	        },
	        years: {
	            required: true
	        },
	        minExperience: {
	            required: true
	        },
	        maxExperience: {
	            required: true
	        },
	        roundName: {
	            required: true
	        },
	        cutOff: {
	            required: true
	        }
	    },
	    messages: {
	    	jobTile: {
	            required: "Job Title is required"
	        },
	        description: {
	            required: "Duration is required"
	        },
	        jobRole: {
	            required: "Job Role is required"
	        },
	        skill: {
	            required: "Skills is required"
	        },
	        years: {
	            required: "Years is required"
	        },
	        minExperience: {
	            required: "Min Experience is required"
	        },
	        maExperience: {
	            required: "Max Experience is required"
	        },
	        roundName: {
	            required: "Round Name is required"
	        },
	        cutOff: {
	            required: "cutoff is required"
	        }
	    },
	    submitHandler: function () {
	        saveUpdateJobDesc();
	    }
	});
});

$(document).ready(function () {
    var table = $('#jobDescDataTable').DataTable({
        "bProcessing": true,
        "bServerSide": true,
      /*  "sAjaxSource": "../getQuizList",*/
        "ajax": "../static/jobdesc.json",
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
            {"mDataProp": "jobTile"},
            {"mDataProp": "description"},
            {"mDataProp": "jobRole"},
            {"mDataProp": "skill"},
            {"mDataProp": "minExperience"},
            {"mDataProp": "maxExperience"},
            {"mDataProp": "roundName"},
            {"mDataProp": "cutOff"},
            {
                "className": 'text-center',
                "orderable": false,
                "data": null,
                "defaultContent": '<a class="btn btn-primary previewBtn" data-toggle="modal" id="previewBtn" ><i class="fa fa-eye"></i></a>'
            },
            {"mDataProp": "Id"}
        ],
        "columnDefs": [
            {
                "targets": [2,3,4,7,8,10],
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
    $("#jobDescDataTable_filter input")
            .unbind() // Unbind previous default bindings
            .bind("input", function (e) { // Bind our desired behavior
                // If the length is 3 or more characters, or the user pressed ENTER, search
                if (this.value.length >= 5 || e.keyCode == 13) {
                    // Call the API search function
                    $('#jobDescDataTable').DataTable().search(this.value).draw();
                }
                // Ensure we clear the search if they backspace far enough
                if (this.value == "") {
                    $('#jobDescDataTable').DataTable().search("").draw();
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
    })
   
    $("#jobDescDataTable").on('click', 'input.editor-active', function() {
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
    $("#jobDescDataTable tbody").on('click', '.previewBtn', function() {
        var table = $('#jobDescDataTable').DataTable();
    	var data = table.row($(this).closest('tr').index()).data();
    	 $("#previewJobDesc").modal('show');
    	
    });
});


function enableDisableButtons() {
	if (rowsSelected.length > 1 || rowsSelected.length == 0) {
		$('#editBtn').prop('disabled', true);
		$('#createBtn').prop('disabled', true);
	} 
	if (rowsSelected.length == 1) {
		$('#editBtn').prop('disabled', false);
		$('#createBtn').prop('disabled', false);
	}
	
	if (rowsSelected.length == 0) {
		$('#deleteBtn').prop('disabled', true);
	}
	if (rowsSelected.length >= 1) {
		$('#deleteBtn').prop('disabled', false);
	} 
}

function addNewJob() {
    $("#jobTile").val("");
    $("#description").val("");
    $("#jobRole").val("");
    $("#skill").val("");
    $("#years").val("");
    $("#minExperience").val("");
    $("#maxExperience").val("");
    $("#roundName").val("");
    $("#cutOff").val("");
    $("#id").val("");

    $("#myModal").modal('show');
}

function editForm() {
	//For editing, always get first element from array.
	var table = $('#jobDescDataTable').DataTable();
	var data = table.row(rowsSelected[0]).data();
	
	console.log(data);

    $("#jobTile").val(data.jobTile);
    $("#description").val(data.description);
    $("#jobRole").val(data.jobRole);
    $("#skill").val(data.skill);
    $("#years").val(data.years);
    $("#minExperience").val(data.minExperience);
    $("#maxExperience").val(data.maxExperience);
    $("#roundName").val(data.roundName);
    $("#cutOff").val(data.cutOff);
	$("#id").val(data.id);
    $("#myModal").modal('show');
}



var divCounter = 0;
function addJobDescDiv() {

	/*var currentskill = $("#skill_" + divCounter).val();
	var currentyears = $("#years_" + divCounter).val();
	
	if (currentskill == '' || currentyears == '') {
		alert('Please fill all required fields before adding more jobs');
		
		return;
	}*/
	
	divCounter ++;
	
	var html = '<div class="after-add-more" id="jobDescSectionDiv_' + divCounter + '">' +
					      		'<div class="row form-group">	' +
					      		'<div class="col-sm-8">' +
					      		 '<div class="form-group">' +
					      	 		'<div class="col-sm-12">' +
					      	 			'<div class="search-input">' +
					                    	'<div class="courseposition">' +
					                    		'<input type="text" class="form-control" id="course_' + divCounter + '" name="course_' + divCounter + '"placeholder="Course">' +
					                    		'<div class="skillresultdiv" id="coursesresultdiv_' + divCounter + '" style="display:none;">' +
					                    			'<ul>' +
					                    				'<li>Devops</li>' +
					                    				'<li>Linux</li>' +
					                    				'<li>AWS</li>' +
					                    			'</ul>'+
					                    		'</div>'+
					                    	'</div>' +
					                    '</div>' +
					                    '</div>' +
								 	'</div>' +
								 	'</div>' +
								 	'<div class="col-sm-3">' +
								 	'<div class="form-group">' +
									'<div class="col-sm-12">' +
					      	 			'<select class="form-control" id="level_' + divCounter + '" name="level_' + divCounter + '" onChange="buildTopics();">' +
											'<option value="">Choose Level</option>' +
											'<option>Beginner</option>' +
											'<option>Intermediate</option>' +
											'<option>Advance</option>' +
										'</select>' +
										'</div>' +
								 	'</div>' +
								 	'</div>' +
								 	'<input type="hidden" id="jobDescId_' + divCounter + '" name="jobDescId_' + divCounter + '">' +
									  '<div class="col-sm-1"> ' +
										'<button class="btn btn-danger removebtn" type="button" onclick="removejobdescDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
									  '</div>' +
								'</div>' +
							'</div> ';
	
	$("#jobDescSectionDiv").after(html);
	
}

function removejobdescDiv() {
	$("#jobDescSectionDiv_" + divCounter).remove();
	divCounter --;
}

var divQuizCounter = 0;
function addQuizDiv() { 

	/*var currentskill = $("#skill_" + divCounter).val();
	var currentyears = $("#years_" + divCounter).val();
	
	if (currentskill == '' || currentyears == '') {
		alert('Please fill all required fields before adding more jobs');
		
		return;
	}*/
	
	divQuizCounter ++;
	
	var html = '<div class="after-add-quiz" id="quizSectionDiv_' + divQuizCounter + '">' +
									'<div class="row form-group">	' +
									'<div class="col-sm-6">' +
								     '<div class="form-group">'+
								            '<div class="col-sm-12">'+
								            '<select class="form-control" id="quiz_' + divQuizCounter + '" name="quiz_' + divQuizCounter + '">'+
												'<option value="">Quiz</option>'+
												'<option>Personal</option>'+
												'<option>Online</option>'+
											'</select>'+
								            '</div>'+
								    '</div>'+
									'</div>'+
								     '<div class="col-sm-5">'+
								           '<div class="form-group">'+
									            '<div class="col-sm-12">'+
									           '<input type="text" class="form-control" id="quizCutOff_' + divQuizCounter + '" name="quizCutOfff_' + divQuizCounter + '" placeholder="cutoff">' +
									            '</div>'+
								          '</div>'+
								    '</div>'+
								    '<input type="hidden" id="quizId_' + divQuizCounter + '" name="quizId_' + divQuizCounter + '">' +
								     '<div class="col-sm-1">'+
								           '<button class="btn btn-danger removebtn" type="button" onclick="removeQuizDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
								    '</div>'+
									'</div>'+
							'</div> ';
	
	$("#quizSectionDiv").after(html);
	
}

function removeQuizDiv() {
	$("#quizSectionDiv_" + divQuizCounter).remove();
	divQuizCounter --;
}

var divTaskCounter = 0;
function addTaskDiv() { 
	divTaskCounter ++;
	var html = '<div class="after-task" id="taskSectionDiv_' + divTaskCounter + '">' +
									'<div class="row form-group">	' +
									'<div class="col-sm-6">' +
								     '<div class="form-group">'+
								            '<div class="col-sm-12">'+
								            '<select class="form-control" id="task_' + divTaskCounter + '" name="task_' + divTaskCounter + '">'+
												'<option value="">Task</option>'+
												'<option>Personal</option>'+
												'<option>Online</option>'+
											'</select>'+
								            '</div>'+
								    '</div>'+
									'</div>'+
								     '<div class="col-sm-5">'+
								           '<div class="form-group">'+
									            '<div class="col-sm-12">'+
									           '<input type="text" class="form-control" id="taskcutOff_' + divTaskCounter + '" name="taskcutOff_' + divTaskCounter + '" placeholder="cutoff">' +
									            '</div>'+
								          '</div>'+
								    '</div>'+
								    '<input type="hidden" id="taskId_' + divTaskCounter + '" name="taskId_' + divTaskCounter + '">' +
								     '<div class="col-sm-1">'+
								           '<button class="btn btn-danger removebtn" type="button" onclick="removetaskDiv();"><i class="fa fa-minus" aria-hidden="true"></i></button>' +
								    '</div>'+
									'</div>'+
							'</div> ';
	
	$("#taskSectionDiv").after(html);
	
}

function removetaskDiv() {
	$("#taskSectionDiv_" + divTaskCounter).remove();
	divTaskCounter --;
}

function saveUpdateJobDesc(){
	
}
var collectionData = '';
$(document).ready(function() {
	$("#search-box").keyup(function(){
		selectedCourse = '';
		if($(this).val().length>=2){
		if(collectionData==''){
		$("#loading").show();
		$.ajax({
		type: "POST",
		url: "../fetchSuggestions",
		data:'searchText='+$(this).val(),
		beforeSend: function(){
			$("#search-box").css("background","#FFF  no-repeat 165px");
		},
		success: function(data){
			collectionData = data.courses;
			filterData(collectionData,$("#search-box").val().toUpperCase());
			$("#loading").hide();
			}
		
		});
		}
		filterData(collectionData,$("#search-box").val().toUpperCase());
		}else{
			$("#suggesstion-box").hide();
		}
		
	});
	
});

function filterData(collectionData,containsStr){
	$("#suggesstion-box").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].courseName.toUpperCase().indexOf(containsStr)>=0){
		htmlTxt = htmlTxt + '<li onClick="selectCourse(this,\''+collectionData[k].courseIdentifier+'\');" value="'+collectionData[k].courseIdentifier+'">'+collectionData[k].courseName+'</li>';
	    }
	}
	$("#suggesstion-box").html('<ul id="country-list" >'+htmlTxt+'</ul>');
	$("#search-box").css("background","#FFF");
}

var selectedCourse = '';
function selectCourse(val,courseIdentifier) {
	selectedCourse = courseIdentifier;
	$("#search-box").val(val.innerHTML);
	$("#suggesstion-box").hide();
}


function checkSelectedCourse(){
	if(selectedCourse!=''){
	var requestPath = '<%=request.getContextPath()%>';
	window.location.href = requestPath+'/courses/'+selectedCourse;
	}else{
		alert('No Courses Found at this time. please select from list of options from Search result.');
	}
}