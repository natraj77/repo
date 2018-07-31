<!--  Include Header  -->
<script src="../resources/assets/js/w3data.js"></script>
<!-- Mainly scripts -->

<script src="../resources/assets/js/jquery-2.1.1.js"></script>
<script src="../resources/assets/js/bootstrap.min.js"></script>
<script src="../resources/assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../resources/assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../resources/assets/js/plugins/flot/jquery.flot.js"></script>
<script src="../resources/assets/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../resources/assets/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../resources/assets/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../resources/assets/js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../resources/assets/js/plugins/flot/jquery.flot.symbol.js"></script>
<script src="../resources/assets/js/plugins/flot/jquery.flot.time.js"></script>

<!-- Peity -->
<script src="../resources/assets/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../resources/assets/js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="../resources/assets/js/inspinia.js"></script>
<script src="../resources/assets/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../resources/assets/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- jQuery Validation -->
<script src="../resources/assets/js/jquery.validate.min.js" type="text/javascript"></script>

<!-- jQuery Validate -->
<script src="../resources/assets/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- Jvectormap -->
<script src="../resources/assets/js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="../resources/assets/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- EayPIE -->
<script src="../resources/assets/js/plugins/easypiechart/jquery.easypiechart.js"></script>

<!-- Sparkline -->
<script src="../resources/assets/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../resources/assets/js/demo/sparkline-demo.js"></script>
<!-- Flot demo data -->
<!--<script src="../resources/assets/js/demo/flot-demo.js"></script>-->
<!-- Morris demo data-->
<!--<script src="../resources/assets/js/demo/morris-demo.js"></script>-->

<!-- Data Tables -->
<script src="../resources/assets/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../resources/assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../resources/assets/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../resources/assets/js/plugins/dataTables/dataTables.tableTools.min.js"></script>
<script src="../resources/assets/js/canvas-to-blob.min.js"
type="text/javascript"></script>
<!-- Time Picker with Date JS-->
	<script src="../resources/assets/plugins/bootstrap-datetimepicker/moment.min.js"></script>
	<script src="../resources/assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="../resources/assets/js/fileinput.min.js" type="text/javascript"></script>

<%@ include file="/static/header.html"%>

<%@ include file="/static/Sidebar.jsp" %>

<script>
function doLogout() {
	if(confirm('Are you sure you want to logout...!')){
	$.ajax({
		type : 'GET',
		url : '../doLogout',
		success : function() {
			window.location = "../";
		},
		failure : function() {
			console.log('There was an error clearing the user sessionss.');
		}

	});
	}
}
var userId;
$(document).ready(function() {
	var userType = '${userType}';
	var url = window.location.href;
	var unauthorizedAccess = false;
	console.log(userType);
	userId = '${userId}';
	
	if (! userType || userType == '' || userType == 'undefined') {
	    alert('Your session is either expired or invalid. Please login');
	    unauthorizedAccess = true;
	}

	if (userType == 'U' && (url.search("/trainer/") >= 0 || url.search("/admin/") >= 0 || url.search("/recruiter/") >= 0)) {
		alert('you are not authorized to access the above url');
		unauthorizedAccess = true;
	}
	if (userType == 'P' && (url.search("/student/") >= 0 || url.search("/admin/") >= 0 || url.search("/recruiter/") >= 0)) {
		alert('you are not authorized to access the above url');
		unauthorizedAccess = true;
	}
	if (userType == 'T' && (url.search("/student/") >= 0 || url.search("/admin/") >= 0 || url.search("/recruiter/") >= 0)) {
		alert('you are not authorized to access the above url');
		unauthorizedAccess = true;
	}
	if (userType == 'A' && (url.search("/student/") >= 0 || url.search("/trainer/") >= 0 || url.search("/recruiter/") >= 0)) {
		alert('you are not authorized to access the above url');
		unauthorizedAccess = true;
	}
	if (userType == 'R' && (url.search("/student/") >= 0 || url.search("/trainer/") >= 0 || url.search("/admin/") >= 0)) {
		alert('you are not authorized to access the above url');
		unauthorizedAccess = true;
		
	}

	if (unauthorizedAccess === true) {
		doLogout();
		window.location = "../";
	}
});
</script>
<script>
/* $(function(){
    var current_page_URL = location.href;
    $( "nav a" ).each(function() {
        if ($(this).attr("href") !== "#") {
            var target_URL = $(this).prop("href");
                if (target_URL == current_page_URL) {
                    $('nav a').parents('li, ul').removeClass('active');
                    $(this).parent('li').addClass('active');
                    return false;
                }
        }
    }); }); */
   /*  $(function(){
        var current_page_URL = location.href;

        $( "nav a" ).each(function() {

            if ($(this).attr("href") !== "#") {

                var target_URL = $(this).prop("href");

                    if (target_URL == current_page_URL) {
						  var t = $(this); //optional but faster if we use it more than once
						  t.parents('nav').find('li').removeClass('active'); //remove all the active classes
						  t.parentsUntil('nav', 'li').addClass('active'); //set the active class to all the li parents of the anchor element
						  //t.parentsUntil('nav', 'li ul').css("display", "block");
                        return false;
                    }
            }
        }); }); */
     
</script>
 <!-- Toastr -->
  <%--  <script src="<%=request.getContextPath()%>/resources/js/plugins/toastr/toastr.min.js"></script>
    <script>
        $(document).ready(function() {
        	var userType = '${userType}';
        	var url = window.location.href;
        	var unauthorizedAccess = false;
        	console.log(userType);
        	userId = '${userId}';
        	if (userType == 'R') {
        		 setTimeout(function() {
                     toastr.options = {
                         closeButton: true,
                         progressBar: true,
                         showMethod: 'slideDown',
                         timeOut: 4000
                     };
                     toastr.success('Take a virtual tour','New to Tadaay');
                 }, 1300);
        	}
           
        });
      
    </script> --%>
    <script type="text/javascript">
  function pageRefresh(){
    setTimeout(function(){location.reload()}, 1000);
  }
</script>


