<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="RecruiterIncludes.jsp"></jsp:include>
<script src="../resources/assets/js/recruiterquizzes.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

	<div class="wrapper wrapper-content">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Quizzes</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 bg-add btn-labeled" data-toggle="modal"
									onclick="addNewQuiz();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Create
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editForm();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteQuizzes();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="quizzesDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Name</span></th>
										<th><span>Course</span></th>
										<th><span>Level</span></th>
										<th><span>Topic</span></th>
										<th><span>Duration</span></th>
										<th><span>No of Questions</span></th>
										<th><span></span></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Quiz</h4>
			</div>
			<form class="form-horizontal" id="quizeDataForm"
				name="quizeDataForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Name
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Quiz Name" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="courseName" class="col-sm-3 control-label">Course
						</label>
						<div class="col-sm-9">
							<select id="multicourse" multiple="multiple" class="form-control">
								<option value="AWS">AWS</option>
								<option value="Linux">Linux</option>
								<option value="DevOps">DevOps</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="level" class="col-sm-3 control-label">Level
						</label>
						<div class="col-sm-9">
							<select class="form-control" id="level" name="level">
								<option value="">Choose Level</option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="topic" class="col-sm-3 control-label">Topic
						</label>
						<div class="col-sm-9">
							<select class="form-control" id="topic" name="topic">
								<option value="">Choose Topic</option>
								<option>All</option>
								<option>Perticular topic</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="duration" class="col-sm-3 control-label">Duration</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="duration"
								name="duration" placeholder="Duration" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="noQuestions" class="col-sm-3 control-label">No of Questions
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="noQuestions" name="noQuestions" placeholder="No of Questions" /> 
						</div>
					</div>
				</div>
				<input type="hidden" name="id" id="id" />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
      $('#multicourse').multiselect({ 
        includeSelectAllOption: true,
          enableFiltering:true         
          
    });
      
});
</script>
</body>
</html>

