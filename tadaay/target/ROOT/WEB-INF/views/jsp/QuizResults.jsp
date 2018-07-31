<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/quizresults.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Quiz Results</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 bg-add btn-labeled">
									<b><i class="fa fa-eye" aria-hidden="true"></i></b>View Result
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="quizResultsDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>First Name</span></th>
										<th><span>Last Name</span></th>
										<th><span>Quiz Name</span></th>
										<th><span>Status</span></th>
										<th><span>Result</span></th>
										<th><span>Assigned Date</span></th>
										<th><span>start Date</span></th>
										<th><span>End Date</span></th>
										<th><span>Score</span></th>
										<th><span>Duration</span></th>
										<th><span></span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none">
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Assigned Date
						                </label>
						                <div class="col-sm-9">
						                  <span id="assigneddate"></span>
						                </div>
						                </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Start Date
						                </label>
						                <div class="col-sm-9">
						                  <span id="startdate"></span>
						                </div>
						                </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">End Date
						                </label>
						                <div class="col-sm-9">
						                  <span id="enddate"></span>
						                </div>
						                </div>
						          </div>
						          <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Score
						                </label>
						                <div class="col-sm-9">
						                  <span id="score"></span>
						                </div>
						                </div>
						          </div>
						          <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Duration
						                </label>
						                <div class="col-sm-9">
						                  <span id="duration"></span>
						                </div>
						                </div>
						          </div>
						          
							</div>
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
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
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
							<select class="form-control" id="courseName" name="courseName">
								<option value="">Choose Course</option>
								<option>AWS</option>
								<option>devOps</option>
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
</div> -->
</body>
</html>

