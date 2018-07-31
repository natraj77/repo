<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content">
	<div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-briefcase"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Open Positions</span>
              <span class="info-box-number" id="openPositionsCnt">5000</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-clock-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Applications Pending</span>
              <span class="info-box-number" id="applicationPendingCnt">100</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>
        <!-- /.col -->
      </div>
       <div class="row">
	     <div class="col-lg-6">
	     <div class="ibox float-e-margins">
	        <div class="ibox-title">
	            <h5>Positions</h5>
	        </div>
	        <div class="ibox-content">
	            <div>
	            	  <canvas id="positions-bar-chart-grouped" width="800" height="450"></canvas>
	            </div>
	        </div>
	    </div>
	    </div>
	     <div class="col-lg-6">
	    <div class="ibox float-e-margins">
	        <div class="ibox-title">
	            <h5>Applications</h5>
	        </div>
	        <div class="ibox-content">
	            <div>
	            	  <canvas id="bar-chart-grouped" width="800" height="450"></canvas>
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
<script>
//Bar chart
new Chart(document.getElementById("bar-chart-grouped"), {
    type: 'bar',
    data: {
      labels: ["PGITS001", "PGITS002", "PGITS003", "PGITS003"],
      datasets: [
        {
          label: "Received",
          backgroundColor: "#ffb400",
          data: [133,221,783,2478]
        }, {
          label: "Pending",
          backgroundColor: "#f35454",
          data: [408,547,675,734]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Applications Count'
      }
    }
});
new Chart(document.getElementById("positions-bar-chart-grouped"), {
    type: 'bar',
    data: {
    	 labels: ["Nov", "Dec", "Jan", "Feb", "Mar"],
      datasets: [
        {
          label: "Open",
          backgroundColor: "#2dc3e8",
          data: [133,221,783,1000,800]
        }, {
          label: "Closed",
          backgroundColor: "#a0d468",
          data: [40,50,100,500,1000]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Positions monthly / Count'
      }
    }
});
</script>
</body>
</html>
