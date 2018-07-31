<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/emailtemplates.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

	<div class="wrapper wrapper-content">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Email Templates</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewTemplate();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 btn-labeled bg-edit" data-toggle="modal"
									data-target="#editform" disabled onclick="editTemplateForm();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteTemplate();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="emailTemplatesDataTable"
								class="display table table-striped table-bordered table-hover"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Template Name</span></th>
										<th><span>File Name</span></th>
										<th><span>Is Active</span></th>
										<th><span></span></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
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
				<h4 class="modal-title" id="myModalLabel">Add Email Template</h4>
			</div>
			 <form class="form-horizontal" id="emailTemplateDataForm" name="emailTemplateDataForm">
		        <div class="modal-body">
		        <div class="form-group">
		            	<label for="templateName" class="col-sm-3 control-label">Name</label>
			            <div class="col-sm-9">           	
					        <input id="templateName" name="templateName" class="form-control" type="text">
					       						       			  
			          	</div>
			         </div>
			         <div class="form-group">
		            	<label for="isActive" class="col-sm-3 control-label">Name</label>
			            <div class="col-sm-9">           	
					        <select id="isActive" name="isActive" class="form-control">
					        	<option id="Y" selected="selected">Y</option>
					        	<option id="Y">N</option>
					        </select>
			          	</div>
			         </div>
		        	<div class="form-group">
		            	<label for="emailtemplate" class="col-sm-3 control-label">Choose File</label>
			            <div class="col-sm-9">           	
					        <input id="emailtemplate" name="file" type="file">
					       						       			  
			          	</div>
			         </div>
		        </div>
		        <input type="hidden" name="id" id="id" />
		      </form>
		</div>
	</div>
</div>
</body>
</html>

