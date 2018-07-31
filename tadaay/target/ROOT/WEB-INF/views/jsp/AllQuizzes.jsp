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
    <!-- Switch Style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hover-min.css">
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/partners.jpg');">
  <div class="container">
    <div class="pagination-area">
      <h2>About us</h2>
      <ul>
        <li><a href="<%=request.getContextPath()%>">Home</a> -</li>
        <li>About</li>
      </ul>
    </div>
  </div>  
</div>
<!-- Inner Page Banner Area End Here -->
<!-- Courses Page 2 Area Start Here -->  
<div class="courses-page-area2">
  <div class="container" id="inner-isotope">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="isotop-classes-tab isotop-btn"> 
          <a href="#" data-filter="*" class="current">All</a>
          <a href="#" data-filter=".basic">Basic</a>
          <a href="#" data-filter=".intermediate">Intermediate</a>
          <a href="#" data-filter=".advanced">Advanced</a>
        </div>
      </div>
    </div>
    <div class="row featuredContainer">
    
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 basic">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="<%=request.getContextPath()%>/AssignedQuizTerms"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="<%=request.getContextPath()%>/AssignedQuizTerms">Basic Python</a></h3>
              <p class="item-content">Getting Started, Introduction, Datatype and Variables, String, Control Flow.</p>
              <ul class="courses-info">
                <li>Level<br><span> Basic</span></li>
                <li>Duration<br><span> 90 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 basic">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="<%=request.getContextPath()%>/AssignedQuizTerms"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="<%=request.getContextPath()%>/AssignedQuizTerms">Function and Data Structure</a></h3>
              <p class="item-content">Functions, List Data Structure, Tuples, sets, Dictionaries.</p>
              <ul class="courses-info">
                <li>Level<br><span> Basic</span></li>
                <li>Duration<br><span> 90 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 intermediate">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="start-quize.php"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="start-quize.php"> I/O and Error Handling </a></h3>
              <p class="item-content">Input and Output, File handling, Error and Exceptions.</p>
              <ul class="courses-info">
               <li>Level<br><span> Intermediate</span></li>
                <li>Duration<br><span> 60 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 advanced">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="start-quize.php"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="start-quize.php">Packages and Modules</a></h3>
              <p class="item-content">Module, Standard Modules, Packages.</p>
              <ul class="courses-info">
                <li>Level<br><span> Advanced</span></li>
                <li>Duration<br><span> 30 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>  
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 intermediate">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
             <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="start-quize.php"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="start-quize.php">OOPS Concept </a></h3>
              <p class="item-content">Class Concept, Inheritance, Data Encapsulation, Constructor and Destructor</p>
              <ul class="courses-info">
                <li>Level<br><span> Intermediate</span></li>
                <li>Duration<br><span> 60 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 advanced">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
             <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="start-quize.php"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="start-quize.php">Packages and Modules</a></h3>
              <p class="item-content">Module, Standard Modules, Packages.</p>
              <ul class="courses-info">
                <li>Level<br><span> Advanced</span></li>
                <li>Duration<br><span> 30 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>    
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 intermediate">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
             <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="start-quize.php"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="start-quize.php">OOPS Concept </a></h3>
              <p class="item-content">Class Concept, Inheritance, Data Encapsulation, Constructor and Destructor</p>
              <ul class="courses-info">
               <li>Level<br><span> Intermediate</span></li>
                <li>Duration<br><span> 60 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>
      
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 basic">
        <div class="courses-box1">
          <div class="single-item-wrapper">
            <div class="courses-img-wrapper hvr-bounce-to-bottom">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/courses/2.jpg" alt="courses">
              <a href="start-quize.php"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
            <div class="courses-content-wrapper">
              <h3 class="item-title"><a href="start-quize.php">Python</a></h3>
              <p class="item-content">Getting Started, Introduction, Datatype and Variables, String, Control Flow.</p>
              <ul class="courses-info">
                <li>Level<br><span> Basic</span></li>
                <li>Duration<br><span> 90 Minutes</span></li>
              </ul>
            </div>                            
          </div>                            
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script src="<%=request.getContextPath()%>/resources/assets/js/isotope.pkgd.min.js" type="text/javascript"></script>
</body>
</html>
<!--  Include Footer  -->