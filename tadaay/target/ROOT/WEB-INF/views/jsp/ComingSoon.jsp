<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>   
  </head>
  <body>
  <%@ include file='/static/header.jsp' %>
  <!-- HEADER -->
			<!-- -->
			<div class="fullheight" style="background:url('<%=request.getContextPath()%>/resources/images/coming-soon.jpg')repeat scroll 0% 0%;height: 500px;position:relative;">
				<div class="display-table">
					<div class="display-table-cell vertical-align-middle">
						<div class="container text-center">
						 <div style="position: absolute; top: 45%;">
							<a class="goto-home" href="<%=request.getContextPath()%>/" target="_blank">Go to Home Page</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- / -->
			<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body> 
</html>
<!--  Include Footer  -->