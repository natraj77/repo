<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="iso-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Find leading courses, trainers and reviews | Tadaay</title>
    <meta name="description" content="Discovering has never been so simple. Find courses, trainers or training institutes, and reviews, students looking for course,reviews in a one go.">
    <meta name="keywords" content="find trainers, find leading IT courses, find reviews, find students">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/home.css">
    <%@ include file='/static/header-include.jsp'%>
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script type="application/ld+json">
{
  "@context" : "http://schema.org",
  "@type" : "LocalBusiness",
  "name" : "Tadaay",
  "image" : "https://www.tadaay.com/resources/images/logo.png",
  "telephone" : "77029 60470",
  "email" : "info@tadaay.com",
  "address" : {
    "@type" : "PostalAddress",
    "addressLocality" : "Hyderabad",
    "addressRegion" : "Telangana",
    "addressCountry" : "India",
    "postalCode" : "500016"
  },
  "openingHoursSpecification" : {
    "@type" : "OpeningHoursSpecification",
    "opens" : "09:00",
    "closes" : "18:00"
  },
  "url" : "https://www.tadaay.com/",
  "aggregateRating" : {
    "@type" : "AggregateRating",
    "ratingValue" : "4.5",
    "bestRating" : "5",
    "ratingCount" : "124"
  }
}
</script>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<!-- Slider 1 Area Start Here -->               
 <section class="divider-triangle half-block">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 col-md-5 col-md-offset-6">
					<h1 class="ulockd-mrgn120 tac-smd">Why Tadaay ?</h1>
<!-- 					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-study text-thm2"></span></div>
						<div class="ib_details">
							<h4>70+ Awesome Courses</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis.</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-people-2 text-thm2"></span></div>
						<div class="ib_details">
							<h4>230+ Experienced Trainers</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt!</p>
						</div>
					</div> -->
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-lab-microscope text-thm2"></span></div>
						<div class="ib_details">
							<h4><span id="coursecnt"></span> Software Courses</h4>
							<p>Find the leading courses in the IT industry including the recommended course content for all the courses.</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-computer-class-room text-thm2"></span></div>
						<div class="ib_details">
							<h4><span id="trainercnt"></span> Training Institutes</h4>
							<p>Find trainers and the upcoming batch schedule information at your finger tips. You can also request course content and demo information online.</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-cogwheel text-thm2"></span></div>
						<div class="ib_details">
							<h4><span id="trainercnt"></span> Freelance / Corporate Trainers</h4>
							<p>Do you want to upgrade your team skills ? Find freelance or coroporate trainers in your city and reach out to them.</p>
						</div>
					</div> 
					<!-- <div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-online text-thm2"></span></div>
						<div class="ib_details">
							<h4>Online courses</h4>
							<p>Learn any courses online from the videos published from our partners or you can enroll for live sessions.</p>
						</div>
					</div> 
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-books text-thm2"></span></div>
						<div class="ib_details">
							<h4>Online tutorials</h4>
							<p>Learn any courses online from the videos published from our partners or you can enroll for live sessions.</p>
						</div>
					</div>  -->
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-students text-thm2"></span></div>
						<div class="ib_details">
							<h4><span id="studentscnt"></span>  Students Registered</h4>
							<p>Join today and get additional discounts on the course fee from our partners.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> 
<!-- Service 2 Area Start Here -->
<div class="service2-area"> 
    <div class="search-area">
        <div class="container">
            <div class="row search-inner">
                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                    <div class="search-title">
                        <span><i class="fa fa-search" aria-hidden="true"></i> Search Course</span>
                    </div>
                </div>
                 <div class="col-lg-10 col-md-1o col-sm-12 col-xs-12">
                    <div class="search-input" id="searchfield">
                        <form style="position:relative;">
                            <input type="text" size="100" style="text-transform: uppercase"  class="search-form" placeholder="Course Keywords . . ." id="search-box" autocomplete="off"/> 
                        </form>
                        <div class="search-submit">
		                        <a href="#" class="join-now-btn" onclick="checkSelectedCourse();"><i class="fa fa-search" aria-hidden="true"></i></a>
		                    </div> 
                    </div>
                    <div id="suggesstion-box"></div>
                </div>
            </div>
        </div>
    </div>
    <section class="home2-panels">
    	<div class="container">
				<div class="row">
					<div class="col-sm-6 col-lg-6 col-md-6">
						<div class="col-sm-3 col-lg-3 col-md-3">
							<img class="alignnone" alt="" src="https://demo.themex.co/academy/wp-content/uploads/2013/02/image_1.jpg">
						</div>
						<div class="col-sm-8 col-lg-8 col-md-8">
						<h2>Training Institutes</h2>
						<p>We will help you unleash the tech guru inside you on a great online platform. </p>
						</div>
					</div>
					<div class="col-sm-6 col-lg-6 col-md-6">
						<div class="col-sm-3 col-lg-3 col-md-3">
							<img class="alignnone" alt="" src="https://demo.themex.co/academy/wp-content/uploads/2013/02/image_1.jpg">
						</div>
						<div class="col-sm-8 col-lg-8 col-md-8">
						<h2>Corporate Trainers</h2>
						<p>We will help you unleash the tech guru inside you on a great online platform. </p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-lg-6 col-md-6">
						<div class="col-sm-3 col-lg-3 col-md-3">
							<img class="alignnone" alt="" src="https://demo.themex.co/academy/wp-content/uploads/2013/02/image_1.jpg">
						</div>
						<div class="col-sm-8 col-lg-8 col-md-8">
						<h2>Students</h2>
						<p>We will help you unleash the tech guru inside you on a great online platform. </p>
						</div>
					</div>
					<div class="col-sm-6 col-lg-6 col-md-6">
						<div class="col-sm-3 col-lg-3 col-md-3">
							<img class="alignnone" alt="" src="https://demo.themex.co/academy/wp-content/uploads/2013/02/image_1.jpg">
						</div>
						<div class="col-sm-8 col-lg-8 col-md-8">
						<h2>Recruiters</h2>
						<p>We will help you unleash the tech guru inside you on a great online platform. </p>
						</div>
					</div>
				</div>
				<div>
					<div class="ibox float-e-margins">
                                <div class="ibox-content ibox-heading">
                                    <h3>Flow</h3>
                                </div>
                                <div class="ibox-content inspinia-timeline">
                                    <div class="timeline-item">
                                        <div class="row">
	                                         <div class="timeline-item col-lg-4">
	                                         	<div class="row">
	                                         		 <div class="content no-top-border">
	                                                <p class="m-b-xs"><strong>Meeting</strong></p>
	                                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
	                                                    sale.</p>
	                                            </div>
	                                             <div class="date">
	                                                <i class="fa fa-briefcase"></i>
	                                                6:00 am
	                                                <br>
	                                                <small class="text-navy">2 hour ago</small>
	                                            </div>
	                                         	</div>
	                                        </div>
	                                         <div class="timeline-item col-lg-4">
	                                          <div class="row">
	                                         		 <div class="content no-top-border">
	                                                <p class="m-b-xs"><strong>Meeting</strong></p>
	                                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
	                                                    sale.</p>
	                                            </div>
	                                             <div class="date">
	                                                <i class="fa fa-briefcase"></i>
	                                                6:00 am
	                                                <br>
	                                                <small class="text-navy">2 hour ago</small>
	                                            </div>
	                                         	</div>
	                                        </div>
	                                         <div class="timeline-item col-lg-4">
	                                            <div class="row">
	                                         		 <div class="content no-top-border">
	                                                <p class="m-b-xs"><strong>Meeting</strong></p>
	                                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
	                                                    sale.</p>
	                                            </div>
	                                             <div class="date">
	                                                <i class="fa fa-briefcase"></i>
	                                                6:00 am
	                                                <br>
	                                                <small class="text-navy">2 hour ago</small>
	                                            </div>
	                                         	</div>
	                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
				</div>
		</div>
    </section>
   <!--  <section class="divider-half bgc-snowshade">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-5">
				<h2 class="ulockd-mrgn120">It will Helpfull for</h2>
                	<div class="faq-content ulockd-mrgn1230">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	                        <div class="panel panel-default">
		                        <div class="panel-heading" role="tab" id="headingOne">
		                            <h4 class="panel-title">
		                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="collapsed">
			                            	<i class="fa fa-minus minus" aria-hidden="true"></i>
			                            	<i class="fa fa-plus plus" aria-hidden="true"></i>
		                              		For Trainers
		                                </a>
		                            </h4>
		                        </div>
		                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">
		                            <div class="panel-body">
		                            	<p>The trainers or training institutes can leverage our lead management platform to find the students looking for training. It helps you to publish your branches, demos information and upcoming batch information to reach the audience quickly. Our powerful task management platform helps you to push quizzes or tasks to your students to help them build their career strong.</p>
		                            </div>
		                        </div>
	                        </div>
	                        <div class="panel panel-default">
		                        <div class="panel-heading" role="tab" id="headingTwo">
		                            <h4 class="panel-title">
		                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			                               <i class="fa fa-minus minus" aria-hidden="true"></i>
			                            	<i class="fa fa-plus plus" aria-hidden="true"></i>
		                                	For Students
		                               	</a>
		                            </h4>
		                        </div>
		                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
		                            <div class="panel-body">
		                            	<p>A unique platform which assist students and job aspirants to
								provide in depth information of all the leading IT courses	find trainers and their reviews. provides the complete career guidance to learn the technology either from classroom or from online sessions or documentation. 
								It also assist you to assess yourself by taking quiz on any technology under the sun & we ensure to keep quiz/assessment as standard as possible.</p>
		                            </div>
		                        </div>
	                        </div>
	                        <div class="panel panel-default">
		                        <div class="panel-heading" role="tab" id="headingThree">
		                            <h4 class="panel-title">
			                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					                        <i class="fa fa-minus minus" aria-hidden="true"></i>
			                            	<i class="fa fa-plus plus" aria-hidden="true"></i>
			                                For Recruiters
			                            </a>
		                            </h4>
		                        </div>
		                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree" aria-expanded="false" style="height: 0px;">
		                            <div class="panel-body">
		                              <p>Student transport is the transporting of children and teenagers to and from schools and school events. School transport can be undertaken by school students themselves (on foot, bicycle or perhaps horseback; or for older students, by car), they may be accompanied by family members or caregivers, or the transport may be organised collectively, using buses or taxis.</p>
		                            </div>
		                        </div>
	                        </div>
	                        <div class="panel panel-default">
		                        <div class="panel-heading" role="tab" id="headingFour">
		                            <h4 class="panel-title">
			                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					                      <i class="fa fa-minus minus" aria-hidden="true"></i>
			                            	<i class="fa fa-plus plus" aria-hidden="true"></i>
			                                For Institutes
			                            </a>
		                            </h4>
		                        </div>
		                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour" aria-expanded="false" style="height: 0px;">
		                            <div class="panel-body">
		                              <p>A library is a collection of sources of information and similar resources, made accessible to a defined community for reference or borrowing.It provides physical or digital access to material, and may be a physical building or room, or a virtual space, or both.A library's collection can include books, periodicals, newspapers, manuscripts, films, maps, prints, documents, microform, CDs, cassettes, videotapes, DVDs, Blu-ray Discs, e-books, audiobooks, databases, and other formats. Libraries range in size from a few shelves of books to several million items. </p>
		                            </div>
		                        </div>
	                        </div>
	                        <div class="panel panel-default">
		                        <div class="panel-heading" role="tab" id="headingFive">
		                            <h4 class="panel-title">
			                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					                        <i class="fa fa-minus icon-1"></i>
					                        <i class="fa fa-plus icon-2"></i>
			                                iQra Student Hostels?
			                            </a>
		                            </h4>
		                        </div>
		                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive" aria-expanded="false" style="height: 0px;">
		                            <div class="panel-body">
		                              <p>Hostels provide budget-oriented, sociable accommodation where guests can rent a bed, usually a bunk bed, in a dormitory and share a bathroom, lounge and sometimes a kitchen. Rooms can be mixed or single-sex, and private rooms may also be available.Hostels are often cheaper for both the operator and occupants; many hostels have long-term residents whom they employ as desk agents or housekeeping staff in exchange for experience or discounted accommodation.</p>
		                            </div>
		                        </div>
	                        </div>
                        </div>
                	</div>
				</div>
			</div>
		</div>
	</section> -->
    </div>
    <section class="sign-upBox">
        	<img src="<%=request.getContextPath()%>/resources/images/sign-upBg.jpg" alt="">
            <div class="sign-upText">
            	<h3><span>Like what you are learning</span>Get Started Today!</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and type setting industry lorem Ipsum has been the industry's standard dummy </p>
                <div class="sign-btn">
                	<a href="<%=request.getContextPath()%>/signup/student">Sign Up</a>
                </div>
            </div>
    </section>
 <!-- Service 2 Area End Here -->
<!-- Featured Area Start Here -->
<div class="courses2-area bg-common-style">
    <div class="container">    
        <h2 class="title-default-left" style="text-align:center;">Featured Courses</h2> 
    </div>
    <div class="container courses-list-wrapper" id="tadaay-courses">    
       <div class="row courses-wrapper courses-list" id="coursesData">
      </div> 
        <div class="view-all-btn-area">
            <a href="<%=request.getContextPath()%>/all-courses" class="view-all-accent-btn">View All Courses</a>
        </div> 
    </div>  
</div> 
<!-- News and Event Area End Here -->
<!-- Brand Area Start Here -->
<div class="brand-area" style="background: linear-gradient(rgb(22, 160, 133) 0%, rgb(244, 208, 63) 100%);">
    <div class="container">    
        <h2 class="title-default-left" style="text-align:center;">Premium Partners</h2>
        <div class="rc-carousel"
             data-loop="true"
             data-items="4"
             data-margin="30"
             data-autoplay="true"
             data-autoplay-timeout="5000"
             data-smart-speed="2000"
             data-dots="false"
             data-nav="false"
             data-nav-speed="false"
             data-r-x-small="2"
             data-r-x-small-nav="false"
             data-r-x-small-dots="false"
             data-r-x-medium="3"
             data-r-x-medium-nav="false"
             data-r-x-medium-dots="false"
             data-r-small="4"
             data-r-small-nav="false"
             data-r-small-dots="false"
             data-r-medium="4"
             data-r-medium-nav="false"
             data-r-medium-dots="false"
             data-r-large="4"
             data-r-large-nav="false"
             data-r-large-dots="false"> 
            <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>
           <!-- <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>
            <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>
            <div class="brand-area-box">
                <a href="<%=request.getContextPath()%>/partners"><img src="<%=request.getContextPath()%>/resources/images/partners/polyglot.png" alt="Polyglot"></a>
            </div>-->
        </div> 
    </div>  
</div>  
<!-- Brand Area End Here -->
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/js/layerslider_pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/demo.layerslider_slider.js" type="text/javascript"></script>
<script type="text/javascript">
var collectionData = '';
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : 'getFeaturedCourses',
		mimeType : 'application/json',
		success : function(data) {
			var srcture = '';
			var finalString = '';
			var temp = 0;
			//var a = $('#coursecnt').data('myval'); //getter

			 $('#coursecnt').text(data.coursesCount);
			 $("#trainercnt").text(data.trainerCount+'');
			 $('#leadscnt').text(data.leadsCnt);
			 $("#studentscnt").text(data.studentsCnt+'');
			for(var k in data.AllCoursesData){
				var obj  = new Object();
				obj.value= k;
				obj.data = data.AllCoursesData[k];
				//finalString = finalString + '{value:"'+k+'",data:"'+data.AllCoursesData[k]+'"}';
				collectionData[temp] = obj
				temp++;
			}
			//if(finalString!=''){
			//	finalString = '['+finalString.substring(0, finalString.length-1)+']';
			//	collectionData = eval(finalString); 
			//}
		if(data!=null && data.featuredCoursesInfo!=null){	
			for(var i = 0; i < data.featuredCoursesInfo.length; i++) {
				var key = data.featuredCoursesInfo[i];
				var requestPath = '<%=request.getContextPath()%>';
				var reqText = requestPath+'/courses/'+key.courseIdentifier;
				srcture = srcture+'<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">'+
				'<div class="course-box">'+
					'<div class="course-icon">'+
						'<a href="'+reqText+'"><img class="img-responsive" src="'+requestPath+key.imagePath+'" alt="" title=""></a>'+
					'</div>'+
					'<div class="course-content desc">'+
						'<h4 class="title '+key.subCategory+'"><a href="'+reqText+'">'+key.courseName+'</a></h4>'+
						'<div class="courseprice-datesec">'+
							'<div class="learnerdatesec">'+
							 	'<span class="learnerscount">'+key.field+'</span>'+
								 '<span class="no-jobs">'+
								 	'<span>'+key.category+'</span> '+
								'</span>'+
							'</div>'+
						'</div>'+
						'<span class="avg-salary like">'+
							'<span>Level :  </span>'+
							'<span class="'+key.level+'">'+key.level+'</span>'+
						'</span>'+
						'<div class="ep-course-meta theme">'+
							'<a href="'+reqText+'" class="button btn btn-primary btn-lg">'+
										'View'+					
							'</a>'+		
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'
			}
		}
			if(srcture!=''){
				$("#featuredCourses").show();
				$("#coursesData").html(srcture);
				$("#coursesData").show();
			}else{
				$("#featuredCourses").hide();
				$("#coursesData").html('');
				$("#coursesData").hide();
			}
			
			
		}
	});	
	
	$("#search-box").keyup(function(){
		selectedCourse = '';
		if($(this).val().length>=2){
		if(collectionData==''){
		$.ajax({
		type: "POST",
		url: "fetchSuggestions",
		data:'searchText='+$(this).val(),
		beforeSend: function(){
			$("#search-box").css("background","#FFF  no-repeat 165px");
		},
		success: function(data){
			collectionData = data.courses;
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
</script>
</body>
</html>
<!--  Include Footer  -->