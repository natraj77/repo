<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/rules.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

	<div class="wrapper wrapper-content">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Rules</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewBranch();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 btn-labeled bg-edit" data-toggle="modal"
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
	</div>

	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Rule</h4>
      </div>
      <form class="form-horizontal" id="rulesForm">
        <div class="modal-body">
         <div class="form-group">
            <label for="rulename" class="col-sm-3 control-label">Rule Name </label>
            <div class="col-sm-9">
              <input type="text" id="rulename" name="rulename" class="form-control rulename" placeholder="Rule Name">
            </div>
          </div>
          <div class="form-group">
            <label for="event" class="col-sm-3 control-label">Event  </label>
            <div class="col-sm-9">
             <select class="form-control" id="event" name="event">
	              <option value="select">-- SELECT --</option>
	              <option>On user invited</option>
	              <option>On user registration</option>
	              <option>On demo request</option>
	              <option>On course completion</option>
	              <option>On course enroll</option>
	              <option>On fee payment</option>
	              <option>On batch reschdule</option>	              	              	              	              
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="action" class="col-sm-3 control-label">Action  </label>
            <div class="col-sm-9">
              <select class="form-control" id="action" name="action">
	              <option value="select">-- SELECT --</option>
	              <option>Send SMS</option>
	              <option>Send Email</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="template" class="col-sm-3 control-label">Tempalte </label>
            <div class="col-sm-9">
              <select class="form-control" id="template" name="template">
                <option>Template1</option>
                <option>Template2</option>
              </select>
            </div>
          </div> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
        </div>
        <input type="hidden" name="id" id="id" />
      </form>
    </div>
  </div>
</div>
</body>
</html>

