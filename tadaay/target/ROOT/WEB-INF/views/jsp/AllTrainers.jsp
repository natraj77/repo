<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> find courses in IT | Tadaay</title>
    <meta name="description" content="find leading courses in IT, average salaries. Find documentation, learn online or find trainers and their reviews">
     <meta name="keywords" content="">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <!-- facebook -->
    <meta property="og:title" content="Join tadaay, get visibility and credibility | Tadaay" />
	<meta property="og:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>"/all-trainers />
	<meta property="og:type" content="website" />
	<meta property="og:description" content="" />
	<meta property="og:image" content="<%= request.getScheme() %>://<%=request.getServerName() %>/appContent/opt/tadaay/uploads/website/promotions/trainers.jpg" />
	
	 <!-- twitter card --->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="Join tadaay, get visibility and credibility | Tadaay" />
	<meta name="twitter:description" content="tadaay will help you connect with students & fetch you corporate training assignments across india" />
	<meta name="twitter:url" content="<%= request.getScheme() %>://<%=request.getServerName() %>"/all-trainers />
	<meta name="twitter:image" content="<%= request.getScheme() %>://<%=request.getServerName() %>/appContent/opt/tadaay/uploads/website/promotions/trainers.jpg" />
    <%@ include file='/static/header-include.jsp'%>
    <!-- jPList core js and css  -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.core.min.css" rel="stylesheet" type="text/css" />				
		<!-- jPList toggle bundle -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.history-bundle.min.css" rel="stylesheet" type="text/css" />		
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />		
		<!-- jPList textbox filter control -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/partners.css">
		<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 40%;
}

/* The Close Button */
.close {
    color: #0c0c0c;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
#suggesstion-box ul{
	width:100%;
	top:35px;
	z-index:1;
}
.search-keywrdicon{
	background-color:#000;
	right:15px;
}

</style>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<!-- Slider 1 Area Start Here -->               
<section id="slider">
				<div class="slider">
					<div class="layerslider height-500" style="width:100%;">
						<c:forEach var='banner' items='${addbanners}'>
						
						<div class="ls-slide" data-ls="slidedelay:3000;transition2d: all;;">
							<!-- background image -->
							<div> <c:out value="${banner[0]}" /> </div>
							<img src="<%=request.getContextPath()%>/<c:out value="${banner[1]}" />" width="100" height="100" class="ls-bg" />
						</div>
						</c:forEach>
					</div>
					<script type="text/javascript">
						var layer_options = {
							responsive: 		false,
							responsiveUnder: 	1280,
							layersContainer: 	1280,
							hoverPrevNext: 		true,
							hoverPrevNext: 		true,
							pauseOnHover: true,
							skinsPath: 			'<%=request.getContextPath()%>/resources/vendor/slider.layerslider/skins/'
						}
					</script>
				</div>
			</section>
<!-- Slider 1 Area End Here -->
		<section class="course-search-box">
				<div id="course_filter" class="jplist container">
					<div class="row search-box">
					<div class="col-md-12 col-sm-12" style="padding:0px;">
				<div class="marginbt100">
				    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 catinfosec clearfix">
				            <div class="row">
				             <div class="trainer-search">
				                    
				            <div class="col-xxs-12 col-xs-12 col-sm-6 col-md-3">
								<div class="form-group search-keywrd">
									<div class="jplist-panel panel-top">	
						            		<div>																
												<!--[if lt IE 10]>
												<div class="jplist-label">Filter by Title:</div>
												<![endif]-->
																	
												<input 
													data-path=".courses" 
													type="text" 
													value="" 
													placeholder="Filter by Courses" 
													data-control-type="textbox" 
													data-control-name="title-filter" 
													data-control-action="filter"
													class="form-control"
													id="search-box"
													style="text-transform: uppercase"  class="search-form" placeholder="Course Keywords . . ." autocomplete="off"
												/>
											</div>
						            	</div>
								</div>
								<div class="search-keywrdicon">
									<button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
								</div>
								<div id="suggesstion-box"></div>
								<div id="loading" style="display:none"><img src="<%=request.getContextPath()%>/resources/assets/img/loading.gif" alt="Polyglot"></div>
							</div>
							
							<div class="col-xxs-12 col-xs-12 col-sm-6 col-md-3">
				              <!-- sort dropdown -->
				              <div class="jplist-panel box panel-top">
				                <div>
					               <select 
										   class="jplist-select" 
										   data-control-type="filter-select" 
										   data-control-name="category-filter" 
										   data-control-action="filter">
										   <option data-path="default" >Filter by Trainer Type</option>
										   <c:forEach items="${trainerTypes}" var="item" >
										      <option data-path=".${fn:replace(item.keyValue,' ', '')}">${item.keyValue}</option>
										   </c:forEach>
										</select>	
								</div>
				                </div>
				            </div>
							<div class="col-xxs-12 col-xs-12 col-sm-6 col-md-3">
							<div class="jplist-panel box panel-top">
				                <div>
					               <select id="cityList"
										   class="jplist-select" 
										   data-control-type="filter-select" 
										   data-control-name="category-filter" 
										   data-control-action="filter">
										   <c:forEach items="${cities}" var="city">
										     <c:choose>
											  <c:when test="${city eq cityData}">
											   <option data-default="true" data-path=".${fn:replace(city,' ', '')}">${city}</option>
											  </c:when>
											  <c:otherwise>
											    <option  data-path=".${fn:replace(city,' ', '')}">${city}</option>
											  </c:otherwise>
											</c:choose>
										   </c:forEach>		
										</select>	
								</div>
				                </div>
								</div>
						<div class="col-xxs-12 col-xs-12 col-sm-6 col-md-3">
			                   <div class="jplist-panel box panel-top">
				                <div>
					              	<!--   <select 
										   class="jplist-select" 
										   data-control-type="filter-select" 
										   data-control-name="category-filter" 
										   data-control-action="filter">
										   
											  <option data-path="default">Filter by Mode</option>
											  <option data-path=".classroom">Class Room</option>
											  <option data-path=".online">Online</option>
											  <option data-path=".classonline">Class Room / Online</option>			
										</select>	-->
								</div>
				                </div>
							</div> 
							 <div class="batchtypefilter jplist-panel">
								<div class="jplist-panel box">	
								<div class="cfilter_actions">										
								<!-- back button button -->
								<button style="display:none;"
									type="button" 
									data-control-type="back-button" 
									data-control-name="back-button" 
									data-control-action="back-button">
									<i class="fa fa-arrow-left"></i> Go Back
								</button>
													
								<!-- reset button -->
								<button style="display:none;"
									type="button" 
									class="jplist-reset-btn"
									data-control-type="reset" 
									data-control-name="reset" 
									data-control-action="reset">
									Reset
								</button>
													
								<!-- items per page dropdown -->
								<div style="display:none;"
								   class="jplist-drop-down" 
								   data-control-type="items-per-page-drop-down" 
								   data-control-name="paging" 
								   data-control-action="paging">
								   
								   <ul>
									 <li><span data-number="4" data-default="true"> 10 per page </span></li>
									 <li><span data-number="all"> View All </span></li>
								   </ul>
								</div>
								</div>
								
							</div>	
					        </div>
				            		<div class="col-md-4" style="display:none;">
				            			<div class="jplist-panel box panel-bottom">
							<div class="jplist-label" data-type="{start} - {end} of {all}" data-control-type="pagination-info" 
							   data-control-name="paging" 
							   data-control-action="paging">
							</div>
						</div>	
				            		</div>
				            	</div>
				            </div>
				    </div>
				</div>				
					
					<!-- data -->   
					<div class="list box text-shadow trainers-block">
						
						<!-- item 1 -->
						<c:forEach items="${trainerData}" var="item" >
						<div class="single-trainer list-item new">
						<div class="col-lg-12">
						<div class="row">
						<div class="trainertype-block">
						        <span style="display:none;" class="${fn:replace(item.city,' ', '')}">${item.city}</span>
								<span class="${fn:replace(item.userType,' ', '')}">${item.userType}</span>
						</div>
							<div class="col-lg-2 col-sm-6 col-xs-2 col-md-2">
								<div class="trainer-logo">
									<img src="<%=request.getContextPath()%>/resources/images/trainers/no-image.jpg">
								</div>
								<h2 class="title">${item.trainerName}</h2>
								
							</div>
							<div class="col-lg-10 col-sm-6 col-xs-10 col-md-10">
								<p>${item.aboutUs}</p>
								<div>
							<div>
								<ul class="courses">
									<c:forEach var="entry" items="${item.courses}">
									 <li><c:if test="${not empty entry.value}"><img src="<%=request.getContextPath()%><c:out value="${entry.value}"/>" width="30px;"> </c:if> <span><c:out value="${entry.key}"/></span></li>
									</c:forEach>
								</ul>
							</div>
							</div>
							<div class="trainer-moreblock">
		                        <a  href="javascript:void(0);" onclick="callforDemoOrCallBack('${userLoggedIn}','${item.partnerId}');" class="btn-sm" data-toggle="modal" data-target="#request_demo">Follow</a>
		                        <a  href="javascript:void(0);" onclick="openModel('${userLoggedIn}',${item.partnerId});" class="partner-contact" data-toggle="modal" data-target="#request_demo"><i class="fa fa-phone" aria-hidden="true"></i> Contact Details</a>
								<a href="javascript:void(0);" onclick="openDetailsPage('${userLoggedIn}','${item.partnerId}','${item.user}');" class="pmore-details" data-toggle="modal" data-target="#request_demo">More Details</a>
								
								</div>
							</div>
							</div>
						</div>
					</div>
					<div id="${item.partnerId}" class="modal">
					  <div class="modal-content">
					    <span class="close" onclick="closeModel(${item.partnerId});">&times;</span>
					    <p><strong>Email Id :</strong> ${item.emailId}</p> 
					    <p><strong>Mobile No :</strong> ${item.contactNo}</p>
					  </div>
					</div>
					
					      
					</c:forEach>
					
					
					</div>
					<div class="jplist-panel box panel-top">
		                
						<!-- pagination results -->
						<div class="jplist-label" data-type="Page {current} of {pages}" data-control-type="pagination-info" 
						   data-control-name="paging" 
						   data-control-action="paging">
						</div>
												
						<!-- pagination control -->
						<div 
						   class="jplist-pagination" 
						   data-control-type="pagination" 
						   data-control-name="paging" 
						   data-control-action="paging">
						</div>
						
						
					</div>						 
					<div class="box jplist-no-results text-shadow align-center">
						<p>No results found</p>
					</div>	
				</div>
				</div>
				</div>
				</section>
		<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>

 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- jPList core js and css  -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.core.min.js"></script>		
<!-- jPList toggle bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.filter-toggle-bundle.min.js"></script>
<!-- jPList history bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.history-bundle.min.js"></script>
<!-- jPList sort bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.sort-bundle.min.js"></script>
<!-- jPList pagination bundle -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.pagination-bundle.min.js"></script>
<!-- jPList textbox filter control -->
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.textbox-filter.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/jplist-master/dist/js/jplist.filter-dropdown-bundle.min.js"></script>
	
<script src="<%=request.getContextPath()%>/resources/assets/js/portalHelper.js" type="text/javascript"></script>
<!-- Layer slider js -->  
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/js/layerslider_pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/demo.layerslider_slider.js" type="text/javascript"></script>
<script type="text/javascript">
var collectionData = '';
$(document).ready(function() {
	searchForCity();
	$("#search-box").keyup(function(){
		selectedCourse = '';
		if($(this).val().length>=2){
		if(collectionData==''){
			$("#loading").show();	
			$.ajax({
		type: "POST",
		url: "../fetchSuggestions",
		data:'searchText='+$(this).val(),
		beforeSend: function(){
			$("#search-box").css("background","#FFF  no-repeat 165px");
		},
		success: function(data){
			collectionData = data.courses;
			filterData(collectionData,$("#search-box").val().toUpperCase());
			$("#loading").hide();
			}
		
		});
		}
		filterData(collectionData,$("#search-box").val().toUpperCase());
		}else{
			$("#suggesstion-box").hide();
		}
		
	});
	
});
function searchForCity(){
	var selectedCourse = '${courseName}';
	if(selectedCourse!=null && selectedCourse!=''){
		$("#search-box").val(selectedCourse);
	}
	$("#search-box").keyup();
}

function filterData(collectionData,containsStr){
	$("#suggesstion-box").show();
	var htmlTxt = '';
	for(var k in collectionData){
		if(collectionData[k].courseName.toUpperCase().indexOf(containsStr)>=0){
		htmlTxt = htmlTxt + '<li onClick="selectCourse(this,\''+collectionData[k].courseIdentifier+'\');" value="'+collectionData[k].courseIdentifier+'">'+collectionData[k].courseName+'</li>';
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
	window.location.href = requestPath+'/courses/'+selectedCourse;
	}else{
		alert('No Courses Found at this time. please select from list of options from Search result.');
	}
}

function callforDemoOrCallBack(loggedIn,partner){
	if(confirm("You will start receiving notifications for all the batches from this trainer. Do you want to continue?")){
	if(loggedIn=='Y'){
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/performSubscription',
			data : {
					partnerId : partner
				},
			success : function(datas) {
				if(datas.status=='Y'){
				alert('You are subscribed to all Trainings for this Trainer/Institute.');
				}else{
					alert('You are Already Subsribed to this  Trainer/Institute.');
				}
			}
		});
	}else{
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=all-trainers";
		}
	}
	}
}

function openDetailsPage(loggedIn,partner,user){
		window.location.href = "<%=request.getContextPath()%>/trainers/"+user;
}

function openModel(loggedIn,id){
	if(loggedIn=='Y'){
		$("#"+id).show();
	}else{
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=all-trainers";
		}
	}
}
function closeModel(id){
		$("#"+id).hide();
}
</script>
<!-- jPList start -->
<!-- jQuery lib -->	