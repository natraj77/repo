<!doctype html>
<html class="no-js" lang="">
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
			<div class="cd-main-content main" style="background: url('<%=request.getContextPath()%>/resources/images/server-error.jpg') repeat 0 0; background-size: cover; min-height:500px;">
		    <section class="hero-internal">
		        <div class="hero-internal--shade" style="background: rgba(28, 32, 45, 0.47) repeat 0 0; height:500px; padding: 0;">
		            <div class="container">
		              <div style="position: absolute; top: 75%;left:30%">
		              <h4 style="color:#bf5847;margin-bottom:10px;font-size:20px;">You will be redirect to <a class="gohome" href="<%=request.getContextPath()%>/" target="_blank">Home Page</a> After <span id="timeLeft" style="color:#adaf44;font-size:30px;">10</span> Seconds Thanks</h4>
		                		              
		              </div>
		            </div><!--container -->
		        </div><!-- shader -->
		    </section>
		  </div>
			<!-- / -->
			<%@ include file='/static/footer.jsp' %>
			<script src="<%=request.getContextPath()%>/resources/js/jquery-count.js" type="text/javascript"></script>
<script> 
$(document).ready(function() {  
	window.setInterval(function() {
	var timeLeft	= $("#timeLeft").html();								
		if(eval(timeLeft) == 0){
				window.location= ("<%=request.getContextPath()%>/");					
		}else{				
			$("#timeLeft").html(eval(timeLeft)- eval(1));
		}
	}, 1000); 
});      
</script>

</body>
<%@ include file='/static/footer-include.jsp' %> 
</html>
<!--  Include Footer  -->