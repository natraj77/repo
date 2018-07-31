<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Best training institutes for {course_name} training in {city}| Tadaay</title>
    <meta name="description" content="Find trainers for {course_name} - find reviews,new batch info, contact details for {course_name} training and much more.">
     <meta name="keywords" content="aws training,amazon web services training,training institutes, Best {course_name} training institute in {location} ">
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
		<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-108404388-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-108404388-1');
</script>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<!-- Slider 1 Area Start Here -->               
<section id="slider">
				<div class="slider">
					<div class="layerslider height-500" style="width:100%;">
						<div class="ls-slide" data-ls="slidedelay:1000;transition2d:75,79;">
							<!-- background image -->
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider1-aws.jpg" class="ls-bg" alt="Slide AWS background"/>
						</div>
						<div class="ls-slide" data-ls="slidedelay:2000;transition2d: all;;">
							<!-- background image -->
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider2-devops.jpg" class="ls-bg" alt="Slide  DevOps background"/>
						</div>
						<div class="ls-slide" data-ls="slidedelay:3000;transition2d: all;;">
							<!-- background image -->
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider3-linux.jpg" class="ls-bg" alt="Slide Linux background"/>
						</div>
						<div class="ls-slide" data-ls="slidedelay:3000;transition2d: all;;">
							<!-- background image -->
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/trainers/slider4-python.jpg" class="ls-bg" alt="Slide Python background"/>
						</div>
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
			<div class="col-md-3 col-sm-3">
					<div class="filtercatsec">
			    <div class="categorymain">
			        <div class="categorytitle">Course Categories</div>
			        	<ul class="categorylist">
				            <li class="category-filter">
				            	<a class="accordion" href="javascript:void(0);">Cloud Computing</a>
				            	<div class="jplist-panel panel">	
						            <div class="jplist-group" data-control-type="checkbox-group-filter" data-control-action="filter" data-control-name="themes">
						            	<ul class="subcategorylist">
						            	<li class="traininglist"> 
											   <input data-path=".cloud" id="cloud" type="checkbox" /> 
											   <label for="cloud">AWS</label>
										   </li>
						                	<li class="traininglist"> 
											   <input data-path=".devops" id="devops" type="checkbox" /> 
											   <label for="devops">Devops</label>
										   </li>
										   <li class="traininglist"> 
										   <input data-path=".salesforce" id="salesforce" type="checkbox" />
										   <label for="salesforce">SalesForce</label>
										   </li>
									   </ul>
									</div>
								</div>
				            </li>
				            <li class="category-filter">
				            	<a class="accordion" href="javascript:void(0);">Programming</a>
				            	<div class="jplist-panel panel">	
						            <div class="jplist-group" data-control-type="checkbox-group-filter" data-control-action="filter" data-control-name="programing">
						            	<ul class="subcategorylist">
						                	<li class="traininglist"> 
											   <input data-path=".java" id="java" type="checkbox" /> 
											   <label for="java">Java</label>
										   </li>
										   <li class="traininglist"> 
										   <input data-path=".dotnet" id="dotnet" type="checkbox"  /> 
										   <label for="dotnet">Dotnet</label>
										   </li>
										   <li class="traininglist"> 
										   <input data-path=".python" id="python" type="checkbox"/> 
										   <label for="python">Python</label>
										   </li>
										   <li class="traininglist"> 
										   <input data-path=".php" id="php" type="checkbox" />
										   <label for="php">Php</label>
										   </li>
									   </ul>
									</div>
								</div>
				            </li>
				            <li class="category-filter">
				            	<a class="accordion" href="javascript:void(0);">Designing</a>
				            	<div class="jplist-panel panel">	
						            <div class="jplist-group" data-control-type="checkbox-group-filter" data-control-action="filter" data-control-name="desining">
						            	<ul class="subcategorylist">
										   <li class="traininglist"> 
										   <input data-path=".christmas" id="christmas" type="checkbox"  /> 
										   <label for="christmas">Web Desining</label>
										   </li>
										   <li class="traininglist"> 
										   <input data-path=".nature" id="nature" type="checkbox"/> 
										   <label for="nature">Nature</label>
										   </li>
										   <li class="traininglist"> 
										   <input data-path=".lifestyle" id="lifestyle" type="checkbox" />
										   <label for="lifestyle">Lifestyle</label>
										   </li>
									   </ul>
									</div>
								</div>
				            </li>
			         	</ul>
			    </div>
			    <div class="refinesearchsec">
			        <h4>Refine Your Search</h4>
			         <div class="jplist-panel">
			         	<ul id="catlist" class="categorylist">
				            <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">City</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="city">
						                <li class="traininglist">
						                    <input data-path=".hyderabad" id="hyd" type="checkbox">
						                    <label for="hyd">Hyderabad</label>
						                </li>
						                <li class="traininglist">
						                    <input data-path=".banglore" id="bngl" type="checkbox">
						                    <label for="bngl">Banglore</label>
						                </li>
						                <li class="traininglist">
						                    <input data-path=".chennai" id="madras" type="checkbox">
						                    <label for="madras">Chennai</label>
						                </li>
						            </ul>
				            </li>
				             <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Location</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="city">
						                <li class="traininglist">
					                    <input data-path=".ameerpet" id="ameerpet" type="checkbox">
					                    <label for="masterCheck">Ameerpet</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".madhapur" id="madhapur" type="checkbox">
					                    <label for="madhapur">Madhapur</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".kondapur" id="kondapur" type="checkbox">
					                    <label for="kondapur">Kondapur</label>
					                </li>
						            </ul>
				            </li>
				           <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Training Mode</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="mode">
						               <li class="traininglist">
					                    <input data-path=".classroom" id="classroom" type="checkbox">
					                    <label for="classroom">Class Room</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".online" id="online" type="checkbox">
					                    <label for="online">Online</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".corporate" id="corporate" type="checkbox">
					                    <label for="corporate">Corporate</label>
					                </li>
						            </ul>
				            </li>
				            <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Trainer Type</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="trainertype">
						                <li class="traininglist">
					                    <input data-path=".institute" id="inst" type="checkbox">
					                    <label for="inst">Institute</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".individual" id="individual" type="checkbox">
					                    <label for="individual">Individual</label>
					                </li>
						            </ul>
				            </li>
				             <li class="category-filter trainingtypefilter">
				            	<a class="accordion" href="javascript:void(0);">Advantages</a>
					            	<ul class="panel plist-group" data-control-type="checkbox-group-filter" data-control-action="filter"
						   			data-control-name="advantages">
						               <li class="traininglist">
					                    <input data-path=".realtime" id="rtprojects" type="checkbox">
					                    <label for="rtprojects">Realtime projects</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".labassistance" id="lab" type="checkbox">
					                    <label for="lab">Lab assistance</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".placement" id="passistance" type="checkbox">
					                    <label for="passistance">Placement assistance</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".material" id="printedmaterial" type="checkbox">
					                    <label for="printedmaterial">Printed Material</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".recorded" id="recordedsessions" type="checkbox">
					                    <label for="recordedsessions">Recorded sessions</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".backup" id="backupclasses" type="checkbox">
					                    <label for="backupclasses">Backup classes</label>
					                </li>
					                <li class="traininglist">
					                    <input data-path=".fee" id="instalments" type="checkbox">
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
					<div class="col-md-9 col-sm-9" style="padding:0px;">
					<div class="no-padding coursetilesec">
					    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 catinfosec clearfix">
					        <div class="filtericons">
					            <div class="row">
					             <div class="course-search">
					                    <div class="col-md-8">
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
					            		<div class="col-md-4">
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
						<div class="list-item col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="course-list list-item">
	                    <div class="course-media">
	                        <img src="<%=request.getContextPath()%>/resources/images/trainers/polyglot-400x560.png" class="img-responsive course-img" alt="Polyglot Logo">             
	                    </div>
	                    <div class="course-detail desc">
	                        <h4 class="heading title php hyderabad ameerpet">Php</h4>
	                        <ul class="course-features">
	                            <li class="trainer-rating">
	                            	<i class="fa fa-google-plus" aria-hidden="true"></i>
									<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                            <li class="trainer-rating">
	                            <i class="fa fa-facebook" aria-hidden="true"></i>
	                            	<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                        </ul> 
	                        <ul class="course-features">
	                             <li><i class="fa fa-calendar" aria-hidden="true"></i> 5th August</li>
	                            <li><i class="fa fa-clock-o"></i> 10:00 AM</li>
	                            <li class="enroll-brd"><a href="#" class="apply-now-btn">Enroll Now</a></li>	                                                       
	                        </ul> 
	                        <div class="personal">
		                        <div>
		                            <span>Mode</span> 
		                            <span>Online / classroom</span>
		                        </div>
		                        <div>
		                            <span>Duration</span> 
		                            <span>3 Months</span>
		                        </div>
		                        <div>
		                            <span>Schedule</span> 
		                            <span>Mon - Fri</span>
		                        </div>
		                        <div>
		                        	<span>Fee</span>
		                        	 <span>
					                        <span class="strikethrough">
						                        <span class="actualprice">
						                        	<i class="fa fa-inr"></i>15,995
						                        </span>
					                        </span> 
					                        <span><i class="fa fa-inr"> </i>10,000</span>
		                    		</span>
		                        </div>
		                    </div>                       
	                        <div class="brief">
	                        	<ul class="list-styled">
		                            <li class="cross">Realtime projects</li>
		                            <li>Lab assistance</li>
		                            <li>Placement assistance</li>
		                            <li>Printed Material</li>
		                            <li class="cross">Recorded sessions</li>
		                             <li>Backup classes</li>
		                              <li class="cross">Fee in installments</li>
		                        </ul>
	                        </div>	        
	                        <div class="trainer-actions">
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Demo</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#course_content">Course Content</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Call Back</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Contact Details</a>
	                        </div>
	                    </div>
	                </div> 
	                <div class="course-list list-item">
	                    <div class="course-media">
	                        <img src="<%=request.getContextPath()%>/resources/images/trainers/t8.png" class="img-responsive course-img" alt="Logo">             
	                    </div>
	                    <div class="course-detail desc">
	                        <h4 class="heading title dotnet">Dotnet</h4>
	                        <ul class="course-features">
	                            <li class="trainer-rating">
	                            	<i class="fa fa-google-plus" aria-hidden="true"></i>
									<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                            <li class="trainer-rating">
	                            <i class="fa fa-facebook" aria-hidden="true"></i>
	                            	<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                        </ul> 
	                        <ul class="course-features">
	                             <li><i class="fa fa-calendar" aria-hidden="true"></i> 5th August</li>
	                            <li><i class="fa fa-clock-o"></i> 10:00 AM</li>
	                            <li class="enroll-brd"><a href="#" class="apply-now-btn">Enroll Now</a></li>	                                                       
	                        </ul> 
	                        <div class="personal">
		                        <div>
		                            <span>Mode</span> 
		                            <span>Online / classroom</span>
		                        </div>
		                        <div>
		                            <span>Duration</span> 
		                            <span>3 Months</span>
		                        </div>
		                        <div>
		                            <span>Schedule</span> 
		                            <span>Mon - Fri</span>
		                        </div>
		                        <div>
		                        	<span>Fee</span>
		                        	 <span>
					                        <span class="strikethrough">
						                        <span class="actualprice">
						                        	<i class="fa fa-inr"></i>15,995
						                        </span>
					                        </span> 
					                        <span><i class="fa fa-inr"> </i>10,000</span>
		                    		</span>
		                        </div>
		                    </div>                       
	                        <div class="brief">
	                        	<ul class="list-styled">
		                            <li class="cross">Realtime projects</li>
		                            <li>Lab assistance</li>
		                            <li>Placement assistance</li>
		                            <li>Printed Material</li>
		                            <li class="cross">Recorded sessions</li>
		                             <li>Backup classes</li>
		                              <li class="cross">Fee in installments</li>
		                        </ul>
	                        </div>	        
	                        <div class="trainer-actions">
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Demo</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#course_content">Course Content</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Call Back</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Contact Details</a>
	                        </div>
	                    </div>
	                </div> 
	                <div class="course-list list-item">
	                    <div class="course-media">
	                        <img src="<%=request.getContextPath()%>/resources/images/trainers/t8.png" class="img-responsive course-img" alt="Logo">             
	                    </div>
	                    <div class="course-detail desc">
	                        <h4 class="heading title python">Python</h4>
	                        <ul class="course-features">
	                            <li class="trainer-rating">
	                            	<i class="fa fa-google-plus" aria-hidden="true"></i>
									<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                            <li class="trainer-rating">
	                            <i class="fa fa-facebook" aria-hidden="true"></i>
	                            	<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                        </ul> 
	                        <ul class="course-features">
	                             <li><i class="fa fa-calendar" aria-hidden="true"></i> 5th August</li>
	                            <li><i class="fa fa-clock-o"></i> 10:00 AM</li>
	                            <li class="enroll-brd"><a href="#" class="apply-now-btn">Enroll Now</a></li>	                                                       
	                        </ul> 
	                        <div class="personal">
		                        <div>
		                            <span>Mode</span> 
		                            <span>Online / classroom</span>
		                        </div>
		                        <div>
		                            <span>Duration</span> 
		                            <span>3 Months</span>
		                        </div>
		                        <div>
		                            <span>Schedule</span> 
		                            <span>Mon - Fri</span>
		                        </div>
		                        <div>
		                        	<span>Fee</span>
		                        	 <span>
					                        <span class="strikethrough">
						                        <span class="actualprice">
						                        	<i class="fa fa-inr"></i>15,995
						                        </span>
					                        </span> 
					                        <span><i class="fa fa-inr"> </i>10,000</span>
		                    		</span>
		                        </div>
		                    </div>                       
	                        <div class="brief">
	                        	<ul class="list-styled">
		                            <li class="cross">Realtime projects</li>
		                            <li>Lab assistance</li>
		                            <li>Placement assistance</li>
		                            <li>Printed Material</li>
		                            <li class="cross">Recorded sessions</li>
		                             <li>Backup classes</li>
		                              <li class="cross">Fee in installments</li>
		                        </ul>
	                        </div>	        
	                        <div class="trainer-actions">
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Demo</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#course_content">Course Content</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Call Back</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Contact Details</a>
	                        </div>
	                    </div>
	                </div> 
	                <!-- trainer 4 -->
	                <div class="course-list list-item">
	                    <div class="course-media">
	                        <img src="<%=request.getContextPath()%>/resources/images/trainers/t8.png" class="img-responsive course-img" alt="Logo">             
	                    </div>
	                    <div class="course-detail desc">
	                        <h4 class="heading title java">Java</h4>
	                        <ul class="course-features">
	                            <li class="trainer-rating">
	                            	<i class="fa fa-google-plus" aria-hidden="true"></i>
									<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                            <li class="trainer-rating">
	                            <i class="fa fa-facebook" aria-hidden="true"></i>
	                            	<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                        </ul> 
	                        <ul class="course-features">
	                             <li><i class="fa fa-calendar" aria-hidden="true"></i> 5th August</li>
	                            <li><i class="fa fa-clock-o"></i> 10:00 AM</li>
	                            <li class="enroll-brd"><a href="#" class="apply-now-btn">Enroll Now</a></li>	                                                       
	                        </ul> 
	                        <div class="personal">
		                        <div>
		                            <span>Mode</span> 
		                            <span>Online / classroom</span>
		                        </div>
		                        <div>
		                            <span>Duration</span> 
		                            <span>3 Months</span>
		                        </div>
		                        <div>
		                            <span>Schedule</span> 
		                            <span>Mon - Fri</span>
		                        </div>
		                        <div>
		                        	<span>Fee</span>
		                        	 <span>
					                        <span class="strikethrough">
						                        <span class="actualprice">
						                        	<i class="fa fa-inr"></i>15,995
						                        </span>
					                        </span> 
					                        <span><i class="fa fa-inr"> </i>10,000</span>
		                    		</span>
		                        </div>
		                    </div>                       
	                        <div class="brief">
	                        	<ul class="list-styled">
		                            <li class="cross">Realtime projects</li>
		                            <li>Lab assistance</li>
		                            <li>Placement assistance</li>
		                            <li>Printed Material</li>
		                            <li class="cross">Recorded sessions</li>
		                             <li>Backup classes</li>
		                              <li class="cross">Fee in installments</li>
		                        </ul>
	                        </div>	        
	                        <div class="trainer-actions">
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Demo</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#course_content">Course Content</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Call Back</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Contact Details</a>
	                        </div>
	                    </div>
	                </div> 
	                 <!-- trainer 4 -->
	                <div class="course-list list-item">
	                    <div class="course-media">
	                        <img src="<%=request.getContextPath()%>/resources/images/trainers/t8.png" class="img-responsive course-img" alt="Logo">             
	                    </div>
	                    <div class="course-detail desc">
	                        <h4 class="heading title java">Advanced Java</h4>
	                        <ul class="course-features">
	                            <li class="trainer-rating">
	                            	<i class="fa fa-google-plus" aria-hidden="true"></i>
									<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                            <li class="trainer-rating">
	                            <i class="fa fa-facebook" aria-hidden="true"></i>
	                            	<div class="trainer-review">
										<ul>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
											<li><span class="fa fa-star"></span></li>
										</ul>
									</div>
	                            </li>
	                        </ul> 
	                        <ul class="course-features">
	                             <li><i class="fa fa-calendar" aria-hidden="true"></i> 5th August</li>
	                            <li><i class="fa fa-clock-o"></i> 10:00 AM</li>
	                            <li class="enroll-brd"><a href="#" class="apply-now-btn">Enroll Now</a></li>	                                                       
	                        </ul> 
	                        <div class="personal">
		                        <div>
		                            <span>Mode</span> 
		                            <span>Online / classroom</span>
		                        </div>
		                        <div>
		                            <span>Duration</span> 
		                            <span>3 Months</span>
		                        </div>
		                        <div>
		                            <span>Schedule</span> 
		                            <span>Mon - Fri</span>
		                        </div>
		                        <div>
		                        	<span>Fee</span>
		                        	 <span>
					                        <span class="strikethrough">
						                        <span class="actualprice">
						                        	<i class="fa fa-inr"></i>15,995
						                        </span>
					                        </span> 
					                        <span><i class="fa fa-inr"> </i>10,000</span>
		                    		</span>
		                        </div>
		                    </div>                       
	                        <div class="brief">
	                        	<ul class="list-styled">
		                            <li class="cross">Realtime projects</li>
		                            <li>Lab assistance</li>
		                            <li>Placement assistance</li>
		                            <li>Printed Material</li>
		                            <li class="cross">Recorded sessions</li>
		                             <li>Backup classes</li>
		                              <li class="cross">Fee in installments</li>
		                        </ul>
	                        </div>	        
	                        <div class="trainer-actions">
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Demo</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#course_content">Course Content</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Request Call Back</a>
		                        <a  href="javascript:void(0);" class="btn-sm" data-toggle="modal" data-target="#request_demo">Contact Details</a>
	                        </div>
	                    </div>
	                </div> 
						</div>
						<!-- Item 16 -->
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