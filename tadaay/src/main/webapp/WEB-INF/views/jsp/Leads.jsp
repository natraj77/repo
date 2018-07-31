<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Includes.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/autocomplete.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
<script src="../resources/assets/js/leads.js" type="text/javascript"></script>
<link href ="../resources/js/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href="../resources/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
<script src="../resources/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
<style>
.ui-autocomplete {
    z-index: 5000;
}
</style>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
          	<div class="ibox-title">
              <h5>Manage Leads</h5>
              <div class="ibox-tools">
              <button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewLead();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
              <div class="btn-group">
              	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>                   	
                <ul class="dropdown-menu">
					<li>
						<button type="button" id="editBtn"
						class="edit-btn" data-toggle="modal"
						data-target="#editform" disabled onclick="editForm();">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="formBatchBtn" data-target="#formBatch" disabled onclick="showBatchPanel();">
						<i class="fa fa-external-link" aria-hidden="true"></i> Form a Batch
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="extdemoBtn" onclick="showDemoPanel();" disabled>
						<i class="fa fa-user-plus" aria-hidden="true"></i> Add to Existing Demo
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="extBatchBtn" disabled data-target="#existingBatch">
						<i class="fa fa-user-plus" aria-hidden="true"></i> Add to Existing Batch
						</button>
					</li>
					<c:if test="${not empty sessionScope.viewContactLead}">
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="sendemailBtn" disabled data-target="#sendEmail">
						<i class="fa fa-envelope-o" aria-hidden="true"></i> Send an Email
						</button>
					</li>
					
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="sendsmsBtn" disabled data-target="#sendSms">
						<i class="fa fa-comment-o" aria-hidden="true"></i> Send an SMS
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" onclick="sendCourse();" id="sendcontentBtn" disabled>
						<i class="fa fa-file-text" aria-hidden="true"></i> Send Course Content
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" onclick="sendVideo();" id="sendVideoBtn" disabled>
						<i class="fa fa-file-video-o" aria-hidden="true"></i> Send Demo Videos
						</button>
					</li>
					</c:if>
					<li>
						<button type="button" id="invalidBtn"
						class="edit-btn" onclick="markInvalidLead();" disabled>
						<i class="fa fa-list" aria-hidden="true"></i> Mark Invalid
						</button>
					</li>
					<li class="divider"></li>
					<li><button type="button" id="deleteBtn" class="delete-btn" disabled onclick="deleteLeads();">
									<i class="fa fa-trash-o" aria-hidden="true"></i> Delete
								</button></li>
				</ul>
				</div>             	
              	<button type="button" id="exportToExcelBtn" onclick="exportLeadData();" class="btn bg-teal-400 btn-labeled pull-right"><b><i class="fa fa-upload" aria-hidden="true"></i></b>Export</button>              	
              	<button type="button" id="importExcelBtn" style="margin-right:5px;" class="btn bg-teal-400 btn-labeled pull-right"><b><i class="fa fa-table" aria-hidden="true"></i></b>Import</button>             	
              </div>
            </div>
            <!--div class="ibox-title">
              <h5>Manage Faculty</h5>
             <div class="ibox-tools">
				<button type="button" id="addBtn"
					class="btn bg-teal-400 btn-labeled" data-toggle="modal"
					data-target="#myModal">
					<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
				</button>
				<button type="button" id="editBtn"
					class="btn bg-teal-400 btn-labeled" data-toggle="modal"
					data-target="#editform" disabled onclick="editLead();">
					<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
				</button>
				<button type="button" id="deleteBtn"
					class="btn bg-teal-400 btn-labeled delete-row" disabled>
					<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
				</button>
			</div>
            </div-->
            <div class="ibox-content table-responsive">           
			<table id="leadsDataTable" class="display table table-striped table-bordered table-hover" style="width:100%;">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="example-select-all" type="checkbox"
						onclick="selectAllRows();" /></th>
					<th><span>First Name</span></th>
					<th><span>Last Name</span></th>
					<th><span>Course</span></th>
					<th><span>Mobile</span></th>
					<th><span>Email</span></th>
					<th><span>Mode</span></th>
					<th><span>Schedule</span></th>
					<th><span>Branch</span></th>
					<th><span>Preffered Time</span></th>
					<th><span>Source</span></th>
					<th><span>Comments</span></th>
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
<!-- Modal -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add lead</h4>
      </div>
      <form class="form-horizontal" id="leadDataForm" name="leadDataForm">
        <div class="modal-body">
        <div class="row searchlead-inner">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="searchlead-title">
                        <span>Search Lead</span>
                    </div>
                </div>
                 <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <div class="search-input" id="search-input">
                    	<div style="position:relative">
                    		<input type="text" size="100" id="searchLead" class="form-control" placeholder="Lead . . ." autocomplete="off"> 
                    	</div>
                        <div class="search-lead">
		                        <a href="#" class="search-now-btn" onclick="checkSelectedLead();"><i class="fa fa-search" aria-hidden="true"></i></a>
		                 </div> 
		                 <div id="lead-suggestion"> </div>
                    </div>
                </div>
         </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="firstName" class="col-sm-3 control-label">First
                  Name </label>
                <div class="col-sm-9">
                  <input class="form-control" id="firstName" name="firstName" placeholder="Name" type="text" readonly="readonly">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="lastName" class="col-sm-3 control-label">Last
                  Name </label>
                <div class="col-sm-9">
                  <input class="form-control" id="lastName" name="lastName" placeholder="Name" type="text" readonly="readonly">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="mobile" class="col-sm-3 control-label">Mobile
                </label>
                <div class="col-sm-9">
                  <input class="form-control" id="mobile" name="mobile" placeholder="Mobile" type="text" readonly="readonly">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="email" class="col-sm-3 control-label">Email
                </label>
                <div class="col-sm-9">
                  <input class="form-control" id="email" name="email" placeholder="Email" type="text" readonly="readonly">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
           <!--  <div class="col-sm-6">
              <div class="form-group">
	            <label for="courseList" class="col-sm-3 control-label">Course </label>
	            <div class="col-sm-9">
	              <input type="text" class="form-control" id="course" name="course">
	            </div>
	          </div>
            </div> -->
             <div class="col-sm-6">
              <div class="form-group">
                <label for="relatedCourses" class="col-sm-3 control-label">Course
                </label>
                <div class="col-sm-9" id="multi-select">
					<div id="addField">
					<select id="course" name="course" class="form-control"  multiple="multiple">
				    </select>
				    </div>
				    <div id="editField">
					   <input type="text" class="form-control" id="courseName" name="courseName" /> 
					   <input type="hidden" class="form-control" id="courseId" name="courseId" />
				    </div>
					<label for="course" style="display: block;" class="error"></label>
                </div>
              </div>
            </div>
             <div class="col-sm-6">
              <div class="form-group">
                <label for="mode" class="col-sm-3 control-label">Mode
                </label>
                <div class="col-sm-9">
                  <select class="form-control" id="mode" name="mode">
                    <option value="">Choose Mode</option>
                    <option>Online</option>
                    <option>Class Room</option>
                    <option>Class Room / Online</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
           	 <div class="col-sm-6">
              <div class="form-group">
                <label for="branchName" class="col-sm-3 control-label">Branch
                </label>
                <div class="col-sm-9">
                  <select class="form-control" id="branchName" name="branchName">
                   <option value="">Choose Branch</option>
                   </select>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="schedule" class="col-sm-3 control-label">Schedule
                </label>
                <div class="col-sm-9">
                  <select id="schedule" name="schedule" class="form-control">
                    <option value="">Choose Schedule</option>
                    <option>Weekend</option>
                    <option>Weekdays</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="preferredTimeStart" style="padding: 0;" class="col-sm-3 control-label">Preferred
                  Start Time </label>
                <div class="col-sm-9">
                  <input class="form-control" placeholder="Preferred Start Time" id="preferredTimeStart" name="preferredTimeStart" type="text">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="preferredTimeEnd" style="padding: 0;" class="col-sm-3 control-label">Preferred End Time </label>
                <div class="col-sm-9">
                  <input class="form-control" placeholder="Preferred End Time" id="preferredTimeEnd" name="preferredTimeEnd" type="text">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="source" class="col-sm-3 control-label">Source
                </label>
                <div class="col-sm-9">
                  <input class="form-control" id="source" name="source" placeholder="Source" type="text" autocomplete="off">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="comments" class="col-sm-3 control-label">Comments
                </label>
                <div class="col-sm-9">
                  <textarea class="form-control" id="comments" name="comments" placeholder="Comments"></textarea>
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
          <input type="hidden" name="userId" id="userId" />
          </div>	
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Form a Batch Modal -->
<div class="modal fade" id="formBatch" tabindex="-1" role="dialog" aria-labelledby="formBatchLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="formBatchLabel">Form a Batch</h4>
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
            	<select class="form-control" id="batchCourseName" name="batchCourseName">
                	<option value="">Choose Course</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="modeList" class="col-sm-3 control-label">Mode  </label>
            <div class="col-sm-9">
              <select class="form-control" id="modeList" name="modeList">
                <option value="">Choose Mode</option>
                <option>Online</option>
                <option>Class Room</option>
                <option>Both</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="branchList" class="col-sm-3 control-label">Branch   </label>
            <div class="col-sm-9">
              <select class="form-control" id="batchBranchName" name="batchBranchName">
                <option value="">Choose Location</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="batchSchedule" class="col-sm-3 control-label">Schedule</label>
            <div class="col-sm-9">
              <select class="form-control" id="batchSchedule" name="batchSchedule">
                <option value="">Choose Schedule</option>
                <option>Weekdays</option>
                <option>Weekend</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="date" class="col-sm-3 control-label">Date & Time   </label>
            <div class="col-sm-9">
	             <div class="input-group date" id="datetimepicker1">
		          	<input class="form-control" placeholder="Date & Time" type="text" id="date">
		             <span class="input-group-addon">
		            	 <span class="glyphicon glyphicon-calendar"></span>
		             </span>
		         </div>
            </div>
          </div>
          <div class="form-group">
            <label for="faculty" class="col-sm-3 control-label">Faculty   </label>
            <div class="col-sm-9">
              <select class="form-control" id="batchFacultyName" name="batchFacultyName">
                <option value="">Choose Faculty</option>
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
            <label for="fee" class="col-sm-3 control-label">Fee </label>
            <div class="col-sm-9">
             <input type="text" id="fee" name="fee" placeholder="Fee" class="form-control" autocomplete="off"/>
            </div>
          </div>
          <div class="form-group">
            <label for="feeDiscount" class="col-sm-3 control-label">Discount </label>
            <div class="col-sm-9">
            <div id="staticParent">
				<input type="text" id="feeDiscount" name="feeDiscount" placeholder="Discount" class="form-control" autocomplete="off" />
			</div>
            </div> 
          </div>
          <div class="form-group">
            <label for="status" class="col-sm-3 control-label">Status   </label>
            <div class="col-sm-9">
              <select class="form-control" id="status" name="status">
                <option value="">Choose Status</option>
                <option>Proposed</option>
                <option>Scheduled</option>
              </select>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="formABatchBtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Model Existing Batch -->
<!-- Modal -->
<div class="modal fade" id="existingBatch" tabindex="-1" role="dialog" aria-labelledby="existingBatchLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="existingBatchLabel">Add to Existing batch</h4>
      </div>
      <form class="form-horizontal" id="existingBatchForm" name="existingBatchForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="batch" class="col-sm-2 control-label">Batch </label>
            <div class="col-sm-10">
              <select class="form-control" id="existingBatchesBatch" name="existingBatchesBatch">
                <option value="">Choose Batch</option>
              </select>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn" onclick="addToExistingBatch();">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Model Send an Email -->
<div class="modal fade" id="sendEmail" tabindex="-1" role="dialog" aria-labelledby="sendEmailLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendEmailLabel">Send Email</h4>
      </div>
      <form class="form-horizontal" id="addemailForm" name="addemailForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="emailtemplate" class="col-sm-3 control-label">Email Content </label>
            <div class="col-sm-9">
              <textarea class="form-control" id="emailContent" name="emailContent" placeholder="emailContent" maxlength="256"></textarea>
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
<!-- Model Send SMS -->
<div class="modal fade" id="sendSms" tabindex="-1" role="dialog" aria-labelledby="sendSmsLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendSmsLabel">Add SMS Template</h4>
      </div>
      <form class="form-horizontal" id="addsmsForm" name="addsmsForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="smstemplate" class="col-sm-3 control-label">SMS Template </label>
            <div class="col-sm-9">
              <select class="form-control" id="smstemplate" name="smstemplate">
                <option value="">Choose SMS Template</option>
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
<div class="modal fade" id="sendCourseContent" tabindex="-1" role="dialog" aria-labelledby="sendcourseLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendcourseLabel">Send Course Content</h4>
      </div>
      <form class="form-horizontal" id="sendcourseForm" name="addsmsForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="couseContent" class="col-sm-2 control-label">Send Course Content</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="couseContent" name="couseContent">
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
<div class="modal fade" id="sendDemoVideo" tabindex="-1" role="dialog" aria-labelledby="sendDemoLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendDemoLabel">Send Demo Video</h4>
      </div>
      <form class="form-horizontal" id="sendDemoForm" name="addDemoForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="smstemplate" class="col-sm-2 control-label">Send Demo Video</label>
            <div class="col-sm-10">
              <input type="text" id="demoVideo" name="demoVideo" class="form-control">
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
<!-- Modal -->
<div class="modal fade" id="existingDemo" tabindex="-1" role="dialog" aria-labelledby="existingDemoLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="existingDemoLabel">Add to Existing Demo</h4>
      </div>
      <form class="form-horizontal" id="existingDemoForm" name="existingDemoForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="batch" class="col-sm-2 control-label">Demo </label>
            <div class="col-sm-10">
              <select class="form-control" id="existingDemosDemo" name="existingDemosDemo">
                <option value="">Choose Demo</option>
              </select>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn" onclick="addLeadToDemo();">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
 <script>    
    $(document).ready(function () {
        var validator = $("#leadDataForm").validate();
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

