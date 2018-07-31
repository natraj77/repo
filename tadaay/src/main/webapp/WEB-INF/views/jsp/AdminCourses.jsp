
<!-- Includes.jsp contains all libraries, and top navigation page -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="Includes.jsp"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>
<script src="../resources/assets/js/admincourses.js" type="text/javascript"></script>
<link href ="../resources/js/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
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
							<h5>Manage Courses</h5>
							<div class="ibox-tools">
								<button type="button" id="addBtn"
									class="btn bg-teal-400 btn-labeled bg-add" data-toggle="modal"
									onclick="addNewCourse();">
									<b><i class="fa fa-plus" aria-hidden="true"></i></b>Add
								</button>
								<button type="button" id="editBtn"
									class="btn bg-teal-400 bg-edit btn-labeled" data-toggle="modal"
									data-target="#editform" disabled onclick="editCourse();">
									<b><i class="fa fa-pencil-square-o" aria-hidden="true"></i></b>Edit
								</button>
								<button type="button" id="deleteBtn"
									class="btn bg-teal-400 btn-labeled delete-row bg-delete" disabled onclick="deleteCourses();">
									<b><i class="fa fa-trash-o" aria-hidden="true"></i></b>Delete
								</button>
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
										<th><span>Course Name</span></th>              
										<th><span>Domain</span></th>
										<th><span>Category</span></th>
										<th><span>Sub Category</span></th>
										<th><span>Level</span></th>
										<th><span>Course Identifier</span></th>
										<th><span>Course Title</span></th>
									</tr>
								</thead>
							</table>
							<div class="ibox-content" id="panelContent" style="display:none;">
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Image Path
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelimagePath"></span>
						                </div>
						                </div>
						          </div>
						          <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Detailed Image Path
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelDetailtimagePath"></span>
						                </div>
						                </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">200X200 image path
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelsmallimagePath"></span>
						                </div>
						                </div>
						          </div>
						          <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Description
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelDescription"></span>
						                </div>
						                </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Featured Course
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelFeaturedCourse"></span>
						                </div>
						              </div>
						            </div>
						             <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Related Courses
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelRelatedCourse"></span>
						                </div>
						                </div>
						          </div>
						          
						          <div><h5 style="margin:20px 0px;font-weight:bold;font-size:16px;">META DATA</h5></div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Description 
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelMetaDesc"></span>
						                </div>
						              </div>
						          </div>
						          <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Title
						                </label>
						                <div class="col-sm-9">
						                  <span id="panelMetaTitle"></span>
						                </div>
						              </div>
						          </div>
						           <div class="row">
						              <div class="form-group">
						                <label for="source" class="col-sm-3 control-label">Keywords
						                </label>
						                <div class="col-sm-9">
						                 <span id="panelpanelKeywords"></span>
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
                <label for="courseName" class="col-sm-4 control-label">Course
                  Name </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Course Name" id="courseName" name="courseName">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="domain" class="col-sm-4 control-label">Domain </label>
                <div class="col-sm-8">
                  <div class="ui-widget">
                  <input type="text" class="form-control" placeholder="Domain" id="domain" name="domain">
                  </div>
                </div>
              </div>
            </div>
          </div>
           <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="category" class="col-sm-4 control-label">Category
                </label>
                <div class="col-sm-8">
                   <div class="ui-widget">
                   <input type="text" class="form-control" placeholder="Category" id="category" name="category">
                   </div>
                 </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="subCategory" class="col-sm-4 control-label">Sub Category
                </label>
                <div class="col-sm-8">
                   <div class="ui-widget">
                   <input type="text" class="form-control" placeholder="SubCategory" id="subCategory" name="subCategory">
                   </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="courseName" class="col-sm-4 control-label">Course
                  Identifier </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Course Identifier" id="courseIdentifier" name="courseIdentifier">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="domain" class="col-sm-4 control-label">Course Priority No </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Course PriorityNo" id="priortyNo" name="priortyNo">
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="courseName" class="col-sm-4 control-label">Course
                  Keywords </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Course KeyWords" id="keywords" name="keywords">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="domain" class="col-sm-4 control-label">Course Title </label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" placeholder="Course Title" id="courseTitle" name="courseTitle">
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
                <label for="detailImagePath" class="col-sm-4 control-label">Complete Image Path
                </label>
                <div class="col-sm-8">
                 <input type="text" class="form-control" placeholder="Complete Image path" id="compImagePath" name="compImagePath">
                </div>
              </div>
            </div>
          </div>
           <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
	            <label for="imagePath" class="col-sm-4 control-label">200X 200 Image Path</label>
	            <div class="col-sm-8">
	              <input type="text" class="form-control" placeholder="Image Path" id="smallimagePath" name="smallimagePath">
	            </div>
	          </div>
            </div>
              <div class="col-sm-6">
              <div class="form-group">
                <label for="featuredCourse" class="col-sm-4 control-label">Featured course
                </label>
                <div class="col-sm-8">
		              <label class="radio-inline">
                <input type="radio" name="featured" id="featured" value="Y"> Yes
              </label>
              <label class="radio-inline">
                <input type="radio" name="featured" id="featured" value="N"> No
              </label>
              <label for="featuredCourse" style="display: block;" class="error"></label>
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
                <label for="relatedCourses" class="col-sm-4 control-label">Related Courses
                </label>
                <div class="col-sm-8">
							<select id="relatedCourses" class="form-control"   name="relatedCourses" multiple="multiple">
										<c:forEach var="type" items="${courseMap}">
										      <option value="${type.key}"> ${type.value}</option>
										</c:forEach>
						    </select>
							<label for="relatedCourses" style="display: block;" class="error"></label>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="level" class="col-sm-4 control-label">Level
                </label>
                <div class="col-sm-8">
                  <select class="form-control" id="level" name="level">
                   <option value="">Choose Level</option>
                   <option value="Beginner">Beginner</option>
                    <option value="Intermediate">Intermediate</option>
                      <option value="Advanced">Advanced</option>
                   </select>
                </div>
              </div>
            </div>
          </div>
           <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <label for="courseContent" style="padding: 0;" class="col-sm-2 control-label">Course Content</label>
                <div class="col-sm-10">
                  <textarea class="form-control" placeholder="Course Content" id="addCourseInfo" name="addCourseInfo"></textarea>
                </div>
              </div>
              </div>
          </div>
          <div class="row">
             <div class="col-sm-12">
              <div class="form-group">
                <label for="description" class="col-sm-2 control-label">Description
                </label>
                <div class="col-sm-10">
                <textarea class="form-control" placeholder="Description" id="courseDesc" name="courseDesc"></textarea>
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
                <label for="metaDataDesc" class="col-sm-4 control-label">Title
                </label>
                <div class="col-sm-8">
                  <input class="form-control" placeholder="Meata Data Title" id="metaCourseTitle" name="metaCourseTitle" type="text">
                </div>
              </div>
            </div>
             <div class="col-sm-6">
              <div class="form-group">
                <label for="keywords" style="padding: 0;" class="col-sm-4 control-label">Keywords</label>
                <div class="col-sm-8">
                  <input class="form-control" placeholder="Keywords" id="metaKeywords" name="metaKeywords" type="text">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="meatadesc" class="col-sm-4 control-label">Description
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
<script>
$(document).ready(function() {
	var availableTags = ${domainList};
	var categoryTags = ${categoryList};
	var subCategoryTags = ${subCategoryList};
	$( "#domain" ).autocomplete({
	      source: availableTags
	});
	$( "#category" ).autocomplete({
	      source: categoryTags
	});
	$( "#subCategory" ).autocomplete({
	      source: subCategoryTags
	});
	
	$('#relatedCourses').multiselect({
        includeSelectAllOption: true,
        enableFiltering:true,
        enableCaseInsensitiveFiltering: true,
        maxHeight: 200,
    });
	
    
	
      
});
</script>
	
</body>
</html>
