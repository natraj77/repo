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
<section id="slider" class="fullheight" style="height:100vh;">
	<div class="overlay dark-3"><!-- dark overlay [0 to 9 opacity] --></div>
	<div class="display-table">
		<div class="display-table-cell vertical-align-middle">
			<div class="container">
				<div class="row search-inner">
                 <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                    <div class="search-input" id="searchfield">
                        <form>
                            <input type="text" size="100" style="text-transform: uppercase"  class="search-form" placeholder="Discover News Happening in Tadaay" id="search-box" />  
                        </form>
                    </div>
                    <div id="suggesstion-box"></div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                    <div class="search-submit">
                        <a href="#" class="join-now-btn" onclick="checkSelectedCourse();">Search</a>
                    </div>
                </div>
            </div>
			</div>
		</div>
	</div>
</section>
<section id="eventsBlock">
	<div class="container">
	<div class="row">
	<div class="heading-title text-center">
				<h2>Popular News</h2>
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
					<a href="<%=request.getContextPath()%>/newsdetails/${dateItem.eventModifier}">Take a look</a>
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
			<p class="pitch">List your events for free and get recommended to interested users immediately.</p>
			<div class="span4 nhide float-shadow col-lg-4"> 
				<img alt="All Events in City Ticketing" src="<%=request.getContextPath()%>/resources/images/event/manage_2.png" style="width: 170px;">
				<a href="#" title="Set up Free ticketing"><h4>Online Ticketing &amp; Payment</h4></a>
				<p class="ppitch" style="color: #555;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy texts</p>
			</div>
			<div class="span4 nhide float-shadow col-lg-4">
				<img alt="Tools to automate your tasks" src="<%=request.getContextPath()%>/resources/images/event/manage_3.png" style="width: 170px;">
				<a href="#" title="Claim Organizer Page"><h4>Tools to automate your tasks</h4></a>
				<p class="ppitch" style="color: #555;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy texts</p>
			</div>
			<div class="span4 nhide float-shadow col-lg-4">
				<img alt="Marketing Activities" src="<%=request.getContextPath()%>/resources/images/event/manage_1.png" style="width: 170px;">
				<a href="#" title="Promote Your Event"><h4>Marketing Activities</h4></a>
				<p class="ppitch" style="color: #555;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy texts</p>
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
          "resources/images/event/blur.jpg",
          "resources/images/event/slider_1-min.jpg",
          "resources/images/event/slider_3-min.jpg"
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
			if($(this).val().length>=2){
			if(collectionData==''){
			$.ajax({
			type: "POST",
			url: "fetchSuggestionsForNews",
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
			}else{
				$("#suggesstion-box").hide();
			}
			
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
		window.location.href = requestPath+'/newsdetails/'+selectedCourse;
		}else{
			alert('No News Found at this time. please select from list of options from Search result.');
		}
	}
	
	
    </script>
</body>
</html>