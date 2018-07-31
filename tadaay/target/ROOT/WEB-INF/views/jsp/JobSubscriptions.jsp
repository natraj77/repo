<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/jobsubscriptions.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/assets/css/adminjobs.css" type="text/css" rel="stylesheet"/>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Subscriptions</h5>
							<div class="ibox-tools">
								<!-- <div class="btn-group">
			             	 	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>                    	             	 	
				                <ul class="dropdown-menu">
									<li>
										<button type="button"
										class="edit-btn" id="editBtn" data-toggle="modal"
									data-target="#editform" disabled onclick="editForm();">
										<i class="fa fa-envelope-o" aria-hidden="true"></i> Edite
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn">
										<i class="fa fa-comment-o" aria-hidden="true"></i> activate
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn">
										<i class="fa fa-comment-o" aria-hidden="true"></i> Deactive
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn" id="deleteBtn" disabled>
										<i class="fa fa-comment-o" aria-hidden="true"></i> Delete
										</button>
									</li>
								</ul>
							</div>     -->
							</div>
						</div>
						<div class="ibox-content table-responsive">
							<table id="subscriptionDataTable"
								class="display table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>No of Postings</span></th>
										<th><span>Position type</span></th>
										<th><span>Used</span></th>
										<th><span>Balance</span></th>
										<th><span>Procured Date</span></th>
										<th><span>Expiry Date</span></th>
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
