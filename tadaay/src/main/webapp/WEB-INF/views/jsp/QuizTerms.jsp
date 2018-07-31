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
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/quiz.css">
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/partners.jpg');">
</div>
<div class="courses-page-area5">
  <div class="container">
    <div class="row"> 
      <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
        <div class="course-details-inner">
          <div class="course-details-tab-area">
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                <h3 class="sidebar-title">Terms and Conditions</h3>
                <ul class="learning-outcomes quiz-terms">
                  <li>Question might have one or more suitable answers. Please select all the correct answers. If all the answers are not selected the final result for the question will be wrong.</li>
                  <li>The assignment has time limit and it should be completed in the given time. </li>
                  <li>In case you want to skip the question and move forward to the next question, please use mark for review option. All the questions marked for review will be highlighted on the top with orange color. </li>
                  <li>The assignment may contain one or more topics. </li>
                  <li>Please see right panel for details of the assignment including topics, number of questions and the time to complete assignment. </li>
                <li>The pass criteria is decided by the assigner.</li> 
                <li>All the results will be auto saved.</li> 
                <li>Please use Submit button only when you have finished all the questions. Once submitted, you don't have any option to resume the quiz again.</li>
                <li>The time left will become red when 90% of the time is over.</li>
                <li>The assignment might have negative marking. Please see right panel for details.</li>
                </ul>
              </div>
              <a href="javascript:void();" class="view-all-accent-btn" data-toggle="modal" data-target="#myModal">Start Quiz</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
        <div class="sidebar">
            <div class="sidebar-box">
            <div class="sidebar-box-inner">
              <h3 class="sidebar-title">Post ads Here</h3>
            </div>
          </div>
        </div>
      </div>                
    </div>
  </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <h4 class="modal-title text-center" id="demoVideoLabel">Confirmation</h4>
      </div>
      <div class="modal-body">
      	<div><input type="checkbox" id="checkme"> I accept the terms and conditions as described by the "TADAAY" And understand the Guide Lines to Start Quiz</div>
      		<div class="row accept-continue">
      			<div class="col-lg-6 go-back"><a href="#" data-dismiss="modal" >Go Back</a></div>
      			<div class="col-lg-6 continue-quiz"><a href="#" onclick="doSubmit(${quizIdentifier});"> Accept & Continue</a></div>
      		</div>
      </div>
    </div>
  </div>
</div>    

<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
<script type="text/javascript">
function doSubmit(identifier){
	var checkedMe = $('#checkme').is(':checked');
	if(!checkedMe){
		alert('Please accept terms and Conditions before Proceeding.');
		return;
	}
	window.location = "<%=request.getContextPath()%>/QuizDetails/"+identifier;
}
</script>
</html>
<!--  Include Footer  -->