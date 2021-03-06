<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/branches.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Branches</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 bg-add btn-labeled" data-toggle="modal"
									onclick="addNewBranch();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editForm();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteBranches();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="branchesDataTable"
								class="display table table-striped table-bordered table-hover"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Branch Name</span></th>
										<th><span>Address</span></th>
										<th><span>Contact</span></th>
										<th><span>City</span></th>
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
				<h4 class="modal-title" id="myModalLabel">Add Branch</h4>
			</div>
			<form class="form-horizontal" id="branchDataForm"
				name="branchDataForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Branch Name
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Branch Name" required="required" autocomplete="off"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Address
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="addressLine1"
								name="addressLine1" placeholder="Flat" autocomplete="off"/> <input type="text"
								class="form-control" id="addressLine2" name="addressLine2"
								placeholder="Apartment" style="margin-top: 10px;" autocomplete="off"/> <input
								type="text" class="form-control" id="location"
								name="location" placeholder="Area" style="margin-top: 10px;" autocomplete="off"/>
						</div>
					</div>
					<div class="form-group">
						<label for="city" class="col-sm-3 control-label">City
						</label>
						<div class="col-sm-9">
							<select class="form-control" id="city" name="city">
								<option value="">Choose City</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-3 control-label">State
						</label>
						<div class="col-sm-9">
							<select class="form-control" id="state" name="state">
								<option value="">Choose State</option>
								<option>Telangana</option>
								<option>Andhra Pradesh</option>
								<option>Tamilnadu</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="pinCode" class="col-sm-3 control-label">Pin
							Code </label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="pinCode"
								name="pinCode" placeholder="Pin Code" required="required" autocomplete="off"/>
						</div>
					</div>
					<div class="form-group">
						<label for="mobile" class="col-sm-3 control-label">Contacts
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="contactName"
								name="contactName" placeholder="Name" autocomplete="off"/> <input type="text"
								class="form-control" id="mobile" name="mobile"
								placeholder="Mobile" style="margin-top: 10px;" autocomplete="off"/> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="E-mail" style="margin-top: 10px;" autocomplete="off"/>
						</div>
					</div>
				</div>
				<input type="hidden" name="id" id="id" />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
$(document).ready(function () {
    var validator = $("#branchDataForm").validate();
    $(".close").click(function () {
        validator.resetForm();
    });
     $(".modal-footer button[type=button]").click(function () {
        validator.resetForm();
    });  
}); 
</script>
</body>
</html>

