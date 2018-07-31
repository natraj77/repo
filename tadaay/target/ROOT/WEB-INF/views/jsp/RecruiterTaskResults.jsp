<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="RecruiterIncludes.jsp"></jsp:include>
<script src="../resources/assets/js/recruitertaskresults.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content">
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
										<th><span>Student Name</span></th>
										<th><span>Task Name</span></th>
										<th><span>Status</span></th>
										<th><span>Result</span></th>
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
</body>
</html>

