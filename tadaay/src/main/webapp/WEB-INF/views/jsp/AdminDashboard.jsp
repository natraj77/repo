<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<script src="../resources/assets/js/admindashboard.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content">
	<div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Students</span>
              <span class="info-box-number" id="stuentscnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Trainers</span>
              <span class="info-box-number" id="trainerscnt"></span>
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
            <span class="info-box-icon bg-green"><i class="fa fa-university"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Institutes</span>
              <span class="info-box-number" id="institutescnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-briefcase"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Recruiters</span>
              <span class="info-box-number" id="recruitercnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
       <div class="row">
   <div class="col-lg-6">
	    <div class="ibox float-e-margins">
	        <div class="ibox-title">
	            <h5>Students by date/month</h5>
	        </div>
	        <div class="ibox-content">
	            <div>
	            	  <canvas id="bar-chart" width="800" height="450"></canvas>
	            </div>
	        </div>
	    </div>
	    </div>
	     <div class="col-lg-6">
	     <div class="ibox float-e-margins">
	        <div class="ibox-title">
	            <h5>Batches</h5>
	        </div>
	        <div class="ibox-content">
	            <div>
	            	  <canvas id="pie-chart" width="800" height="450"></canvas>
	            </div>
	        </div>
	    </div>
	    </div>
    </div>
	</div>
	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<script src="<%=request.getContextPath()%>/resources/assets/js/Chart.min.js"></script>
<script type="text/javascript">
var collectionData = '';
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : '../getAdminDashboardDtls',
		mimeType : 'application/json',
		success : function(data) {
			var srcture = '';
			var finalString = '';
			var temp = 0;
			 $('#stuentscnt').text(data.studentCount);
			 $("#trainerscnt").text(data.trainersCount);
			 $('#institutescnt').text(data.instituteCount);
			 $('#recruitercnt').text(data.recruiterCount);
			 
			 $("#trainerscnt").addClass("about-counter title-bar-counter counter-head");
			 $('#stuentscnt').addClass("about-counter title-bar-counter counter-head");
			 $('#institutescnt').addClass("about-counter title-bar-counter counter-head");
			 $('#recruitercnt').addClass("about-counter title-bar-counter counter-head");
			 
			//pie chart
			 var batchStatus = [];
			 var batchCount = [];
			 var data = data.batchesCount;
			 for(var i in data) {
				 batchStatus.push(data[i].batchStatus);
				 batchCount.push(data[i].batchCount);
			 }
			 var chartdata = {
					 labels: batchStatus,
					 datasets : [
					 	{
							label: 'batches',
							backgroundColor: ["#3e95cd", "#8e5ea2","#e8c3b9"],
							data: batchCount
						}
			 		 ]
			 };

			 var ctx = $("#pie-chart");
			 var barGraph = new Chart(ctx, {
					type: 'pie',
					data: chartdata
			 });			 
		}
	});
	//bar chart
	$.ajax({
		url: "../getAdminLeadByMonth",
		method: "GET",
		success: function(data) {
			
			var leadByMonth = [];
			 var leadCount = [];
			 var data = data.leadCount;
			 for(var i in data) {
				 leadByMonth.push(data[i].leadByMonth);
				 leadCount.push(data[i].leadCount);
			 }
			 leadByMonth.reverse();
			 leadCount.reverse();
			 var leadChartdata = {
					 labels: leadByMonth,
					 datasets : [
					 	{
							label: 'students',
							backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#8e5ea2","#3e95cd","#793ecd","#c83ecd","#cd3e98","#c3cd3e","#cd3e70"],
							data: leadCount
						}
			 		 ]
			 };

			 var leadCtx = $("#bar-chart");
			 var leadBarGraph = new Chart(leadCtx, {
					type: 'bar',
					data: leadChartdata
			 });
		},
		error: function(data) {
			console.log(data);
		}
	});
});
</script>
</body>
</html>

