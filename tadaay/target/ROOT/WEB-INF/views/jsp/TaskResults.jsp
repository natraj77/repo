<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/taskresults.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Task Results</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 bg-add btn-labeled">
									<b><i class="fa fa-eye" aria-hidden="true"></i></b>View Result
								</button>
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="taskResultsDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>First Name</span></th>
										<th><span>Last Name</span></th>
										<th><span>Task Name</span></th>
										<th><span>Status</span></th>
										<th><span>Result</span></th>
										<th><span>Assigned Date</span></th>
										<th><span>start Date</span></th>
										<th><span>End Date</span></th>
										<th><span>Duration</span></th>
										<th><span></span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none">
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Assigned Date
						                </label>
						                <div class="col-sm-9">
						                  <span id="assigneddate"></span>
						                </div>
						                </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Start Date
						                </label>
						                <div class="col-sm-9">
						                  <span id="startdate"></span>
						                </div>
						                </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">End Date
						                </label>
						                <div class="col-sm-9">
						                  <span id="enddate"></span>
						                </div>
						                </div>
						          </div>
						          <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Duration
						                </label>
						                <div class="col-sm-9">
						                  <span id="duration"></span>
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
</body>
</html>

