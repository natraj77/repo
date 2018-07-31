<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="iso-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Find leading courses, trainers and reviews | Tadaay</title>
    <meta name="description" content="Discovering has never been so simple. Find courses, trainers or training institutes, and reviews, students looking for courses.">
    <meta name="keywords" content="find trainers, find leading IT courses, find reviews, find students">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- facebook Linked In gplus-->
    <meta property="og:title" content="Find leading IT courses, training institutes" />
	<meta property="og:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>" />
	<meta property="og:type" content="website" />
	<meta property="og:description" content="Discovering has never been so simple. Find courses, trainers or training institutes, and reviews, students looking for courses." />
	<meta property="og:image" content="<%= request.getScheme() %>://<%=request.getServerName() %>/appContent/opt/tadaay/uploads/website/promotions/home-facebook.jpg" />
	
	 <!-- twitter card --->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="Find leading courses, trainers and reviews | Tadaay" />
	<meta name="twitter:description" content="Discovering has never been so simple. Find courses, trainers or training institutes, and reviews, students looking for courses." />
	<meta name="twitter:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>" />
	<meta name="twitter:image" content="<%= request.getScheme() %>://<%=request.getServerName() %>/appContent/opt/tadaay/uploads/website/promotions/home-twitter.jpg" />
    <%@ include file='header-include.jsp'%>
    <!-- Global site tag (gtag.js) - Google Analytics -->
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='header.jsp' %>
<!-- Slider 1 Area Start Here -->               
 <section id="slider">
				<div class="slider">
					<div class="layerslider height-500" style="width:100%;">
							<div class="ls-slide" data-ls="slidedelay:8000;transition2d:75,79;">
							<!-- background image -->
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/slider1-bg.jpg" class="ls-bg img-responsive" alt="Slide background"/>
							<img class="ls-l" style="width:250px;height:150px;top:130px;left:40%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;easingin:easeOutElastic;fadein:false;offsetxout:right;durationout:1500;showuntil:1;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/devops.png" alt="DevOps"> 
							<img class="ls-l" style="width:200px;height:120px;top:150px;left:15%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;delayin:50;easingin:easeOutElastic;fadein:false;offsetxout:right;durationout:1500;showuntil:100;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/cloud-computing.png" alt="Cloud Computing">
							<img class="ls-l" style="width:200px;height:100px;top:330px;left:20%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;delayin:150;easingin:easeOutElastic;fadein:false;offsetxout:right;durationout:1500;showuntil:500;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/datascience.png" alt="Data Science">
							<img class="ls-l" style="width:120px;height:150px;top:280px;left:40%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;delayin:200;easingin:easeOutElastic;fadein:false;offsetxout:left;durationout:1500;showuntil:50;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/python.png" alt="Python">
							<img class="ls-l" style="top:330px;left:68%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;delayin:150;easingin:easeOutElastic;fadein:false;offsetxout:right;durationout:1500;showuntil:500;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/oracle.png" alt="Oracle">
							<img class="ls-l" style="top:130px;left:75%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;delayin:150;easingin:easeOutElastic;fadein:false;offsetxout:left;durationout:1500;showuntil:500;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/java.png" alt="Java">
							<img class="ls-l" style="top:220px;left:60%;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:3000;delayin:150;easingin:easeOutElastic;fadein:false;offsetxout:right;durationout:1500;showuntil:500;easingout:easeInBack;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/salesforce.png" alt="Salesforce">
							<img class="ls-l" data-ls=" durationin:3500; delayin:1000; scalexin:0.8; scaleyin:0.8; scalexout:0.8; scaleyout:0.8;showuntil:500;"
								style="top:130px;left:90%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/girl1.png" alt="Girl">
								<p class="ls-l" style="top:250px;left:720px;color: #fff; text-shadow: none; font-size: 22px; line-height: 34px; padding: 0px 10px; padding-top: 1px; margin: 0px; border-width: 0px; border-style: none; background-color:#000; white-space: nowrap;" 
								data-ls="offsetxin:0;durationin:1500;delayin:3500;rotatein:30;scalexin:0.2;scaleyin:0.2;offsetxout:0;offsetyout:top;durationout:1000;fadeout:false;rotateout:30;scalexout:0.2;scaleyout:0.2;showuntil:100;">Confused ??</p>
								<p class="ls-l" style="top:300px;left:720px;font-size: 35px; line-height: 45px; color:#ffffff; white-space: nowrap;" 
								data-ls="offsetxin:0;durationin:1500;delayin:3500;rotatein:30;scalexin:0.2;scaleyin:0.2;offsetxout:right;durationout:1000;fadeout:false;rotateout:45;scalexout:0.2;scaleyout:0.2;showuntil:100;">Explore Courses</p>
								<p class="ls-l" style="top:360px;left:720px;color: #fff; font-size: 13px; line-height: 20px; text-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5); font-weight: 300; ;white-space: nowrap;" 
								data-ls="offsetxin:0;offsetyin:bottom;durationin:1500;delayin:3500;fadein:false;offsetxout:0;offsetyout:bottom;durationout:1000;fadeout:false;showuntil:50;">A unique platform to find leading courses in IT,<br> trainers and their reviews at your finger tips.</p>
								<h5 class="ls-l" style="top:237px;left:50%;text-align: center; background: black; background: rgba(0,0,0,.75); font-weight: normal;padding-left:10px;padding-right:10px;height:100px;font-size:50px;line-height:100px;color:#eee;border-radius:5px;white-space: nowrap;" 
							data-ls="delayin:5500;offsetxin:0;scalexin:0;scaleyin:0;offsetxout:0;offsetyout:top;durationout:750;fadeout:false;">Your Confusion Ends Here</h5>
							<h5 class="ls-l" style="top:343px;left:50%;text-align: center; font-weight: normal; padding-left:10px; padding-right:10px; height:100px;font-size:50px;line-height:100px;color:#444;background:white;border-radius:5px;white-space: nowrap;" 
							data-ls="delayin:6000;offsetxin:0;scalexin:0;scaleyin:0;offsetxout:0;offsetyout:bottom;durationout:750;fadeout:false;">TADAAY</h5>
							<img class="ls-l" data-ls=" durationin:3500; delayin:4000; scalexin:0.8; scaleyin:0.8; scalexout:0.8; scaleyout:0.8;"
								style="width:500px;height:375px;top:130px;left:20%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider1/girl2.png" alt="Girl">
						</div>
						<!-- SLIDE -->
						<div class="ls-slide" data-ls="slidedelay:6000; transition2d: all;">
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider2/slider2-bg.jpg" class="ls-bg" alt="Slide background" />
								<img class="ls-l" data-ls="offsetxin:0;offsetyin:bottom;durationin:3500;delayin:350;easingin:linear;fadein:false;rotatein:-20;scalexin:0.2;scaleyin:0.2;offsetxout:0;offsetyout:top;durationout:2500;easingout:linear;fadeout:false;" 
								style="width:350px;height:241px;top:100px;left:80%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider2/come-joinus.png" alt="Join us">
								<img class="ls-l" style="top:220px;left:0px;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:bottom;durationin:3500;delayin:550;easingin:swing;fadein:false;scalexin:0.2;scaleyin:0.2;offsetxout:0;offsetyout:bottom;durationout:1000;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider2/man.png" alt="Man">
								<img class="ls-l" data-ls="
								offsetxin:0;
								durationin:1500;
								delayin:1000;
								easingin:linear;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								durationout:1500;" 
								style="top:58%;left:50%;white-space: nowrap;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider2/circle.png" alt="Circle">
							<!-- left -->
							<p class="ls-l" data-ls="durationin:1500;delayin:300;rotatein:20;rotatexin:30;scalexin:1.5;scaleyin:1.5;transformoriginin:left 50% 0;durationout:750;rotateout:20;rotatexout:-30;scalexout:0;scaleyout:0;transformoriginout:left 50% 0;"
								style="top:34%;left:50%;font-weight:500px;height:40px; padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#7be27b;white-space: nowrap;">
								Enroll
							</p>
							<p class="ls-l" data-ls="
								offsetxin:0;
								durationin:2500;
								delayin:1000;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;" 
								style="top:42%;left:50%;font-weight: 300;font-size:40px;color:#fff;white-space: nowrap;">
								&amp;
							</p>
							<p class="ls-l" data-ls="offsetxin:0;durationin:2000;delayin:3500;rotatein:-45;scalexin:2;scaleyin:2;transformoriginin:right top 0;offsetxout:0;durationout:1000;rotateout:45;scalexout:2;scaleyout:2;transformoriginout:left top 0;"
								style="top:53%;left:50%;font-weight: 300; height:40px; padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#60dee4;white-space: nowrap;">
								Get
							</p>
							<p class="ls-l" data-ls="offsetxin:0;durationin:2000;delayin:3500;rotatein:-45;scalexin:2;scaleyin:2;transformoriginin:right top 0;offsetxout:0;durationout:1000;rotateout:45;scalexout:2;scaleyout:2;transformoriginout:left top 0;"
								style="top:62%;left:50%;font-weight: 300; height:40px; padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#60dee4;white-space: nowrap;">
								Additional Discount
							</p>
							<p class="ls-l" data-ls="offsetxin:0;durationin:2000;delayin:3500;rotatein:-45;scalexin:2;scaleyin:2;transformoriginin:right top 0;offsetxout:0;durationout:1000;rotateout:45;scalexout:2;scaleyout:2;transformoriginout:left top 0;"
								style="top:72%;left:50%;font-weight: 300; height:40px; padding-right:10px;padding-left:10px;font-size:30px;line-height:37px;color:#fff;white-space: nowrap;">
								On
							</p>
							<p class="ls-l" data-ls="offsetxin:0;durationin:2000;delayin:3500;rotatein:-45;scalexin:2;scaleyin:2;transformoriginin:right top 0;offsetxout:0;durationout:1000;rotateout:45;scalexout:2;scaleyout:2;transformoriginout:left top 0;"
								style="top:80%;left:50%;font-weight: 500;font-size:30px;color:yellow;white-space: nowrap;">
								Course Fee
							</p>
						</div>

						<!-- SLIDE -->
						<div class="ls-slide" data-ls="slidedelay:7000; transition2d: all;">
							<img src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider3/slider3-bg.png" class="ls-bg" alt="Slide background" />
							<img class="ls-l" style="top:190px;left:428px;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;durationin:1500;delayin:500;easingin:swing;fadein:false;rotatein:30;scalexin:0.2;scaleyin:0.2;offsetxout:0;offsetyout:bottom;durationout:2000;fadeout:false;"  src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider3/insitutes.png" alt="Institutes">
							<img class="ls-l" style="top:100px;left:280px;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:bottom;durationin:1500;delayin:350;easingin:linear;fadein:false;rotatein:-20;scalexin:0.2;scaleyin:0.2;offsetxout:0;offsetyout:top;durationout:2500;easingout:linear;fadeout:false;"  src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider3/triners.png" alt="Trainers">
							<p class="ls-l" data-ls="
								offsetxin:0;
								durationin:2500;
								delayin:1000;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;" 
								style="top:200px;left:500px;color:#fff;font-weight: 700;font-size:40px;color:#fff;white-space: nowrap;">
								&amp;
							</p>
							
							<img class="ls-l" style="top:100px;left:790px;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:top;delayin:1200;fadein:false;offsetxout:right;durationout:1000;fadeout:false;" src="<%=request.getContextPath()%>/resources/images/layerslider/home/slider3/squrebox.png" alt="Green Background">
							<p class="ls-l" style="top:150px;left:880px;color: yellow; text-shadow: none; font-size: 35px;padding:1px 15px; margin: 0px; border-width: 0px; border-style: none; background-color:#000; white-space: nowrap;" data-ls="offsetxin:0;durationin:1500;delayin:500;rotatein:30;scalexin:0.2;scaleyin:0.2;offsetxout:0;offsetyout:top;durationout:1000;fadeout:false;rotateout:30;scalexout:0.2;scaleyout:0.2;">REGISTER</p>
							<p class="ls-l" data-ls="
								offsetxin:0;
								durationin:2500;
								delayin:1000;
								scalexin:0;
								scaleyin:0;
								offsetxout:0;
								scalexout:0;
								scaleyout:0;" 
								style="top:200px;left:960px;font-weight: 700;font-size:45px;color:#fff;white-space: nowrap;">
								&amp;
							</p>
								<p class="ls-l" style="top:260px;left:900px;font-size: 35px; line-height: 35px; color:#000; white-space: nowrap;" data-ls="offsetxin:0;durationin:1500;delayin:750;rotatein:30;scalexin:0.2;scaleyin:0.2;offsetxout:right;durationout:1000;fadeout:false;rotateout:45;scalexout:0.2;scaleyout:0.2;">EXPLORE</p>
								<p class="ls-l" style="top:298px;left:950px;font-size: 35px; line-height: 45px; color:#000; white-space: nowrap;color:yellow" data-ls="offsetxin:0;durationin:1500;delayin:750;rotatein:30;scalexin:0.2;scaleyin:0.2;offsetxout:right;durationout:1000;fadeout:false;rotateout:45;scalexout:0.2;scaleyout:0.2;">Our</p>
								<p class="ls-l" style="top:350px;left:880px;color: #000; letter-spacing:8px;font-size: 35px; line-height: 25px; font-weight: 700; ;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:bottom;durationin:1500;delayin:1200;fadein:false;offsetxout:0;offsetyout:bottom;durationout:1000;fadeout:false;">Powerful</p>
								<p class="ls-l" style="top:390px;left:880px;color: #fff; font-size: 25px; line-height: 25px;color:yellow; text-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);font-weight: 300; ;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:bottom;durationin:1500;delayin:1200;fadein:false;offsetxout:0;offsetyout:bottom;durationout:1000;fadeout:false;">Lead Management </p>
								<p class="ls-l" style="top:430px;left:880px;font-size: 40px;line-height: 25px;color:red;  font-weight: 700; ;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:bottom;durationin:1500;delayin:1200;fadein:false;offsetxout:0;offsetyout:bottom;durationout:1000;fadeout:false;">PLATFORM</p>
							
						</div>
					</div>
					<script type="text/javascript">
						var layer_options = {
							responsive: 		true,
							responsiveUnder: 	1280,
							layersContainer: 	1280,
							hoverPrevNext: 		true,
							pauseOnHover: true,
							skinsPath: 			'<%=request.getContextPath()%>/resources/vendor/slider.layerslider/skins/'
						}
					</script>
				</div>
			</section>
<!-- Service 2 Area Start Here -->
<div class="service2-area"> 
    <div class="search-area">
        <div class="container">
            <div class="row search-inner">
                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                    <div class="search-title">
                        <span><i class="fa fa-search" aria-hidden="true"></i> Search Course</span>
                    </div>
                </div>
                 <div class="col-lg-10 col-md-1o col-sm-12 col-xs-12">
                    <div class="search-input" id="searchfield">
                        <form style="position:relative;">
                            <input type="text" size="100" style="text-transform: uppercase"  class="search-form" placeholder="Course Keywords . . ." id="search-box" autocomplete="off"/> 
                        </form>
                        <div class="search-submit">
		                        <a href="#" class="join-now-btn" onclick="checkSelectedCourse();"><i class="fa fa-search" aria-hidden="true"></i></a>
		                    </div> 
                    </div>
                    <div id="loading" style="display:none;position: absolute;
    top: 0;width:60px;
    z-index: 99;"><img src="<%=request.getContextPath()%>/resources/images/course-preload.gif" alt="tadaay"></div>
                    <div id="suggesstion-box"></div>
                </div>
            </div>
        </div>
    </div>


<div class="why-choose-area">                                
  <div class="container">
    <h1 class="about-title">Why Tadaay?</h1>
	<!--<div class="col-lg-12">
		<div class="col-lg-6">
			<h2 class="about-sub-title">For Students</h2>
			<p class="about-sub-title-desc">A unique platform which assist students and job aspirants to
provide in depth information of all the leading IT courses	find trainers and their reviews. provides the complete career guidance to learn the technology either from classroom or from online sessions or documentation. 
It also assist you to assess yourself by taking quiz on any technology under the sun & we ensure to keep quiz/assessment as standard as possible.</p>
		</div>
		<div class="col-lg-6">
				<h2 class="about-sub-title">For Trainers</h2>
	<p class="about-sub-title-desc">The trainers or training institutes can leverage our lead management platform to find the students looking for training. It helps you to publish your branches, demos information and upcoming batch information to reach the audience quickly. Our powerful task management platform helps you to push quizzes or tasks to your students to help them build their career strong.</p>
		</div>
	</div>-->
	<h2 class="about-sub-title">For Students</h2>
	<p class="about-sub-title-desc">Students are often confused about which IT course to pick up. They do not know which training institute they should enroll in. tadaay is here to end all your confusions relating to IT trainings. We will provide reviews and ratings about training institutes across India which will help you enrolling in right course.  tadaay will not only help you with training but will provide assistance in getting a reputed job. The portal will have in-built quizzes to assess you and recruiters can assign a task to select you. It provides all in one solution for your career!  </p>
	

	<h2 class="about-sub-title">For Trainers</h2>
	<p class="about-sub-title-desc">We will help you unleash the tech guru inside you on a great online platform. Trainers can sign up with us and avail opportunities to provide corporate trainings across the country. Trainers will gain credibility and get recognition for their skills and talents. In this way, tadaay will help you in becoming an integral part of corporate success across the country. It will enhance your experience with trainings in corporate world. The online platform will broadcast you in a manner which is unmatched in the industry.
	</p>
	<h2 class="about-sub-title">For Training Institute</h2>
	<p class="about-sub-title-desc">We will help you connect with students across the country. The leading platform will provide unbiased ratings for your institute and add much needed credibility for the institute. The online platform will be accessed by lakhs of students across the country. This platform which is unique in its kind can bridge the gap between students and training institutes. You can feature all your IT courses in an elegant manner with a price quote. Your presence on tadaay is inevitable. 
	
	</p>
	<h2 class="about-sub-title">For Recruiters</h2>
	<p class="about-sub-title-desc">Getting right employees with desired skills for your firm has become a challenge and requires lots of efforts. You have a lucrative opportunity for talent acquisition in the form of tadaay. You can assess the students by giving a quiz or ask them to perform a task. Talent pool will attract students across the country. Moreover, it is an opportunity to attract talent who are freshers filled with energy and dedication. The convenience provided by tadaay is unparalleled and unique. tadaay is one stop solution for all your recruitment worries!   
	</p>
    
  </div>
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="service-box4">
          <div class="service-box-icon">
            <a href="<%=request.getContextPath()%>/all-courses"><i class="fa fa-search" aria-hidden="true"></i></a>
          </div>                      
          <h2><a href="<%=request.getContextPath()%>/all-courses">Explore Courses</a></h2>
          <p>Find the leading courses in the IT industry including the recommended course content for all the courses.
          </p>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="service-box4">
          <div class="service-box-icon">
            <a href="<%=request.getContextPath()%>/all-trainers"><i class="fa fa-university" aria-hidden="true"></i></a>
          </div>                      
          <h2><a href="<%=request.getContextPath()%>/all-trainers">Find Trainers</a></h2>
          <p>Get accurate information about training institutes and trainers at your finger tips. You can also request course content and demo information online.
</p>
        </div>
      </div>
       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="service-box4">
          <div class="service-box-icon">
            <a href="<%=request.getContextPath()%>/all-batches/find-leading-training-institutes"><i class="fa fa-users" aria-hidden="true"></i></a>
          </div>                      
          <h2><a href="<%=request.getContextPath()%>/all-batches/find-leading-training-institutes">Find Batches</a></h2>
          <p>Choose a batch which suits best to your biological clock. At tadaay, we provide complete information about batches like dates and timings.</p>
        </div>
      </div>
    </div>
    <%-- <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="service-box4">
          <div class="service-box-icon">
            <a href="<%=request.getContextPath()%>/comingsoon"><i class="fa fa-play-circle" aria-hidden="true"></i></a>
          </div>                      
          <h2><a href="<%=request.getContextPath()%>/comingsoon">Learn Online</a></h2>
          <p>Learn any courses online from the videos published from our partners or you can enroll for live sessions. </p>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="service-box4">
          <div class="service-box-icon">
            <a href="<%=request.getContextPath()%>/comingsoon"><i class="fa fa-book" aria-hidden="true"></i></a>
          </div>                      
          <h2><a href="<%=request.getContextPath()%>/comingsoon">Books Library</a></h2>
          <p>Like reading books? Download books for free. </p>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <div class="service-box4">
          <div class="service-box-icon">
            <a href="<%=request.getContextPath()%>/comingsoon"><i class="fa fa-tachometer" aria-hidden="true"></i></a>
          </div>                      
          <h2><a href="<%=request.getContextPath()%>/comingsoon">Take Assesment</a></h2>
          <p>Ready to give an interview? Assess yourself by taking quiz.</p>
        </div>
      </div>
    </div> --%>
  </div>
</div>
    </div>
 <!-- Service 2 Area End Here -->
<!-- Featured Area Start Here -->
<div class="courses2-area bg-common-style">
    <div class="container">    
        <h2 class="title-default-left">Featured Courses</h2> 
    </div>
    <div class="container courses-list-wrapper" id="tadaay-courses">    
       <div class="row courses-wrapper courses-list" id="coursesData">
      </div> 
        <div class="view-all-btn-area">
            <a href="<%=request.getContextPath()%>/all-courses" class="view-all-accent-btn">View All Courses</a>
        </div> 
    </div>  
</div> 
<!-- Featured Area End Here -->
<!-- Counter Area Start Here -->
<div class="counter-area bg-primary-deep" style="background-image: url('<%=request.getContextPath()%>/resources/images/4.jpg');">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 counter1-box wow fadeInUp" data-wow-duration=".5s" data-wow-delay=".20s">
                <div class=""  id="trainercnt"></div>
                <p>Trainers</p>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 counter1-box wow fadeInUp" data-wow-duration=".5s" data-wow-delay=".40s">
                <div class="" id="coursecnt"></div>
                <p>COURSES</p>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 counter1-box wow fadeInUp" data-wow-duration=".5s" data-wow-delay=".60s">
                <div class="" id="studentscnt"></div>
                <p>REGISTERED STUDENTS</p>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 counter1-box wow fadeInUp" data-wow-duration=".5s" data-wow-delay=".80s">
                <div class="" id="leadscnt"></div>
                <p>OPEN LEADS</p>
            </div>
        </div>
    </div>
</div>
<!-- News and Event Area End Here -->
<!-- Brand Area Start Here -->
<div class="brand-area">
    <div class="container">    
        <h2 class="title-default-left">Premium Partners</h2>
        <div class="rc-carousel"
             data-loop="true"
             data-items="4"
             data-margin="30"
             data-autoplay="true"
             data-autoplay-timeout="5000"
             data-smart-speed="2000"
             data-dots="false"
             data-nav="false"
             data-nav-speed="false"
             data-r-x-small="2"
             data-r-x-small-nav="false"
             data-r-x-small-dots="false"
             data-r-x-medium="3"
             data-r-x-medium-nav="false"
             data-r-x-medium-dots="false"
             data-r-small="4"
             data-r-small-nav="false"
             data-r-small-dots="false"
             data-r-medium="4"
             data-r-medium-nav="false"
             data-r-medium-dots="false"
             data-r-large="4"
             data-r-large-nav="false"
             data-r-large-dots="false"> 
            <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>
           <!-- <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>
            <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>
            <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>-->
        </div> 
    </div>  
</div>  
<!-- Brand Area End Here -->
<!-- Main Body Area End Here -->
<%@ include file='footer.jsp' %>
<%@ include file='footer-include.jsp' %>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/js/layerslider_pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/demo.layerslider_slider.js" type="text/javascript"></script>
<script type="text/javascript">
var collectionData = '';
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : 'getFeaturedCourses',
		mimeType : 'application/json',
		success : function(data) {
			var srcture = '';
			var finalString = '';
			var temp = 0;
			//var a = $('#coursecnt').data('myval'); //getter

			 $('#coursecnt').text(data.coursesCount);
			 $("#trainercnt").text(data.trainerCount+'');
			 $('#leadscnt').text(data.leadsCnt);
			 $("#studentscnt").text(data.studentsCnt+'');
			 $("#trainercnt").addClass("about-counter title-bar-counter counter-head");
			 $('#coursecnt').addClass("about-counter title-bar-counter counter-head");
			 $("#leadscnt").addClass("about-counter title-bar-counter counter-head");
			 $('#studentscnt').addClass("about-counter title-bar-counter counter-head");
			 //collectionData = data.courses;
		if(data!=null && data.featuredCoursesInfo!=null){	
			for(var i = 0; i < data.featuredCoursesInfo.length; i++) {
				var key = data.featuredCoursesInfo[i];
				var trainersCnt = key.template.split("-");
				var requestPath = '<%=request.getContextPath()%>';
				var reqText = requestPath+'/courses/'+key.courseIdentifier;
				srcture = srcture+'<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">'+
				'<div class="course-box">'+
					'<div class="course-icon">'+
						'<a href="'+reqText+'"><img class="img-responsive" src="'+requestPath+key.imagePath+'" alt="" title=""></a>'+
					'</div>'+
					'<div class="course-content desc">'+
						'<h4 class="title '+key.subCategory+'"><a href="'+reqText+'">'+key.courseName+'</a></h4>'+
						'<div class="courseprice-datesec">'+
							'<div class="learnerdatesec">'+
											'<span class="learnerscount"><i class="fa fa-graduation-cap" aria-hidden="true"></i> '+trainersCnt[0]+' Learners</span>'+
											 '<span class="no-jobs">'+
												 '<span><i class="fa fa-users"></i>' +trainersCnt[1]+' </span> '+	 
												 '<span>Trainers</span> '+
											'</span>'+
										'</div>'+
							'<div class="learnerdatesec">'+
							 	'<span class="learnerscount">'+key.category+'</span>'+
								 '<span class="no-jobs">'+
								 	'<span>'+key.subCategory+'</span> '+
								'</span>'+
							'</div>'+
						'</div>'+
						'<span class="avg-salary like">'+
							'<span>Level :  </span>'+
							'<span class="'+key.level+'">'+key.level+'</span>'+
						'</span>'+
						'<div class="ep-course-meta theme">'+
							'<a href="'+reqText+'" class="button btn btn-primary btn-lg">'+
										'View'+					
							'</a>'+		
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'
			}
		}
			if(srcture!=''){
				$("#featuredCourses").show();
				$("#coursesData").html(srcture);
				$("#coursesData").show();
			}else{
				$("#featuredCourses").hide();
				$("#coursesData").html('');
				$("#coursesData").hide();
			}
			
			
		}
	});	
	
	$("#search-box").keyup(function(){
		selectedCourse = '';
		if($(this).val().length>=2){
		if(collectionData==''){
		$("#loading").show();
		$.ajax({
		type: "POST",
		url: "fetchSuggestions",
		data:'searchText='+$(this).val(),
		beforeSend: function(){
			$("#search-box").css("background","#FFF  no-repeat 165px");
		},
		success: function(data){
			collectionData = data.courses;
			filterData(collectionData,$("#search-box").val().toUpperCase());
			$("#loading").hide();
			}
		
		});
		}
		filterData(collectionData,$("#search-box").val().toUpperCase());
		}else{
			$("#suggesstion-box").hide();
		}
		
	});
	
});

function filterData(collectionData,containsStr){
	$("#suggesstion-box").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].courseName.toUpperCase().indexOf(containsStr)>=0){
		htmlTxt = htmlTxt + '<li onClick="selectCourse(this,\''+collectionData[k].courseIdentifier+'\');" value="'+collectionData[k].courseIdentifier+'">'+collectionData[k].courseName+'</li>';
	    }
	}
	$("#suggesstion-box").html('<ul id="country-list" >'+htmlTxt+'</ul>');
	$("#search-box").css("background","#FFF");
}

var selectedCourse = '';
function selectCourse(val,courseIdentifier) {
	selectedCourse = courseIdentifier;
	$("#search-box").val(val.innerHTML);
	$("#suggesstion-box").hide();
}


function checkSelectedCourse(){
	if(selectedCourse!=''){
	var requestPath = '<%=request.getContextPath()%>';
	window.location.href = requestPath+'/courses/'+selectedCourse;
	}else{
		alert('No Courses Found at this time. please select from list of options from Search result.');
	}
}

</script>
</body>
</html>
<!--  Include Footer  -->