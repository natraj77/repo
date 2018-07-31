<!doctype html>

<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
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
	    <div class="row">
	      <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12 left-side trainer-bg">
	        <div class="signup-text-block">
				 <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/t.png" alt="courses">	         
	        </div>
	      </div>
	      <div class="signup-btn-content">
		      <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12 right-side">
		      	 <form id="registration1">
                        <div id="errorMsg"></div>
                        <div class="row" style="opacity:0;">
				           <span class="col-sm-5 col-lg-5 col-md-5 signup-type">Register As</span>
				           <div class="col-sm-7 col-lg-7 col-md-7 radio">
				             <label for="userType" class="radio-inline">
				               <input type="radio" name="userType" id="userType" value="U"> Student
				             </label>
				             <label for="partnerType" class="radio-inline">
				               <input type="radio" name="userType"  id="partnerType"  value="P" > Training Institute
				             </label>
				              <label for="trainerType" class="radio-inline">
				               <input type="radio" name="userType"  id="trainerType" checked value="T" > Trainer
				             </label>
				              <label for="recruiterType">
				               <input type="radio" name="userType"  id="recruiterType" value="R" > Recruiter
				             </label>
				           </div>
				         </div> 
					      <div class="row">
						      <div class="col-sm-6">
					         	<span class="signup-input signup-input-mrg input-block fname-error">
						          <input class="input_field input_field-name" type="text" id="fname" name="fname" />
						          <label class="input_label input_label-name border-color" for="fname">
						            <span class="input_label-content label-name">First Name</span>
						          </label>
						        </span>
						        </div>
						        <div class="col-sm-6">
						        <span class="signup-input signup-input-mrg input-block lname-error">
						          <input class="input_field input_field-name" type="text" id="lname" name="lname" />
						          <label class="input_label input_label-name border-color" for="lname">
						            <span class="input_label-content label-name">Last Name</span>
						          </label>
						        </span>
						        </div>
					        </div>
                          <span class="signup-input signup-input-mrg input-block email-error">
					          <input class="input_field input_field-name" type="email" id="emailId" name="emailId" />
					          <label class="input_label input_label-name border-color" for="email">
					            <span class="input_label-content label-name">E-mail</span>
					          </label>
					        </span>
					         <span class="signup-input signup-input-mrg input-block mobile-error">
					          <input class="input_field input_field-name" type="text" id="mobile" name="mobile" />
					          <label class="input_label input_label-name border-color" for="mobile">
					            <span class="input_label-content label-name">MObile Number</span>
					          </label>
					        </span>
					       <span class="password-note">Note:(Password should be alphanumeric with special character)</span>
					         <div class="row">
						      <div class="col-sm-6">
						        <span class="signup-input signup-input-mrg input-block password-error">
						          <input class="input_field input_field-name" type="password" id="Newpassword" name="Newpassword" />
						          <label class="input_label input_label-name border-color" for="Newpassword">
						            <span class="input_label-content label-name">Password</span>
						          </label>
						        </span>
						        </div>
						        <div class="col-sm-6">
						        <span class="signup-input signup-input-mrg input-block repassword-error">
						          <input class="input_field input_field-name" type="password" id="retypepassword" name="retypepassword" />
						          <label class="input_label input_label-name border-color" for="password">
						            <span class="input_label-content label-name">Retype Password</span>
						          </label>
						        </span>
						        </div>
					        </div> 
					         <div class="form-group terms" style="margin-top:30px;">
									<input type="checkbox" name="accept" id="accept"> I accept the <a href="<%=request.getContextPath()%>/termsandconditions">terms and conditions</a> as described  by the tadaay 
							</div>
					        <div class="cta">
					          <button class="btn btn-primary">
					            Sign-Up Now
					          </button>
					        </div>
						     <div class="newto-signup text-center">
					         	Already have an Existing Account go to <a href="<%=request.getContextPath()%>/Login">Login</a>
					         	</div>
                        </form>
                        <!-- thank you -->
                        <div id="thankyou" style="display:none;padding-top:100px;">
						    <h4 class="title-default-left title-bar-high">
						        Thanks for registering with us. Please validate your Email
						    </h4>
						    <form id="registration2" class="form-inline">
						        <div class="">
						            <div class="form-group">
						                <input type="email" class="form-control" id="email" placeholder="" disabled>
						            </div>
						            <div class="form-group">
						                 <input class="form-control" id="emailToken" name="emailToken" type="text"  placeholder="Enter OTP here" required="required">
						            </div>
						        </div>
						        <!-- <div class="mT20">
						            <div class="form-group">
						                <input type="text" class="form-control" id="thanksmobile" name="thanksmobile" placeholder=""  disabled>
						            </div>
						            <div class="form-group">
						                <input type="text" class="form-control" id="mobileToken" placeholder="" required="required">
						            </div>
						        </div> -->
						        <button class="default-big-btn submit-mrg" id="otpSubmit">Submit</button>
						    </form>
						</div>
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
