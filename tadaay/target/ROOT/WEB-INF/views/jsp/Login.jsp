<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
  </head>
  <body>
	<div id="main-wrapper">
  <div class="container-fluid">
  	<div class="login-logo-area hidden-xs">
	          <a href="<%=request.getContextPath()%>/" class="logo-text"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/logo.png" alt="courses" width="160px"></a>
	        </div>
	        <div class="login-logo-area visible-xs">
	          <a href="<%=request.getContextPath()%>/" class="logo-text"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/logo2.png" alt="courses" width="160px"></a>
	        </div>
  	<!--  <ul class="login-type-btns">
  	     <li><a href="javascript:void(0);" class="login-active login-type" id="login-btn">Login /</a></li>
       	<li><a href="javascript:void(0);" rel="signup-btn login-type" id="sign-btn">Sign up</a></li>
       </ul> -->
	    <div class="row">
	      <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12 left-side">
	        <div class="login-text-block">
	          <h2 style="color:#FFEB3B;">Use tadaay free for 30 days !</h2>
	          <div class="content-block-bg">
		          <div class="student-login-content">
			          <ul class="learning-outcomes">
						<li><i class="fa fa-graduation-cap" aria-hidden="true"></i> As a student, you will be able to acquire right IT skills and land a good job.</li>
						<li><i class="fa fa-university" aria-hidden="true"></i> tadaay will help training institutes to connect well with students across the country.</li>
						<li><i class="fa fa-user" aria-hidden="true"></i> Corporate trainers will get credibility which will help them to get training assignments from corporates.</li>
						<li><i class="fa fa-briefcase" aria-hidden="true"></i> Recruiters will be able to find right talent for their firms with an easy and synchronized     </li>
					</ul>
					</div>
	          	</div>
	        </div>
	      </div>
	      <input type="hidden" id="callback" name="callback" value="${param.callback}"> 
	      <div class="login-btn-content">
		      <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12 right-side login-right-side">
			        <form id="loginform">
			        <div id="loginErrorMsg"></div>
				        <span class="signup-input input-block">
				          <input class="input_field input_field-name" type="email" name="emailId"/>
				          <label class="input_label input_label-name border-color" for="email">
				            <span class="input_label-content label-name">E-mail</span>
				          </label>
				        </span>
				         <span class="signup-input input-block">
				          <input class="input_field input_field-name" type="password" id="password" name="password"/>
				          <label class="input_label input_label-name border-color" for="mobile">
				            <span class="input_label-content label-name">Password</span>
				          </label>
				        </span>
				        <div class="cta">
				          <button class="btn btn-primary" style="width:100%;border-radius:0px;margin-bottom:30px;">
				            Login
				          </button>
				          <div>
				          <a href="javascript:void(0);" onclick="performForgotPassword();" class="forgot-mrg pull-right" style="margin-top:0px;">Forgot password ?</a>
				          <a href="<%=request.getContextPath()%>/signup/student">Register</a>
				          </div>
				        </div>
				        <div class="mrgt20">
				         	 <a href="<%=request.getContextPath()%>"><i class="fa fa-arrow-left" aria-hidden="true"></i>  Back to Tadaay </a> 
				         </div>
			         </form> 
		      </div>
	      </div>
	    </div>
  </div>
  </div>
<%@ include file='/static/footer-include.jsp' %>
<script src="<%=request.getContextPath()%>/resources/assets/js/login.js"></script>
</body>	       
</html>
<!--  Include Footer  -->
