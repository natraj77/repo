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
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('resources/images/banners/5.jpg');">
  <div class="container">
    <div class="pagination-area">
      <h2>News</h2>
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
         </div>
     </div>
 </div>
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
</html>
<!--  Include Footer  -->