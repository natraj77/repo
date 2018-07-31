
<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="Includes.jsp"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<script src="../resources/assets/js/adminevents.js" type="text/javascript"></script>
<link href ="../resources/js/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href ="../resources/css/jquery.datetimepicker.css" rel="stylesheet">
<script src="../resources/assets/js/jquery.datetimepicker.full.min.js" type="text/javascript"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
<style>
.ui-autocomplete {
    z-index: 5000;
}
</style>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Events</h5>
							<div class="ibox-tools">
							<button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewCourse();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
							<div class="btn-group">
				              	<button type="button" class="btn btn-primary dropdown-toggle btn-labeled bg-edit" data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-bars" aria-hidden="true"></i></b> Actions <span class="caret"></span></button>                   	
				                <ul class="dropdown-menu">
									<li>
										<button type="button" id="editBtn"
										class="edit-btn" data-toggle="modal"
										data-target="#editform" disabled onclick="editCourse();">
										<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
										</button>
									</li>
									<li>
										<button type="button" 
										class="edit-btn" data-toggle="modal" id="deleteBtn" disabled onclick="deleteCourses();" >
										<i class="fa fa-external-link" aria-hidden="true"></i> Delete
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn" data-toggle="modal" id="subscriberBtn" disabled data-toggle="modal"
									data-target="#showSubscribers">
										<i class="fa fa-eye" aria-hidden="true"></i> Show Subscribers
										</button>
									</li>
									
									
								</ul>
								</div>      
							</div>
						</div>
						<div class="ibox-content">
							<table class="table table-striped table-bordered table-hover"
								id="adminCoursesDataTable">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" />  </th>
										<th><span>Title</span></th>              
										<th><span>Organizer</span></th>
										<th><span>Description</span></th>
										<th><span>Recurring</span></th>
										<th><span>Venue</span></th>
										<th><span>Location</span></th>
										<th><span>City</span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none;">
						       
						       <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="title1" class="col-sm-4 control-label">Title </label>
							               <div class="col-sm-8">
							                 <span id="title1"></span>
							               </div>
							             </div>
							           </div>
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="organizer1" class="col-sm-4 control-label">Organizer </label>
							               <div class="col-sm-8">
							                 <div class="ui-widget">
							                   <span id="organizer1"></span>
							                 </div>
							               </div>
							             </div>
							           </div>
							         </div>
							          <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="description1" class="col-sm-4 control-label">Description
							               </label>
							               <div class="col-sm-8">
							                  <div class="ui-widget">
							                  <span id="description1"></span>
							                  </div>
							                </div>
							             </div>
							           </div>
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="recurring1" class="col-sm-4 control-label">Recurring
							               </label>
							               <div class="col-sm-8">
							                  <div class="ui-widget">
							                  <span id="recurring1"></span>
							                  </div>
							                </div>
							             </div>
							           </div>
							         </div>
							         <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="venue1" class="col-sm-4 control-label"> Venue </label>
							               <div class="col-sm-8">
							                 <span id="venue1"></span>
							               </div>
							             </div>
							           </div>
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="location1" class="col-sm-4 control-label"> Location </label>
							               <div class="col-sm-8">
							                  <span id="location1"></span>
							               </div>
							             </div>
							           </div>
							         </div>
							         
							         <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="city1" class="col-sm-4 control-label"> City </label>
							               <div class="col-sm-8">
							                 <span id="city1"></span>
							               </div>
							             </div>
							           </div>
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="country1" class="col-sm-4 control-label">Country </label>
							               <div class="col-sm-8">
							                 <span id="country1"></span>
							               </div>
							             </div>
							           </div>
							         </div>
							         
							        
							         <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							            <label for="imagePath1" class="col-sm-4 control-label">Image Path</label>
							            <div class="col-sm-8">
							              <span id="imagePath1"></span>
							            </div>
							          </div>
							           </div>
							            <div class="col-sm-6">
							             <div class="form-group">
							               <label for="schedule1" class="col-sm-4 control-label">Schedule
							               </label>
							               <div class="col-sm-8">
							                  <span id="schedule1"></span>
							               </div>
							             </div>
							           </div>
							         </div>
							        <!--   <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							           	 <button type="button" class="btn btn-primary pull-right">Upload</button>
							          </div>
							           </div>
							            <div class="col-sm-6">
							             <div class="form-group">
							              	<button type="button" class="btn btn-primary pull-right">Upload</button>
							             </div>
							           </div>
							         </div> -->
							          <div class="row">
							            <div class="col-sm-6">
							             <div class="form-group">
							               <label for="isActive1" class="col-sm-4 control-label">Active
							               </label>
							               <div class="col-sm-8">
							                  <span id="isActive1"></span>
							               </div>
							             </div>
							           </div>
							            <div class="col-sm-6">
							             <div class="form-group">
							               <label for="template1" class="col-sm-4 control-label">Template
							               </label>
							               <div class="col-sm-8">
							                 <span id="template1"></span>
							               </div>
							             </div>
							           </div>
							         </div>
							         <div class="row">
							            <div class="col-sm-6">
							             <div class="form-group">
							               <label for="eventIdentifier1" class="col-sm-4 control-label">Event Identifier
							               </label>
							               <div class="col-sm-8">
							                  <span id="eventIdentifier1"></span>
							               </div>
							             </div>
							           </div>
							            
							         </div>
							       
							          <div class="row">
							         <div><h4 class="text-center mrg-bt">META DATA VALUES</h4></div>
							         </div>
							         <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="metaTitle1" class="col-sm-4 control-label">Title
							               </label>
							               <div class="col-sm-8">
							                 <span id="metaTitle1"></span>
							               </div>
							             </div>
							           </div>
							            <div class="col-sm-6">
							             <div class="form-group">
							               <label for="metaKeywords1" style="padding: 0;" class="col-sm-4 control-label">Keywords</label>
							               <div class="col-sm-8">
							                 <span id="metaKeywords1"></span>
							               </div>
							             </div>
							           </div>
							         </div>
							         <div class="row">
							           <div class="col-sm-6">
							             <div class="form-group">
							               <label for="metaDescription1" class="col-sm-4 control-label">Description
							               </label>
							               <div class="col-sm-8">
							                <span id="metaDescription1"></span>
							               </div>
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
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <form class="form-horizontal" id="adminCourseDataForm" name="adminCourseDataForm">
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="title" class="col-sm-4 control-label">Title </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Title" id="title" name="title">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="organizer" class="col-sm-4 control-label">Organizer </label>
                <div class="col-sm-8">
                  <div class="ui-widget">
                  <input type="text" class="form-control" placeholder="Organizer" id="organizer" name="organizer">
                  </div>
                </div>
              </div>
            </div>
          </div>
           <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="description" class="col-sm-4 control-label">Description
                </label>
                <div class="col-sm-8">
                   <div class="ui-widget">
                   <input type="text" class="form-control" placeholder="Description" id="description" name="description">
                   </div>
                 </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="recurring" class="col-sm-4 control-label">Recurring
                </label>
                <div class="col-sm-8">
		              <label class="radio-inline">
                <input type="radio" name="recurring" id="recurring" value="Y" > Yes
              </label>
              <label class="radio-inline">
                <input type="radio" name="recurring" id="recurring" value="N" checked> No
              </label>
              <label for="recurring" style="display: block;" class="error"></label>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="venue" class="col-sm-4 control-label"> Venue </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Venue" id="venue" name="venue">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="location" class="col-sm-4 control-label"> Location </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Location" id="location" name="location">
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="city" class="col-sm-4 control-label"> City </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="City" id="city" name="city">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="country" class="col-sm-4 control-label">Country </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Country" id="country" name="country">
                </div>
              </div>
            </div>
          </div>
          
         
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
	            <label for="imagePath" class="col-sm-4 control-label">Image Path</label>
	            <div class="col-sm-8">
	              <input type="text" class="form-control" placeholder="Image Path" id="imagePath" name="imagePath">
	            </div>
	          </div>
            </div>
             <div class="col-sm-6">
              <div class="form-group">
                <label for="schedule" class="col-sm-4 control-label">Schedule
                </label>
                <div class="col-sm-8">
                   <input type="text" class="form-control"   value="" id="schedule" name="schedule">
                </div>
              </div>
            </div>
          </div>
         <!--   <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
	           	 <button type="button" class="btn btn-primary pull-right">Upload</button>
	          </div>
            </div>
             <div class="col-sm-6">
              <div class="form-group">
               	<button type="button" class="btn btn-primary pull-right">Upload</button>
              </div>
            </div>
          </div> -->
           <div class="row">
             <div class="col-sm-6">
              <div class="form-group">
                <label for="isActive" class="col-sm-4 control-label">Active
                </label>
                <div class="col-sm-8">
		              <label class="radio-inline">
                <input type="radio" name="isActive" id="isActive" value="Y" checked> Yes
              </label>
              <label class="radio-inline">
                <input type="radio" name="isActive" id="isActive" value="N"> No
              </label>
              <label for="featuredCourse" style="display: block;" class="error"></label>
                </div>
              </div>
            </div>
             <div class="col-sm-6">
              <div class="form-group">
                <label for="template" class="col-sm-4 control-label">Template
                </label>
                <div class="col-sm-8">
                 <input type="text" class="form-control" placeholder="Template" id="template" name="template">
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
             <div class="col-sm-6">
              <div class="form-group">
                <label for="eventIdentifier" class="col-sm-4 control-label">Event Identifier
                </label>
                <div class="col-sm-8">
                 <input type="text" class="form-control" placeholder="Event Identifier" id=eventIdentifier name="eventIdentifier">
                </div>
              </div>
            </div>
          </div>
          
        
           <div class="row">
          <div><h4 class="text-center mrg-bt">META DATA VALUES</h4></div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="metaTitle" class="col-sm-4 control-label">Title
                </label>
                <div class="col-sm-8">
                  <input class="form-control" placeholder="Meata Data Title" id="metaTitle" name="metaTitle" type="text">
                </div>
              </div>
            </div>
             <div class="col-sm-6">
              <div class="form-group">
                <label for="metaKeywords" style="padding: 0;" class="col-sm-4 control-label">Keywords</label>
                <div class="col-sm-8">
                  <input class="form-control" placeholder="Keywords" id="metaKeywords" name="metaKeywords" type="text">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="metaDescription" class="col-sm-4 control-label">Description
                </label>
                <div class="col-sm-8">
                  <input class="form-control" id="metaDescription" name="metaDescription" placeholder="metaDescription" type="text">
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
          </div>	
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="showSubscribers" tabindex="-1" role="dialog" aria-labelledby="showSubscribersLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="showSubscribersLabel"></h4>
      </div>
      <form class="form-horizontal" id="eventSubscriptionForm" name="eventSubscriptionForm">
        <div class="modal-body">
         <table id="studentTable" class="table table-bordered table-hover table-responsive text-center">
	         <thead class="text-center">
	         <tr>
		         <th><input name="select_all" value="1" id="example-select-all" type="checkbox" onclick="selectAllRows();"></th>
		         <th class="text-center">First Name</th>
		         <th class="text-center">Last Name</th>
		         <th class="text-center">Mobile</th>
		         <th class="text-center">Email</th>
		         <th class="text-center">Status</th>
	         </tr>
	         </thead>
	         <tbody>
	         		<tr>
	         			<td><input type="checkbox"></td>
	         			<td>Sukanya</td>
	         			<td>d</td>
	         			<td>8639440664</td>
	         			<td>sukanya.danasi@polyglotit.com</td>
	         			<td>Enrolled</td>
	         		</tr>
	         		<tr>
	         			<td><input type="checkbox"></td>
	         			<td>Sukanya</td>
	         			<td>d</td>
	         			<td>8639440664</td>
	         			<td>sukanya.danasi@polyglotit.com</td>
	         			<td>Enrolled</td>
	         		</tr>
	         		<tr>
	         			<td><input type="checkbox"></td>
	         			<td>Sukanya</td>
	         			<td>d</td>
	         			<td>8639440664</td>
	         			<td>sukanya.danasi@polyglotit.com</td>
	         			<td>Enrolled</td>
	         		</tr>
	         </tbody>
         </table>
           
          <input type="hidden" name="id" id="id" />
          </div>	
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
	var templateList = ${templateList};
	var cityList = ${cityList};
	var cntryList = ${cntryList};
	$( "#template" ).autocomplete({
	      source: templateList,
	      change: function( event, ui ) {
	    	  val = $(this).val();
	    	  exists = $.inArray(val,templateList);
	    	  if (exists<0) {
	    	    $(this).val("");
	    	    return false;
	    	  }
	    	 }
	});
	$( "#country" ).autocomplete({
	      source: cntryList,
	      change: function( event, ui ) {
	    	  val = $(this).val();
	    	  exists = $.inArray(val,cntryList);
	    	  if (exists<0) {
	    	    $(this).val("");
	    	    return false;
	    	  }
	    	 }
	});
	$( "#city" ).autocomplete({
	      source: cityList,
	      change: function( event, ui ) {
	    	  val = $(this).val();
	    	  exists = $.inArray(val,cityList);
	    	  if (exists<0) {
	    	    $(this).val("");
	    	    return false;
	    	  }
	    	 }
	});
	 
	
});

$('#schedule').datetimepicker({
	mask:'9999/19/39 29:59',
});

</script>
	
</body>
</html>
