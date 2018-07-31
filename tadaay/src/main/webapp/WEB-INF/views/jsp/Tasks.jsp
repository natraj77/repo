<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/editor.js"></script>
<script src="../resources/assets/js/tasks.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<link href="<%=request.getContextPath()%>/resources/assets/css/editor.css" type="text/css" rel="stylesheet"/>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Tasks</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 bg-add btn-labeled" data-toggle="modal"
									onclick="addNewTask();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<div class="btn-group">
			              		<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>	                	
				                     <ul class="dropdown-menu">
										<li>
											<button type="button" id="editBtn"
											class="edit-btn" data-toggle="modal" disabled onclick="editForm();">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
											</button>
										</li>
										<li>
											<button type="button" id="deleteBtn"
											class="edit-btn" onclick="deleteTasks();" disabled>
											<i class="fa fa-trash-o" aria-hidden="true"></i> Delete
											</button>
										</li>
										<li>
											<button type="button" id="studentBtn"
											class="edit-btn" data-toggle="modal" data-target="#assignstudent" disabled onclick="buildStudentList();">
											<i class="fa fa-graduation-cap" aria-hidden="true"></i> Asssign to Student
											</button>
										</li>
										<li>
											<button type="button" id="batchBtn"
											class="edit-btn" data-toggle="modal" data-target="#assignbatch" disabled onclick="buildBatchList();">
											<i class="fa fa-users" aria-hidden="true"></i> Asssign to Batch
											</button>
										</li>
									</ul>
							</div>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="tasksDataTable"
								class="display table table-striped table-bordered table-hover"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Task Name</span></th>
										<th><span>Show Content</span></th>
									</tr>
								</thead>
							</table>
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
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Task</h4>
			</div>
			<form class="form-horizontal" id="branchDataForm"
				name="branchDataForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Task Name
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="taskName" name="taskName"
								placeholder="Task Name" required="required" onchange="validateTaskName(this)" />
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Task Description
						</label>
						<div class="col-sm-9">
						<textarea class="form-control" id="taskDescription" name="taskDescription" 
							placeholder="Task Description" maxlength="128"></textarea>
						</div>
					</div>
					<!-- <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">File
						</label>
						<div class="col-sm-9">
							<input id="file-task" name="file" type="file" multiple="multiple" /> 
						</div>
					</div> -->
				</div>
				<input type="hidden" name="id" id="id" />
				<input type="hidden" name="fileName" id="fileName" />
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="saveBtn" onclick="saveUpdateTask()">Save</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="assignstudent" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Select Student</h4>
			</div>
			<form class="form-horizontal" id="sudenttaskForm"
				name="quizeDataForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="courseName" class="col-sm-3 control-label">Student Name
						</label>
						<div class="col-sm-9">
							<select id="studentList" multiple="multiple" class="form-control">
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" name="id" id="id" />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="assignTasksToStudent" onclick="assignTasksToStudents();">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="assignbatch" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Select Batch</h4>
			</div>
			<form class="form-horizontal" id="batchtaskForm"
				name="batchtaskForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="courseName" class="col-sm-3 control-label">Batch Name
						</label>
						<div class="col-sm-9">
							<select id="batchList" multiple="multiple" class="form-control">
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" name="id" id="id" />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="assignTaskToBatch" onclick="assignTasksToBatches();">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="previewTask" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Preview Result</h4>
			</div>
			<div class="container">
    <div class="task-content">
    </div>
  </div>
		</div>
	</div>
</div>
<script>
			$(document).ready(function() {
				$("#taskDescription").Editor();
			});
			
		</script>
</body>
</html>

