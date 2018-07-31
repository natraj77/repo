<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/autocomplete.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
<script src="../resources/assets/js/faculty.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Faculty</h5>
             <div class="ibox-tools">
				<button type="button" id="addBtn"
					class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
					onclick="addNewFaculty();">
					<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
				</button>
				<button type="button" id="editBtn"
					class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
					data-target="#editform" disabled onclick="editFaculty();">
					<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
				</button>
				<button type="button" id="deleteBtn"
					class="btn bg-teal-400 btn-labeled bg-delete delete-row" disabled onclick="deleteFaculty();">
					<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
				</button>
			</div>
            </div>
            <div class="ibox-content table-responsive">           
			<table id="facultyDataTable" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
			   <thead>
				<tr>
					<th><input name="select_all" value="1"
						id="example-select-all" type="checkbox"
						onclick="selectAllRows();" /></th>
					<th><span>First Name</span></th>
					<th><span>Last Name</span></th>
					<th><span>Mobile</span></th>
					<th><span>Email</span></th>
					<th><span>Course</span></th>
					<th><span>Mode</span></th>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Faculty</h4>
      </div>
      <form class="form-horizontal" id="facultyForm">
        <div class="modal-body">
         <div class="row searchlead-inner">
                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                    <div class="searchlead-title">
                        <span>Search Faculty</span>
                    </div>
                </div>
                 <div class="col-lg-8 col-md-5 col-sm-12 col-xs-12">
                    <div class="search-input" id="search-input">
                    	<div style="position:relative">
                    		<input type="text" size="100" id="searchLead" class="form-control" placeholder="Faculty . . ." autocomplete="off"> 
                    	</div>
                        <div class="search-lead">
		                        <a href="#" class="search-now-btn" onclick="checkSelectedUser();"><i class="fa fa-search" aria-hidden="true"></i></a>
		                 </div> 
		                 <div id="lead-suggestion"> </div>
                    </div>
                </div>
         </div>
          <div class="form-group">
            <label for="fName" class="col-sm-3 control-label">First Name </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" required="true" id="fName"  name="fName" placeholder="First Name" readonly="readonly"/></td>
            </div>
          </div>
          <div class="form-group">
            <label for="lName" class="col-sm-3 control-label">Last Name </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" required="true" id="lName"  name="lNname" placeholder="Last Name" readonly="readonly"/></td>
            </div>
          </div>
          <div class="form-group">
            <label for="mobile" class="col-sm-3 control-label">Mobile  </label>
            <div class="col-sm-9">
              <input type="text" maxlength="15"   class="form-control" id="mobile" name="mobile" placeholder="MobileNo" readonly="readonly"/>
            </div>
          </div>
          <div class="form-group">
            <label for="emailId" class="col-sm-3 control-label">E-mail  </label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="emailId" name="emailId" placeholder="Type E-Mail" readonly="readonly"/>
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
            <label for="modeList" class="col-sm-3 control-label">Mode </label>
            <div class="col-sm-9">
              <select class="form-control" id="modeDesc" name="modeDesc">
                <option value="">Choose Mode</option>
                <option>ClassRoom</option>
                <option>Online</option>
                <option>Both</option>
              </select>
            </div>
          </div>
		<div class="form-group">
			<label for="private" class="col-sm-3 control-label">Keep Private</label>
            <div class="col-sm-9">
            	<div class="onoff-Switch">
               	<input id="isPrivate" name="isPrivate" type="checkbox" value="y"/>
               	<label for="isPrivate"></label>
               	</div>
             </div>
        </div>
        </div>
        <input type="hidden" name="id" id="id" />
        <input type="hidden" name="facultId" id="facultId" />
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
    var validator = $("#facultyForm").validate();
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

