<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> find courses in IT | Tadaay</title>
    <meta name="description" content="find leading courses in IT, average salaries. Find documentation, learn online or find trainers and their reviews">
     <meta name="keywords" content="">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <!-- jPList core js and css  -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.core.min.css" rel="stylesheet" type="text/css" />				
		<!-- jPList toggle bundle -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.history-bundle.min.css" rel="stylesheet" type="text/css" />		
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />		
		<!-- jPList textbox filter control -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />
		
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<!-- Slider 1 Area Start Here -->               
<section id="slider">
				<div class="slider">
					<div class="layerslider height-500" style="width:100%;">

						<!-- SLIDE -->
						<div class="ls-slide" data-ls="slidedelay:8000;transition2d:75,79;">
							<!-- background image -->
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/courses/cloud/cloud-background.jpg" class="ls-bg" alt="Slide1 background"/>
							<p class="ls-l" style="top:150px;left:100px;font-weight: 300;font-size:45px;color:#fff;white-space: nowrap;" 
							data-ls="offsetxin:0;durationin:1500;delayin:0;rotateyin:90;skewxin:60;transformoriginin:25% 50% 0;offsetxout:100;durationout:750;skewxout:60;">
								Cloud Computing
							</p>
							<img class="ls-l" data-ls="offsetxin:0;offsetyin:top;delayin:500;fadein:false;offsetxout:right;durationout:3500;fadeout:false;" 
								style="top:80%;left:15%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/cloud/amazon-wed-services.png" alt="Amazon Web Services">
								<img class="ls-l" data-ls="offsetxin:0;offsetyin:top;delayin:1000;fadein:false;offsetxout:right;durationout:3500;fadeout:false;" 
								style="top:70%;left:40%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/cloud/microsoft-azure.png" alt="Microsoft Azure">
								<img class="ls-l" data-ls="offsetxin:0;offsetyin:top;delayin:1500;fadein:false;offsetxout:right;durationout:3500;fadeout:false;" 
								style="top:60%;left:65%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/cloud/google-cloud-platform.png" alt="Google Cloud Platform">
								<img class="ls-l" data-ls="offsetxin:0;offsetyin:top;delayin:2000;fadein:false;offsetxout:right;durationout:3500;fadeout:false;" 
								style="top:40%;left:85%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/cloud/openstack.png" alt="Openstack">
								
						</div>
						 <!-- SLIDE -->
						<div class="ls-slide" data-ls="slidedelay:6000; transition2d: all;">
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/courses/java-vs-python/java-vs-python-bg.jpg" class="ls-bg" alt="Slide2 background" />
							<img class="ls-l" data-ls="offsetxin:0;offsetyin:top;delayin:0;fadein:false;offsetxout:right;durationout:3500;fadeout:false;" 
								style="top:70%;left:35%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/java-vs-python/python.png" alt="Python">
								<img class="ls-l" data-ls="offsetxin:0;offsetyin:top;delayin:1000;fadein:false;offsetxout:right;durationout:3500;fadeout:false;" 
								style="top:71%;left:65%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/java-vs-python/java.png" alt="Java">
							
							<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:2500;
								delayin:2000;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:80%;left:50%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/java-vs-python/vs.png" alt="versus">
							<p class="ls-l" style="top:80%;left:20%;color: #fff; text-shadow: none; font-size: 45px;font-weight:700; line-height: 34px; padding: 0px 10px; padding-top: 1px; margin: 0px; border-width: 0px; border-style: none; white-space: nowrap;" 
							data-ls="offsetxin:left;offsetyin:0;delayin:500;fadein:false;offsetxout:right;durationout:3500;fadeout:false;">Python</p>
							<p class="ls-l" style="top:80%;left:80%;color: #fff; text-shadow: none; font-size: 45px;font-weight:700; line-height: 34px; padding: 0px 10px; padding-top: 1px; margin: 0px; border-width: 0px; border-style: none; white-space: nowrap;" 
							data-ls="offsetxin:right;offsetyin:0;delayin:1500;fadein:false;offsetxout:right;durationout:3500;fadeout:false;">Java</p>
						</div> 
					<!-- SLIDE -->
						<div class="ls-slide" data-ls="slidedelay:7000; transition2d: all;">
							<img style="width:100%;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/datascience/datascience-background.jpg" class="ls-bg" alt="Slide3 background" />
							<p class="ls-l" style="top:150px;left:100px;font-weight: 300;font-size:45px;color:yellow;white-space: nowrap;" data-ls="offsetxin:0;durationin:1500;delayin:0;rotateyin:90;skewxin:60;transformoriginin:25% 50% 0;offsetxout:100;durationout:750;skewxout:60;">
								DATA SCIENCE
							</p>
							<img class="ls-l" data-ls="
								durationin:2500;
								scalexin:0.8;
								scaleyin:0.8;
								scalexout:0.8;
								scaleyout:0.8;" 
								style="top:220px;left:25%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/datascience/data-mining.png" alt="Data Mining">
								<p class="ls-l" style="top:450px;left:22%;font-weight: 300;height:40px;padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#ffffff;white-space: nowrap;" 
								data-ls="durationin:1500;delayin:1000;rotatein:20;rotatexin:30;scalexin:1.5;scaleyin:1.5;transformoriginin:left 50% 0;durationout:750;rotateout:20;rotatexout:-30;scalexout:0;scaleyout:0;transformoriginout:left 50% 0;">
									Data Mining
								</p>
								 <img class="ls-l" data-ls="
								durationin:5500;
								scalexin:0.8;
								scaleyin:0.8;
								scalexout:0.8;
								scaleyout:0.8;" 
								style="top:150px;left:55%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/datascience/machine-learning.png" alt="Machine Learning">
								<p class="ls-l" style="top:430px;left:55%;font-weight: 300;height:40px;padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#ffffff;white-space: nowrap;" 
								data-ls="durationin:1500;delayin:3000;rotatein:20;rotatexin:30;scalexin:1.5;scaleyin:1.5;transformoriginin:left 50% 0;durationout:750;rotateout:20;rotatexout:-30;scalexout:0;scaleyout:0;transformoriginout:left 50% 0;">
									Machine Learning
								</p>
							<img class="ls-l" data-ls="
								durationin:9500;
								scalexin:0.8;
								scaleyin:0.8;
								scalexout:0.8;
								scaleyout:0.8;" 
								style="top:150px;left:80%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/datascience/data-analytics.png" alt="Data Analytics">

								<p class="ls-l" style="top:350px;left:80%;font-weight: 300;height:40px;padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#ffffff;white-space: nowrap;" 
								data-ls="durationin:1500;delayin:4000;rotatein:20;rotatexin:30;scalexin:1.5;scaleyin:1.5;transformoriginin:left 50% 0;durationout:750;rotateout:20;rotatexout:-30;scalexout:0;scaleyout:0;transformoriginout:left 50% 0;">
									Data Analytics
								</p>
						</div>
						<div class="ls-slide" data-ls="slidedelay:7000; transition2d: all;">
							<img style="width:100%;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/devops-background.jpg" class="ls-bg" alt="Slide4 background" />
							<p class="ls-l" style="top:120px;left:85%;font-weight: 700;font-size:60px;color:#f9b602;white-space: nowrap;" data-ls="offsetxin:0;durationin:1500;delayin:0;rotateyin:90;skewxin:60;transformoriginin:25% 50% 0;offsetxout:100;durationout:750;skewxout:60;">
								DevOps
							</p>
							<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:2500;
								delayin:0;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:50%;left:5%%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/ansible.png" alt="Ansible">
								<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:3000;
								delayin:0;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:70%;left:25%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/chef.png" alt="Chef">
								<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:4000;
								delayin:0;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:50%;left:40%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/puppet.png" alt="Puppet">
								<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:5000;
								delayin:0;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:70%;left:55%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/jenkins.png" alt="Jenkins">
								<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:6000;
								delayin:0;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:50%;left:70%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/docker.png" alt="Docker">
								<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:7000;
								delayin:0;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;"  
								style="top:70%;left:85%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/courses/devops/git.png" alt="Git">
						</div>
					</div>
					<script type="text/javascript">
						var layer_options = {
							responsive: 		false,
							responsiveUnder: 	1280,
							layersContainer: 	1280,
							hoverPrevNext: 		true,
							skinsPath: 			'<%=request.getContextPath()%>/resources/vendor/slider.layerslider/skins/'
						}
					</script>
				</div>
			</section>
			<div class="container">
    <div class="pagination-area">
      <ul>
        <li><a href="<%=request.getContextPath()%>/">Home</a> -</li>
        <li>Courses</li>
      </ul>
    </div>
  </div>
<!-- Slider 1 Area End Here -->
<section id="tadaay-courses">
				<div id="course_filter" class="jplist container">
					<div class="row">
			<!-- Left -->
			<div class="col-md-3 col-sm-3">
			<div class="filtercatsec">
			    <div class="categorymain">
			      <div class="categorytitle">Course Categories</div>
			        	<ul class="categorylist">
				                     <c:forEach var='leftPanel' items='${leftPanel}'>
				                     <li class="category-filter">
						                 <a class="accordion" href="javascript:void(0);"><c:out value="${leftPanel.key}" /></a>
						                 <div class="jplist-panel panel">	
									            <div class="jplist-group" data-control-type="checkbox-group-filter" data-control-action="filter" data-control-name="themes">
									            	<ul class="subcategorylist">
									            <c:forEach var='arrayItem' items='${leftPanel.value}' >
													      <li class="traininglist"> 
														   <input  id="<c:out value="${arrayItem}" />" data-path=".${fn:replace(arrayItem,' ', '')}" type="checkbox" /> 
														   <label for="<c:out value="${arrayItem}" />"> <c:out value="${arrayItem}" /></label>
													   </li>
											     </c:forEach>
											          </ul>
												</div>
											</div>
							            </li>
						            </c:forEach>
				       	</ul>
			    </div>
			    <div class="refinesearchsec">
			        <h4>Refine Your Search</h4>
			         <div class="batchtypefilter jplist-panel">
			            <h5>Level</h5>
			              <div class="jplist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   data-control-name="colors">
						   <ul>
						     <c:forEach var='leftPanelTypes' items='${leftPanelLevels}'>
						       <li class="traininglist"> 
							   		<input data-path=".${fn:replace(leftPanelTypes,' ', '')}" id="red-color"  type="checkbox" /> 
							   		<label for="red-color"><c:out value="${leftPanelTypes}" /></label>
							   </li>
						    </c:forEach>
						  </ul>
						</div>
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
					<div class="col-md-9 col-sm-9" style="padding:0px;">
				<div class="no-padding coursetilesec">
				    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 catinfosec clearfix">
				        <div class="filtericons">
				            <div class="row">
				             <div class="course-search">
				                    <div class="col-md-8 col-sm-8 col-lg-8 col-xs-12">
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
				            		<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
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
					<div class="list box text-shadow no-padding col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<!-- item 1 -->
						<c:forEach var='data' items='${data}'>
						<div class="list-item col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<div class="course-box">	
								<div class="course-icon">
									<a href="<%=request.getContextPath()%>/courses/${data.courseIdentifier}"><img class="img-responsive" src="<%=request.getContextPath()%>${data.imagePath}" alt="" title=""></a>
								</div>
								<c:set var="dateParts" value="${fn:split(data.template, '-')}" />
								<div class="course-content desc">
									<h4 class="title ${fn:replace(data.subCategory,' ', '')}"><a href="<%=request.getContextPath()%>/courses/${data.courseIdentifier}">${data.courseName}</a></h4>
									<div class="courseprice-datesec">
									<div class="learnerdatesec">
											<span class="learnerscount"><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${dateParts[0]} Learners</span>
											 <span class="no-jobs">
												 <span><i class="fa fa-users"></i> ${dateParts[1]} </span> 	 
												 <span>Trainers</span> 
											</span>
										</div>
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
					<div class="jplist-panel box panel-top">
						<!-- pagination results -->
						<!--div class="jplist-label" data-type="Page {current} of {pages}" data-control-type="pagination-info" 
						   data-control-name="paging" 
						   data-control-action="paging">
						   Showing
						</div-->
						<!-- pagination control -->
						<div 
						   class="jplist-pagination pull-right" 
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
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script>
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
  }
}
</script>
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
<script src="<%=request.getContextPath()%>/resources/assets/js/portalHelper.js" type="text/javascript"></script>
<!-- Layer slider js -->  
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/js/layerslider_pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/demo.layerslider_slider.js" type="text/javascript"></script>
<!-- jPList start -->
<!-- jQuery lib -->	
</body>	       
</html>
<!--  Include Footer  -->
