<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Jobs</title>
   <meta name="description" content="jobs">
    <meta name="keywords" content="jobs">
	<meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <link href="<%=request.getContextPath()%>/resources/css/jobs.css" rel="stylesheet">
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/jobs/job-banner.jpg');">
  <div class="container">
    <div class="pagination-area jobsearch-area">
      <h2>Find the Jobs</h2>
      <div class="col-lg-12">
      		<div class="col-lg-4 padding-lt0">
      			 <input type="text" class="form-control" placeholder="Job Title, Keywords or Company">
      		</div>
      		<div class="col-lg-3 padding-lt0">
      			 <input type="text" class="form-control" placeholder="Location">
      		</div>
      		<div class="col-lg-2 padding-lt0">
      			 <input type="text" class="form-control"  placeholder="Experience">
      		</div>
      		<div class="col-lg-2 padding-lt0">
      			 <input type="text" class="form-control"  placeholder="Job Type">
      		</div>
      		<div class="col-lg-1 padding-lt0">
      			  <button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
      		</div>
      		</div>
    </div>
  </div>  
</div>
<section class="alljobs-sections">
	<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<h3 class="filters-hd">Filters</h3>
			<div class="col-lg-3">
			<div class="jobfilter-section">
			<a class="accordion" href="javascript:void(0);">Filter By Job Type</a>
            	<div class="panel show">	
		            	<ul>
			            	<li><input type="checkbox">Full - Time <span>(23)</span></li>
						<li><input type="checkbox">Part - Time <span>(93)</span></li>
						<li><input type="checkbox">Internship <span>(24)</span></li>
						<li><input type="checkbox">Contract <span>(28)</span></li>
					   </ul>
					   <a href="#">show more</a>
				</div>
				</div>
				<div class="jobfilter-section">
				<a class="accordion" href="javascript:void(0);">Filter By Location</a>
            	<div class="panel show">	
		            	<ul>
			            	<li><input type="checkbox">Hyderabad<span>(23)</span></li>
						<li><input type="checkbox">Banglore <span>(93)</span></li>
						<li><input type="checkbox">Delhi <span>(24)</span></li>
						<li><input type="checkbox">Mumbai <span>(28)</span></li>
					   </ul>
					   <a href="#">show more</a>
				</div>
				</div>
				<div class="jobfilter-section">
				<a class="accordion" href="javascript:void(0);">Filter By Job Title</a>
            	<div class="panel show">	
		            	<ul>
			            	<li><input type="checkbox">Graphic Designer<span>(23)</span></li>
						<li><input type="checkbox">Web Designer<span>(93)</span></li>
						<li><input type="checkbox">Web Developer <span>(24)</span></li>
						<li><input type="checkbox">Java Developer <span>(28)</span></li>
					   </ul>
					   <a href="#">show more</a>
				</div>
				</div>
				<div class="jobfilter-section">
				<a class="accordion" href="javascript:void(0);">Filter By Experience Level</a>
            	<div class="panel show">	
		            	<ul>
			            	<li><input type="checkbox">0 - 1 year <span>(23)</span></li>
						<li><input type="checkbox">2- 3 years<span>(93)</span></li>
						<li><input type="checkbox">4-5 Years <span>(24)</span></li>
						<li><input type="checkbox">6-7 Years <span>(28)</span></li>
					   </ul>
					   <a href="#">show more</a>
				</div>
				</div>
				<div class="jobfilter-section">
				<a class="accordion active" href="javascript:void(0);">Filter By Posting Period</a>
            	<div class="panel show-in">	
		            	<ul>
			            	<li><input type="checkbox">1 Week Before </li>
						<li><input type="checkbox">1 Month Before </li>
						<li><input type="checkbox">6 Months Before </li>
						<li><input type="checkbox">1 year Before </li>
					   </ul>
					   <a href="#">show more</a>
				</div>
				</div>
				<div class="jobfilter-section">
				<a class="accordion active" href="javascript:void(0);">Filter By Salary</a>
            	<div class="panel show-in">	
		            	<ul>
			            	<li><input type="checkbox">0 - 1LPA</li>
						<li><input type="checkbox">2 - 3 LPA</li>
						<li><input type="checkbox">3 - 4 LPA </li>
						<li><input type="checkbox">5 - 6 LPA</li>
						<li><input type="checkbox">7 - 8 LPA</li>
						<li><input type="checkbox">9 - 10 LPA</li>
					   </ul>
					   <a href="#">show more</a>
				</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="single-job">
					<div class="row">
						<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding"><h2>Senior Project Manager</h2></div>
						<div class="col-lg-4">
						<div class="posting"><strong>Posted on :</strong> Dec 12 2017</div>
						</div>
					</div>
					</div>
					<h3>Aliens Developer Private Limited</h3>
					<p class="job-exp">3 - 6 yrs</p>
					<p>3.00 Lac - 5.00 Lac / Annual</p>
					<p>Summery:</p>
					<p class="job-summery">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
					Lorem Ipsum has been the industry's standard dummy 
					<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding">
							<div class="job-location">
								<p>Hyderabad | india</p>
							</div>
							
						</div>
						<div class="col-lg-4">
							<div class="jobviewBtn">
								<a href="<%=request.getContextPath()%>/jobdetails">View & Apply</a>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="single-job">
					<div class="row">
						<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding"><h2>Senior Project Manager</h2></div>
						<div class="col-lg-4">
						<div class="posting"><strong>Posted on :</strong> Dec 12 2017</div>
						</div>
					</div>
					</div>
					<h3>Aliens Developer Private Limited</h3>
					<p class="job-exp">3 - 6 yrs</p>
					<p>3.00 Lac - 5.00 Lac / Annual</p>
					<p>Summery:</p>
					<p class="job-summery">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
					Lorem Ipsum has been the industry's standard dummy 
					<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding">
							<div class="job-location">
								<p>Hyderabad | india</p>
							</div>
							
						</div>
						<div class="col-lg-4">
							<div class="jobviewBtn">
								<a href="#">View & Apply</a>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="single-job">
					<div class="row">
						<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding"><h2>Senior Project Manager</h2></div>
						<div class="col-lg-4">
						<div class="posting"><strong>Posted on :</strong> Dec 12 2017</div>
						</div>
					</div>
					</div>
					<h3>Aliens Developer Private Limited</h3>
					<p class="job-exp">3 - 6 yrs</p>
					<p>3.00 Lac - 5.00 Lac / Annual</p>
					<p>Summery:</p>
					<p class="job-summery">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
					Lorem Ipsum has been the industry's standard dummy 
					<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding">
							<div class="job-location">
								<p>Hyderabad | india</p>
							</div>
							
						</div>
						<div class="col-lg-4">
							<div class="jobviewBtn">
								<a href="#">View & Apply</a>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="single-job">
					<div class="row">
						<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding"><h2>Senior Project Manager</h2></div>
						<div class="col-lg-4">
						<div class="posting"><strong>Posted on :</strong> Dec 12 2017</div>
						</div>
					</div>
					</div>
					<h3>Aliens Developer Private Limited</h3>
					<p class="job-exp">3 - 6 yrs</p>
					<p>3.00 Lac - 5.00 Lac / Annual</p>
					<p>Summery:</p>
					<p class="job-summery">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
					Lorem Ipsum has been the industry's standard dummy 
					<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-8 row-nopadding">
							<div class="job-location">
								<p>Hyderabad | india</p>
							</div>
							
						</div>
						<div class="col-lg-4">
							<div class="jobviewBtn">
								<a href="#">View & Apply</a>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="featured-employers">
					<h3>Featured Employers</h3>
				<ul>
					<li>
						<a href="#">
							<img src="<%=request.getContextPath()%>/resources/images/jobs/polyglot.png"> <span>Polyglot IT Solutions</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="<%=request.getContextPath()%>/resources/images/jobs/polyglot.png"> <span>Polyglot IT Solutions</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="<%=request.getContextPath()%>/resources/images/jobs/polyglot.png"> <span>Polyglot IT Solutions</span>
						</a>
					</li>
				</ul>
				<a href="#">show more</a>
				</div>
				<div class="skill-set">
					<h2>Assess your skill set</h2>
					<ul>
						<li>Amazon Web Services</li>
						<li>DevOps</li>
						<li>Redhat Linux</li>
						<li>Python</li>
						<li>Java</li>
						<li>Digital Marketing</li>
						<li>Web Development</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script>
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show-in");
        this.nextElementSibling.classList.toggle("show");
  }
}
</script>
</body>
</html>
<!--  Include Footer  -->