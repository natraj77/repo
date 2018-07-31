<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/students.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Students</h5>
             <div class="ibox-tools">
				<!-- <button type="button" id="addBtn"
					class="btn bg-teal-400 btn-labeled" data-toggle="modal"
					onclick="addNewStudent();">
					<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
				</button> -->
				<div class="btn-group">
             	 	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>                    	             	 	
	                <ul class="dropdown-menu">
					<!-- <li>
						<button type="button" id="editBtn"
						class="edit-btn" data-toggle="modal"
						data-target="#editform" disabled onclick="editStudent();">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
						</button>
					</li> -->
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="sendemailBtn" disabled data-target="#sendEmail">
						<i class="fa fa-envelope-o" aria-hidden="true"></i> Send an Email
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="sendsmsBtn" disabled data-target="#sendSms">
						<i class="fa fa-comment-o" aria-hidden="true"></i> Send SMS
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" data-toggle="modal" id="updatepayBtn" onclick="updatePaymentDtls();" disabled data-target="#updatePayment">
						<i class="fa fa-money" aria-hidden="true"></i> Update payment
						</button>
					</li>
					<li>
						<button type="button"
						class="edit-btn" id="dropStudentBtn" onclick="dropStudent();" disabled>
						<i class="fa fa-ban" aria-hidden="true"></i> Drop
						</button>
					</li>
					<li>
						<button type="button" id="assignQuizBtn" data-toggle="modal" data-target="#assignQuiz"
						class="edit-btn" disabled>
						<i class="fa fa-arrow-up" aria-hidden="true"></i> Assign Quiz
						</button>
					</li>
					<li>
						<button type="button" id="quizResultsBtn" data-toggle="modal" data-target="#quizResults"  disabled
						class="edit-btn">
						<i class="fa fa-arrow-up" aria-hidden="true"></i> Quiz Results
						</button>
					</li>
					<li>
						<button type="button" id="pushTaskBtn" data-toggle="modal" data-target="#assignTask"
						class="edit-btn" disabled>
						<i class="fa fa-list" aria-hidden="true"></i> Assign Task
						</button>
					</li>
					<li>
						<button type="button" id="TaskResultsBtn" data-toggle="modal" data-target="#taskResults"
						class="edit-btn" >
						<i class="fa fa-list" aria-hidden="true"></i> Task Results
						</button>
					</li>
					<!-- <li><button type="button" id="deleteBtn" class="delete-btn" disabled onclick="deleteStudents();">
							<i class="fa fa-trash-o" aria-hidden="true"></i> Delete
						</button></li> -->
				</ul>
				</div>             	
              	<button type="button" class="btn bg-teal-400 btn-labeled pull-right"><b><i class="fa fa-upload" aria-hidden="true"></i></b>Export</button>
			</div>
            </div>
            <div class="ibox-content table-responsive">           
			<table id="studentsDataTable" class="display table table-striped table-bordered table-hover">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="example-select-all" type="checkbox"
						onclick="selectAllRows();" /></th>
					<th><span>First Name</span></th>
					<th><span>Last Name</span></th>
					<th><span>Batch Name</span></th>
					<th><span>Mode</span></th>
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
				<h4 class="modal-title" id="myModalLabel">Add Student</h4>
			</div>
			<form class="form-horizontal" id="studentDataForm"
				name="studentDataForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="firstName" class="col-sm-3 control-label">First
							Name </label>
						<div class="col-sm-9">
							<input type="text" name="firstName" id="firstName"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-sm-3 control-label">Last
							Name </label>
						<div class="col-sm-9">
							<input type="text" name="lastName" id="lastName"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="courseName" class="col-sm-3 control-label">Course
						</label>
						<div class="col-sm-9">
							<input type="text" name="courseName" id="courseName"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="mode" class="col-sm-3 control-label">Mode </label>
						<div class="col-sm-9">
							<select class="form-control" id="mode" name="mode">
								<option>Class Room</option>
								<option>Online</option>
								<option>Both</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-sm-3 control-label">Status
						</label>
						<div class="col-sm-9">
							<select class="form-control" id="status" name="status">
								<option>ENROLLED</option>
								<option>INVITED</option>
								<option>REGISTERED</option>
							</select>
						</div>
					</div>
					<input type="hidden" name="id" id="id" />
					<input type="hidden" name="batchId" id="batchId" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="savebtn"
						onclick="saveStudent();">Save</button>
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
                <option value="">Choose SMS Tempalte</option>
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
<!-- Model Update Payment -->
<div class="modal fade" id="updatePayment" tabindex="-1" role="dialog" aria-labelledby="sendSmsLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendSmsLabel">Update payment</h4>
      </div>
      <form class="form-horizontal" id="addPaymentForm" name="addPaymentForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="tpayment" class="col-sm-3 control-label">Total Payment </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="tpayment" id="tpayment" readonly="readonly">
            </div>
          </div>
          <div class="form-group">
            <label for="tdiscount" class="col-sm-3 control-label">User Discount</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="tdiscount" id="tdiscount" autocomplete="off">
            </div>
          </div>
          <div class="form-group">
            <label for="paid" class="col-sm-3 control-label">Payment Received </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="tReceived" id="tReceived" readonly="readonly">
            </div>
          </div>
           <div class="form-group">
            <label for="paid" class="col-sm-3 control-label">paid </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="tpaid" id="tpaid" autocomplete="off" onblur="calculateBalance();">
            </div>
          </div>
           <div class="form-group">
            <label for="balance" class="col-sm-3 control-label">Balance </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="balance" id="balance" readonly="readonly">
            </div>
          </div>
           <div class="form-group">
            <label for="paymentmode" class="col-sm-3 control-label">Payment Mode </label>
            <div class="col-sm-9">
              <select class="form-control" id="paymentmode" name="paymentmode">
                <option value="">Choose Payment Mode</option>
                <option>cash</option>
                <option>Online</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="balance" class="col-sm-3 control-label">Transaction Ref(Optional) </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="transactionRef" id="transactionRef" autocomplete="off">
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
<div class="modal fade" id="assignQuiz" tabindex="-1" role="dialog" aria-labelledby="sendSmsLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendSmsLabel">Assign Quiz</h4>
      </div>
      <form class="form-horizontal" id="assignQuizForm" name="assignQuizForm">
        <div class="modal-body">
           <div class="form-group">
            <label for="quizName" class="col-sm-3 control-label">Quiz</label>
            <div class="col-sm-9">
              <select class="form-control" id="quizName" name="quizName">
                <option value="">Choose Quiz</option>
              </select>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn" >Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="assignTask" tabindex="-1" role="dialog" aria-labelledby="sendSmsLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="sendSmsLabel">Assign Task</h4>
      </div>
      <form class="form-horizontal" id="assignTaskForm" name="assignTaskForm">
        <div class="modal-body">
           <div class="form-group">
            <label for="taskName" class="col-sm-3 control-label">Tasks</label>
            <div class="col-sm-9">
              <select class="form-control" id="taskName" name="taskName">
                <option value="">Choose Task</option>
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
<div class="modal fade" id="quizResults" tabindex="-1" role="dialog" aria-labelledby="auizResults">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="auizResults">Quiz Results</h4>
      </div>
     <form class="form-horizontal" id="quizDataForm" name="quizDataForm">
        <div class="modal-body" id="QuizResultsTable">
        	<table class="table table-bordered table-hover table-responsive text-center">
	        	<thead class="text-center">
	        		<tr>
			        	<th class="text-center"><input name="select_all" value="1" type="checkbox"></th>
			        	<th class="text-center">Quiz Name</th>
			        	<th class="text-center">Start Time</th>
			        	<th class="text-center">End Time</th>
			        	<th class="text-center">Status</th>
			        	<th class="text-center">Result</th>
		        	</tr>
	        	</thead>
	        	<tbody>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">AWS</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">New</td>
			        	<td class="text-center"></td>
		        	</tr>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">DevOps</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">inprogress</td>
			        	<td class="text-center"></td>
		        	</tr>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">Linux</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">Completed</td>
			        	<td class="text-center">90%</td>
		        	</tr>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">Linux</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">Completed</td>
			        	<td class="text-center">50%</td>
		        	</tr>
	        	</tbody>
        	</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         <!--  <button type="submit" class="btn btn-primary" id="savebtn">Save</button> -->
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="taskResults" tabindex="-1" role="dialog" aria-labelledby="taskResults">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="taskResults">Task Results</h4>
      </div>
     <form class="form-horizontal" id="taskResultsDataForm" name="taskResultsDataForm">
        <div class="modal-body" id="taskResultsTable">
        	<table class="table table-bordered table-hover table-responsive text-center">
	        	<thead class="text-center">
	        		<tr>
			        	<th class="text-center"><input name="select_all" value="1" type="checkbox"></th>
			        	<th class="text-center">Task Name</th>
			        	<th class="text-center">Start Time</th>
			        	<th class="text-center">End Time</th>
			        	<th class="text-center">Status</th>
			        	<th class="text-center">Result</th>
		        	</tr>
	        	</thead>
	        	<tbody>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">AWS</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">New</td>
			        	<td class="text-center"></td>
		        	</tr>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">DevOps</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">inprogress</td>
			        	<td class="text-center"></td>
		        	</tr>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">Linux</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">Completed</td>
			        	<td class="text-center">Pass</td>
		        	</tr>
		        	<tr>
			        	<td><input name="chkbox" value="1"  type="checkbox"></td>
			        	<td class="text-center">Linux</td>
			        	<td class="text-center">26/12/2017 2:00 PM</td>
			        	<td class="text-center">26/12/2017 4:00 PM</td>
			        	<td class="text-center">Completed</td>
			        	<td class="text-center">Fail</td>
		        	</tr>
	        	</tbody>
        	</table>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Mark Pass</button>
        <button type="submit" class="btn btn-primary">Mark Fail</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         <!--  <button type="submit" class="btn btn-primary" id="savebtn">Save</button> -->
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>

