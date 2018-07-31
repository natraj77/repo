
<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="Includes.jsp"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<script src="../resources/assets/js/admintemplates.js" type="text/javascript"></script>
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
							<h5>Manage Templates</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewCourse();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editCourse();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteCourses();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
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
										<th><span>Template Type</span></th>              
										<th><span>Template Name</span></th>
										<th><span>Active</span></th>
										<th><span>Template Content</span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none;">
						       
						       <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="templateType1" class="col-sm-4 control-label">Template Type </label>
							               <div class="col-sm-8">
							                 <span id="templateType1"></span>
							               </div>
							             </div>
							           </div>
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="templateName1" class="col-sm-4 control-label">Template Name </label>
							               <div class="col-sm-8">
							                 <div class="ui-widget">
							                   <span id="templateName1"></span>
							                 </div>
							               </div>
							             </div>
							           </div>
							         </div>
							          <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="isActive1" class="col-sm-4 control-label">Active
							               </label>
							               <div class="col-sm-8">
							                  <div class="ui-widget">
							                  <span id="isActive1"></span>
							                  </div>
							                </div>
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
<!-- Modal --><!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Template</h4>
			</div>
			 <form class="form-horizontal" id="adminCourseDataForm" name="adminCourseDataForm">
		        <div class="modal-body">
			        <div class="form-group">
			            	<label for="templateName" class="col-sm-3 control-label">Template Name</label>
				            <div class="col-sm-9">           	
						        <input id="templateName" name="templateName" placeholder="Template Name" class="form-control" type="text">
				          	</div>
				         </div>
				         <div class="form-group">
			            	<label for="templateType" class="col-sm-3 control-label">Template Type</label>
				            <div class="col-sm-9">           	
						        <select id="templateType" name="templateType" class="form-control">
						        	<option value="">Choose option</option>
						        	<option value="EVENT">Event</option>
						        	<option value="EMAIL">Email</option>
						        	<option value="NEWS">News</option>
						        	<option value="SMS">SMS</option>
						        </select>
				          	</div>
				         </div>
				         <div class="form-group">
			            	<label for="isActive" class="col-sm-3 control-label">Active</label>
				            <div class="col-sm-9">           	
						        <select id="isActive" name="isActive" class="form-control">
						        	<option value="">Choose option</option>
						        	<option value="Y">Yes</option>
						        	<option value="N">No</option>
						        </select>
				          	</div>
				         </div>
			        	<div class="form-group">
			            	<label for="templateContent" class="col-sm-3 control-label">Template Content</label>
				            <div class="col-sm-9">           	
						        <textarea id="templateContent" name="templateContent" maxlength="50000" rows="10" cols="70" class="form-control" style="height:250px;"></textarea>
				          	</div>
				         </div>
			        </div>
		        <input type="hidden" name="id" id="id" />
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		          <button type="submit" class="btn btn-primary">Save</button>
		        </div>
		   </form>
		</div>
	</div>
</div>


<div class="modal fade" id="myModalContent" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document" style="width:95% !important">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Template Content</h4>
				
			</div>
			 <div id="templateData" ></div>
		</div>
	</div>
</div>

</body>
</html>
