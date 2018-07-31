<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/studentbatches.js" type="text/javascript"></script> 
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Batches</h5>
             <div class="ibox-tools">
				
				<button type="button" id="editBtn"
					class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
					data-target="#editform" disabled onclick="dropStudentDemoForm();">
					<b><i class="fa fa-bars" aria-hidden="true"></i></b>Drop
				</button>
			</div>
            </div>
            <div class="ibox-content table-responsive">           
			<table id="studentBatchTable" class="display table table-striped table-bordered table-hover">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="student-batches" type="checkbox" onclick="selectAllRows()"
						/></th>
					<th><span>Course Name</span></th>
					<th><span>Training Institute</span></th>
					<th><span>Batch Name</span></th>
					<th><span>Start Date and Time</span></th>
					<th><span>End Date and Time</span></th>
					<th><span>Mode</span></th>
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
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Batch</h4>
      </div>
      <form class="form-horizontal" id="studentbatchForm" name="studentbatchForm">
        <div class="modal-body">
        <div class="form-group">
            <label for="coursename" class="col-sm-3 control-label">Course </label>
            <div class="col-sm-9">
            	<input type="text" class="form-control" id="courseName" name="courseName">
            </div>
          </div>
          <div class="form-group">
            <label for="mode" class="col-sm-3 control-label">Mode  </label>
            <div class="col-sm-9">
              <select class="form-control" id="mode" name="mode">
                <option value="">Choose Mode</option>
                <option value="online">Online</option>
                <option value="classRoom">Class Room</option>
                <option value="any">Any</option>
              </select>
            </div>
          </div>
           <div class="form-group" id="row_city">
            <label for="city" class="col-sm-3 control-label">City   </label>
            <div class="col-sm-9">
              <select class="form-control" id="city" name="city">
                <option value="">Choose City</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
              </select>
            </div>
          </div>
         <div class="form-group" id="row_location">
            <label for="location" class="col-sm-3 control-label">Location   </label>
            <div class="col-sm-9">
              <select class="form-control" id="location" name="location">
                <option value="">Choose Location</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
              </select>
            </div>
          </div> 
          <div class="form-group">
            <label for="trainer" class="col-sm-3 control-label">Trainer   </label>
            <div class="col-sm-9">
              <select class="form-control" id="trainer" name="trainer">
                <option value="">Choose Faculty</option>
                <option>Polyglot It Solutions</option>
                <option>Ribha</option>
              </select>
            </div>
          </div>
          <div class="form-group">
	            <label for="trainer" class="col-sm-3 control-label">Batch</label>
	            <div class="col-sm-9">
	              <select class="form-control" id="batch" name="batch">
	                <option value="">Choose Batch</option>
	                <option>27-9-2017,2:00PM, ClassRoom/Online/Both</option>
	                <option>28-9-2017,2:00PM, ClassRoom/Online/Both</option>
	                <option>29-9-2017,2:00PM, ClassRoom/Online/Both</option>
	                
	              </select>
	            </div>
          </div>
          <input type="hidden" name="id" id="id" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
$(function() {
    $('#row_city').hide(); 
    $('#row_location').hide(); 
    $('#mode').change(function(){
        if($('#mode').val() == 'online') {
            $('#row_city').show();
            $('#row_location').show();
        } else {
            $('#row_city').hide(); 
            $('#row_location').hide(); 
        } 
    });
});

</script> -->
</body>
</html>

