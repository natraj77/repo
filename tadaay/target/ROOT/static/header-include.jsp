<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.png">
    <!-- Main CSS -->         
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/autocomplete.css">
    <!-- Bootstrap CSS --> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">

    <!-- Animate CSS --> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">

    <!-- Font-awesome CSS-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css">

    <!-- Owl Caousel CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/OwlCarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/OwlCarousel/owl.theme.default.min.css">
	
	<!-- for responsive main menu -->
	 <!-- Main Menu CSS -->      
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/meanmenu.min.css">
	
	<!-- Layer Slider -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendor/slider.layerslider/css/layerslider.css" type="text/css" />
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/jssocials/jssocials.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/jssocials/jssocials-theme-flat.css" />
   
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
    <link href="<%=request.getContextPath()%>/resources/css/theme.css" rel="stylesheet" type="text/css" />
  
    	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-108404388-1"></script>
    	<script>
    	if (window.location.hostname === "www.tadaay.com") {
    		   window.dataLayer = window.dataLayer || [];
    		  function gtag(){dataLayer.push(arguments);}
    		  gtag('js', new Date());

    		  gtag('config', 'UA-108404388-1');
    	    return; 
    	  }
    	</script>
   
<script>
  function sessionCLose(){
		$.ajax({
			type: "POST",
			url: "static/logoutSession",
			mimeType : 'application/json',
			    success: function(data){
				window.location = '<%=request.getContextPath()%>';
				}
			
			});
	}
</script>
<script type="application/ld+json">
{
  "@context" : "http://schema.org",
  "@type" : "LocalBusiness",
  "name" : "Tadaay",
  "image" : "https://www.tadaay.com/resources/images/logo.png",
  "telephone" : "+91 9703309933",
  "email" : "info@tadaay.com",
  "address" : {
    "@type" : "PostalAddress",
    "addressLocality" : "Hyderabad",
    "addressRegion" : "Telangana",
    "addressCountry" : "India",
    "postalCode" : "500038"
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

