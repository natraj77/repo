<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/editor.js"></script>
<script src="../resources/assets/js/jobdescription.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/assets/css/editor.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/assets/css/adminjobs.css" type="text/css" rel="stylesheet"/>
<style>
	.Editor-editor{
		height:150px;
	}
	#jobDescDataTable_filter input{
		margin-bottom:0px;
	}
</style>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Job Descriptions</h5>
							<div class="ibox-tools">
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
								<button type="button" id="createBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#createNewHire" disabled>
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Create New position
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="jobDescDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Job Title</span></th>
										<th><span>Job Description</span></th>
										<th><span>Role</span></th>
										<th><span>Skills</span></th>
										<th><span>Min Experience</span></th>
										<th><span>Max Experience</span></th>
										<th><span>Round Name</span></th>
										<th><span>Cutoff</span></th>
										<th><span>Preview</span></th>
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
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Job Description</h4>
			</div>
			 <form class="form-horizontal" id="jobDescriptionForm" name="jobDescriptionForm">
			 <div class="modal-body">
							 <div class="form-group">
					            <label for="jobTitle" class="col-sm-2 control-label">Job Title :</label>
					            <div class="col-sm-10">
					            <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="Job Title">
					            </div>
					          </div>
					          <div class="row form-group">
					          	  <label for="hireType" class="col-sm-2 control-label">Hire Type :</label>
					          	  <div class="col-lg-10">
						          	  <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
						          	  		<select class="form-control" id="hireType" name="hireType">
												<option value="">Choose</option>
												<option> Full time</option>
												<option> Part time</option>
												<option>contract to hire</option>
											</select>
										</div>
										<!-- <div class="col-lg-7 col-md-6 col-sm-6">
										  <label for="jobTile" class="col-sm-4 control-label">Hire Mode :</label>
										   <div class="col-sm-8">
										<select class="form-control" id="hireType" name="hireType">
										<option value="">Choose</option>
										<option>permanent</option>
										<option>contract to hire</option>
									</select>
									</div>
										</div> -->
					          	  </div>
					          </div>
					           <div class="row">
					          		<label for="jobTile" class="col-sm-2 control-label">Salary in LPA:</label>
						          	 <div class="col-sm-5">
							           <div class="form-group">
								            <div class="col-sm-12">
								            	<input type="text" placeholder="Min" class="form-control" id="minSalay" name="minSalary">
								            </div>
							          </div>
						          	</div>
						          	 <div class="col-sm-5">
							           <div class="form-group">
								            <div class="col-sm-12">
								            <input type="text" placeholder="Max" class="form-control" id="maxSalay" name="maxSalary">
								            </div>
							          </div>
						          	</div>
						       </div>
					           <div class="form-group">
						              <label for="description" class="col-sm-2 control-label">Job Description :</label>
						            <div class="col-sm-10">
						            	<textarea id="description" name="description" placeholder="Job Description"></textarea>
						            </div>
					          </div>
					            <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Roles &amp; Responsibilities :</label>
						            <div class="col-sm-10">
						            	<textarea id="jobRole" name="jobRole" placeholder="Roles &amp; Responsibilities"></textarea>
						            </div>
					          </div>
					          <div class="row">
					          		<label for="jobTile" class="col-sm-2 control-label">Experience in Years:</label>
						          	 <div class="col-sm-5">
							           <div class="form-group">
								            <div class="col-sm-12">
								            	<select class="form-control" id="minExperience" name="minExperience">
													<option value="">Min</option>
													<option>0</option>
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
													<option>11</option>
													<option>12</option>
													<option>13</option>
													<option>14</option>
													<option>15</option>
													<option>16</option>
													<option>17</option>
													<option>18</option>
													<option>19</option>
													<option>20</option>
													<option>21</option>
													<option>22</option>
													<option>23</option>
													<option>24</option>
													<option>25</option>
													<option>26</option>
													<option>27</option>
													<option>28</option>
													<option>29</option>
													<option>30</option>
													
												</select>
								            </div>
							          </div>
						          	</div>
						          	 <div class="col-sm-5">
							           <div class="form-group">
								            <div class="col-sm-12">
								            	<select class="form-control" id="maxExperience" name="maxExperience">
											<option value="">Max</option>
											<option>0</option>
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
													<option>11</option>
													<option>12</option>
													<option>13</option>
													<option>14</option>
													<option>15</option>
													<option>16</option>
													<option>17</option>
													<option>18</option>
													<option>19</option>
													<option>20</option>
													<option>21</option>
													<option>22</option>
													<option>23</option>
													<option>24</option>
													<option>25</option>
													<option>26</option>
													<option>27</option>
													<option>28</option>
													<option>29</option>
													<option>30</option>
										</select>
								            </div>
							          </div>
						          	</div>
						       </div>
					          <div class="row">
					          <label class="col-sm-2 control-label">Course :</label>
					           <div class="col-sm-10">
					           	<div class="after-add-more" id="jobDescSectionDiv">
						      		<div class="row form-group">	
						      	 		<div class="col-sm-8">
						      	 		 <div class="form-group">
							      	 		 <div class="col-sm-12">
							      	 			<div class="search-input">
							                    	<div class="courseposition">
							                    		<input type="text" class="form-control" id="search-box" placeholder="Course">
							                    		 <div class="skillresultdiv" id="suggesstion-box"></div>
							                    	</div>
							                    </div>
							                 </div>
							                 </div>
									 	</div>
									 	<div class="col-sm-3">
									 	 <div class="form-group">
										 	<div class="col-sm-12">
							      	 			<select class="form-control" id="level" name="level">
													<option value="">Choose Level</option>
													<option>Beginner</option>
													<option>Intermediate</option>
													<option>Advanced</option>
												</select>
											</div>
											</div>
									 	</div>
									 	<input type="hidden" id="jobDescId_1" name="jobDescId_1">
										  <div class="col-sm-1"> 
											<button class="btn btn-default add-more"  type="button" onclick="addJobDescDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
										  </div>
									</div>
								</div> 
					           </div>
							</div>
							<div class="row">
						            <label for="jobRole" class="col-sm-2 control-label">Quiz :</label>
						             <div class="col-sm-10">
								<div class="after-add-quiz" id="quizSectionDiv">
							          	<div class="row form-group">
							          	 <div class="col-sm-6">
									           <div class="form-group">
										            <div class="col-sm-12">
										            	<select class="form-control" id="quiz" name="quiz">
															<option value="">Quiz</option>
															<option>Linux</option>
															<option>Aws</option>
															<option>Devops</option>
														</select>
										            </div>
									          </div>
								          	</div>
								          	 <div class="col-sm-5">
									           <div class="form-group">
										            <div class="col-sm-12">
										            	<input type="text" class="form-control" id="quizCutOff" name="quizCutOff" placeholder="Cutoff">
										            </div>
									          </div>
								          	</div>
							          	<input type="hidden" id="quizId_1" name="quizId_1">
							           <div class="col-sm-1">
									          <button class="btn btn-default add-more"  type="button" onclick="addQuizDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
							          </div>
							          	</div> 
						          </div>
					          </div>
							</div>
							<div class="row">
						            <label for="jobRole" class="col-sm-2 control-label">Task :</label>
						             <div class="col-sm-10">
								<div class="after-add-task" id="taskSectionDiv">
							          	<div class="row form-group">
							          	<div class="col-sm-6">
								           <div class="form-group">
									            <div class="col-sm-12">
									            	<select class="form-control" id="task" name="task">
														<option value="">Task</option>
														<option>Linux</option>
															<option>Aws</option>
															<option>Devops</option>
													</select>
									            </div>
								          </div>
							          </div>
							           <div class="col-sm-5">
								           <div class="form-group">
									            <div class="col-sm-12">
									            	<input type="text" class="form-control" id="taskCutOff" name="taskCutOff" placeholder="Cutoff">
									            </div>
								          </div>
							          </div>
							          	<input type="hidden" id="taskId_1" name="taskId_1">
							           <div class="col-sm-1">
									          <button class="btn btn-default add-more"  type="button" onclick="addTaskDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
							          </div>
							          	</div> 
						          </div>
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
<div class="modal fade" id="previewJobDesc" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
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
			    <p>Experience : <span>0 - 2 years</span></p>
			    
			    <p>Job Description</p>
			    	<ul>
			  		 <li> Interacting with customers to understand the requirement and serve the project requirement.</li>
					<li>Migrating applications from on-premise to cloud.</li>
					<li>Monitoring applications hosted on Cloud.</li>
					<li>Strong individual player or a team member.</li>
					<li>Working as part of Cloud &amp; DevOps team</li> 
					<li>Flextible to work in 24x7 support environment.</li>
			    </ul>
			    	<p>Roles &amp; Responsibilities</p>
			    	<ul>
			  		 <li> Interacting with customers to understand the requirement and serve the project requirement.</li>
					<li>Migrating applications from on-premise to cloud.</li>
					<li>Monitoring applications hosted on Cloud.</li>
					<li>Strong individual player or a team member.</li>
					<li>Working as part of Cloud &amp; DevOps team</li> 
					<li>Flextible to work in 24x7 support environment.</li>
			    </ul>
			    <p>Courses</p>
			    	<div class="previewmoreskills">
			    	<div class="row roundshead">
				           <div class="col-sm-4">
				            	<span>Course</span>
				            </div>
				            <div class="col-sm-4">
				            	<span>years</span>
				            </div>
				             <div class="col-sm-4">
				            	<span>Level</span>
				            </div>
			          </div>
			    		<div class="row">
				           <div class="col-sm-4">
				            	<span>AWS solution Architect associate</span>
				            </div>
				            <div class="col-sm-4">
				            	<span>2 years</span>
				            </div>
				             <div class="col-sm-4">
				            	<span>Beginner</span>
				            </div>
			          </div>
			          <div class="row">
				           <div class="col-sm-4">
				            	<span>Linux</span>
				            </div>
				            <div class="col-sm-4">
				            	<span>2 years</span>
				            </div>
				             <div class="col-sm-4">
				            	<span>Beginner</span>
				            </div>
			          </div>
			          <div class="row">
				           <div class="col-sm-4">
				            	<span>AWS</span>
				            </div>
				            <div class="col-sm-4">
				            	<span>2 years</span>
				            </div>
				             <div class="col-sm-4">
				            	<span>Beginner</span>
				            </div>
			          </div>
			          <div class="row">
				           <div class="col-sm-4">
				            	<span>AWS</span>
				            </div>
				            <div class="col-sm-4">
				            	<span>2 years</span>
				            </div>
				             <div class="col-sm-4">
				            	<span>Beginner</span>
				            </div>
			          </div>
			    	</div>
			    <p>Rounds</p>
			    	<div class="previewmorerounds">
			    	<div class="row roundshead">
				           <div class="col-sm-4">
				            	<span>Quiz</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>Cutoff</span>
				            </div>
			          	</div>
			    		<div class="row">
				           <div class="col-sm-4">
				            	<span>Aptitude</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>40 Marks</span>
				            </div>
			          	</div>
			          	<div class="row">
				           <div class="col-sm-4">
				            	<span>Aptitude</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>40 Marks</span>
				            </div>
			          	</div>
			          	<div class="row">
				           <div class="col-sm-4">
				            	<span>Aptitude</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>40 Marks</span>
				            </div>
			          	</div>
			          	<div class="row roundshead">
				           <div class="col-sm-4">
				            	<span>Task</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>Cutoff</span>
				            </div>
			          	</div>
			          	<div class="row">
				           <div class="col-sm-4">
				            	<span>Aptitude</span>
				            </div>
				            <div class="col-sm-3">
				            	<span>40 Marks</span>
				            </div>
			          	</div>
			          
			    	</div>
			   		 
			    </div>
  			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="createNewHire" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Create New Hire</h4>
			</div>
			 <form class="form-horizontal" id="jobPositionsForm" name="jobPositionsForm">
			 <div class="modal-body">
	           <div class="form-group">
		              <label for="description" class="col-sm-3 control-label">No of Positions</label>
		             <div class="col-sm-9">
	            		<input type="text" class="form-control" id="noPositions" name="noPositions" placeholder="Number of Positions">
	            	</div>
	          </div>
	            <div class="form-group">
		              <label for="description" class="col-sm-3 control-label">Posting Type</label>
		             <div class="col-sm-9">
	            		<select class="form-control" id="postingType" name="postingType">
							<option value="">Choose</option>
							<option>Regular</option>
							<option> Walkin</option>
							<option>Hot</option>
						</select>
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
		<script>
			$(document).ready(function() {
				$("#description").Editor();
				$("#jobRole").Editor();
				  var validator = $("#jobDescriptionForm").validate();
				    $(".close").click(function () {
				        validator.resetForm();
				    });
				    var contentValidator = $("#jobDescriptionForm").validate();
				    $(".close").click(function () {
				    	contentValidator.resetForm();
				    });
				     $(".modal-footer button[type=button]").click(function () {
				        validator.resetForm();
				    });  
			});
			
		</script>
</body>
</html>
