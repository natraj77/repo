<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/adminstudents.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content">
       <div class="row">
	    <div class="ibox float-e-margins">
	        <div class="ibox-title">
	            <h5>Tadaay Students Data </h5>
	           <div class="ibox-tools">
					<div class="btn-group">
		              	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>                   	
		                <ul class="dropdown-menu">
		                	<li>
		                		 <button type="button"
						class="edit-btn" id="makeadminBtn" data-toggle="modal" data-target="#makeAdmin" disabled onclick="markStudentAdmin();">
						<i class="fa fa-external-link" aria-hidden="true"></i>Make a Admin
								</button> 
		                	</li>
							<li>
								<button type="button" id="verifyEduBtn" 
									class="edit-btn" data-toggle="modal" data-target="#verifyEdu" disabled onclick="showBatchPanel();">
						<i class="fa fa-graduation-cap" aria-hidden="true"></i>Verify Education
								</button> 
							</li>
							<li>
								<button type="button" id="verifyExpBtn"
									class="edit-btn"data-toggle="modal" data-target="#verifyExperience" disabled onclick="showBatchPanel();">
						<i class="fa fa-briefcase"></i>Verify Experience
								</button> 
							</li>
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
						</ul>
					</div>    
				</div> 
	        </div>
	        <div class="ibox-content">
				<table class="table table-striped table-bordered table-hover" id="adminStudentsDataTable">
					<thead>
						<tr>
							<th><input name="select_all" value="1" id="example-select-all" type="checkbox" /> </th>
							<th><span>First Name</span></th>              
							<th><span>Last Name</span></th>
							<th><span>Mobile</span></th>
							<th><span>Email</span></th>
							<th><span>Status</span></th>
							<th><span>Joined Date</span></th>
							<th><span>Last Login</span></th>
						</tr>
					</thead>
				</table> 
	        </div>
        </div>
    </div>
	</div>
	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<div class="modal fade" id="verifyEdu" tabindex="-1" role="dialog" aria-labelledby="verifyeduLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="verifyeduLabel">Verify Education</h4>
      </div>
      <form class="form-horizontal" id="verifyEducationForm" name="verifyEducationForm">
        <div class="modal-body" id="verifyEducationTable">
        	<table id="studentTable" class="table table-bordered table-hover table-responsive text-center">
	        	<thead class="text-center">
		        	<tr>
			        	<th><input type="checkbox" ></th>
			        	<th class="text-center">Degree</th>
			        	<th class="text-center">College</th>
			        	<th class="text-center">Passed Out</th>
			        	<th class="text-center">Percentage</th>
			        	<th class="text-center">Verified</th>
			        	<th class="text-center">Verified Date</th>
		        	</tr>
	        	</thead>
	        	<tbody id="leadDemoStatusTBody">
		        	<tr>
			        	<td><input type="checkbox" ></td>
			        	<td class="text-center">Btech </td>
			        	<td class="text-center">JNTU</td>
			        	<td class="text-center">2017</td>
			        	<td class="text-center">80</td>
			        	<td class="text-center">Verified</td>
			        	<td class="text-center">2018-02-22 +0530</td>
		        	</tr>
		        	<tr>
			        	<td><input type="checkbox" ></td>
			        	<td class="text-center">Btech </td>
			        	<td class="text-center">JNTU</td>
			        	<td class="text-center">2017</td>
			        	<td class="text-center">80</td>
			        	<td class="text-center"></td>
			        	<td class="text-center"></td>
		        	</tr>
	        	</tbody>
        	</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Mark Verified</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="verifyExperience" tabindex="-1" role="dialog" aria-labelledby="verifyexpLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="verifyexpLabel">Verify Education</h4>
      </div>
      <form class="form-horizontal" id="verifyExperienceForm" name="verifyExperienceForm">
        <div class="modal-body" id="verifyExperienceFormTable">
        	<table id="studentTable" class="table table-bordered table-hover table-responsive text-center">
	        	<thead class="text-center">
		        	<tr>
			        	<th><input type="checkbox" ></th>
			        	<th class="text-center">Company Name</th>
			        	<th class="text-center">Designation</th>
			        	<th class="text-center">Joined Date</th>
			        	<th class="text-center">Last date</th>
			        	<th class="text-center">Verified</th>
			        	<th class="text-center">Verified Date</th>
		        	</tr>
	        	</thead>
	        	<tbody id="leadDemoStatusTBody">
		        	<tr>
			        	<td><input type="checkbox" ></td>
			        	<td class="text-center">Polyglot It Soluitions </td>
			        	<td class="text-center">Developer</td>
			        	<td class="text-center">2018-2-22 +0530</td>
			        	<td class="text-center">2018-2-22 +0530</td>
			        	<td class="text-center">Verified</td>
			        	<td class="text-center">2018-02-22 +0530</td>
		        	</tr>
		        	<tr>
			        	<td><input type="checkbox" ></td>
			        	<td class="text-center">Polyglot It Soluitions </td>
			        	<td class="text-center">Developer</td>
			        	<td class="text-center">2018-2-22 +0530</td>
			        	<td class="text-center">2018-2-22 +0530</td>
			        	<td class="text-center"></td>
			        	<td class="text-center"></td>
		        	</tr>
	        	</tbody>
        	</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Mark Verified</button>
        </div>
      </form>
    </div>
  </div>
</div>
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
            <label for="emailtemplate" class="col-sm-3 control-label">Email Template </label>
            <div class="col-sm-9">
               <select class="form-control" id="smstemplate" name="smstemplate">
                <option value="">Choose Email Template</option>
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
          <button type="submit" class="btn btn-primary">Save</button>
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
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>

