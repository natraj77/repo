<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/editor.js"></script>
<script src="../resources/assets/js/adminQuizQuestions.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/assets/css/editor.css" type="text/css" rel="stylesheet"/>
<style>
	.Editor-editor{
		height:150px;
	}
	#jobDescDataTable_filter input{
		margin-bottom:0px;
	}
	input[type="search"]{
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
							<h5>Manage Quiz Questions</h5>
							<div class="ibox-tools">
							 <button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewQuestion();">
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
								 <button type="button" id="importExcelData" class="btn bg-teal-400 btn-labeled pull-right" onclick="importInvites();">
		              <b><i class="fa fa-table" aria-hidden="true"></i></b>Import</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="quizQuestionsTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Course</span></th>
										<th><span>Topic</span></th>
										<th><span>Level</span></th>
										<th><span>Question</span></th>
										<th><span>Option1</span></th>
										<th><span>Option2</span></th>
										<th><span>Option3</span></th>
										<th><span>Option4</span></th>
										<th><span>Option5</span></th>
										<th><span>Option6</span></th>
										<th><span>Corect Answer</span></th>
										<th><span></span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none;">
						           <div class="form-group">
						              <div class="row">
							                <label for="source" class="col-sm-2 control-label">Course Name
							                </label>
							                <div class="col-sm-10">
							                  <span id="panelcourseName"></span>
							                </div>
						               </div>
						          	</div>
						          <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Topic
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelTopic"></span>
						                </div>
						                </div>
						          </div>
						           <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Level
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelLevel"></span>
						                </div>
						                </div>
						          </div>
						          <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Option1
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelOption1"></span>
						                </div>
						                </div>
						          </div>
						           <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Option2
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelOption2"></span>
						                </div>
						                </div>
						          </div>
						           <div class="form-group">
						              <div class="form-group">
						                <label for="source" class="col-sm-2 control-label">Option3
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelOption3"></span>
						                </div>
						                </div>
						          </div>
						           <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Option4
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelOption4"></span>
						                </div>
						                </div>
						          </div>
						           <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Option5
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelOption5">: </span>
						                </div>
						                </div>
						          </div>
						          <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Option6
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelOption6"> </span>
						                </div>
						                </div>
						          </div>
						          <div class="form-group">
						              <div class="row">
						                <label for="source" class="col-sm-2 control-label">Correct Answer
						                </label>
						                <div class="col-sm-10">
						                  <span id="panelCorrectAnswer"> </span>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Quiz Questions</h4>
			</div>
			 <form class="form-horizontal" id="quizQuestionsForm" name="quizQuestionsForm">
			 <div class="modal-body">
							 <div class="form-group">
					            <label for="courseName" class="col-sm-2 control-label">Course Name :</label>
					            <div class="col-sm-10">
					             <input type="text" class="form-control" id="coursename" name="coursename" autocomplete="off"> 
						            <div id="course-box" class="trainer-courses"></div>
					            </div>
					          </div>
					          <div class="row">
					             <div class="col-sm-6">
					              <div class="form-group">
					                <label for="topic" class="col-sm-4 control-label">Topic :</label>
					                <div class="col-sm-8">
							             <select class="form-control" id="topic" name="topic">
												<option value="">Choose</option>
												<option>RDS</option>
												<option>EDS</option>
											</select>
					                </div>
					              </div>
					            </div>
					             <div class="col-sm-6">
					              <div class="form-group">
					                 <label for="level" class="col-sm-4 control-label">Level :</label>
					                <div class="col-sm-8">
					                <select class="form-control" id="level" name="level">
												<option value="">Choose</option>
												<option>Beginner</option>
												<option>Intermediate</option>
												<option>Advanced</option>
											</select>
					                </div>
					              </div>
					            </div>
					          </div>
					           <div class="form-group">
						              <label for="description" class="col-sm-2 control-label">Question:</label>
						            <div class="col-sm-10">
						            	<textarea id="question" name="question"></textarea>
						            </div>
					          </div>
					            <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Opions 1 :</label>
						            <div class="col-sm-10">
						            	<input type="text" id="option1" name="option1" class="form-control">
						            </div>
					          </div>
					          <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Opions 2 :</label>
						            <div class="col-sm-10">
						            	<input type="text" id="option2" name="option2" class="form-control">
						            </div>
					          </div>
					          <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Opions 3 :</label>
						            <div class="col-sm-10">
						            	<input type="text" id="option3" name="option3" class="form-control">
						            </div>
					          </div>
					          <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Opions 4 :</label>
						            <div class="col-sm-10">
						            	<input type="text" id="option4" name="option4" class="form-control">
						            </div>
					          </div>
					          <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Opions 5 :</label>
						            <div class="col-sm-10">
						            	<input type="text" id="option5" name="option5" class="form-control">
						            </div>
					          </div>
					          <div class="form-group">
						           <label for="jobRole" class="col-sm-2 control-label">Opions 6 :</label>
						            <div class="col-sm-10">
						            	<input type="text" id="option6" name="option6" class="form-control">
						            </div>
					          </div>
					              <div class="form-group">
					                <label for="isActive" class="col-sm-2 control-label">Correct Answer
					                </label>
					                <div class="col-sm-10">
							              <label class="radio-inline">
					                <input type="checkbox" name="one" id="one" value="1"> Option1
					              </label>
					              <label class="radio-inline">
					                <input type="checkbox" name="two" id="two" value="2"> Option2
					              </label>
					               <label class="radio-inline">
					                <input type="checkbox" name="three" id="three" value="3"> Option3
					              </label>
					               <label class="radio-inline">
					                <input type="checkbox" name="four" id="four" value="4"> Option4
					              </label>
					               <label class="radio-inline">
					                <input type="checkbox" name="five" id="five" value="5"> Option5
					              </label>
					               <label class="radio-inline">
					                <input type="checkbox" name="six" id="six" value="6"> Option6
					              </label>
					              <label for="featuredCourse" style="display: block;" class="error"></label>
					                </div>
					              </div>
							<div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					          <button type="submit" class="btn btn-primary" id="addQuestionBtn">Save</button>
					        </div>
					         <input type="hidden" name="id" id="id" />
					        </div>
					        </form>
					       
		</div>
	</div>
</div>
		<script>
			$(document).ready(function() {
				$("#question").Editor();
				  var validator = $("#quizQuestionsForm").validate();
				    $(".close").click(function () {
				        validator.resetForm();
				    });
				    var contentValidator = $("#quizQuestionsForm").validate();
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
