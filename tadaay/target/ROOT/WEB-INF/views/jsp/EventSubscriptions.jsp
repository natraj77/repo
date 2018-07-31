<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/eventsubscriptions.js" type="text/javascript"></script> 
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Event Subscriptions</h5>
							<!-- <div class="ibox-tools">
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
							</div> -->
						</div>
						<div class="ibox-content table-responsive">
							<table id="quizQuestionsTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>First Name</span></th>
										<th><span>Last Name</span></th>
										<th><span>Mobile</span></th>
										<th><span>Email</span></th>
										<th><span>Event Name</span></th>
										<th><span>Status</span></th>
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
</body>
</html>
