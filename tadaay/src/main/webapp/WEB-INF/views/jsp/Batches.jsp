
<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
 <!-- <link href="../resources/assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"> -->
<script src="../resources/assets/js/batches.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Batches</h5>
             <div class="ibox-tools">
				<button type="button" id="addBtn"
					class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
					onclick="addNewBatch();">
					<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
				</button>
				<div class="btn-group">
                	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>
                    <ul class="dropdown-menu">
					<li>
						<button type="button" id="editBtn" class="edit-btn" disabled onclick="editForm();">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
						</button>
					</li>
					<li>
						<button type="button" class="edit-btn" data-toggle="modal" data-target="#renameBatchname">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Rename
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="scheduleBatchBtn" disabled data-target="#batchschedule">
						<i class="fa fa-calendar" aria-hidden="true"></i> Schedule
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="rescheduleBatchBtn" disabled data-target="#batchreshedule">
						<i class="fa fa-calendar" aria-hidden="true"></i> Reschedule
						</button>
					</li>
					<li>
						<button type="button" id="inviteesBtn"
						class="edit-btn" data-toggle="modal" onclick="showInvitees();" disabled>
						<i class="fa fa-users" aria-hidden="true"></i> Show Students
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" disabled id="cancelBatch" onclick="cancelBatch();">
						<i class="fa fa-ban" aria-hidden="true"></i> Cancel
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" disabled id="inprogressBatch" onclick="markBatchInprogress();">
						<i class="fa fa-list" aria-hidden="true"></i> mark In Progress
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" disabled id="completedBatch" onclick="markBatchComplete();">
						<i class="fa fa-list" aria-hidden="true"></i> mark Completed
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" disabled id="archivedBatch" onclick="markBatchArchive();">
						<i class="fa fa-list" aria-hidden="true"></i> mark Archive
						</button>
					</li>
				</ul>
				</div>
				<button type="button" class="pull-right btn bg-teal-400 bg-teal-500 btn-labeled delete-row" onclick="showArchivedBatches();"><b><i class="fa fa-file-archive-o" aria-hidden="true"></i></b>Show Archive</button>
			</div>
            </div>
            <div class="ibox-content table-responsive">           
				<table id="batchesDataTable" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
				   <thead>
					<tr>
						<th><input name="select_all" value="1"
							id="example-select-all" type="checkbox"
							onclick="selectAllRows();" /></th>
						<th><span>Batch Name</span></th>
						<th><span>Course Name</span></th>
						<th><span>Schedule</span></th>
						<th><span>Start Date</span></th>
						<th><span>Mode</span></th>
						<th><span>Duration</span></th> 
						<th><span>Duration type</span></th> 
						<th><span>Faculty</span></th>
						<th><span>Branch</span></th>
						<th><span>Fee</span></th>
						<th><span>Fee Discount</span></th>
						<th><span>Status</span></th>
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
        <h4 class="modal-title" id="myModalLabel">Add Batch</h4>
      </div>
      <form class="form-horizontal" id="batchDataForm" name="batchDataForm">
        <div class="modal-body">
         <div class="form-group">
            <label for="batch" class="col-sm-3 control-label">Batch Name </label>
            <div class="col-sm-9">
            	<input type="text" class="form-control" id="batchName" name="batchName" autocomplete="off">
            </div>
          </div>
          <div class="form-group">
            <label for="coursename" class="col-sm-3 control-label">Course </label>
            <div class="col-sm-9">
            	<select class="form-control" id="courseName" name="courseName" onchange="showFacultyForBatches();">
                	<option value="">Choose Course</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="mode" class="col-sm-3 control-label">Mode  </label>
            <div class="col-sm-9">
              <select class="form-control" id="mode" name="mode">
                <option value="">Choose Mode</option>
                <option>Online</option>
                <option>Class Room</option>
                <option>Class Room / Online</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="faculty" class="col-sm-3 control-label">Faculty </label>
            <div class="col-sm-9">
              <select class="form-control" id="facultyName" name="facultyName" onchange="setFacultyId(this);">
                <option value="">Choose Faculty</option>
              </select>
            </div>
          </div>
           <div class="form-group">
            <label for="mode" class="col-sm-3 control-label">Schedule</label>
            <div class="col-sm-9">
              <select class="form-control" id="schedule" name="schedule">
                <option value="">Choose Schedule</option>
                <option>Weekdays</option>
                <option>Weekends</option>
              </select>
            </div>
          </div>
           <div class="form-group">
            <label for="mode" class="col-sm-3 control-label">Duration</label>
            <div class="col-sm-9">
              <select class="form-control" id="duration" name="duration">
                <option value="">Choose Duration</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-9">
              <label class="radio-inline">
                <input type="radio" name="durationType" id="days" value="Days"> Days
              </label>
              <label class="radio-inline">
                <input type="radio" name="durationType" id="weeks" value="Weeks"> Weeks
              </label>
              <label class="radio-inline">
                <input type="radio" name="durationType" id="months" value="Months"> Months
              </label>
              <label for="durationType" style="display: none;" class="error"></label>
            </div>
          </div>
          <div class="form-group">
            <label for="branchName" class="col-sm-3 control-label">Branch   </label>
            <div class="col-sm-9">
              <select class="form-control" id="branchName" name="branchName">
                <option value="">Choose Location</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="fee" class="col-sm-3 control-label">Fee </label>
            <div class="col-sm-9">
             <input type="text" id="fee" name="fee" placeholder="Fee" class="form-control" autocomplete="off"/>
            </div>
          </div>
          <div class="form-group">
            <label for="feeDiscount" class="col-sm-3 control-label">Discount </label>
            <div class="col-sm-9">
            <div id="staticParent">
				<input type="text" id="feeDiscount" name="feeDiscount" placeholder="Discount" class="form-control" autocomplete="off"/>
			</div>
            </div> 
          </div>
          <div class="form-group">
            <label for="date" class="col-sm-3 control-label">Date & Time   </label>
            <div class="col-sm-9">
	             <div class="input-group date" id="datetimepicker1">
		          	<input class="form-control" placeholder="Date & Time" type="text" id="startDate" name="startDate">
		             <span class="input-group-addon">
		            	 <span class="glyphicon glyphicon-calendar"></span>
		             </span>
		         </div>
            </div>
          </div>
          <div class="form-group">
            <label for="status" class="col-sm-3 control-label">Status   </label>
            <div class="col-sm-9">
              <select class="form-control" id="batchStatus" name="batchStatus">
                <option value="-1">Choose Status</option>
                <option value="PROPOSED">PROPOSED</option>
                <option value="SCHEDULED">SCHEDULED</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="mode" class="col-sm-3 control-label">Class Time Daily</label>
            <div class="col-sm-9">
              <select class="form-control" id="classTime" name="classTime">
                <option value="">Choose Duration</option>
                <option value="60">60 (1 Hrs)</option>
                <option value="90">90 (1 Hrs 30 Mins)</option>
                <option value="120">120 (2 Hrs)</option>
                <option value="150">150 (2 Hrs 30 Mins)</option>
                <option value="180">180 (3 Hrs)</option>
                <option value="210">210 (3 Hrs 30 Mins)</option>
                <option value="240">240 (4 Hrs)</option>
                <option value="270">270 (4 Hrs 30 Mins)</option>
                <option value="300">300 (5 Hrs)</option>
                <option value="330">330 (5 Hrs 30 Mins)</option>
                <option value="360">360 (6 Hrs)</option>
                <option value="390">390 (6 Hrs 30 Mins)</option>
                <option value="420">420 (7 Hrs)</option>
                <option value="450">450 (7 Hrs 30 Mins)</option>
                <option value="480">480 (8 Hrs)</option>
              </select>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
          <input type="hidden" name="facultyId" id="facultyId" />
          <input type="hidden" name="courseId" id="courseId" />
          <input type="hidden" name="branchId" id="branchId" />
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Batch Shedule Modal -->
<div class="modal fade" id="batchschedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Schedule</h4>
      </div>
      <form class="form-horizontal" id="courseDataForm" name="courseDataForm">
        <div class="modal-body">
           <div class="form-group">
	            <label for="date" class="col-sm-3 control-label">Date & Time   </label>
	            <div class="col-sm-9">
	             	<div class="input-group date" id="scheduleSelector">
		         		<input class="form-control" type="text" id="rescheduleDate" name="rescheduleDate" autocomplete="off">
	                    <span class="input-group-addon">
	                    	<span class="glyphicon glyphicon-calendar"></span>
	                    </span>
		            </div>
	            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="savebtn" onclick="rescheduleBatch('SCHEDULED')">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Batch ReShedule Modal -->
<div class="modal fade" id="batchreshedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Reshedule</h4>
      </div>
      <form class="form-horizontal" id="courseDataForm" name="courseDataForm">
        <div class="modal-body">
          <div class="form-group">
	            <label for="date" class="col-sm-3 control-label">New Date & Time</label>
	            <div class="col-sm-9">
             		<div class="input-group date" id="rescheduleSelector">
	                    <input class="form-control" type="text" id="rescheduleDate1" name="rescheduleDate1">
	                    <span class="input-group-addon">	
	                    	<span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="savebtn" onclick="rescheduleBatch('');">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="batchArchives" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Archived Batches</h4>
      </div>
      <form class="form-horizontal" id="batchArchiveForm" name="batchArchiveForm">
        <div class="modal-body" id="batchArchiveTable">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="batchinvitees" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Show Students</h4>
      </div>
      <form class="form-horizontal" id="batchInviteesForm" name="batchInviteesForm">
        <div class="modal-body" id="studentBatchTable">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Register</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="renameBatchname" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Show Rename</h4>
      </div>
      <form class="form-horizontal" id="renameBatchForm" name="renameBatchForm">
        <div class="modal-body">
         <div class="form-group">
            <label for="batch" class="col-sm-3 control-label">Batch Name </label>
            <div class="col-sm-9">
            	<input type="text" class="form-control" id="renameBatchName" name="renameBatchName" autocomplete="off">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
$(document).ready(function () {
    var validator = $("#batchDataForm").validate();
    $(".close").click(function () {
        validator.resetForm();
    });
     $(".modal-footer button[type=button]").click(function () {
        validator.resetForm();
    });  
}); 
</script>
	<!-- <script type="text/javascript" src="../resources/assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="../resources/assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script> -->
</body>
</html>

