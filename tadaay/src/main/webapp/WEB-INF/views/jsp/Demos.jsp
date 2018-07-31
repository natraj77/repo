<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/demos.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Demos</h5>
             <div class="ibox-tools">
				<button type="button" id="addBtn"
					class="btn bg-teal-400 bg-add btn-labeled" data-toggle="modal"
					onclick="addNewDemo();">
					<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
				</button>
				<div class="btn-group">
              		<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>	                	
	                     <ul class="dropdown-menu">
							<li>
								<button type="button" id="editBtn"
								class="edit-btn" data-toggle="modal" disabled onclick="showEditDemo();">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
								</button>
							</li>
							<li>
								<button type="button" id="rescheduleBtn"
								class="edit-btn" data-toggle="modal" disabled data-target="#demoReschedule">
								<i class="fa fa-calendar" aria-hidden="true"></i> Reschedule
								</button>
							</li>
							<li>
								<button type="button" id="attendeesBtn"
								class="edit-btn" data-toggle="modal" onclick="showAttendees();" disabled>
								<i class="fa fa-users" aria-hidden="true"></i> Show Attendees
								</button>
							</li>
							<li>
								<button type="button" id="cancelDemoBtn"
								class="edit-btn" onclick="cancelDemo();" disabled>
								<i class="fa fa-ban" aria-hidden="true"></i> Cancel
								</button>
							</li>
							<li>
								<button type="button" id="completedBtn"
								class="edit-btn" onclick="markDemoComplete();" disabled>
								<i class="fa fa-list" aria-hidden="true"></i> Mark Complete
								</button>
							</li>
							<li>
								<button type="button" id="archivedBtn"
								class="edit-btn" onclick="markDemoArchive();" disabled>
								<i class="fa fa-list" aria-hidden="true"></i> Mark Archive
								</button>
							</li>
						</ul>
				</div>
              	<button type="button" class="pull-right btn bg-teal-400 bg-teal-500 btn-labeled delete-row" onclick="showArchivedDemos();"><b><i class="fa fa-file-archive-o" aria-hidden="true"></i></b>Show Archive</button>
			</div>
            </div>
            <div class="ibox-content table-responsive">           
			<table id="demosDataTable" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="example-select-all" type="checkbox"
						onclick="selectAllRows();" /></th>
					<th><span>Course Name</span></th>
					<th><span>Mode</span></th>
					<th><span>Faculty</span></th>
					<th><span>Branch</span></th>
					<th><span>Demo Status</span></th> 
					<th><span>Start Date</span></th>
					<th><span>Fee</span></th>
					<th><span></span></th>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Demo</h4>
      </div>
      <form class="form-horizontal" id="demoDataForm" name="demoDataForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="courseName" class="col-sm-2 control-label">Course </label>
            <div class="col-sm-10">
              <!-- <input type="text" class="form-control" id="courseName" name="courseName"> -->
              <select class="form-control" id="courseName" name="courseName" onchange="showFacultyDemos();">
                <option value="">Choose Course</option>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label for="mode" class="col-sm-2 control-label">Mode  </label>
            <div class="col-sm-10">
              <select class="form-control" id="mode" name="mode">
                <option value="">Choose Mode</option>
                <option>Online</option>
                <option>Class Room</option>
                <option>Class Room / Online</option>
              </select>
            </div>
          </div>
             <div class="form-group">
            <label for="faculty" class="col-sm-2 control-label">Faculty   </label>
            <div class="col-sm-10">
              <select class="form-control" id="facultyName" name="facultyName">
                <option value="">Choose Faculty</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="branchName" class="col-sm-2 control-label">Branch</label>
            <div class="col-sm-10">
              <select class="form-control" id="branchName" name="branchName">
                <option value="">Choose Location</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="date" class="col-sm-2 control-label">Date & Time   </label>
            <div class="col-sm-10">
             <div class="input-group date" id="startDateSelector">
	                    <input class="form-control" type="text" id="startDate" name="startDate" autocomplete="off">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
            </div>
          </div>
          <div class="form-group">
            <label for="demoStatus" class="col-sm-2 control-label">Demo Status   </label>
            <div class="col-sm-10">
              <select class="form-control" id="demoStatus" name="demoStatus">
                <option value="-1">Choose Status</option>
                <option value="PROPOSED">PROPOSED</option>
                <option value="SCHEDULED">SCHEDULED</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="feeDiscount" class="col-sm-2 control-label">Fee </label>
            <div class="col-sm-10">
            <div id="staticParent">
				<input type="text" id="fee" name="fee" class="form-control" autocomplete="off"/>
			</div>
            </div> 
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Demo ReShedule Modal -->
<div class="modal fade" id="demoReschedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Reschedule Demo</h4>
      </div>
      <form class="form-horizontal" id="courseDataForm" name="courseDataForm">
        <div class="modal-body">
          <div class="form-group">
	            <label for="date" class="col-sm-3 control-label">New Date & Time</label>
	            <div class="col-sm-9">
	             <div class="input-group date" id="rescheduleSelector">
		                    <input class="form-control" type="text" id="rescheduleDate" name="rescheduleDate">
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
	            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn" onclick="rescheduleDemo();">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="demoattendees" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Show Invitees</h4>
      </div>
      <form class="form-horizontal" id="courseDataForm" name="courseDataForm">
        <div class="modal-body" id="studentDemoTable">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn" onclick="saveUpdateAttendees();">Attended</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="demoArchives" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Archived Demos</h4>
      </div>
      <form class="form-horizontal" id="demoArchiveForm" name="demoArchiveForm">
        <div class="modal-body" id="demoArchiveTable">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
$(document).ready(function () {
    var validator = $("#demoDataForm").validate();
    $(".close").click(function () {
        validator.resetForm();
    });
     $(".modal-footer button[type=button]").click(function () {
        validator.resetForm();
    });  
}); 
</script>
</body>
</html>

