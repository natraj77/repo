<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${course.courseName} training | Tadaay</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Understand how ${course.courseName} training will help you to build your career strong in IT">
    <meta name="keywords" content="${course.courseName} training, ${course.courseName} certification training, ${course.courseName} training for beginners, ${course.courseName} course, ${course.courseName} online course,${course.courseName} training and certification,${course.courseName} course content,${course.courseName} jobs,${course.courseName} salary, ${course.courseName} average salary, learn ${course.courseName}, learn ${course.courseName} online">
    <meta name="robots" content="index,follow">
    <meta property="og:type" content="website" />
	<meta property="og:title" content="Tadaay | Your career advisor" />
	<meta property="og:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>/courses/${course.courseIdentifier}" />
	<meta property="og:image"	content="<%= request.getScheme() %>://<%=request.getServerName() %>${course.compImagePath}" />
	<meta property="og:site_name" content="Tadaay" />

	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="Tadaay | Your career advisor" />
	
    
    <!-- Owl Caousel CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendor/OwlCarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendor/OwlCarousel/owl.theme.default.min.css">
     <!-- Switch Style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hover-min.css">
    
    <%@ include file='/static/header-include.jsp'%>
    <!-- jPList core js and css  -->		
    <style>
    	#country-list{
    		z-index:1;
    	}
    	.modal-body{
    		padding:30px;
    	}
    </style>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
 <div class="row">
      <div class="owl-carousel">
		<div class="slider1">
			<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider1-aws.jpg" alt="thumb">
		</div>
		<div class="slider1">
			<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider1-aws.jpg" alt="thumb">
		</div>
		<div class="slider1">
			<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider1-aws.jpg" alt="thumb">
		</div>
	</div>
</div>
<!-- Inner Page Banner Area End Here -->
<!-- Courses Page 5 Area Start Here -->
<div class="courses-page-area5">
  <div class="container">
    <div class="row"> 
      <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
        <div class="course-details-inner">
          <a href="#" class="enroll-btn learn-btn" data-toggle="modal" data-target="#wantToLearn">I want to learn</a>
          <h1 class="title-default-left title-bar-high"><c:out value="${course.courseName}" /> </h1>
          <p><c:out value="${course.courseDesc}" /> 
          </p>
          <img src="<%=request.getContextPath()%>${course.compImagePath}" class="img-responsive img-python" alt="course">
          <section id="stats10" class="parallax text-center">
<!-- 			            <div class="counter">
			                <h2 class="about-counter title-bar-counter number1" data-num="80">80</h2>
			                <div class="description">Students</div>
			            </div>
			             <div class="counter">
			                <h2 class="about-counter title-bar-counter" data-num="80">80</h2>
			                <div class="description">Jobs</div>
			            </div>
			             <div class="counter">
			                <h2 class="about-counter title-bar-counter" data-num="80">80</h2>
			                <div class="description">Trainers</div>
			            </div>
			             <div class="counter">
			                <h2 class="about-counter title-bar-counter" data-num="80">80</h2>
			                <div class="description">Companies</div>
			            </div> -->
			</section>
			<c:out value="${course.addCourseInfo}" escapeXml="false"></c:out>
        </div>
      <c:if test='${not empty recommendedCourses}'>
        <div class="related-courses-title-area">
          <h3>Related Courses</h3>
        </div>
        <div id="shadow-carousel" class="related-courses-carousel">    
          <div class="rc-carousel"
               data-loop="true"
               data-items="3"
               data-margin="15"
               data-autoplay="false"
               data-autoplay-timeout="10000"
               data-smart-speed="2000"
               data-dots="false"
               data-nav="true"
               data-nav-speed="false"
               data-r-x-small="1"
               data-r-x-small-nav="true"
               data-r-x-small-dots="false"
               data-r-x-medium="2"
               data-r-x-medium-nav="true"
               data-r-x-medium-dots="false"
               data-r-small="1"
               data-r-small-nav="true"
               data-r-small-dots="false"
               data-r-medium="2"
               data-r-medium-nav="true"
               data-r-medium-dots="false"
               data-r-large="3"
               data-r-large-nav="true"
               data-r-large-dots="false"> 
            
            <c:forEach var='data' items='${recommendedCourses}'>
						<div class="list-item" id="tadaay-courses">
							<div class="course-box">	
								<div class="course-icon">
									<a href="<%=request.getContextPath()%>/courses/${data.courseIdentifier}"><img class="img-responsive" src="<%=request.getContextPath()%>${data.imagePath}" alt="" title=""></a>
								</div>
								<div class="course-content desc">
									<h4 class="title ${data.subCategory}"><a href="<%=request.getContextPath()%>/courses/${data.courseIdentifier}">${data.courseName}</a></h4>
									<div class="courseprice-datesec">
										<div class="learnerdatesec">
										 	<span class="learnerscount">${data.category}</span>
											 <span class="no-jobs">
											 	<span>${data.subCategory}</span> 
											</span>
										</div>
									</div>
									<span class="avg-salary like">
										<span>Level :  </span>
										<span class="${data.level}">${data.level}</span>
									</span>
									<div class="ep-course-meta theme">
										<a href="<%=request.getContextPath()%>/courses/${data.courseIdentifier}" class="button btn btn-primary btn-lg">
													View					
										</a>		
									</div>
								</div>
							</div>
						</div>
			</c:forEach>	
					                    
          </div> 
        </div>
        </c:if>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
        <div class="sidebar">
			<%-- <div class="sidebar-box">
                <div class="sidebar-box-inner">
                    <p style="font-size:18px">Are you a <c:out value="${course.courseName}" /> trainer ?</p>
                    <div class="sidebar-course-price">
                    <a href="<%=request.getContextPath()%>/signup/trainer" class="trainer-signup-btn">Sign Up</a>
                    </div>
                </div>
            </div> --%>
          <div class="sidebar-box">
            <div class="sidebar-box-inner">
              <a href="#" class="enroll-btn learn-btn">More Info</a>
              <div class="sidebar-course-price">
                <a href="<%=request.getContextPath()%>/all-batches/find-leading-training-institutes" class="enroll-btn enroll-btn1">Upcoming Batches</a>
              </div>
              <div class="sidebar-course-price">
                <a href="<%=request.getContextPath()%>/quiz-terms" class="enroll-btn enroll-btn1">Take Quiz</a>
              </div>
              <h3 class="sidebar-title">Find Trainers by City</h3>
              <div class="sidebar-course-price">
                <a href="<%=request.getContextPath()%>/all-trainers/find-trainers-for-${course.courseIdentifier}-in-Hyderabad" class="enroll-btn enroll-btn1">Hyderabad</a>
                <a href="<%=request.getContextPath()%>/all-trainers/find-trainers-for-${course.courseIdentifier}-in-Bangalore" class="enroll-btn enroll-btn1">Bangalore</a>
                <a href="<%=request.getContextPath()%>/all-trainers/find-trainers-for-${course.courseIdentifier}-in-Pune" class="enroll-btn enroll-btn1">Pune</a>
                <a href="<%=request.getContextPath()%>/all-trainers/find-trainers-for-${course.courseIdentifier}-in-Mumbai" class="enroll-btn enroll-btn1">Mumbai</a>
                <a href="<%=request.getContextPath()%>/all-trainers/find-trainers-for-${course.courseIdentifier}-in-Chennai" class="enroll-btn enroll-btn1">Chennai</a>
                <a href="<%=request.getContextPath()%>/all-trainers/find-trainers-for-${course.courseIdentifier}-in-noida" class="enroll-btn enroll-btn1">Noida</a>
              </div>
            </div>
          </div>
          
          <%-- <div class="sidebar-box">
            <div class="sidebar-box-inner">
              <a href="#" class="enroll-btn learn-btn">More Info</a>
              <h3 class="sidebar-title">Self Learning</h3>
              <div class="sidebar-course-price">
                <a href="<%=request.getContextPath()%>/docs/?course=${course.courseIdentifier}" class="enroll-btn enroll-btn1">Documentation</a>
                <a href="<%=request.getContextPath()%>/videos/?course=${course.courseIdentifier}" class="enroll-btn enroll-btn1">videos</a>
                <a href="<%=request.getContextPath()%>/quizzes/?course=${course.courseIdentifier}" class="enroll-btn enroll-btn1">quizzes</a>
                <a href="trainers.php" class="enroll-btn enroll-btn1">Documentation</a>
                <a href="#" class="enroll-btn enroll-btn1">videos</a>
                <a href="#" class="enroll-btn enroll-btn1">quizzes</a>
              </div>
            </div>
          </div> --%>
        </div>
      </div>             
    </div>
  </div>
</div>
<!-- Courses Page 5 Area End Here -->
<!-- Modal -->
<div class="modal fade" id="wantToLearn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">I want to learn</h4>
      </div>
      <form>
        <div class="modal-body leave-comments">
          <fieldset>
            <div class="col-sm-6">
              <div class="form-group">
                <select class="form-control">
                  <option>Mode</option>
                  <option>Online</option>
                  <option>Classroom</option>
                </select>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <select class="form-control">
                  <option>Location</option>
                  <option>Location 1</option>
                  <option>Location 2</option>
                </select>
              </div>
            </div>
            <div class="col-sm-12">
              <div class="form-group">
              <input type="text" placeholder="Prefered Time" class="form-control"> 
              </div>
            </div>
            <div class="col-sm-12">
              <div class="form-group margin-bottom-none">
                <button type="submit" class="view-all-accent-btn pull-right">Save</button>
              </div>
            </div>
          </fieldset>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="question-fixbar">
	<a data-toggle="modal" data-target="#popup-1" href="#">Submit Request</a>
</div>
<div class="modal fade" id="popup-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Submit your Requirement</h4>
      </div>
    <form id="questionForm">
     <div class="modal-body">
     		<div class="form-group">
     			<div class="row">
     				<div class="col-lg-12">
     					<div class="col-sm-6">
     						  <label for="courseList">First Name </label>
					            <div>
					              <input type="text" class="form-control" id="firstName" name="name"> 
					            </div>
     					</div>
     					<div class="col-sm-6">
     						 <label for="courseList">Last Name </label>
				            <div>
				              <input type="text" class="form-control" id="lastNname" name="name"> 
				            </div>
     					</div>
     				</div>
	            </div>
          	</div>
          	  <div class="form-group">
	          <div class="row">
	          <div class="col-lg-12">
     					<div class="col-sm-6">
     						  <label for="courseList">Mobile </label>
				            <div>
				              <input type="text" class="form-control" id="mobile" name="mobile"> 
				            </div>
     					</div>
     					<div class="col-sm-6">
     						  <label for="courseList">Email </label>
				            <div>
				              <input type="text" class="form-control" id="email" name="email"> 
				            </div>
     					</div>
     			</div>
	           </div>
          </div>
           <div class="form-group">
	           <div class="row">
	            <div class="col-lg-12">
	           		<div class="col-lg-6">
	           			 <label  class="control-label">Iam</label>
			            <div>
			              <label class="radio-inline">
			                <input type="radio" name="relevent" id="fresher" value="y"> Fresher
			              </label>
			              <label class="radio-inline">
			                <input type="radio" name="relevent" id="experienced" value="y"> Experince
			              </label>
			              <label for="modeType" style="display: block;" class="error"></label>
			            </div>
	           		</div>
	           		<div class="col-lg-6">
	           			 <label for="courseList">Course </label>
			            <div>
			               <input type="text" class="form-control" id="coursename" name="coursename" autocomplete="off" placeholder="Search for courses"> 
			            	<div id="course-box" class="trainer-courses"></div> 
			            </div>
           			</div>
           		</div>
	            </div>
          </div>
           <div class="form-group">
           <div class="row">
            <div class="col-lg-12">
           		<div class="col-lg-6">
           			 <label  class="control-label">Mode</label>
		            <div>
		              <label class="radio-inline">
		                <input type="radio" name="mode" id="online" value="y"> Online
		              </label>
		              <label class="radio-inline">
		                <input type="radio" name="mode" id="classroom" value="y"> ClassRoom
		              </label>
		              <label for="modeType" style="display: block;" class="error"></label>
		            </div>
           		</div>
           		<div class="col-lg-6">
           			 <div class="form-group locationdiv">
			            <label for="courseList">Location </label>
			            <div>
			              <input type="text" class="form-control" disabled id="location" name="location"> 
			            </div>
		           	</div>
           		</div>
            </div>
          </div>
          </div>
         <div class="form-group">
           <div class="row">
           <div class="col-lg-12">
           		<div class="col-lg-6">
           			 <label for="courseList">
	               Start Time </label>
            <div>
              <input class="form-control valid"  id="preferredTimeStart" name="preferredTimeStart" type="text"> 
            </div>
           		</div>
           		<div class="col-lg-6">
           			 <label for="courseList">
	              End Time </label>
            <div>
              <input class="form-control valid"  id="preferredTimeEnd" name="preferredTimeEnd" type="text"> 
            </div>
           		</div>
           </div>
           
         </div>
         </div>
	                	<!-- <div class="form-group">
	                	<textarea class="form-control"  id="queryId" rows="3" cols="70" name="queryId" placeholder="Message"></textarea>
	                	</div> -->
	                	<div class="form-group terms">
						<input type="checkbox" name="accept" id="accept"> I accept the terms and conditions as described  by the "tadaay" 
					</div>
                	 <div class="form-group" style="text-align:right">
                        <input type="button" class="view-all-accent-btn" onclick="sendQuestion();" value="Submit"/>
                    </div>
                    </div>
                </form>
    </div>
  </div>
</div>
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script src="<%=request.getContextPath()%>/resources/assets/js/login.js" type="text/javascript"></script>
	<script src="../resources/assets/plugins/bootstrap-datetimepicker/moment.min.js"></script>
	<script src="../resources/assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script>
$(function () {
    $("input[name='mode']").click(function () {
        if ($("#classroom").is(":checked")) {
            $(".locationdiv input").prop( "disabled", false );
        } else {
            $(".locationdiv input").prop( "disabled", true );
        }
    });
});
$(document).ready(function(){
	$('.owl-carousel').owlCarousel({
		nav:true,
		items:1,
		loop:true,
		autoplay:true,
		autoplayTimeout:3000,
		autoplayHoverPause:true
	})
});	
$(document).ready(function () {
    //$('#preferredTimeStart').datetimepicker();
    //$('#preferredTimeEnd').datetimepicker();
    $('#datetimepicker1').datetimepicker();
    
    $('#preferredTimeStart').datetimepicker({
    	format: 'HH:mm'
    })
     $('#preferredTimeEnd').datetimepicker({
    	format: 'HH:mm'
    })
    
  
});

var selectedCourse = '';
var collectionData = '';
$(document).ready(function() {
	$("#coursename").keyup(function(){
		selectedCourse = '';
		if($(this).val().length>=2){
			if(collectionData==''){
				$.ajax({
				type: "POST",
				url: "../fetchSuggestions",
				data:'searchText='+$(this).val(),
				beforeSend: function(){
					$("#coursename").css("background","#FFF  no-repeat 165px");
				},
				success: function(data){
					collectionData = data.courses;
					}
				
				});
			}
			filterData(collectionData,$("#coursename").val().toUpperCase());
		}else{
			$("#course-box").hide();
		}
		
	});
});

function filterData(collectionData,containsStr){
	$("#course-box").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].courseName.toUpperCase().indexOf(containsStr)>=0){
			htmlTxt = htmlTxt + '<li onClick="selectCourse(this,\''+collectionData[k].courseName+'\');" value="'+collectionData[k].id+'">'+collectionData[k].courseName+'</li>';
	    }
	}
	$("#course-box").html('<ul id="country-list" >'+htmlTxt+'</ul>');
	$("#coursename").css("background","#FFF");
}

function selectCourse(val,courseIdentifier) {
	selectedCourse = courseIdentifier;
	$("#coursename").val(selectedCourse);
	$("#dmnCourseId").val(val.value);
	$("#course-box").hide();
}

function checkSelectedCourse(){
	if(selectedCourse==''){
		alert('No Courses Found at this time. please select from list of options from Search result.');
	}
}

</script>
 </body>
</html>
<!--  Include Footer  -->