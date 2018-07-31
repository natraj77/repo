<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="wrapper"><!-- Warpper starts -->
      <!-- Header Area Start Here -->
      <header>    
<div id="header2" class="header2-area">
                <div class="header-top-area" style="margin-bottom: 0px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="header-top-left">
                                    <ul>
				                        <li><i class="fa fa-phone" aria-hidden="true"></i><a href="Tel:+91 970 330 9933"> +91 9703309933</a></li>
				                        <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@tadaay.com">info@tadaay.com</a></li>
				                      </ul>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="header-top-right">
                                    <c:if test="${sessionScope.CURRENT_USER == null}" >   
                      <ul>
                         <li class="dropdown signup-dropdown">
						    <button class="dropbtn" style="color:#d0d6dd;background:none;" type="button" data-toggle="dropdown"><i class="fa fa-lock" aria-hidden="true"></i>  Sign Up
						    <span class="caret"></span></button>
						     <ul class="dropdown-menu">
                          		<li><a class="login-btn-area" href="<%=request.getContextPath()%>/signup/student"><i class="fa fa-graduation-cap" aria-hidden="true"></i> As a Student</a></li>
                          	<li><a class="login-btn-area" href="<%=request.getContextPath()%>/signup/training-institute"><i class="fa fa-university" aria-hidden="true"></i> As a Training Institute</a></li>
                          	<li><a class="login-btn-area" href="<%=request.getContextPath()%>/signup/trainer"><i class="fa fa-user" aria-hidden="true"></i> As a Corporate Trainer</a></li>
                          	<li><a class="login-btn-area" href="<%=request.getContextPath()%>/signup/recruiter"><i class="fa fa-briefcase" aria-hidden="true"></i> As a Recruiter</a></li>
                          </ul>
						  </li>
						   <li>
                         <a class="login-btn-area" href="<%=request.getContextPath()%>/Login">
                            <i class="fa fa-lock" aria-hidden="true"></i> Login</a>
                        </li>
                      </ul>
                     </c:if>
                     <c:if test="${sessionScope.CURRENT_USER != null}" >   
                       <ul>
		                    <li class="has-menu">
		                      <a class="login-btn-area" href="#" id="signup-button">
		                        <i class="fa fa-user" aria-hidden="true"></i> <c:out value="Welcome ${sessionScope.CURRENT_USER.fname}" /></a>
		                      <ul class="drop-submenu">
		                        <li>
		                        <c:if test="${sessionScope.CURRENT_USER.userType =='U'}" >
	                           <a class="login-btn-area" href="<%=request.getContextPath()%>/student/Dashboard">
	                             My Dashboard</a>
	                            </c:if>
	                            <c:if test="${sessionScope.CURRENT_USER.userType =='P'}" >
	                            <a class="login-btn-area" href="<%=request.getContextPath()%>/trainer/Dashboard">
	                             My Dashboard</a>
	                            </c:if>
	                            <c:if test="${sessionScope.CURRENT_USER.userType =='A'}" >
	                            <a class="login-btn-area" href="<%=request.getContextPath()%>/admin/Dashboard">
	                             My Dashboard</a>
	                            </c:if>
	                             <c:if test="${sessionScope.CURRENT_USER.userType =='R'}" >
	                            <a class="login-btn-area" href="<%=request.getContextPath()%>/admin/Dashboard">
	                             My Dashboard</a>
	                            </c:if>
                            </li>
		                         <li>
		                           <a class="login-btn-area" href=#" onclick="sessionCLose();"> Logout</a>
		                        </li>
		                      </ul>
		                    </li>
		                  </ul>
                     </c:if> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-menu-area bg-textPrimary" id="sticker" style="border-bottom:1px solid #ccc">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <div class="logo-area" style="margin-top:10px;">
                                   <a href="<%=request.getContextPath()%>/" class="logo-text"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/logo2.png" alt="courses"></a>
                                </div>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10">
                                <nav id="desktop-nav">
                                    <ul>
				                      <li><a href="<%=request.getContextPath()%>/">Home</a></li>
				                      <li><a href="<%=request.getContextPath()%>/about">About Us</a></li>
				                      <%-- <li><a href="#">Training</a>
					                       <ul>
					                          <li><a href="<%=request.getContextPath()%>/IT-courses">Courses</a></li>
					                                   <li><a href="<%=request.getContextPath()%>/IT-trainers">Trainers</a></li>
					                               
					                       </ul>
				                        </li> --%>
				                      <li><a href="<%=request.getContextPath()%>/all-courses">Courses</a></li>
				                      <li><a href="<%=request.getContextPath()%>/all-trainers">Trainers</a></li>
				                      <li><a href="<%=request.getContextPath()%>/all-batches/find-leading-training-institutes">Batches</a></li>
				                    <%--   <li><a href=javascript:void();">Library</a>
				                           <ul>
				                             <!--  <li><a href="research1.html">Books</a></li> -->
				                            	<li><a href="<%=request.getContextPath()%>/AllVideos">Videos</a></li>
				                               <li><a href="<%=request.getContextPath()%>/AllQuizzes">Quizzes</a></li>
				                           </ul>
				                      </li> --%>
				                      <%-- 	<li><a href="<%=request.getContextPath()%>/events">Blog</a></li>
				                        <li><a href="<%=request.getContextPath()%>/events">Events</a></li>
				                        <li><a href="<%=request.getContextPath()%>/AllNews">News</a></li> --%>
				                      <li><a href="<%=request.getContextPath()%>/contact">Contact</a>
				                      </li>
				                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                     <ul>
                      <li><a href="<%=request.getContextPath()%>/">Home</a></li>
                      <li><a href="<%=request.getContextPath()%>/about">About Us</a></li>
                     <%--  <li><a href="#">Training</a>
	                       <ul>
	                          <li><a href="<%=request.getContextPath()%>/IT-courses">Courses</a></li>
	                                   <li><a href="<%=request.getContextPath()%>/IT-trainers">Trainers</a></li>
	                               
	                       </ul>
                        </li> --%>
                         <li><a href="<%=request.getContextPath()%>/all-courses">Courses</a></li>
                         <li><a href="<%=request.getContextPath()%>/all-trainers">Trainers</a></li>
                       <li><a href="<%=request.getContextPath()%>/all-batches/find-leading-training-institutes">Batches</a></li>
                      <%--   <li><a href=javascript:void();">Library</a>
                           <ul>
                             <!--  <li><a href="research1.html">Books</a></li> -->
                            	<li><a href="<%=request.getContextPath()%>/AllVideos">Videos</a></li>
                               <li><a href="<%=request.getContextPath()%>/AllQuizzes">Quizzes</a></li>
                           </ul>
                      </li> --%>
                      <%--  <li><a href="<%=request.getContextPath()%>/events">Blog</a></li>
                        <li><a href="<%=request.getContextPath()%>/events">Events</a></li>
                        <li><a href="<%=request.getContextPath()%>/AllNews">News</a></li> --%>
                      <li><a href="<%=request.getContextPath()%>/contact">Contact</a>
                      </li>
                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Area End -->
            </header>