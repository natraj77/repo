<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="RecruiterIncludes.jsp"></jsp:include>
<script src="../resources/assets/js/recruiterinvites.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

	<div class="wrapper wrapper-content">
    <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">
        <div class="col-lg-12">
          <div class="ibox float-e-margins">
            <div class="ibox-title">
              <h5>Manage Invites</h5>
            </div>
            <div class="ibox-content">
            <div id="inviteErrMsg"></div>
	               <form class="form-horizontal" id="invitesForm" name="invitesForm">
	               <div id="inviteDiv">
		            <div class="after-add-more">
			      		<div class="col-sm-12 row form-group">	
			      	 		<div class="col-sm-3 no-padding">
			      	 			<input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name">
						 	</div>
						 	<div class="col-sm-3">
			      	 			<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name">
						 	</div>
						 	<div class="col-sm-2">
			      	 			<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile">
						 	</div>
						 	<div class="col-sm-3">
			      	 			<input type="email" class="form-control" id="email" name="email" placeholder="Email">
						 	</div>
							  <div class="col-sm-1"> 
								<button class="btn btn-default add-more"  type="button" ><i class="fa fa-plus" aria-hidden="true"></i></button>
							  </div>
						</div>
					</div>
					</div>
					 <div class="copy-fields hide form-group">
				          <div class="remove-invites col-sm-12 row form-group">
					           <div class="col-sm-3 no-padding">
					      	 			<input type="text" class="form-control" id="copyfirstName" name="copyfirstName" placeholder="First Name">
								 	</div>
								 	<div class="col-sm-3">
					      	 			<input type="text" class="form-control" id="copylastName" name="copylastName" placeholder="Last Name">
								 	</div>
								 	<div class="col-sm-2">
					      	 			<input type="text" class="form-control" id="copymobile" name="copymobile" placeholder="Mobile">
								 	</div>
								 	<div class="col-sm-3">
					      	 			<input type="email" class="form-control" id="copyemail" name="copyemail" placeholder="Email">
								 	</div>
								  
								  <div class="col-sm-1">
					              <button class="btn btn-danger removebtn" type="button"><i class="fa fa-minus" aria-hidden="true"></i></button>
					            </div>
				          </div>
			        </div> 
			        <div class="text-right">
				    		<button type="submit" class="btn btn-info bg-teal-400">Invite</button>
				   	</div>
			        </form>
			        <div>
		              <h5>Pending Invites</h5>
		            </div>
			         <div class="table-responsive">           
						<table id="admininvitesDataTable" class="display table table-striped table-bordered table-hover" style="width:100%;">
						   <thead>
							<tr>
								<th><input name="select_all" value="1"
									id="example-select-all" type="checkbox"
									onclick="selectAllRows();" /></th>
								<th><span>First Name</span></th>
								<th><span>Last Name</span></th>
								<th><span>Mobile</span></th>
								<th><span>Email</span></th>
								<th><span>Status</span></th>
								<th><span></span></th>
							</tr>
						</thead>
						</table>
            </div>
              <!-- <div>
                <div class="row">
                  <div class="col-sm-6">
				 <form action="" name="inviteemail">
				  		<div class="form-group">
                        	<label>Invite By Email</label>
				    		<textarea class="form-control"  name="email" id="email" placeholder="john@doe.com"></textarea>
				     	</div>
                      	<div class="text-right">
				    		<button type="submit" class="btn btn-info bg-teal-400">Invite</button>
				   		 </div>
				  </form>
                  </div>
                  <div class="col-sm-6">
                  	<form action="" name="invitesms">
					 <div class="form-group">
	                        <label>Invite By SMS</label>
					    <textarea class="form-control"  name="mobile" id="mobile" placeholder="9999999999"></textarea>
					    </div>
					    <div class="text-right">
					    <button type="submit" class="btn btn-info bg-teal-400">Invite</button>
					    </div>
				  </form>
                  </div>
                </div>
              </div> -->
            </div>
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
        <h4 class="modal-title" id="myModalLabel">Add Demo</h4>
      </div>
      <form class="form-horizontal" id="demoDataForm" name="demoDataForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="courseName" class="col-sm-2 control-label">Course </label>
            <div class="col-sm-10">
              <select class="form-control" id="courseName" name="courseName">
                <option value="">Choose Course</option>
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
            <label for="modeList" class="col-sm-2 control-label">Mode  </label>
            <div class="col-sm-10">
              <select class="form-control" id="modeList" name="modeList">
                <option value="">Choose Mode</option>
                <option>Online</option>
                <option>Class Room</option>
                <option>Both</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="branchList" class="col-sm-2 control-label">Branch</label>
            <div class="col-sm-10">
              <select class="form-control" id="branchList" name="branchList">
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
            <label for="date" class="col-sm-2 control-label">Date & Time   </label>
            <div class="col-sm-10">
             <div class="input-group date" id="datetimepicker1">
	                    <input class="form-control" type="text" id="date" name="date">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
            </div>
          </div>
          <div class="form-group">
            <label for="faculty" class="col-sm-2 control-label">Faculty   </label>
            <div class="col-sm-10">
              <select class="form-control" id="name" name="name">
                <option value="">Choose Faculty</option>
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
            <label for="feeDiscount" class="col-sm-2 control-label">Fee </label>
            <div class="col-sm-10">
            <div id="staticParent">
				<input type="text" id="feeDiscount" name="feeDiscount" class="form-control" />
			</div>
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
<!-- Batch ReShedule Modal -->
<div class="modal fade" id="batchreshedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Reshedule</h4>
      </div>
      <form class="form-horizontal" id="courseDataForm" name="courseDataForm">
        <div class="modal-body">
          <div class="form-group">
	            <label for="date" class="col-sm-3 control-label">New Date & Time</label>
	            <div class="col-sm-9">
	             <div class="input-group date" id="newdatetimepicker">
		                    <input class="form-control" type="text" id="date">
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
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
<script type="text/javascript">
	var i = 1;
    $(document).ready(function() {
	//here first get the contents of the div with name class copy-fields and add it to after "after-add-more" div class.
      $(".add-more").click(function(){
    	  var html = $(".copy-fields").html();
    	  html = html.replace('copyfirstName','copyfirstName'+i);
    	  html = html.replace('copylastName','copylastName'+i);
    	  html = html.replace('copymobile','copymobile'+i);
    	  html = html.replace('copyemail','copyemail'+i);

          $(".after-add-more").after(html);
          i=i+1;
      });
//here it will remove the current value of the remove button which has been pressed
      $("body").on("click",".removebtn",function(){ 
          $(this).parents(".remove-invites").remove();
      });
 
    });
 
</script>
</body>
</html>

