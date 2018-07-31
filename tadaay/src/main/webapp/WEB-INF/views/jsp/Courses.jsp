<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/autocomplete.css">
<script src="../resources/assets/js/courses.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Courses</h5>
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
										class="edit-btn" data-toggle="modal" id="uploadCourse" onclick="showCourseContent();" disabled>
										<i class="fa fa-envelope-o" aria-hidden="true"></i> Add Course Content
										</button>
									</li>
									<li>
										<button type="button"
										class="edit-btn" data-toggle="modal"  id="uploadVideo" data-target="#demoVideo" disabled>
										<i class="fa fa-envelope-o" aria-hidden="true"></i> Add Demo Videos
										</button>
									</li> 
									<li><button type="button" id="deleteBtn" class="delete-btn" disabled onclick="deleteCourses();" >
									<i class="fa fa-trash-o" aria-hidden="true"></i> Delete
								</button></li>
								</ul>
								</div>  
								<!-- <button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editCourse();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteCourses();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button> -->
								<!-- <div class="btn-group pull-right">
				                   <button type="button" class="btn btn-primary dropdown-toggle btn-labeled " data-toggle="dropdown" aria-expanded="false"><b><i class="fa fa-upload" aria-hidden="true"></i></b> Upload <span class="caret"></span></button>                   	
				                    
				                    <ul class="dropdown-menu">
										<li>
										<button type="button" id="uploadCourse"  class="edit-btn" data-toggle="modal" onclick="showCourseContent();">
										<i class="fa fa-file-text" aria-hidden="true"></i> Course Content
										</button>
										<li><button type="button" id="uploadVideo"  class="edit-btn" data-toggle="modal" data-target="#demoVideo">
										<i class="fa fa-play" aria-hidden="true"></i> Demo Videos
										</button></li>
									</ul>
								</div> -->
							</div>
						</div>
						<div class="ibox-content">
							<table class="table table-striped table-bordered table-hover"
								id="coursesDataTable">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Courses</span></th>
										<th><span>Online</span></th>
										<th><span>Class Room</span></th>
										<th><span>Corporate</span></th>
										<th><span>Course Content</span></th>
										<th><span>Course Video</span></th>
										<th><span></span></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
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
        <h4 class="modal-title" id="myModalLabel">Add Course</h4>
      </div>
      <form class="form-horizontal" id="courseDataForm" name="courseDataForm">
        <div class="modal-body">
          <div class="form-group">
            <label for="courseList" class="col-sm-2 control-label">Course </label>
            <div class="col-sm-10" >
              <input type="text" class="form-control" id="name" name="name" autocomplete="off" placeholder="search for courses"> 
            </div>
           <!--  <div class="search-submit">
            	<a href="#" class="join-now-btn" onclick="checkSelectedCourse();"><i class="fa fa-search" aria-hidden="true"></i></a>
            </div> -->
            <div id="course-box" class="trainer-courses"></div>
          </div>
           <div class="form-group">
            <label  class="col-sm-2 control-label">Mode</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="checkbox" name="online" id="online" value="y"> Online
              </label>
              <label class="radio-inline">
                <input type="checkbox" name="classroom" id="classroom" value="y"> ClassRoom
              </label>
              <label class="radio-inline">
                <input type="checkbox" name="corporate" id="corporate" value="y"> Corporate
              </label>
              <label for="modeType" style="display: block;" class="error"></label>
            </div>
          </div>
         <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="courseList" class="col-sm-9 control-label">Realtime Projects  </label>
                <div class="col-sm-3">
                 <div class="onoff-Switch">
                            <input id="realtimeProjs" name="realtimeProjs" type="checkbox" value="y"/>
                            <label for="realtimeProjs"></label>
                        </div>
                </div>
              </div>
              <label for="realtimeProjs" style="display: block;" class="error text-center"></label>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
               <label for="courseList" class="col-sm-9 control-label">Lab Assistance </label>
                <div class="col-sm-3">
               <div class="onoff-Switch">
                            <input id="labAssistance" name="labAssistance" type="checkbox" value="y"/>
                            <label for="labAssistance" class="label-default"></label>
                        </div>
                </div>
              </div>
               <label for="labAssistance" style="display: block;" class="error text-center"></label>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
               <label for="courseList" class="col-sm-9 control-label">Fee in Installments</label>
                <div class="col-sm-3">
                <div class="onoff-Switch">
                            <input id="feeInInstallments" name="feeInInstallments" type="checkbox" value="y"/>
                            <label for="feeInInstallments" class="label-default"></label>
                        </div>
                </div>
              </div>
                <label for="feeInInstallments" style="display: block;" class="error text-center"></label>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label  class="col-sm-9 control-label">Placement Assistance</label>
                <div class="col-sm-3">
                  <div class="onoff-Switch">
                            <input id="placementAssistance" name="placementAssistance" type="checkbox" value="y"/>
                            <label for="placementAssistance" class="label-default"></label>
                        </div>
                </div>
              </div>
               <label for="placementAssistance" style="display: block;" class="error text-center"></label>
            </div>
          </div>
          <input type="hidden" name="id" id="id" />
          <input type="hidden" name="dmnCourseId" id="dmnCourseId" />
          <input type="hidden" name="contentPath" id="contentPath" />
          <input type="hidden" name="videoPath" id="videoPath" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
          <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Model Course content -->
<div class="modal fade" id="courseContent" tabindex="-1" role="dialog" aria-labelledby="courseContent">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="courseContentLabel">Add Course Content</h4>
      </div>
      <form class="form-horizontal" id="courseContentForm" name="courseContentForm">
        <div class="modal-body">
        <!-- <div class="form-group">
            <label for="uploadCourseName" class="col-sm-3 control-label">Select Course</label>
            <div class="col-sm-9">
		        <select class="form-control" id="uploadCourseName" name="uploadCourseName">
		        	<option>Select Course</option>
		        </select>						       
             </div>
          </div> -->
         <div class="form-group">
            <label for="inputEmail3" class="col-sm-3 control-label">Course Content</label>
            <div class="col-sm-9">
		        <input id="file-course" name="file" type="file" multiple="multiple">							       
             </div>
          </div>
        </div>
      </form>
      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary" onclick="saveCourseContent()">Save</button>
	</div>
    </div>
  </div>
</div>
<!-- Model Demo Video -->
<div class="modal fade" id="demoVideo" tabindex="-1" role="dialog" aria-labelledby="demoVideoLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="demoVideoLabel">Add Videos</h4>
      </div>
      <form class="form-horizontal" id="courseDemoForm" name="courseDemoForm">
        <div class="modal-body">
       <!--  <div class="form-group">
            <label for="uploadCourseDemoName" class="col-sm-3 control-label">Select Course</label>
            <div class="col-sm-9">
		        <select class="form-control" id="uploadCourseDemoName" name="uploadCourseDemoName">
		        	<option>Select Course</option>
		        </select>						       
             </div>
          </div> -->
        	<div class="form-group">
            	<label for="inputEmail3" class="col-sm-3 control-label">Demo Videos</label>
	            <div class="col-sm-9">           	
			        <input id="file-videos" name="file" type="file" multiple>							       			  
	          	</div>
	         </div>
        </div>
      </form>
      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary" onclick="saveVideoContent()">Save</button>
	</div>
    </div>
  </div>
</div>
<div class="modal fade" id="myModalContent" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Course Content</h4>
				
			</div>
			<div class="modal-body">
				 <div id="courseData">
				 	<iframe src="" id="courseFrameContent" style="width:100%;height:100%;"></iframe>
				 </div>
			 </div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModalVideo" tabindex="-1" role="dialog"
	aria-labelledby="myModalVideoLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalVideoLabel">Course Video</h4>
				
			</div>
			<div class="modal-body">
				 <div id="courseVideoData">
				 	<video controls="" name="media" id="course-video" controlslist="nodownload">
						<source src="" id="videoFrameContent" type="video/mp4">
					</video>
					
				 </div>
			 </div>
		</div>
	</div>
</div>
<script>
$(document).ready(function () {
    var validator = $("#courseDataForm").validate();
    $(".close").click(function () {
        validator.resetForm();
    });
    var contentValidator = $("#courseContentForm").validate();
    $(".close").click(function () {
    	contentValidator.resetForm();
    });
     $(".modal-footer button[type=button]").click(function () {
        validator.resetForm();
    });  
}); 
</script>
</body>
</html>
