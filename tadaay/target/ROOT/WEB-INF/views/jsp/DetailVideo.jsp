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
<!-- Inner Page Banner Area End Here -->
<!-- Courses Page 5 Area Start Here -->
<div class="courses-page-area5">
  <div class="container">
    <div class="row"> 
      <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
        <div class="course-details-inner">
          <a href="#" class="enroll-btn learn-btn" data-toggle="modal" data-target="#wantToLearn">I want to learn</a>
          <h2 class="title-default-left title-bar-high">Basic HTML</h2>
          <p>Python is a high-level language used for automation and building web applications. Python is
            an interpreted and object oriented programming language like many other languages. It
            comes with a lot of modules and packages to encourage modularity of the code and helps to
            improve the application performance. 
          </p>
          <div class="video-thumbnailimg">
          <video controls="" name="media" id="course-video" controlsList="nodownload">
				<source src="<%=request.getContextPath()%>/resources/videos/test-mpeg_512kb.mp4" type="video/mp4">
			</video>
           <div class="video-overlay">
	           <a href="<%=request.getContextPath()%>/SingleVideo" class="video-watch">Sample Video</a>
           </div>
          </div>
          <div class="course-details-tab-area">
          <a href="<%=request.getContextPath()%>/SingleVideo" class="view-all-accent-btn">Watch All</a>
          <a href="<%=request.getContextPath()%>/SingleVideo" class="view-all-accent-btn">Buy Now</a>
          <span class="pull-right video-price">Price : 3000/-</span>
          </div>
          <div class="course-details-tab-area">
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                <ul class="course-details-tab-btn">
                 <li class="active"><a href="#overview" data-toggle="tab" aria-expanded="true">Overview</a></li>
                   <li class=""><a href="#pre" data-toggle="tab" aria-expanded="false">Prerequisites</a></li>
                   <li class=""><a href="#curriculum" data-toggle="tab" aria-expanded="false">Videos</a></li>
                  <li class=""><a href="#reviews" data-toggle="tab" aria-expanded="false">Reviews</a></li>
                </ul>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="tab-content">
                	 <div class="tab-pane fade active in" id="overview">
                  		<h3 class="sidebar-title">Course Description</h3>
                  		<p>Dmply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</p>
							<h3 class="sidebar-title">Certification</h3>
							<p>Dmply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</p>
							<h3 class="sidebar-title">Learning Outcomes</h3>
							<ul class="learning-outcomes">
								<li>Over 37 lectures and 55.5 hours of content!</li>
								<li>Testing Training Included.</li>
								<li>Learn Software Testing and Automation basics from a professional trainer from your own desk.</li>
								<li>Information packed practical training starting from basics to advanced testing techniques.</li>
								<li>Best suitable for beginners to advanced level users and who learn faster when demonstrated.</li>
								<li>Course content designed by considering current software testing technology and the job market.</li>
								<li>Practical assignments at the end of every session.</li>
								<li>Practical learning experience with live project work and examples.</li>
							</ul>
                  	</div>
	                  <div class="tab-pane fade" id="pre">
	                    <ul class="course-feature">                                             
	                      <li>What is Python?</li>
	                      <li>Installing Python in Windows/Linux/Mac OS</li>
	                      <li>Using Python interpreter</li>
	                      <li>Structuring with Indentation</li>
	                      <li>Salient features of Python</li>
	                      <li>How Python runs Programs?</li>
	                      <li>Structuring with Indentation</li>
	                      <li>Single-quote, double quote and multi-line strings</li>                                                   
	                    </ul>
	                  </div>
                  <div class="tab-pane fade" id="curriculum">
                    <h3 class="sidebar-title">MODULE 1: Basic Python (24:30:00 hours)</h3>
                    <div class="panel-group curriculum-wrapper" id="accordion">
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <div class="panel-title">
                            <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                              <ul>
                                <li><i class="fa fa-play-circle" aria-hidden="true"></i></li>
                                <li>Lecture 1.1</li>
                                <li>Getting Started</li>
                                <li><i class="fa fa-clock-o" aria-hidden="true"><span> 00.60.00</span></i></li>
                              </ul>
                            </a>
                          </div>
                        </div>
                        <div aria-expanded="false" id="collapseOne" role="tabpanel" class="panel-collapse collapse in">
                          <div class="panel-body">
                            Ut quis scelerisque risus, et viverra nisi. Phasellus ultricies luctus augue, eget maximus felis laoreet quis. Maecenasbibendum tempor eros. 
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <div class="panel-title">
                            <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                              <ul>
                                <li><i class="fa fa-play-circle" aria-hidden="true"></i></li>
                                <li>Lecture 1.2</li>
                                <li>Introduction</li>
                                <li><i class="fa fa-clock-o" aria-hidden="true"><span> 00.60.00</span></i></li>
                              </ul> 
                            </a>
                          </div>
                        </div>
                        <div aria-expanded="false" id="collapseTwo" role="tabpanel" class="panel-collapse collapse">
                          <div class="panel-body">
                            Ut quis scelerisque risus, et viverra nisi. Phasellus ultricies luctus augue, eget maximus felis laoreet quis. Maecenasbibendum tempor eros. 
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <div class="panel-title">
                            <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                              <ul>
                                <li><i class="fa fa-play-circle" aria-hidden="true"></i></li>
                                <li>Lecture 1.3</li>
                                <li>Datatype and Variables</li>
                                <li><i class="fa fa-clock-o" aria-hidden="true"><span> 00.60.00</span></i></li>
                              </ul>
                            </a>
                          </div>
                        </div>
                        <div aria-expanded="false" id="collapseThree" role="tabpanel" class="panel-collapse collapse">
                          <div class="panel-body">
                            Ut quis scelerisque risus, et viverra nisi. Phasellus ultricies luctus augue, eget maximus felis laoreet quis. Maecenasbibendum tempor eros. 
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <div class="panel-title">
                            <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                              <ul>
                                <li><i class="fa fa-play-circle" aria-hidden="true"></i></li>
                                <li>Lecture 1.4</li>
                                <li>String</li>
                                <li><i class="fa fa-clock-o" aria-hidden="true"><span> 00.60.00</span></i></li>
                              </ul>
                            </a>
                          </div>
                        </div>
                        <div aria-expanded="false" id="collapseFour" role="tabpanel" class="panel-collapse collapse">
                          <div class="panel-body">
                            Ut quis scelerisque risus, et viverra nisi. Phasellus ultricies luctus augue, eget maximus felis laoreet quis. Maecenasbibendum tempor eros. 
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <div class="panel-title">
                            <a aria-expanded="false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                              <ul>
                                <li><i class="fa fa-play-circle" aria-hidden="true"></i></li>
                                <li>Lecture 1.5</li>
                                <li>Control Flow</li>
                                <li><i class="fa fa-clock-o" aria-hidden="true"><span> 00.60.00</span></i></li>
                              </ul> 
                            </a>
                          </div>
                        </div>
                        <div aria-expanded="false" id="collapseFive" role="tabpanel" class="panel-collapse collapse">
                          <div class="panel-body">
                            Ut quis scelerisque risus, et viverra nisi. Phasellus ultricies luctus augue, eget maximus felis laoreet quis. Maecenasbibendum tempor eros. 
                          </div>
                        </div>
                      </div>
                    </div>                     
                  </div>
                  <div class="tab-pane fade" id="reviews">
                    <div class="course-details-comments">
                      <h3 class="sidebar-title">Student Reviews</h3>
                      <div class="media">
                        <a href="#" class="pull-left">
                          <img alt="Comments" src="assets/images/course/16.jpg" class="media-object">
                        </a>
                        <div class="media-body">
                          <h3><a href="#">Greg Christman</a></h3>
                          <h4>Excellent course!</h4>
                          <p>Rimply dummy text of the printinwhen an unknown printer took eype and scramb relofeletog and typesetting industry. Lorem </p>
                          <div class="replay-area">
                            <ul>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="media">
                        <a href="#" class="pull-left">
                          <img alt="Comments" src="assets/images/course/16.jpg" class="media-object">
                        </a>
                        <div class="media-body">
                          <h3><a href="#">Lora Ekram</a></h3>
                          <h4>Excellent course!</h4>
                          <p>Rimply dummy text of the printinwhen an unknown printer took eype and scramb relofeletog and typesetting industry. Lorem </p>
                          <div class="replay-area">
                            <ul>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="media">
                        <a href="#" class="pull-left">
                          <img alt="Comments" src="assets/images/course/16.jpg" class="media-object">
                        </a>
                        <div class="media-body">
                          <h3><a href="#">Mike Jones</a></h3>
                          <h4>Excellent course!</h4>
                          <p>Rimply dummy text of the printinwhen an unknown printer took eype and scramb relofeletog and typesetting industry. Lorem </p>
                          <div class="replay-area">
                            <ul>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="media">
                        <a href="#" class="pull-left">
                          <img alt="Comments" src="assets/images/course/16.jpg" class="media-object">
                        </a>
                        <div class="media-body">
                          <h3><a href="#">Greg Christman</a></h3>
                          <h4>Excellent course!</h4>
                          <p>Rimply dummy text of the printinwhen an unknown printer took eype and scramb relofeletog and typesetting industry. Lorem </p>
                          <div class="replay-area">
                            <ul>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="leave-comments">
                      <h3 class="sidebar-title">Leave A Comment</h3>
                      <div class="row">
                        <div class="contact-form" id="review-form"> 
                          <form>
                            <fieldset>
                              <div class="col-sm-6">
                                <div class="form-group">
                                  <input placeholder="Name" class="form-control" type="text">
                                  <div class="help-block with-errors"></div>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="form-group">
                                  <input placeholder="Email" class="form-control" type="email">
                                  <div class="help-block with-errors"></div>
                                </div>
                              </div>
                              <div class="col-sm-12">
                                <div class="form-group">
                                  <div class="rate-wrapper">
                                    <div class="rate-label">Your Rating:</div>
                                    <div class="rate">
                                      <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                      <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                      <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                      <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                      <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-sm-12">
                                <div class="form-group">
                                  <textarea placeholder="Comment" class="textarea form-control" id="form-message" rows="8" cols="20"></textarea>
                                  <div class="help-block with-errors"></div>
                                </div>
                              </div>
                              <div class="col-sm-12">
                                <div class="form-group">
                                  <button type="submit" class="view-all-accent-btn">Post Comment</button>
                                </div>
                              </div>
                            </fieldset>
                          </form>
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
      <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
        <div class="sidebar">
          <div class="sidebar-box">
            <div class="sidebar-box-inner">
              <h3 class="sidebar-title">Video Reviews</h3>
              <div class="sidebar-course-reviews">
                <h4>Average Rating<span>4.8</span></h4>
                <ul>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star" aria-hidden="true"></i></li>
                  <li><i class="fa fa-star-half-o" aria-hidden="true"></i></li>
                </ul>
                <div class="skill-area">
                  <div class="progress">
                    <div class="lead">5 Stars </div>
                    <div data-wow-delay="1.2s" data-wow-duration="1.5s" style="width: 100%; visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInLeft;" data-progress="100%" class="progress-bar wow fadeInLeft  animated"></div><span>10</span>
                  </div>
                  <div class="progress">
                    <div class="lead">4 Stars</div>
                    <div data-wow-delay="1.2s" data-wow-duration="1.5s" style="width: 80%; visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInLeft;" data-progress="80%" class="progress-bar wow fadeInLeft  animated"></div><span>6</span> 
                  </div>
                  <div class="progress">
                    <div class="lead">3 Stars</div>
                    <div data-wow-delay="1.2s" data-wow-duration="1.5s" style="width: 60%; visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInLeft;" data-progress="60%" class="progress-bar wow fadeInLeft  animated"></div><span>3</span> 
                  </div>
                  <div class="progress">
                    <div class="lead">2 Stars</div>
                    <div data-wow-delay="1.2s" data-wow-duration="1.5s" style="width: 0%; visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInLeft;" data-progress="0%" class="progress-bar wow fadeInLeft  animated"></div><span>0</span> 
                  </div>
                  <div class="progress">
                    <div class="lead">1 Stars</div>
                    <div data-wow-delay="1.2s" data-wow-duration="1.5s" style="width: 0%; visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInLeft;" data-progress="0%" class="progress-bar wow fadeInLeft  animated"></div><span>0</span> 
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- <div class="sidebar-box">
            <div class="sidebar-box-inner">
              <h3 class="sidebar-title">Ask a Question?</h3>
              <div class="sidebar-question-form"> 
                <form id="question-form">
                    <div class="form-group">
                      <input type="text" placeholder="Name*" class="form-control" name="name" id="form-name" data-error="Name field is required" required>
                      <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                      <input type="email" placeholder="Email*" class="form-control" name="email" id="form-email" data-error="Email field is required" required>
                      <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                      <textarea placeholder="Message*" class="textarea form-control" name="message" id="sidebar-form-message" rows="3" cols="20" data-error="Message field is required" required></textarea>
                      <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="default-full-width-btn">Send</button>
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

<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
</html>
<!--  Include Footer  -->