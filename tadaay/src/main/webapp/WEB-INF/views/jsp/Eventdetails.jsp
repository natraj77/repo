<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
   <meta name="description" content="${meta_description}">
    <meta name="keywords" content="${meta_keywords}">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/events.css">
     <style>
     	.inner-page-banner-area{
     		padding:100px 0px 30px;
     	}
     </style>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('resources/images/banners/5.jpg');">
  <div class="container">
    <div class="pagination-area">
      <ul>
        <li><a href="#">Home</a> -</li>
        <li>${template_title}</li>
      </ul>
    </div>
  </div>  
</div>
<div class="event-details-page-area">

     <div class="container">
         <div class="row">
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                 ${template_data}
             </div>
             <div class="view-all-btn-area">
            <a href="#" class="view-all-accent-btn" onclick="getEventSubscription('${eventIdentifier}','${eventId}','${userLoggedIn}');">Enroll Now</a>
        </div>
         </div>
     </div>
 </div>
 
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
<script type="text/javascript">
function getEventSubscription(eventIdentifier,eventId,loggedIn){
	if(loggedIn=='Y'){
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/performEventSubscription',
			data : {
				    eventId : eventId
				},
			success : function(datas) {
				if(datas.status=='Y'){
					alert('You are subscribed to the Event.');
				}else{
					alert('You are Already Subscribed for the Event.');
				}
				
			}
		});
	}else{
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=eventdetails/"+eventIdentifier;
		}
	}
}

var countDownDate = Number(${time});
var x = setInterval(function() {
var now = new Date().getTime();
var distance = countDownDate - now;
var days = Math.floor(distance / (1000 * 60 * 60 * 24));
var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((distance % (1000 * 60)) / 1000);
document.getElementById("timerDisplay").innerHTML =("<div class='countdown-section'><h3> " + days + "</h3><p>Days</p></div><div class='countdown-section'><h3> " + hours + "</h3><p>Hours</p></div><div class='countdown-section'><h3> " + minutes + "</h3><p>Minutes</p></div><div class='countdown-section'><h3> " + seconds + "</h3><p>Seconds</p></div>");
if (distance < 0) {
 clearInterval(x);
 document.getElementById("timerDisplay").innerHTML = "EXPIRED";
}
}, 1000);

			
	



</script>
</html>
<!--  Include Footer  -->