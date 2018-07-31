<!doctype html>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>

#menu {
  position: relative;
}

div#menu ul {
  width: 400px;
  overflow: hidden;
  white-space: nowrap;
  display: block;
  list-style: none;
  padding: 0;
  margin-left: 45px;
}

div#menu li {
  height: 50px;
  display: inline-block;
  text-align: center;
}

#nav {
  position: absolute;
  top: 0;
  width: 500px;
}

#prev {
  display: inline-block;
  position: absolute;
  left: 0;
  background-color: #ceaaaa;
  padding: 5px;
  cursor: pointer;
  font-weight: bold;
}

#next {
  position: absolute;
  right: 0;
  display: inline-block;
  background-color: #ceaaaa;
  padding: 5px;
  cursor: pointer;
  font-weight: bold;
}
</style>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/partners.jpg');">
</div>
<div class="courses-page-area5">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <div class="course-details-inner fuelux">
        	<div class="row">
        		 <div class="col-sm-7"> <h2 class="title-default-left title-bar-high">${quizName}</h2></div>
        		 <div class="col-sm-5">
            		 <div class="timerBlock">
                      	<div>Time Left : <span id="timerDisplay">00:00:00</span></div>
                      </div>
                     <a href="#" class="quiz-submit" data-toggle="modal" data-target="#myModal" onclick="performSubmit();">Submit</a>
                     <div class="quiz-legends">
                     	<span class="answered-color">Answered</span>
                     	<span class="review-color">Mark for Review</span>
                     	<span class="unread-color">Unread</span>
                     </div>
          		</div>
        	</div>
          <div class="questions-block">
            <c:set var="count" value="0" scope="page" />
            <c:set var="startIndex" value="1" scope="page" />
            <c:set var="parentcount" value="1" scope="page" />
              <div class="row question-sections-block">
              		<c:forEach var="courseData" items="${courseMap}">
              		<div class="col-lg-12 question-sections">
              			<div class="col-lg-4 section-name">Section - ${parentcount} of ${courseMap.size()} <span>${courseData.key}</span></div>
              			<c:set var="parentcount" value="${parentcount + 1}" scope="page" />
              			<div id="menu" class="col-lg-6 quize-pagination">
                      		<ul class="pagination-questions">
                      			<c:forEach var="question" varStatus="loop" items="${courseData.value}">
                      			     <c:set var="count" value="${count + 1}" scope="page"/>
                      			      <c:if test="${loop.index==0}">
                      			           <c:set var="startIndex" value="${count}" scope="page" />
                      			      </c:if>
                      			    <li><a  href="#" id="${courseData.key}-${count}-box" onclick="getQuestionForIndexAndSection('${courseData.key}','${count}');return false;"><c:out value="${count}"></c:out></a></li>
                      			</c:forEach>
                      		</ul>
						  <div id="nav">
						    <div id="prev">Prev</div>
						    <div id="next">Next</div>
						  </div>
                        </div>
                        <div class="col-lg-2 total-questions"><span>${startIndex} to ${count} of ${noOfQuestions}</span></div>
              		</div>
              		</c:forEach>
              </div>
              <div id="allQuestions">
              
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
         <h4 class="modal-title text-center" id="demoVideoLabel">Overview</h4>
      </div>
      <div class="modal-body">
      		<form class="form-horizontal" id="checkout-form">
                            <div class="profile-details tab-content">
                                <div class="tab-pane fade" id="Personal">
                                    <h3 class="title-section title-bar-high mb-40">Personal Information</h3>
                                    <div class="personal-info">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Biographical Info</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" id="first-name" type="text" rows="5"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">First Name</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="first-name" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Last Name</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="last-name" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Nick Name</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="nick-name" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Display Name</label>
                                            <div class="col-sm-9">
                                                <div class="custom-select">
                                                    <select id="country" class="select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                        <option value="0">Name 1</option>
                                                        <option value="1">Name 2</option>
                                                        <option value="2">Name 3</option>
                                                        <option value="3">Name 4</option>
                                                        <option value="4">Name 5</option>
                                                        <option value="5">Name 6</option>
                                                    </select><span class="select2 select2-container select2-container--classic" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" title="Name 1">Name 1</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Avatar</label>
                                            <div class="col-sm-9 public-profile-content">
                                                <img class="img-responsive" src="img/team/12.jpg" alt="Avatar">
                                                <div class="file-title">Upload a new avatar:</div>
                                                <div class="file-upload-area"><a href="#">Choose File</a>No File Choosen</div>
                                                <div class="file-size">JPEG 80x80px</div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Change Password</label>
                                            <div class="col-sm-9">
                                                <input class="form-control mb-10" id="last-name" type="password" placeholder="Current Password">
                                                <input class="form-control mb-10" id="last-name" type="password" placeholder="New Password">
                                                <input class="form-control mb-10" id="last-name" type="password" placeholder="Repeat Password">
                                            </div>
                                        </div>
                                        <div class="form-group mb-none">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button class="view-all-accent-btn disabled col-sm-9" type="submit" value="Login">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="Profile">
                                    <h3 class="title-section title-bar-high mb-40">Courses</h3>
                                    <div class="course-info">
                                        <img src="img/course/20.jpg" alt="course">
                                        <h3>This is a Paid course</h3>
                                        <div class="skill-area">
                                            <div class="progress">
                                                <div class="lead">90% Complete</div>
                                                <div data-wow-delay="1.2s" data-wow-duration="1.5s" style="width: 80%; visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInLeft;" data-progress="80%" class="progress-bar wow fadeInLeft  animated animated"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade active in" id="Badges">
                                    <h3 class="title-section">Total No of Questions : ${noOfQuestions}</h3>
                                    <div class="orders-info quiz-info">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr>
                                                    	 <th>Indicators</th>
                                                        <th>Actions</th>
                                                        <th>No of Questions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                    	<td class="review-color1">
                                                            <sapn></sapn>
                                                        </td>
                                                        <td>Un Answered</td>
                                                        <td><div id="unansweredTotal"></div></td>
                                                    </tr>
                                                    <tr>
                                                    	 <td class="review-color2">
                                                            <sapn></sapn>
                                                        </td>
                                                        <td>Answered</td>
                                                        <td><div id="answeredTotal"></div></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="final-submit"><button class="btn btn-primary" onclick="submitDecision();">Submit</button></div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="E-mail">
                                    <h3 class="title-section title-bar-high mb-40">Wishlist</h3>
                                    <div class="wishlist-info">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>Thumb</th>
                                                        <th>Name</th>
                                                        <th>Duration</th>
                                                        <th>Classes</th>
                                                        <th>Time</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th><img src="img/course/24.jpg" alt="course" class="img-responsive"></th>
                                                        <td>Mathematics</td>
                                                        <td>7 Months</td>
                                                        <td>60</td>
                                                        <td>10 pm - 11 pm</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
      </div>
    </div>
  </div>
</div>    

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
     <script>
    $(function () {
    	  var $timerDisplay = $('#timerDisplay');
    	  var serverTime = parseInt(${time});
    	  var time = 1*1*60*serverTime;
    	  var timeRemaining = time;
    	    var intervalId = setInterval(function () {
    	    	var hours = parseInt( time / 3600 ) % 24;
           		var minutes = parseInt( time / 60 ) % 60;
           		var seconds = time % 60;
           		var timeStamp = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);
           		if(time == 0 ){ time = 60*60*60; }
           		time = time - 1;              
    	      $timerDisplay.text(timeStamp);
    	      $timerDisplay.css("color", (timeRemaining > 1*1*50 ? "initial" : "red"));
    	      if (timeRemaining === 0) {
    	        clearInterval(intervalId);
    	        $timerDisplay.fadeOut();
    	        alert('Time is up, please submit  :)');
    	        $startTimer.prop('disabled', false);
    	      } else {
    	        timeRemaining--;
    	      }
    	    }, 1000);
    	});
    	$('#prev').on('click', function() {
    		  $('#menu ul').animate({
    		    scrollLeft: '-=100'
    		  }, 300, 'swing');
    		});

    		$('#next').on('click', function() {
    		  $('#menu ul').animate({
    		    scrollLeft: '+=100'
    		  }, 300, 'swing');
    		});
        var selectedQuestionData = '';
        var dateObjValues = new Object();
        var tempData = '';
		$(document).ready(function(){
    		//alert('${courseMap}');
    		var jsonData = eval(${quizDataObj});
    		jsonData = jsonData.quizData;
    		var totalDivTags = '';
    		var noOfQuestions = '${noOfQuestions}';
    		var questionIndex = 0;
    		for(var key in jsonData){
				var tempValue = key+'@'+parseInt(questionIndex+1);
    			for(var data in jsonData[key]){
    				var dataObj = jsonData[key];
    				questionIndex++;
    				dateObjValues[questionIndex] = key;
    				var showData = 'display:none;';
    				if(questionIndex==1){
    					showData = 'display:block;';
    					selectedQuestionData = questionIndex+'-'+key;
    				}
    				var buttonType = "radio";
    				if(dataObj[data].correctOption.indexOf(',')>=0){
    					buttonType = "checkbox";
    				}
    				var option1Text = '';
    				var option2Text = '';
    				var option3Text = '';
    				var option4Text = '';
    				var option5Text = '';
    				var option6Text = '';
    				
    				if((dataObj[data].optionAText!=null && dataObj[data].optionAText!='')  || dataObj[data].optionAHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].optionAText!='' && dataObj[data].optionAHasImage!='Y'){
    						finalText = dataObj[data].optionAText;
    					}else if(dataObj[data].optionAText!='' && dataObj[data].optionAHasImage=='Y'){
    						finalText = dataObj[data].optionAText+'<img src="'+dataObj[data].optionAImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}else if(dataObj[data].optionAHasImage=='Y' && dataObj[data].optionAImagePath!=''){
    						finalText = '<img src="'+dataObj[data].optionAImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}
    					option1Text = '<label><input type="'+buttonType+'" name="'+questionIndex+'-'+key+'" value="A" id="'+questionIndex+'-'+key+'-option-a" onclick="saveSelected(this);"> '+finalText+'</label>';	
    				}
    				if((dataObj[data].optionBText!=null && dataObj[data].optionBText!='')  || dataObj[data].optionBHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].optionBText!='' && dataObj[data].optionBHasImage!='Y'){
    						finalText = dataObj[data].optionBText;
    					}else if(dataObj[data].optionBText!='' && dataObj[data].optionBHasImage=='Y'){
    						finalText = dataObj[data].optionBText+'<img src="'+dataObj[data].optionBImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}else if(dataObj[data].optionBHasImage=='Y' && dataObj[data].optionBImagePath!=''){
    						finalText = '<img src="'+dataObj[data].optionBImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}
    					option2Text = '<label><input type="'+buttonType+'" name="'+questionIndex+'-'+key+'" value="B" id="'+questionIndex+'-'+key+'-option-b" onclick="saveSelected(this);"> '+finalText+'</label>';	
    				}
    				if((dataObj[data].optionCText!=null && dataObj[data].optionCText!='')  || dataObj[data].optionCHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].optionCText!='' && dataObj[data].optionCHasImage!='Y'){
    						finalText = dataObj[data].optionCText;
    					}else if(dataObj[data].optionCText!='' && dataObj[data].optionCHasImage=='Y'){
    						finalText = dataObj[data].optionCText+'<img src="'+dataObj[data].optionCImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}else if(dataObj[data].optionCHasImage=='Y' && dataObj[data].optionCImagePath!=''){
    						finalText = '<img src="'+dataObj[data].optionAImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}
    					option3Text = '<label><input type="'+buttonType+'" name="'+questionIndex+'-'+key+'" value="C" id="'+questionIndex+'-'+key+'-option-c" onclick="saveSelected(this);"> '+finalText+'</label>';	
    				}
    				if((dataObj[data].optionDText!=null && dataObj[data].optionDText!='')  || dataObj[data].optionDHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].optionDText!='' && dataObj[data].optionDHasImage!='Y'){
    						finalText = dataObj[data].optionDText;
    					}else if(dataObj[data].optionDText!='' && dataObj[data].optionDHasImage=='Y'){
    						finalText = dataObj[data].optionDText+'<img src="'+dataObj[data].optionDImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}else if(dataObj[data].optionDHasImage=='Y' && dataObj[data].optionDImagePath!=''){
    						finalText = '<img src="'+dataObj[data].optionDImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}
    					option4Text = '<label><input type="'+buttonType+'" name="'+questionIndex+'-'+key+'" value="D" id="'+questionIndex+'-'+key+'-option-d" onclick="saveSelected(this);"> '+finalText+'</label>';	
    				}
    				if((dataObj[data].optionEText!=null && dataObj[data].optionEText!='')  || dataObj[data].optionEHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].optionEText!='' && dataObj[data].optionEHasImage!='Y'){
    						finalText = dataObj[data].optionEText;
    					}else if(dataObj[data].optionEText!='' && dataObj[data].optionEHasImage=='Y'){
    						finalText = dataObj[data].optionEText+'<img src="'+dataObj[data].optionEImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}else if(dataObj[data].optionEHasImage=='Y' && dataObj[data].optionEImagePath!=''){
    						finalText = '<img src="'+dataObj[data].optionEImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}
    					option5Text = '<label><input type="'+buttonType+'" name="'+questionIndex+'-'+key+'" value="E" id="'+questionIndex+'-'+key+'-option-e" onclick="saveSelected(this);"> '+finalText+'</label>';	
    				}
    				
    				if((dataObj[data].optionFText!=null && dataObj[data].optionFText!='')  || dataObj[data].optionFHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].optionFText!='' && dataObj[data].optionFHasImage!='Y'){
    						finalText = dataObj[data].optionFText;
    					}else if(dataObj[data].optionFText!='' && dataObj[data].optionFHasImage=='Y'){
    						finalText = dataObj[data].optionFText+'<img src="'+dataObj[data].optionFImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}else if(dataObj[data].optionFHasImage=='Y' && dataObj[data].optionFImagePath!=''){
    						finalText = '<img src="'+dataObj[data].optionFImagePath+'" alt="Smiley face" height="100" width="100">'; 
    					}
    					option6Text = '<label><input type="'+buttonType+'" name="'+questionIndex+'-'+key+'" value="F" id="'+questionIndex+'-'+key+'-option-f" onclick="saveSelected(this);"> '+finalText+'</label>';	
    				}
    				
    				var questionText = '';
    				if((dataObj[data].questionText!=null && dataObj[data].questionText!='')  || dataObj[data].questionHasImage=='Y')	{
    					var finalText = '';
    					if(dataObj[data].questionText!='' && dataObj[data].questionHasImage!='Y'){
    						finalText = dataObj[data].questionText;
    					}else if(dataObj[data].questionText!='' && dataObj[data].questionHasImage=='Y'){
    						finalText = dataObj[data].questionText+'<img src="'+dataObj[data].questionImagePath+'" alt="Smiley face" height="200" width="200">'; 
    					}else if(dataObj[data].questionHasImage=='Y' && dataObj[data].questionImagePath!=''){
    						finalText = '<img src="'+dataObj[data].questionImagePath+'" alt="Smiley face" height="200" width="200">'; 
    					}
    					questionText = finalText;	
    				}
    				
    				
    				var divContent = '<div  style="'+showData+'"id="'+questionIndex+'-'+key+'-data" class="questions-content"><div class="single-question">'+
          				   '<h2 class="question-hd">Question # '+questionIndex+' of '+noOfQuestions+'<a href="#"  onclick="unmarkForReview(\''+key+'-'+questionIndex+'\');return false;" class="btn btn-primary" style="float:right;margin-right:5px;"> Clear </a>'+
          				   '<a href="#"  onclick="markForReview(\''+key+'-'+questionIndex+'\');return false;" class="btn btn-primary" style="float:right;margin-right:5px;">Mark Review</a></h2>'+
          				   '<p>'+questionText+'</p>'+option1Text+option2Text+option3Text+option4Text+option5Text+option6Text+
          			       '</div><div class="questions-navigation"> <div class="row">'+
                           '<a href="#" onclick="fetchQuestion(\''+key+'-'+questionIndex+'\',\'Next\');return false;" style="margin-left:30px;" class="nextQuestion pull-right">Next</a>'+
                           '<a href="#"  onclick="fetchQuestion(\''+key+'-'+questionIndex+'\',\'Prev\');return false;" class="prevQuestion pull-right">Previous</a></div></div></div>';
                           totalDivTags = totalDivTags+divContent; 
    			}
    			tempValue = tempValue+'@'+questionIndex+'-';
    			tempData = tempData+tempValue
    		}
			$("#allQuestions").html(totalDivTags);
    	});
    	
    	function fetchQuestion(questinId,typeData){
    	   var arrData = questinId.split('-');
    	   var Index = parseInt(arrData[1]);
    	   var noOfQuestions = '${noOfQuestions}';
    	   if(typeData=='Next'){
    		   Index++;
    		   if(Index<=noOfQuestions){
    		   $("#"+Index+"-"+dateObjValues[Index]+"-data").show();
    		   selectedQuestionData = Index+'-'+dateObjValues[Index];
    		   $("#"+arrData[1]+"-"+arrData[0]+"-data").hide();
               identifyTagColor(--Index,arrData[0],'C');
        	   }
    	   }else{
    		   Index--;
    		   if(Index>=1){
    		   $("#"+Index+"-"+dateObjValues[Index]+"-data").show();
    	       selectedQuestionData = Index+'-'+dateObjValues[Index];
    	       $("#"+arrData[1]+"-"+arrData[0]+"-data").hide();
    		   identifyTagColor(++Index,arrData[0],'C');
    		   }
    	   }
    	  
    	}
    	var answersList = new Object();
    	var answeredQuestions = new Object();
    	function saveSelected(obj){
    		var objData = obj.id.split('-');
    		var finalAnswer = '';
    		if($("#"+objData[0]+"-"+objData[1]+"-option-a") && $("#"+objData[0]+"-"+objData[1]+"-option-a").is(":checked")) 
    		{
    			finalAnswer = finalAnswer+'A,';
    	    }
    		if($("#"+objData[0]+"-"+objData[1]+"-option-b") && $("#"+objData[0]+"-"+objData[1]+"-option-b").is(":checked")) 
    	    		{
    	    			finalAnswer = finalAnswer+'B,';
    	    	    }
    		if($("#"+objData[0]+"-"+objData[1]+"-option-c") && $("#"+objData[0]+"-"+objData[1]+"-option-c").is(":checked")) 
    	    		{
    	    			finalAnswer = finalAnswer+'C,';
    	    	    }
    		if($("#"+objData[0]+"-"+objData[1]+"-option-d") && $("#"+objData[0]+"-"+objData[1]+"-option-d").is(":checked")) 
    	    		{
    	    			finalAnswer = finalAnswer+'D,';
    	    	    }
    		if($("#"+objData[0]+"-"+objData[1]+"-option-e") && $("#"+objData[0]+"-"+objData[1]+"-option-e").is(":checked")) 
    	    		{
    	    			finalAnswer = finalAnswer+'E,';
    	    	    }
    		if($("#"+objData[0]+"-"+objData[1]+"-option-f") && $("#"+objData[0]+"-"+objData[1]+"-option-f").is(":checked")) 
    	    		{
    	    			finalAnswer = finalAnswer+'F,';
    	    	    }
    		if(finalAnswer!=''){
    			var pos = finalAnswer.lastIndexOf(',');
    			finalAnswer = finalAnswer.substring(0,pos);	
    		}
    		delete answeredQuestions[objData[0]];
	    	delete answersList[objData[1]+"-"+objData[0]];
    			if(finalAnswer.length>0){
    		    	answeredQuestions[objData[0]] = objData[0];
    		    	answersList[objData[1]+"-"+objData[0]] = finalAnswer;
    			}
    			identifyTagColor(objData[0],objData[1],'C');	
    		}
    		
    	function getObjectSize(myObject) {
    		  var count=0
    		  for (var key in myObject)
    		    count++
    		  return count
    		}

    	function convertToString(myObject) {
  		  var content='';
  		  for (var key in myObject)
  			content = content +'|'+key+'-'+myObject[key];
  		  return content
  		}
    	
    	function performSubmit(){
    		var noOfQuestions = '${noOfQuestions}';
    		var answered = getObjectSize(answeredQuestions);
    		var unAnswered = parseInt(noOfQuestions) - answered;
    		$("#answeredTotal").html(answered);
    		$("#unansweredTotal").html(unAnswered);
    	}
    	
    	function hexc(colorval) {
    		var ctx = document.createElement('canvas').getContext('2d');
    		ctx.strokeStyle = 'rgb(64, 128, 192)';
    		var hexColor = ctx.strokeStyle;
    	    return hexColor;
    	}
    	
    	function submitDecision(){
    		$.ajax({
    			type: "POST",
    			url: "../postQuizAnswers",
    			data: { 
    			        allData: convertToString(answersList), 
    			        quizIdentifier: '${quizIdentifier}',
    			        quizId: '${quizId}',
    			        tempData : tempData// <-- the $ sign in the parameter name seems unusual, I would avoid it
    			},
    			success: function(data){
    			}
    		 });
    	}

    	
    	function identifyTagColor(Index,typeData,check){
    		var dataText = parseInt(Index);
    		var colorMe = hexc($("#"+typeData+"-"+dataText+"-box").css("background-color"));
    		if(document.getElementById(typeData+"-"+dataText+"-box").style.backgroundColor=='red'){
    			return;
    		}
    		if(check=='C' ){
    			if(($("#"+Index+"-"+typeData+"-option-a") && $("#"+Index+"-"+typeData+"-option-a").is(":checked")) 
    				|| 	($("#"+Index+"-"+typeData+"-option-b") && $("#"+Index+"-"+typeData+"-option-b").is(":checked"))
    				|| ($("#"+Index+"-"+typeData+"-option-c") && $("#"+Index+"-"+typeData+"-option-c").is(":checked"))
    				|| ($("#"+Index+"-"+typeData+"-option-d") && $("#"+Index+"-"+typeData+"-option-d").is(":checked"))
    				|| ($("#"+Index+"-"+typeData+"-option-e") && $("#"+Index+"-"+typeData+"-option-e").is(":checked"))
    				|| ($("#"+Index+"-"+typeData+"-option-f") && $("#"+Index+"-"+typeData+"-option-f").is(":checked"))){
    			$("#"+typeData+"-"+dataText+"-box").css("background-color","green");
    			}else{
    				$("#"+typeData+"-"+dataText+"-box").css("background-color","");
    			}
    		}else{
    			$("#"+typeData+"-"+dataText+"-box").css("background-color","red");
    		}
    		
    	}
    	
    	function unmarkForReview(reviewId){
    		var objData = reviewId.split('-');
    		$("#"+objData[0]+"-"+objData[1]+"-box").css("background-color","");
    		identifyTagColor(objData[1],objData[0],'C');
    	}
    	
    	
    	function markForReview(reviewId){
    		var objData = reviewId.split('-');
    		identifyTagColor(objData[1],objData[0],'R');
    	}
    	
    	function getQuestionForIndexAndSection(keyname,indexval){
    		 var selectedData = selectedQuestionData.split('-');
    		 var indexVal = parseInt(indexval);
    		 $("#"+selectedData[0]+"-"+selectedData[1]+"-data").hide();
    		 $("#"+indexVal+"-"+keyname+"-data").show();
    		 selectedQuestionData = indexVal+"-"+keyname;
    	 }
    </script>
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
</html>
<!--  Include Footer  -->