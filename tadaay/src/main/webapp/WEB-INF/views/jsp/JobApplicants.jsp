<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/jobapplicants.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/assets/css/adminjobs.css" type="text/css" rel="stylesheet"/>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Job Applicants</h5>
							<!-- <div class="ibox-tools">
							 <button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewJob();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editForm();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteJobs();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button>
							</div> -->
						</div>
						<div class="ibox-content table-responsive">
							<table id="jobApplicantsDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>First Name</span></th>
										<th><span>Last Name</span></th>
										<th><span>Position Title</span></th>
										<th><span>Received Datetime</span></th>
										<th><span>Final Result</span></th>
										<th><span></span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none;">
						           <div class="jobcontent">
							    <h2 id="panelTitle"></h2>
							    <p>Rounds</p>
							    	<div class="previewmorerounds">
							    		 <div class="row roundshead">
								           <div class="col-sm-2">
								            	<span>Quiz Name</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Assigned Date</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Status</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Score</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Cutoff</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Result</span>
								            </div>
							          	</div>
							    		<div class="row">
								           <div class="col-sm-2">
								            	<span>Aptitude</span>
								            </div>
								            <div class="col-sm-2">
								            	<span>16-02-218</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Assigned</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>30</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>30</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Qualified</span>
								            </div>
							          	</div>
							    	</div>
							    	<div class="previewmorerounds">
							    		 <div class="row roundshead">
								           <div class="col-sm-2">
								            	<span>task Name</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Assigned Date</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Status</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Score</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Cutoff</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Result</span>
								            </div>
							          	</div>
							    		<div class="row">
								           <div class="col-sm-2">
								            	<span>Aptitude</span>
								            </div>
								            <div class="col-sm-2">
								            	<span>16-02-218</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>Qualified</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>30</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>30</span>
								            </div>
								             <div class="col-sm-2">
								            	<span>40</span>
								            </div>
							          	</div>
							    	</div>
							    	 <p>Final Result : <span id="panelStatus"></span></p>
							   		 
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
<!-- <div class="modal fade" id="previewJobApplicants" tabindex="-1" role="dialog"
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
			<div class="modal-body">
			    <div class="jobcontent">
			    <h2>Associate DevOps Engineer</h2>
			    
			    <p>Rounds</p>
			    	<div class="previewmorerounds">
			    		 <div class="row roundshead">
				           <div class="col-sm-3">
				            	<span>Round Name</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>Assigned Date</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>Status</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>Result</span>
				            </div>
			          	</div>
			    		<div class="row">
				           <div class="col-sm-3">
				            	<span>Aptitude</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>07-02-2018</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>Qualified</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>40 Marks</span>
				            </div>
			          	</div>
			          	<div class="row">
				           <div class="col-sm-3">
				            	<span>Technical</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>07-02-2018</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>Not Qualified</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>30 Marks</span>
				            </div>
			          	</div>
			          	<div class="row">
				           <div class="col-sm-3">
				            	<span>Aptitude</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>07-02-2018</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>Not Qualified</span>
				            </div>
				             <div class="col-sm-3">
				            	<span>20 Marks</span>
				            </div>
			          	</div>
			          
			    	</div>
			    	 <p>Status : <span> Qualified</span></p>
			   		 
			    </div>
  			</div>
		</div>
	</div>
</div> -->
</body>
</html>
