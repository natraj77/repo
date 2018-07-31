<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html class="no-js" lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.css"></link>
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/partners.css">
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<section class="divider-triangle half-block">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 col-md-5 col-md-offset-6" style="display:none;">
					<h2 class="ulockd-mrgn120 tac-smd">Why Choose Us?</h2>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-study text-thm2"></span></div>
						<div class="ib_details">
							<h4>70+ Awesome Courses</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis.</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-people-2 text-thm2"></span></div>
						<div class="ib_details">
							<h4>230+ Experienced Teacher</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt!</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-lab-microscope text-thm2"></span></div>
						<div class="ib_details">
							<h4>Modern Practical Lab</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum?</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-computer-class-room text-thm2"></span></div>
						<div class="ib_details">
							<h4>Beautiful Organized Classroom</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam.</p>
						</div>
					</div>
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-cogwheel text-thm2"></span></div>
						<div class="ib_details">
							<h4>Corporate Training</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum.</p>
						</div>
					</div> 
					<div class="icon_box text-left tac-smd">
						<div class="icon pull-left fn-smd"><span class="flaticon-cogwheel text-thm2"></span></div>
						<div class="ib_details">
							<h4>Online Training</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum.</p>
						</div>
					</div> 
				</div>
			</div>
		</div>
	</section> 
<section class="partners-bgimageblock">
	<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/sample/3.jpg');">
  <div class="container">
  	<div class="row">
    <div class="pagination-area">
     	<div class="col-lg-12">
     		<div class="col-lg-6">
     			<img src="<%=request.getContextPath()%>/resources/images/partners/no-image.jpg">
                   <div class="form-group">
                     <div class="parnerrate-wrapper">
                       <div class="rate" style="display:none;">
                         <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                         <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                         <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                         <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                         <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                       </div>
                     </div>
                   </div>
     		</div>
     		<div class="col-lg-6">
     			<div class="demos-tab">
     			${wallmsg}
     			</div>
     			<div class="parner-contactno">
     				${contactNo}
     			</div>
     		</div>
     	</div>
    </div>
    <div class="partner-address"><p><i class="fa fa-map-marker" aria-hidden="true"></i> 
    ${mainBranch.addressLine1} , ${mainBranch.addressLine2} , ${mainBranch.location} , ${mainBranch.city} ,${mainBranch.zipCode} <span>${websiteUrl} </span>| ${contactEmail}</p></div>
    </div>
  </div>  
</div> 
</section>
<%--  <aside class="section section-featured-page">
    <div class="container">
        <img class="alignleft" alt="About Us" src="<%=request.getContextPath()%>/resources/images/sample/page-4.jpg">
        <div class="featured-page-section">
            <h2 class="section-title">Who we are</h2>
            <h5>Don't take my word for it. Read the first few pages and see how this will change your life</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac lorem pretium, laoreet enim at, malesuada elit. </p>
            <ul>
                <li>Vivamus non nisl venenatis, tempor erat vitae.</li>
                <li>Lorem ipsum dolor sit consectetur adipiscing elit.</li>
                <li>Donec aliquam mattis ligula sit amet cursus mattis.</li>
                 <li>Donec aliquam mattis ligula sit amet cursus mattis.</li>
            </ul>
            <a href="#" class="btn btn-circle">Know More</a>
        </div><!-- .featured-page-section -->
    </div> <!-- .container -->
</aside>  --%>
	<section class="about-trainer">
		<div class="container">
			<div class="row">
				<p>
				${aboutUs}
				</p>
			</div>
		</div>
	</section>
	<section class="courseactions-section">
	<div class="container">
				<div class="row">
				
 <div class="col-lg-12 col-md-12 col-sm-12">
 <div class="col-lg-4 col-md-4 col-sm-12">
	<ul class="list-courseactions">
	    <li class="active"><a href="#branches" data-toggle="tab" aria-expanded="true">Branches</a></li>
		<li><a href="#courses" data-toggle="tab" aria-expanded="true">Courses</a></li>
		<li class=""><a href="#demos" data-toggle="tab" aria-expanded="false">Demos</a></li>
		<li class=""><a href="#batches" data-toggle="tab" aria-expanded="false">Upcoming Batches</a></li>
	</ul>
</div>
<div class="col-lg-8 col-md-8 col-sm-12">
	<div class="tab-content">
		<!-- Courses TAB -->
		<div class="tab-pane fade active in" id="branches">
			<ul class="partner-courseslist">
				<c:forEach items="${branchList}" var="branch">
			    	<li>${branch.addressLine1} , ${branch.addressLine2} , ${branch.location} , ${branch.city} ,${branch.zipCode}</li>
				</c:forEach>
			</ul>
		</div>
		<div class="tab-pane fade" id="courses">
			<ul class="partner-courseslist">
    			<c:forEach items="${coursesList}" var="course">
			       <li>${course.courseName} <span> ${course.addCourseInfo} </span> <span onclick="getSubscription('${course.id}','${userId}','${userLoggedIn}','${user}');">Subscribe</span></li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="tab-pane fade table-responsive" id="demos" >
			<table class="table table-bordered table-hover table-responsive text-center demolist-table">
				<thead>
					<tr>
						<th>Course</th>
						<th>Date</th>
						<th>Time</th>
						<th>Faculty</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${demoList}" var="course">
			       <tr>
			       <td>${course.courseName}</td><td>${course.startDate}</td>
			        <td>${course.hourOfDay}</td><td>${course.facultyName}</td>
			       <td><span onclick="getDemoSubs('${course.id}',${course.courseId},'${userLoggedIn}','${user}');">Enroll</span></td>
			       </tr>
				   </c:forEach>
				</tbody>
			</table>
		</div>
		<!-- demos TAB End-->
		<!-- Batches TAB -->
		<div class="tab-pane fade table-responsive" id="batches" >
			<table class="table table-bordered table-hover table-responsive text-center batchlist-table">
				<thead>
					<tr>
						<th>Course</th>
						<th>Date</th>
						<th>Time</th>
						<th>Faculty</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${batchList}" var="course">
			       <tr>
			       <td>${course.courseName}</td><td>${course.startDate}</td>
			        <td>${course.hourOfDay}</td><td>${course.facultyName}</td>
			        <td><span onclick="getbatchSubscription('${course.id}',${course.courseId},'${userLoggedIn}','${user}');">Enroll</span></td>
			       </tr>
				   </c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Batches TAB End-->
	</div>
</div>
</div>  
</div>
</div>    
</section>    
	<div class="page-section" style="display:none;">
			<div class="container">
				<div class="row">
					<div class="l-events">
						<div class="heading-area">
							<h3>EVENTS</h3>
							<p>The others comfortable these days are all happy and free listen to a story </p>
						</div>
						<div id="carousel-example-generic221" class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<div class="row">
										<div class="col-sm-6 col-xs-12 l-column">
											<img src="<%=request.getContextPath()%>/resources/images/sample/img-66.jpg" alt="image" width="570" height="260">

										</div>

										<div class="col-sm-6 col-xs-12 l-column">

										<span class="count">01</span>

										<span class="date">AUGUST 24, 2016</span>

										<strong>SEMINAR ABOUT ADVANCED CORROSION</strong>

										<p>The pie and we know flipper lives in a world full of wonder under the clouds away full of wonder under the clouds away never thought could feel so free.</p>

										<a href="#">view details</a>

									</div>

									</div>

									<div class="row align-right">

										<div class="col-sm-6 col-xs-12 l-column pull-right">

											<img src="<%=request.getContextPath()%>/resources/images/sample/img-67.jpg" alt="image" width="570" height="260">

										</div>

										<div class="col-sm-6 col-xs-12 l-column">

											<span class="count">02</span>

											<span class="date">AUGUST 24, 2016</span>

											<strong>SEMINAR ABOUT ADVANCED CORROSION</strong>

											<p>The pie and we know flipper lives in a world full of wonder under the clouds away full of wonder under the clouds away never thought could feel so free.</p>

											<a href="#">view details</a>

										</div>

									</div>

								</div>

								<div class="item">

									<div class="row">

										<div class="col-sm-6 col-xs-12 l-column">

											<img src="<%=request.getContextPath()%>/resources/images/sample/img-66.jpg" alt="image" width="570" height="260">

										</div>

										<div class="col-sm-6 col-xs-12 l-column">

										<span class="count">03</span>

										<span class="date">AUGUST 24, 2016</span>

										<strong>SEMINAR ABOUT ADVANCED CORROSION</strong>

										<p>The pie and we know flipper lives in a world full of wonder under the clouds away full of wonder under the clouds away never thought could feel so free.</p>

										<a href="#">view details</a>

									</div>

								</div>

									<div class="row align-right">

										<div class="col-sm-6 col-xs-12 l-column pull-right">

											<img src="<%=request.getContextPath()%>/resources/images/sample/img-67.jpg" alt="image" width="570" height="260">

										</div>

										<div class="col-sm-6 col-xs-12 l-column">

											<span class="count">04</span>

											<span class="date">AUGUST 24, 2016</span>

											<strong>SEMINAR ABOUT ADVANCED CORROSION</strong>

											<p>The pie and we know flipper lives in a world full of wonder under the clouds away full of wonder under the clouds away never thought could feel so free.</p>

											<a href="#">view details</a>

										</div>

									</div>

								</div>

								<div class="item">

									<div class="row">

										<div class="col-sm-6 col-xs-12 l-column">

											<img src="<%=request.getContextPath()%>/resources/images/sample/img-66.jpg" alt="image" width="570" height="260">

										</div>

										<div class="col-sm-6 col-xs-12 l-column">

										<span class="count">05</span>

										<span class="date">AUGUST 24, 2016</span>

										<strong>SEMINAR ABOUT ADVANCED CORROSION</strong>

										<p>The pie and we know flipper lives in a world full of wonder under the clouds away full of wonder under the clouds away never thought could feel so free.</p>

										<a href="#">view details</a>

									</div>

								</div>

									<div class="row align-right">

										<div class="col-sm-6 col-xs-12 l-column pull-right">

											<img src="<%=request.getContextPath()%>/resources/images/sample/img-67.jpg" alt="image" width="570" height="260">

										</div>

										<div class="col-sm-6 col-xs-12 l-column">

											<span class="count">06</span>

											<span class="date">AUGUST 24, 2016</span>

											<strong>SEMINAR ABOUT ADVANCED CORROSION</strong>

											<p>The pie and we know flipper lives in a world full of wonder under the clouds away full of wonder under the clouds away never thought could feel so free.</p>

											<a href="#">view details</a>

										</div>

									</div>

								</div>

							<!-- Controls -->

							

							</div>

						</div>

						<div class="control-box">

								<a class="left carousel-control" href="#carousel-example-generic221" role="button" data-slide="prev">

									<span><i aria-hidden="true" class="fa fa-angle-left"></i></span>

									<span class="sr-only">Previous</span>

								</a>

								<a class="right carousel-control" href="#carousel-example-generic221" role="button" data-slide="next">

									<span><i aria-hidden="true" class="fa fa-angle-right"></i></span>

									<span class="sr-only">Next</span>

								</a>

							</div>

					</div>

				</div>

			</div>

		</div>
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
<script type="text/javascript">
function getSubscription(course,userid,loggedIn,user){
		if(loggedIn=='Y'){
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/performSubscription',
				data : {
						partnerId : userid,
						courseId : course
					},
				success : function(datas) {
					if(datas.status=='Y'){
						alert('You are subscribed to the Course for this Trainer/Institute.');
					}else{
						alert('You are Already Subscribed for this Course with this Trainer/Institute.');
					}
					
				}
			});
		}else{
			
			if (window.confirm("Please Login to Continue with Request")) { 
				window.location.href = "<%=request.getContextPath()%>/Login?callback=trainerdetails/"+user;
			}
		}
	
}

function getDemoSubs(demoId,courseId,loggedIn,user){
	if(loggedIn=='Y'){
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/performDemoSubscription',
			data : {
				    demoId : demoId,
				    courseId : courseId
				},
			success : function(datas) {
				if(datas.status=='Y'){
					alert('You are subscribed to the Demo for this Trainer/Institute.');
				}else{
					alert('You are Already Subscribed for this Course with this Trainer/Institute.');
				}
				
			}
		});
	}else{
		
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=trainers/"+user;
		}
	}
}

function getbatchSubscription(batchId,courseId,loggedIn,user){
	if(loggedIn=='Y'){
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/performBatchSubscription',
			data : {
				    batchId : batchId,
				    courseId : courseId
				},
			success : function(datas) {
				if(datas.status=='Y'){
					alert('You are subscribed to the Batch for this Trainer/Institute.');
				}else{
					alert('You are Already Subscribed for this Batch with this Trainer/Institute.');
				}
				
			}
		});
	}else{
		
		if (window.confirm("Please Login to Continue with Request")) { 
			window.location.href = "<%=request.getContextPath()%>/Login?callback=trainers/"+user;
		}
	}
}

</script>
</html>

