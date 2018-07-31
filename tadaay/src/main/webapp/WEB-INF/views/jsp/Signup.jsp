<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
  </head>
  <body>
	<div id="main-wrapper">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-6 left-side">
        <div class="signup-text-block">
          <h2>Create An Account</h2>
          <div class="content-block-bg">
	          <div id="U" class="user-signup-content">
		         <!--  <h3>create an account and </h3> -->
			 <p>find courses</p>
				<p>find trainers</p>
				<p>find reviews</p>
				<p>request course content</p>
				<p>request demo</p>
				<p>enroll online</p>		         
	          </div>
	          <div id="P" class="partner-signup-content">
	        <!--   <h3>create an account and</h3> -->
			 	<p> find leads</p>
				<p> form batches</p>
				<p> start tracking payments</p>
				<p> assign quizzes</p>
				<p> assign tasks to your students</p>	
	          </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 right-side">
      	<div class="row">
           <span class="col-sm-4 signup-type"><a href="#">Login Type</a></span>
           <div class="col-sm-8 radio">
             <label for="userType" class="radio-inline">
               <input type="radio" name="userType" id="userType" checked value="U"> Student
             </label>
             <label for="partnerType" class="radio-inline">
               <input type="radio" name="userType"  id="partnerType" value="P" > Trainer
             </label>
           </div>
         </div>
        <span class="signup-input input-block">
          <input class="input_field input_field-name" type="text" id="email" />
          <label class="input_label input_label-name border-color" for="email">
            <span class="input_label-content label-name">E-mail</span>
          </label>
        </span>
         <span class="signup-input input-block">
          <input class="input_field input_field-name" type="text" id="mobile" />
          <label class="input_label input_label-name border-color" for="mobile">
            <span class="input_label-content label-name">MObile Number</span>
          </label>
        </span>
        <div class="cta">
          <button class="btn btn-primary pull-left">
            Sign-Up Now
          </button>
         <span>Do you have an Existing Account go to <a href="<%=request.getContextPath()%>/Login">Login here</a></span> 
        </div>
      </div>
      <div class="or"><a href="<%=request.getContextPath()%>/">tadaay</a></div>
    </div>
  </div>
  </div>
<%@ include file='/static/footer-include.jsp' %>
<script>
$(document).ready(function() {
    $("div.partner-signup-content").hide();
    $("input[name$='userType']").click(function() {
        var test = $(this).val();
        $("div.partner-signup-content").hide();
        $("div.user-signup-content").hide();
        $("#" + test).show();
    });
});
</script>
</body>	       
</html>
<!--  Include Footer  -->
