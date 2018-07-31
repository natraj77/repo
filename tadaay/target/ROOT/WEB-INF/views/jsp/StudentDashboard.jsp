<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content">
	<div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-university"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Trainers</span>
              <span class="info-box-number" id="trainercnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Courses</span>
              <span class="info-box-number" id="coursecnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">students</span>
              <span class="info-box-number" id="studentscnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-line-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Open Leads</span>
              <span class="info-box-number" id="leadscnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
	</div>
    </div>
	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<script type="text/javascript">
var collectionData = '';
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : '../getFeaturedCourses',
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
			 $("#trainercnt").addClass("about-counter title-bar-counter counter-head");
			 $('#coursecnt').addClass("about-counter title-bar-counter counter-head");
			 $("#leadscnt").addClass("about-counter title-bar-counter counter-head");
			 $('#studentscnt').addClass("about-counter title-bar-counter counter-head");
		}
	});	
});
</script>
</body>
</html>

