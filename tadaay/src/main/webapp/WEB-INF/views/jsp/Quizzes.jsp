<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%-- <c:if test="${sessionScope.CURRENT_USER != null}" >   
	                            <c:if test="${sessionScope.CURRENT_USER.userType =='P'}" >
<jsp:include page="Includes.jsp"></jsp:include>
 </c:if>
	                             <c:if test="${sessionScope.CURRENT_USER.userType =='R'}" >
	                             <jsp:include page="RecruiterIncludes.jsp"></jsp:include>
	                              </c:if>
	                               </c:if> --%>
	                               <jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/quizzes.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Quizzes</h5>
							 <form class="form-horizontal" id="addQuizForm" name="addQuizForm">
							 <div class="col-sm-12 row form-group">	
							 	<div class="col-sm-4 no-padding">
					      	 			<input type="text" class="form-control" id="quizName" name="quizName" placeholder="Quize Name">
								 	</div>
								 	<div class="col-sm-5">
					      	 			<select class="form-control" id="duration" name="duration" >
											<option value="">Duration (Minutes)</option>
											<option>30</option>
											<option>60</option>
											<option>90</option>
											<option>120</option>
										</select>
								 	</div>
							</div>
							<div class="col-sm-12 row form-group">	
					      	 			<textarea class="form-control" id="description" name="description" placeholder="Description"></textarea>
								 	</div>
				            <div class="after-add-more" id="quizSectionDiv">
					      		<div class="col-sm-12 row form-group">	
					      	 		<div class="col-sm-4 no-padding">
					      	 			<div class="search-input">
					                    	<div class="courseposition">
					                    		<select id="courseName_0" name="courseName_0" class="form-control">
					                    			 <option value="">Choose Course</option>
					                    		</select>
					                    	</div>
					                    </div>
								 	</div>
								 	<div class="col-sm-2 no-padding">
					      	 			<select class="form-control" id="level_0" name="level_0" onChange="buildTopics();">
											<option value="">Choose Level</option>
											<option>Begginer</option>
											<option>Intermediate</option>
											<option>Advanced</option>
										</select>
								 	</div>
								 	<div class="col-sm-3">
					      	 			<select id="topic_0" name="topic_0" class="form-control" onChange="selectQuizId();">
					                    			 <option value="">Choose Topic</option>
					                    		</select>
								 	</div>
								 	
								 	<div class="col-sm-2 no-padding">
					      	 			<div class="col-sm-8 no-padding"><input type="text" class="form-control noOfQuestions" id="noQuestions_0" name="noQuestions_0" placeholder="Questions"></div>
					      	 			<div class="col-sm-4 no-padding"><input type="text" class="form-control" value="100" readonly></div>
								 	</div>
								 	<input type="hidden" id="quizId_1" name="quizId_1">
									  <div class="col-sm-1"> 
										<button class="btn btn-default add-more"  type="button" onclick="addQuestionDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
									  </div>
								</div>
							</div> 
					        <div class="text-right">
						    		<button type="btn" class="btn btn-info bg-teal-400" onclick="createNewQuiz(i);">Create</button>
						   	</div>
					        </form>
							<div class="ibox-tools">
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editForm();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteQuizzes();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="quizzesDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Name</span></th>
										<th><span>Duration</span></th>
										<th><span>Description</span></th>
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
				<h4 class="modal-title" id="myModalLabel">Edit Quiz</h4>
			</div>
			<form class="form-horizontal" id="editQuizForm" name="editQuizForm">
			<div class="modal-body">
			<div class="col-sm-12 row form-group">	
							 	<div class="col-sm-4 no-padding">
					      	 			<input type="text" class="form-control" id="quizNameEdit" name="quizNameEdit" placeholder="Quize Name">
								 	</div>
								 	<div class="col-sm-5">
					      	 			<select class="form-control" id="durationEdit" name="durationEdit" >
											<option value="">Duration (Minutes)</option>
											<option>30</option>
											<option>60</option>
											<option>90</option>
											<option>120</option>
										</select>
								 	</div>
							</div>
							<div class="col-sm-12 row form-group">	
					      	 			<textarea class="form-control" id="descriptionEdit" name="descriptionEdit" placeholder="Description"></textarea>
								 	</div>
								 	<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="savebtn"
						onclick="saveUpdateQuiz();">Save</button>
				</div>
			</div>
							 <input type="hidden" id="quizEditId" name="quizEditId">
					        </form>
		</div>
	</div>
</div>
<script>
/* $(document).ready(function() {
      $('#multicourse').multiselect({ 
        includeSelectAllOption: true,
          enableFiltering:true         
          
    });
      
}); */
var i = 1;
$(document).ready(function() {
  $(".add-more").click(function(){ 
      i=i+1;
  });
});

</script>
</body>
</html>
