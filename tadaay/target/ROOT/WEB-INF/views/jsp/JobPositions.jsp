<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/jobpositions.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/assets/css/adminjobs.css" type="text/css" rel="stylesheet"/>
<style>
	.searchlead-title{
		font-size:14px;
	}
</style>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Job Positions</h5>
							<div class="ibox-tools">
								<div class="btn-group">
			             	 	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>                    	             	 	
				                <ul class="dropdown-menu">
									<li>
										<button type="button"
										class="edit-btn" id="editBtn" data-toggle="modal"
									data-target="#editform" disabled onclick="editForm();">
										<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn" id="activateBtn" disabled>
										<i class="fa fa-comment-o" aria-hidden="true"></i> activate
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn" id="deactivateBtn" disabled>
										<i class="fa fa-trash-o" aria-hidden="true"></i> Deactivate
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn" id="applicantsBtn" data-toggle="modal"
									data-target="#jobApplicants" disabled>
										<i class="fa fa-trash-o" aria-hidden="true"></i> Add Applicants
										</button>
									</li>
								</ul>
							</div>    
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="jobPositionsDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
											<th><span>Job ID</span></th>
										<th><span>Job Title</span></th>
										<th><span>No of Positions</span></th>
										<th><span>Created date Time</span></th>
										<th><span>Closed date Time</span></th>
										<th><span>Status</span></th>
										<th><span>Job Type</span></th>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Job Positions</h4>
			</div>
			 <form class="form-horizontal" id="jobPositionsForm" name="jobPositionsForm">
			 <div class="modal-body">
	           <div class="form-group">
		              <label for="description" class="col-sm-3 control-label">No of Positions</label>
		             <div class="col-sm-9">
	            		<input type="text" class="form-control" id="noPositions" name="noPositions" placeholder="Number of Positions">
	            	</div>
	          </div>
			<div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	          <button type="submit" class="btn btn-primary" id="formABatchBtn">Save</button>
	        </div>
	         <input type="hidden" name="id" id="id" />
	        </div>
	        </form>
		</div>
	</div>
</div>
<div class="modal fade" id="jobApplicants" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Job Applicants</h4>
			</div>
			 <form class="form-horizontal" id="jobApplicantForm" name="jobApplicantForm">
				 <div class="modal-body">
					 <div class="row searchlead-inner">
                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                    <div class="searchlead-title">
                        <span>Search Applicants</span>
                    </div>
                </div>
                 <div class="col-lg-8 col-md-5 col-sm-12 col-xs-12">
                    <div class="search-input" id="search-input">
                    	<div style="position:relative">
                    		<input type="text" size="100" id="searchApplicant" class="form-control" placeholder="Applicants . . ." autocomplete="off"> 
                    	</div>
		                 <div id="applicant-suggestion"> </div>
                    </div>
                </div>
         </div>
          				<div class="form-group">
				              <label for="description" class="col-sm-3 control-label">First Name</label>
				            <div class="col-sm-9">
				            	<input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" readonly="readonly">
				            </div>
			          </div>
			           <div class="form-group">
				              <label for="description" class="col-sm-3 control-label">Last Name</label>
				            <div class="col-sm-9">
				            	<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" readonly="readonly">
				            </div>
			          </div>
			          <div class="form-group">
				              <label for="description" class="col-sm-3 control-label">Mobile</label>
				            <div class="col-sm-9">
				            	<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile" readonly="readonly">
				            </div>
			          </div>
			          <div class="form-group">
				              <label for="description" class="col-sm-3 control-label">Email</label>
				            <div class="col-sm-9">
				            	<input type="text" class="form-control" id="email" name="email" placeholder="Email" readonly="readonly">
				            </div>
			          </div>
					<div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			          <button type="submit" class="btn btn-primary" id="formABatchBtn">Save</button>
			        </div>
			         <input type="hidden" name="jobApplicantsid" id="jobApplicantsid" />
		        </div>
	        </form>
					       
		</div>
	</div>
</div>
</body>
</html>
