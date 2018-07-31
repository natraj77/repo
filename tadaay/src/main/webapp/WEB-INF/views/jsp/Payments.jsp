<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/payments.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Payments</h5>
             <div class="ibox-tools">
				<!-- <button type="button" id="addBtn"
					class="btn bg-teal-400 btn-labeled" data-toggle="modal"
					onclick="addNewPayment();">
					<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
				</button> -->
				<!-- <button type="button" id="editBtn"
					class="btn bg-teal-400 btn-labeled bg-edit" data-toggle="modal"
					data-target="#editform" disabled onclick="editForm();">
					<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
				</button>
				<button type="button" id="deleteBtn"
					class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deletePayment();">
					<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
				</button> -->
			</div>
            </div>
            <div class="ibox-content table-responsive">           
			<table id="paymentsDataTable" class="display table table-striped table-bordered table-hover">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="example-select-all" type="checkbox"
						onclick="selectAllRows();" /></th>
					<th><span>First Name</span></th>
					<th><span>Last Name</span></th>
					<th><span>Total Fee</span></th>
					<th><span>Opted Discount</span></th>
					<th><span>Fee Paid</span></th>
					<th><span>Fee Pending</span></th>
					<th><span>Mode</span></th>
					<th><span>Transaction Ref</span></th>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Payment</h4>
      </div>
      <form class="form-horizontal" id="paymentDataForm" name="paymentDataForm">
        <div class="modal-body">
        <div class="form-group">
						<label for="studentName" class="col-sm-3 control-label">Student
							Name </label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="studentName"
								name="studentName" placeholder="Student Name"
								/>
						</div>
					</div>
          <div class="form-group">
            <label for="courseList" class="col-sm-3 control-label">Course </label>
            <div class="col-sm-9">
              <select class="form-control" id="courseName" name="courseName">
              <option value="">Choose Course</option>
              </select>
            </div>
          </div>
					<div class="form-group">
						<label for="totalFee" class="col-sm-3 control-label">Total
							Fee </label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="totalFee"
								name="totalFee" placeholder="Total Fee"
								/>
						</div>
					</div>
					<div class="form-group">
						<label for="feePaid" class="col-sm-3 control-label">Fee
							Paid</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="feePaid"
								name="feePaid" placeholder="Fee Paid"
								/>
						</div>
					</div>
					<div class="form-group">
						<label for="feePending" class="col-sm-3 control-label">Fee
							Pending </label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="feePending"
								name="feePending" placeholder="Fee Pending"
								 />
						</div>
					</div>
					<div class="form-group">
						<label for="mode" class="col-sm-3 control-label">Mode
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="mode" name="mode"
								placeholder="Fee Mode" />
						</div>
					</div>
					<div class="form-group">
						<label for="transactionRef" class="col-sm-3 control-label">Transaction
							Ref </label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="transactionRef"
								name="transactionRef" placeholder="Transaction Ref"
								/>
						</div>
					</div>
					<div class="form-group">
						<label for="optedDiscount" class="col-sm-3 control-label">Opted
							Discount</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="optedDiscount"
								name="optedDiscount" placeholder="Discount"
								 />
						</div>
					</div>
         
         
         
          
          
          <input type="hidden" name="id" id="id" />
          <input type="hidden" name="studentId" id="studentId" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div> 

</body>
</html>

