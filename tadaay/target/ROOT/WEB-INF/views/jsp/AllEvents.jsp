<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/events.css">
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<section id="slider" class="fullheight" style="height:600px;">
	<div class="overlay dark-3" style="background-color: rgba(0,0,0,.7);"><!-- dark overlay [0 to 9 opacity] --></div>
	<div class="display-table">
		<div class="display-table-cell vertical-align-middle">
			<div class="container">
				<div class="row search-inner">
                 <form class="row margin-top-80 landing-form">
	                 <div class="col-sm-9">
	                    <div class="search-input" id="searchfield">
	                            <input type="text" size="100" style="text-transform: uppercase;width:100%"  class="search-form" placeholder="Discover Events Happening in Tadaay" id="search-box" />  
	                    </div>
	                    <div id="suggesstion-box"></div>
	                 </div>
	                 <div class="col-sm-3">
	    				<div>
	                        <a href="#" class="join-now-btn btn-block" onclick="checkSelectedCourse();" style="padding:10px 40px;height:43px;">Search</a>
	                    </div>
	    			</div>
               </form>
            </div>
			</div>
		</div>
	</div>
</section>
<section id="eventsBlock">
	<div class="container">
	<div class="row">
	<div class="heading-title text-center">
				<h2>Popular Events</h2>
			</div>
		<div class="grid cs-style-4">
		   <c:forEach var='dateItem' items='${data}' >
		  <div class="col-lg-4 line-content">
			<figure>
				<div><img class="img-responsive" src="<%=request.getContextPath()%>${dateItem.imagePath}" alt="image"></div>
				<figcaption>
					<h3>${dateItem.title}</h3><br/>
					${dateItem.organizer}<br/>
					${dateItem.location}<br/>
					${dateItem.eventDateFormat}<br/>
					<a href="<%=request.getContextPath()%>/eventdetails/${dateItem.eventModifier}">Take a look</a>
				</figcaption>
			</figure>
		</div>
        </c:forEach>
     </div>
	<div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <ul class="pagination-center"></ul>
        </div>
    </div>
    </div>
	</div>
</section>
<section class="register-events">
<div class="row-fluid fold" style="border-bottom: 1px dashed #ddd ;"> 
	<div class="container eorg">
		<div class="row span12 eorg-wrap">
			<h2>Are you an Event Organizer?</h2>
			<p class="pitch">Broadcast your events for free at Tadaay's event page and reach thousands of participants.  
			</p>
			<div class="span4 nhide float-shadow col-lg-4"> 
				<img alt="All Events in City Ticketing" src="<%=request.getContextPath()%>/resources/images/event/manage_2.png" style="width: 170px;">
				<a href="#" title="Set up Free ticketing"><h4>Online Ticketing &amp; Payment</h4></a>
				<p class="ppitch" style="color: #555;">Tadaay gives you an online platform to manage ticketing and payment for your events in an easy, effective and reliable manner. The process involves a novel and intuitive way to present your event information. Participants can join by obtaining tickets and make payments in a streamlined manner.
				
				</p>
			</div>
			<div class="span4 nhide float-shadow col-lg-4">
				<img alt="Tools to automate your tasks" src="<%=request.getContextPath()%>/resources/images/event/manage_3.png" style="width: 170px;">
				<a href="#" title="Claim Organizer Page"><h4>Automate your tasks </h4></a>
				<p class="ppitch" style="color: #555;">When you feature your event on Tadaay's event page, the enrollment for the event becomes totally automated. The participants can easily read the description of the event and can contact you for further details. You obtain all the details about the participants through an e-mail notification.
				</p>
			</div>
			<div class="span4 nhide float-shadow col-lg-4">
				<img alt="Marketing Activities" src="<%=request.getContextPath()%>/resources/images/event/manage_1.png" style="width: 170px;">
				<a href="#" title="Promote Your Event"><h4>Marketing Needs</h4></a>
				<p class="ppitch" style="color: #555;">Organizing an event can fulfil your marketing needs as well. Events displayed on this page are marketed across different social media platforms to make it a grand success. Tadaay believes that displaying your events on this page will attract more participants because Tadaay enjoys the presence of thousands of interested candidates. 
				</p>
			</div>
		</div>
		<div class="row" style="text-align: center;margin-left: 5px;"> 
		<a href="<%=request.getContextPath()%>/contact" class="btn btn-warning btn-large ae-get-start-btn">Contact Us</a> 
	</div> 
	</div>
</div>
</section>
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script src="<%=request.getContextPath()%>/resources/js/jquery.backstretch.min.js"></script>
	<script>
	$("#slider").backstretch([
          "resources/images/event/events-new.jpg"
        ], {
            fade: 750,
            duration: 4000
        });
    </script>
    <script> 
    pageSize = 6;
	var pageCount =  $(".line-content").length / pageSize;
     for(var i = 0 ; i<pageCount;i++){
       $(".pagination-center").append('<li><a href="javascript:void();">'+(i+1)+'</a></li> ');
     }
        $(".pagination-center li").first().find("a").addClass("active")
    showPage = function(page) {
	    $(".line-content").hide();
	    $(".line-content").each(function(n) {
	        if (n >= pageSize * (page - 1) && n < pageSize * page)
	            $(this).show();
	    });        
	}
	showPage(1);
	$(".pagination-center li a").click(function() {
	    $(".pagination-center li a").removeClass("active");
	    $(this).addClass("active");
	    showPage(parseInt($(this).text())) 
	});
	
	
	var collectionData = '';
	$(document).ready(function() {
		
		$("#search-box").keyup(function(){
			selectedCourse = '';
			if(collectionData==''){
			$.ajax({
			type: "POST",
			url: "fetchSuggestionsForEvents",
			data:'searchText='+$(this).val(),
			beforeSend: function(){
				$("#search-box").css("background","#FFF  no-repeat 165px");
			},
			success: function(data){
				collectionData = data.events;
				}
			
			});
			}
			filterData(collectionData,$("#search-box").val().toUpperCase());
		});
		
	});

	function filterData(collectionData,containsStr){
		$("#suggesstion-box").show();
		var htmlTxt = '';
		for(var k in collectionData){
			if(collectionData[k].toUpperCase().indexOf(containsStr)>=0){
			htmlTxt = htmlTxt + '<li onClick="selectCourse(this,\''+k+'\');" value="'+k+'">'+collectionData[k]+'</li>';
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
		window.location.href = requestPath+'/eventdetails/'+selectedCourse;
		}else{
			alert('No Events Found at this time. please select from list of options from Search result.');
		}
	}
	
	
    </script>
</body>
</html>