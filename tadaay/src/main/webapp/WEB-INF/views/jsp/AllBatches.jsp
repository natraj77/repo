<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <c:if test = "${city != null}">
    <title>Best training institutes for ${courseName} training in ${city}| Tadaay</title>
    <meta name="description" content="Find trainers for ${courseName} training in ${city} - find reviews,new batch information and contact details">
    <meta name="keywords" content="find trainers for ${courseName}, find trainers for ${courseName} in ${city}, learn ${courseName} classroom, best training institutes for ${courseName}, best training institutes for ${courseName} in ${city}, best ${courseName} training institutes in ${city}, online trainers for ${courseName}, classroom trainers for ${courseName}
">
    </c:if>   
    <c:if test = "${city == null}">
    <title>Find best training institutes | Tadaay</title>
    <meta name="description" content="find trainers for all IT courses.">
    <meta name="keywords" content="find best training institutes, classroom trainers and reviews">
    </c:if>   
    
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <!-- facebook Linked In gplus-->
    <meta property="og:title" content="Find leading IT courses, training institutes" />
	<meta property="og:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>/all-batches/find-leading-training-institutes "/>
	<meta property="og:type" content="website" />
	<meta property="og:description" content="Give a facelift to your career with Tadaay! Find IT courses, trainers, training institutes and reviews in one go." />
	<meta property="og:image" content="<%= request.getScheme() %>://<%=request.getServerName() %>/appContent/opt/tadaay/uploads/website/promotions/batch-facebook.jpg" />
	
	 <!-- twitter card --->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="Find leading IT courses, trainers and reviews | Tadaay" />
	<meta name="twitter:description" content="Give a facelift to your career with Tadaay! Find IT courses, trainers, training institutes and reviews in one go." />
	<meta name="twitter:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>/all-batches/find-leading-training-institutes" />
	<meta name="twitter:image" content="<%= request.getScheme() %>://<%=request.getServerName() %>/appContent/opt/tadaay/uploads/website/promotions/batch-twitter.jpg" />
    <!-- jPList core js and css  -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.core.min.css" rel="stylesheet" type="text/css" />		
		<!-- jPList toggle bundle -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.history-bundle.min.css" rel="stylesheet" type="text/css" />		
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />		
		<!-- jPList textbox filter control -->
		
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />
		<!-- Global site tag (gtag.js) - Google Analytics -->
		  <%@ include file='/static/header-include.jsp'%>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-108404388-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-108404388-1');
</script>
<style>
/* The Modal (background) */
/* .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
} */

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<!-- Slider 1 Area Start Here -->               
<section id="slider">
				<div class="slider">
					<div class="layerslider height-500" style="width:100%;">
						<c:forEach var='banner' items='${addbanners}'>
						
						<div class="ls-slide" data-ls="slidedelay:3000;transition2d: all;;">
							<!-- background image -->
							<div> <c:out value="${banner[0]}" /> </div>
							<img src="<%=request.getContextPath()%>/<c:out value="${banner[1]}" />" width="100" height="100" class="ls-bg" />
						</div>
						</c:forEach>
					</div>
					<script type="text/javascript">
						var layer_options = {
							responsive: 		false,
							responsiveUnder: 	1280,
							layersContainer: 	1280,
							hoverPrevNext: 		true,
							hoverPrevNext: 		true,
							pauseOnHover: true,
							skinsPath: 			'<%=request.getContextPath()%>/resources/vendor/slider.layerslider/skins/'
						}
					</script>
				</div>
			</section>
<!-- Slider 1 Area End Here -->
<div class="container">
    <div class="pagination-area">
      <ul>
        <li><a href="<%=request.getContextPath()%>/">Home</a> -</li>
        <li>Trainers</li>
      </ul>
    </div>
  </div>
<section id="tadaay-courses">
				<div id="course_filter" class="jplist container">
					<div class="row">
			<!-- Left -->
			<div class="col-md-3 col-sm-4 col-lg-3">
			 <div class="filtercatsec">
			    <div class="categorymain">
			      <div class="categorytitle">Course Categories</div>
			        	<ul class="categorylist">
			        	 <c:forEach var='leftPanel' items='${leftPanel}'>
			        	<li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);" id="<c:out value="${leftPanel.key}" />"><c:out value="${leftPanel.key}" /></a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="courses">
						                <c:forEach var='arrayItem' items='${leftPanel.value}' >
													      <li class="traininglist"> 
														   <input data-path=".${fn:replace(arrayItem,' ', '')}" id="${fn:replace(arrayItem,' ', '')}" type="checkbox" /> 
														   <label for="<c:out value="${arrayItem}" />"> <c:out value="${arrayItem}" /></label>
													   </li>
									  </c:forEach>
						            </ul>
				            </li>
				         </c:forEach>   
				       	</ul>
			    </div>
			    
			    <div class="refinesearchsec">
			        <h4>Refine Your Search</h4>
			         <div class="jplist-panel">
			         	<ul id="catlist" class="categorylist">
				            <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);" id="cityAccrd">City</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="city">
						                <c:forEach var='leftPanelTypes' items='${leftPanelCities}'>
									       <li class="traininglist"> 
										   		<input data-path=".${fn:replace(leftPanelTypes,' ', '')}" id="${fn:replace(leftPanelTypes,' ', '')}"  type="checkbox" /> 
										   		<label for="red-color"><c:out value="${leftPanelTypes}" /></label>
										   </li>
									    </c:forEach>
						            </ul>
				            </li>
				             <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Location</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="city">
						             <c:forEach var='leftPanelLocality' items='${leftPanelLocality}'>
								       <li class="traininglist"> 
									   		<input data-path=".${fn:replace(leftPanelLocality,' ', '')}" id="red-color"  type="checkbox" /> 
									   		<label for="red-color"><c:out value="${leftPanelLocality}" /></label>
									   </li>
								    </c:forEach>
						             </ul>
				            </li>
				           <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Training Mode</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="mode">
						               <li class="traininglist">
					                    <input data-path=".ClassRoom" id="classroom" type="checkbox">
					                    <label for="classroom">Class Room</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".Online" id="online" type="checkbox">
					                    <label for="online">Online</label>
					                </li>
					                </ul>
				            </li>
				            <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Advantages</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="advantages">
						               <li class="traininglist">
					                    <input data-path=".RealTime" id="rtprojects" type="checkbox">
					                    <label for="rtprojects">Realtime projects</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".LabAssistance" id="lab" type="checkbox">
					                    <label for="lab">Lab assistance</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".PlacementAssistance" id="passistance" type="checkbox">
					                    <label for="passistance">Placement assistance</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".FeeInInstallments" id="instalments" type="checkbox">
					                    <label for="instalments">Fee in installments</label>
					                </li>
						            </ul>
				            </li>
				       </ul>
						<div class="jplist-panel box">	
						<div class="cfilter_actions">										
						<!-- back button button -->
						<!-- reset button -->
						<button 
							type="button" 
							class="jplist-reset-btn"
							data-control-type="reset" 
							data-control-name="reset" 
							data-control-action="reset">
							Reset
						</button>
						<!-- items per page dropdown -->
						<div style="display:none;"
						   class="jplist-drop-down" 
						   data-control-type="items-per-page-drop-down" 
						   data-control-name="paging" 
						   data-control-action="paging">
						   <ul>
							 <li><span data-number="6" data-default="true"> 10 per page </span></li>
							 <li><span data-number="all"> View All </span></li>
						   </ul>
						</div>
						</div>
					</div>	
			        </div>
			    </div>
			    
			</div>
					</div>
					<div class="col-md-9 col-lg-9 col-sm-8" style="padding:0px;">
					<div class="no-padding coursetilesec">
					    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 catinfosec clearfix">
					        <div class="filtericons">
					            <div class="row">
					             <div class="course-search">
					                    <div class="col-md-8 col-sm-6 col-xs-12">
							            	<div class="jplist-panel panel-top">	
							            		<div>																
													<!--[if lt IE 10]>
													<div class="jplist-label">Filter by Title:</div>
													<![endif]-->
													<input 
														data-path=".title" 
														type="text" 
														value="" 
														placeholder="Filter by Title" 
														data-control-type="textbox" 
														data-control-name="title-filter" 
														data-control-action="filter"
														class="form-control"
													/>
												</div>
							            	</div>
					            		</div>
					            		<div class="col-md-4 col-sm-6 col-xs-12">
					            			<div class="jplist-panel box panel-bottom">
												<div class="jplist-label" data-type="Showing {start} - {end} of {all}" data-control-type="pagination-info" 
												   data-control-name="paging" 
												   data-control-action="paging">
												</div>
											</div>	
					            		</div>
					            	</div>
					            </div>
					        </div> 
					    </div>
					</div>
					

					<!-- data -->   
			<div class="list" id="course2">
					
				<c:forEach var='data' items='${data}'>
				
				<div id="${data[11]}" class="modal">
				<div class="modal-dialog" role="document">
				  <div class="modal-content">
				  <div class="modal-body">
				    <span class="close" onclick="closeModel(${data[11]},'${userLoggedIn}');">&times;</span>
				    <p>Email Id : </p> ${data[9]}
				    <p>Mobile No : </p> ${data[10]}
				  </div>
				  </div>
				  </div>
				</div>

					<div class="course-list list-item">
						<div class="trainer-name">
					 		<h4 class="heading title ${data[1]} ${data[7]} ${data[8]} ${fn:replace(data[4],' ', '')} ${data[18]}">${data[0]}</h4>
					 		<p class="trainer-by">by <a href="javascript:void();">${data[24]}</a></p>
	                        <ul class="course-features">
	                            <li><i class="fa fa-calendar" aria-hidden="true"></i> ${data[2]}</li>
	                            <li><i class="fa fa-clock-o"></i> ${data[3]}</li>
	                            <li><i class="fa fa-map-marker" aria-hidden="true"></i> ${data[8]} | ${data[7]}</li>	   
	                           <li><i class="fa fa-users"></i> Enrolled | ${data[21]}</li>	   
	                            <li class="enroll-brd"><a href="#" class="apply-now-btn enroll-now" onclick="getbatchSubscription('${data[19]}','${data[20]}','${userLoggedIn}');">Enroll Now</a></li>                                                    
	                        </ul>
	                    </div>
	                    <div class="course-media">
	                        <img src="<%=request.getContextPath()%>/resources/images/trainers/no-image2.jpg" class="img-responsive course-img" alt="Polyglot Logo">             
	                    </div>
	                    <div class="course-detail desc">
	                        <div class="personal">
		                        <div>
		                            <span>Mode</span> 
		                            <span>${data[4]}</span>
		                        </div>
		                        <div>
		                            <span>Duration</span> 
		                            <span>${data[5]}</span>
		                        </div>
		                        <div>
		                            <span>Schedule</span> 
		                            <span>${data[6]}</span>
		                        </div>
		                        <div>
		                        	<span>Fee</span>
		                        	 <span>
					                        <span class="strikethrough">
						                        <span class="actualprice">
						                        	<i class="fa fa-inr"></i>${data[12]}
						                        </span>
					                        </span> 
					                        <span><i class="fa fa-inr"> </i>${data[13]}</span>
		                    		</span>
		                        </div>
		                    </div>                       
	                        <div class="brief">
	                        	<ul class="list-styled">
		                            <li class="${data[14]}">Realtime projects</li>
		                            <li class="${data[15]}">Fee in installments</li>
		                            <li class="${data[16]}">Lab assistance</li>
		                            <li class="${data[17]}">Placement assistance</li>
		                        </ul> 
	                       
	                        </div>	        
	                        <div class="trainer-actions">
		                        <c:if test="${not empty data[23]}">
		                        <a  href="javascript:void(0);" id="showVideo" onclick="courseVideo('${userLoggedIn}','${data[23]}');" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Demo</a>
		                        </c:if>
		                        <c:if test="${not empty data[22]}">
		                        <a  href="javascript:void(0);" id="showContent" onclick="courseContent('${userLoggedIn}','${data[22]}');"  class="btn-sm"  >Course Content</a> 
		                        </c:if>
		                        <a  href="javascript:void(0);" onclick="callforDemoOrCallBack('C','${userLoggedIn}','${data[9]}');" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Call Back</a>
		                        <a  href="javascript:void(0);" onclick="openModel(${data[11]},'${userLoggedIn}');" class="btn-sm" data-toggle="modal" data-target="#request_demo">Contact Details</a>
	                        </div>
	                    </div>
	                </div> 
	            </c:forEach>   
	                 <!-- trainer 4 -->
					</div>
					<div class="jplist-panel box panel-top">
						<!-- pagination results -->
						<!--div class="jplist-label" data-type="Page {current} of {pages}" data-control-type="pagination-info" 
						   data-control-name="paging" 
						   data-control-action="paging">
						</div-->
						<!-- pagination control -->
						<div 
						   class="jplist-pagination" 
						   data-control-type="pagination" 
						   data-control-name="paging" 
						   data-control-action="paging">
						</div>
					</div>						 
					<div class="box jplist-no-results text-shadow align-center">
						<p>No results found</p>
					</div>	
				</div>
				</div>
				</div>
				</section>
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
				<button type="button" class="close"  data-dismiss="modal"
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
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>

<script>
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show-in");
        this.nextElementSibling.classList.toggle("show");
  }
}

function openPDF(loggedIn){
	if(loggedIn=='Y'){
		window.open("<%=request.getContextPath()%>/resources/trainerContent/AWS-Administration.pdf",'resizable,scrollbars');
	}else{
	if (window.confirm("Please Login to Continue with Request")) { 
		window.location.href = "<%=request.getContextPath()%>/Login";
	}
	}
}

function openModel(id,loggedIn){
	if(loggedIn=='Y'){
		$("#"+id).show();
	}else{
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login";
		}
	}
}
function closeModel(id,loggedIn){
	if(loggedIn=='Y'){
		$("#"+id).hide();
	}else{
	if (window.confirm("Please Login to Continue with Request")) { 
		window.location.href = "<%=request.getContextPath()%>/Login";
	}
	}
}

function callforDemoOrCallBack(sourceType,loggedIn,emailid){
	if(loggedIn=='Y'){
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/sendDemoAndCallBack',
			data : {
					source : sourceType,
					emailId : emailid
				},
			success : function(datas) {
				alert('Request has been Proceesed Successfully.');
			}
		});
	}else{
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login";
		}
	}
}
$(document).ready(function() {
	//alert('test');
	var cityId = '${city}';
	var courseName = '${courseNameSetter}';
	var courseGrp = '${courseGroupSetter}';
	if(cityId!='' && cityId!='undefined'){
	$('#'+cityId).prop('checked', true); 
	$('#'+courseName).prop('checked', true); 
	var cityAccrd = document.getElementById("cityAccrd");
	showToggleDisplay(cityAccrd);
	var courseGroupSetter = document.getElementById(courseGrp);
	showToggleDisplay(courseGroupSetter);
	//$('#Microsoft-Azure').prop('checked', true); 	
	}

});

function showToggleDisplay(divId){
	divId.classList.toggle("active");
	divId.nextElementSibling.classList.toggle("show-in");
	divId.nextElementSibling.classList.toggle("show");
}

function  courseContent(loggedIn,courseContent){
	if(loggedIn=='Y'){
	var contentUrl = "../appContent/" + courseContent;
	$("#courseFrameContent").prop('src',contentUrl);
	$("#myModalContent").modal('show');
	}else{
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=all-batches/find-leading-training-institutes";
		}
	}
}
function  courseVideo(loggedIn,videoContent){
	if(loggedIn=='Y'){
	var videoUrl = "../appContent/" + videoContent;
	$("#course-video").find("#videoFrameContent").prop('src', videoUrl);
	$("#course-video").load();
	$("#myModalVideo").modal('show');
    }else{
	if (window.confirm("Please Login to Continue with Request")) { 
		window.location.href = "<%=request.getContextPath()%>/Login?callback=all-batches/find-leading-training-institutes";
	}
}
}

function getbatchSubscription(batchId,courseId,loggedIn){
	if(loggedIn=='Y'){
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/performBatchSubscription',
			data : {
				    batchId : batchId,
				    courseId : courseId
				},
			success : function(datas) {
				if(datas.status=='Y'){
					alert('You are subscribed to the Batch for this Trainer/Institute.');
				}else{
					alert('You are Already Subscribed for this Batch with this Trainer/Institute.');
				}
				
			}
		});
	}else{
		
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=all-batches/find-leading-training-institutes";
		}
	}
}

</script>
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<%--  <script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script> --%>
<!-- jPList core js and css  -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.core.min.js"></script>		
<!-- jPList toggle bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.filter-toggle-bundle.min.js"></script>
<!-- jPList history bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.history-bundle.min.js"></script>
<!-- jPList sort bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.sort-bundle.min.js"></script>
<!-- jPList pagination bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.pagination-bundle.min.js"></script>
<!-- jPList textbox filter control -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.textbox-filter.min.js"></script>
	<script>
		$('document').ready(function(){
		
			$('#course_filter').jplist({				
				itemsBox: '.list' 
				,itemPath: '.list-item' 
				,panelPath: '.jplist-panel'	
			});
		});
		</script>	
<!-- Layer slider js -->  
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/js/layerslider_pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/demo.layerslider_slider.js" type="text/javascript"></script>
<!-- jPList start -->
<!-- jQuery lib -->	
</body>	       
</html>
<!--  Include Footer  -->