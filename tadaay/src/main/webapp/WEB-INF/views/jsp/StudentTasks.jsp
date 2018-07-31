<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="Includes.jsp"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<script src="../resources/assets/js/studenttasks.js" type="text/javascript"></script>
<link href ="../resources/js/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href ="../resources/css/jquery.datetimepicker.css" rel="stylesheet">
<script src="../resources/assets/js/jquery.datetimepicker.full.min.js" type="text/javascript"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Tasks</h5>
							<div class="ibox-tools">
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="completeTasks();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Complete
								</button>
							</div>
						</div>
						<div class="ibox-content">
							<table class="table table-striped table-bordered table-hover"
								id="adminCoursesDataTable">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" />  </th>
										<th><span>Task Name</span></th>              
										<th><span>Assigned By</span></th>
										<th><span>Assigned Date</span></th>
										<th><span>Start Date</span></th>
										<th><span>End Date</span></th>
										<th><span>Status</span></th>
										<th><span>Result</span></th>
										<th><span>Preview</span></th>
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
<div class="modal fade" id="myModalContent" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Course Content</h4>
				
			</div>
			<div class="modal-body">
				 <div id="courseData">
				 	<iframe src="" id="courseFrameContent" style="width:100%;height:100%;"></iframe>
				 </div>
			 </div>
		</div>
	</div>
</div>
</body>
</html>
