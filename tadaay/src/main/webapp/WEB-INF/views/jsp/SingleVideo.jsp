<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
   <meta name="description" content="">
    <meta name="keywords" content="">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/video.css">
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/partners.jpg');">
</div>
<div class="courses-page-area5">
  <div class="container">
    <div class="row"> 
      <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
        <div class="course-details-inner">
          <a href="#" class="enroll-btn learn-btn" data-toggle="modal" data-target="#wantToLearn">I want to learn</a>
          <h2 class="title-default-left title-bar-high">Basic HTML</h2>
          <!--div class="video-thumbnailimg">
           <img class="img-responsive" src="assets/images/corporate-banner.jpg" alt="">
           <div class="video-overlay">
	           <a href="#" class="overlay icon play" ></a>
	           <a href="#" class="video-watch">Watch Video</a>
           </div>
          </div-->
			<video  controls="" name="media" id="course-video" controlsList="nodownload" onclick="this.paused ? this.play() : this.pause();".>
				<source src="<%=request.getContextPath()%>/resources/videos/test-mpeg_512kb.mp4" type="video/mp4">
			</video>
        </div>
        <div class="video-panel-bg">
         	<h2>Basic HTML</h2>
         	<ul class="title-bar-high news-comments">
            	<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i><span>By</span> Admin</a></li>
                <li><a href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i>1000</a></li>
                <li><a href="#"><i class="fa fa-thumbs-down" aria-hidden="true"></i>11,000</a></li>
                <li><a href="#"><i class="fa fa-eye" aria-hidden="true"></i>Views</a></li>
            </ul>
        </div>
        <div class="video-panel-bg">
        	<h2>Assignments</h2>
        	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
        	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
        	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
        </div>
      </div>
      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
      
        <div class="sidebar">
          <div class="sidebar-box">
                                <div class="sidebar-box-inner">
                                    <h3 class="sidebar-title">Related</h3>
                                    <div class="sidebar-skilled-area">
                                        <ul>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#">
                                                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.1</a></h4>
                                                    <p>Senior WordPress Developer</p>
                                                    <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.2</a></h4>
                                                    <p>Graphic Designer</p>
                                                     <span class="view-count">2 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.3</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.4</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.5</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.6</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.7</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.8</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.9</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="skilled-img related-img">
                                                    <a href="#"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses"></a>
                                                    <span class="play-time"><i class="fa fa-clock-o" aria-hidden="true"></i> 3.20</span>
                                                </div>
                                                <div class="skilled-content">
                                                    <h4><a href="#">Lecture 1.10</a></h4>
                                                    <p>Senior UI Designer</p>
                                                     <span class="view-count">3 views</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
        </div>
      </div>                
    </div>
  </div>
</div>

<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
</html>
<!--  Include Footer  -->