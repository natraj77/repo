<!doctype html>
<html class="no-js" lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <%@ include file='/static/header-include.jsp'%>
    <!-- jPList core js and css  -->		
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/header.jsp' %>
<div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/banners/5.jpg');">
  <div class="container">
    <div class="pagination-area">
      <h2>Contact</h2>
      <ul>
        <li><a href="<%=request.getContextPath()%>">Home</a> -</li>
        <li>Contact</li>
      </ul>
    </div>
  </div>  
</div> 
<div class="contact-us-page1-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="contact-us-info1">
                            <ul>
                                <li>
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <h3>Phone</h3>
                                    <p>+91 970 330 9933 <br>+91 970 331 9933</p>
                                </li>
                                <li>
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <h3>Address</h3>
                                    <address>
                                    	307/B/B, Nilgiri block, Aditya enclave, <br>
                                    	Ameerpet, Hyderabad, 
                                    	Telangana 500016
                                    </address>
                                </li>
                                <li>
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <h3>E-mail</h3>
                                    <p><a href="mailto:info@tadaay.com">info@tadaay.com</a></p>
                                </li>
                                <li>
                                    <h3>Follow Us</h3>
                                    <ul class="contact-social">
                                        <li><a href=" https://www.facebook.com/tadaay.edu"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="https://twitter.com/tadaay_edu"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="https://www.linkedin.com/company/tadaay/"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        <li><a href="https://www.tumblr.com/blog/tadaay"><i class="fa fa-tumblr" aria-hidden="true"></i></a></li>
                                       <!--  <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li> -->
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h2 class="title-default-left title-bar-high">Contact With Us</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="contact-form1">
			                 <form id="questionForm">
		                 		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				                	<div class="form-group">
				                	<input type="text" class="form-control" id="name" name="name" placeholder="Name*" >
				                	</div>
			                	</div>
			                	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				                	<div class="form-group">
				                	<input type="email" class="form-control" id="email" name="email" placeholder="Email*" >
				                	</div>
			                	</div>
			                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				                	<div class="form-group">
				                	<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile*" >
				                	</div>
			                	</div>
			                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				                	<div class="form-group">
				                	<textarea class="form-control"  id="queryId" rows="10" cols="70" name="queryId" placeholder="Message"></textarea>
				                	</div>
			                	</div>
			                	<div class="col-lg-4 col-md-4 col-sm-6 col-sm-12">
				                  <div class="form-group margin-bottom-none">
				                     <input type="button" class="default-big-btn" onclick="sendQuestion();" value="Send Message"/>
				                  </div>
				                </div>
				                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- Inner Page Banner Area End Here -->
<!-- Courses Page 5 Area Start Here -->

<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
<script  type="text/javascript">
function sendQuestion(){
	if($("#questionForm input[name=name]").val()=='' || $("#questionForm input[name=email]").val()==''
		 || $("#questionForm input[name=mobile]").val()=='' || $("#questionForm textarea#queryId").val()==''){
		alert('Please fill in the form to proceed');
		return;
	}
	$.ajax({
		type : 'POST',
		url : '<%=request.getContextPath()%>/submitQuestion',
		data : {
			name : $("#questionForm input[name=name]").val(),
			email : $("#questionForm input[name=email]").val(),
			mobile : $("#questionForm input[name=mobile]").val(),
			queryId : $("#questionForm textarea#queryId").val()
		},
		mimeType : 'application/json',
		success : function(data) {
			if (data.status == 'SUCCESS') {
				alert('Recieved the Query .We will get back to you soon...!');
			} else if (data.status == 'FAIL') {
				alert('Problem with Submitting the Query ');
			} 
		}
	});
}
</script>

</body>
</html>
<!--  Include Footer  -->