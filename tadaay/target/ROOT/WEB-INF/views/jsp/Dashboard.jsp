<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
<section class="content-header">
      <h1>My statistics</h1>
    </section>
	<div class="wrapper wrapper-content">
	<div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-university"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Courses Offered</span>
              <span class="info-box-number" id="coursecnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Trainers Available</span>
              <span class="info-box-number" id="trainercnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Branches</span>
              <span class="info-box-number" id="branchesCnt"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
       <!--  <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-line-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Open Leads</span>
              <span class="info-box-number" id="leadscnt"></span>
            </div>
            /.info-box-content
          </div>
          /.info-box
        </div> -->
        <!-- /.col -->
      </div>
      <section class="content-header">
      <h1>Batches</h1>
    </section>
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><span class="info-box-number" id="batchOngCnt"></span></h3>

              <p>Ongoing</p>
            </div>
            <div class="icon">
              <i class="fa fa-book"></i>
            </div>
            <a href="#" class="small-box-footer"><!-- More info <i class="fa fa-arrow-circle-right"></i> --></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><span class="info-box-number" id="batchSchCnt"></span></h3>

              <p>Upcoming</p>
            </div>
            <div class="icon">
              <i class="fa fa-book"></i>
            </div>
            <a href="#" class="small-box-footer"><!-- More info <!-- <i class="fa fa-arrow-circle-right"></i> --></a>
          </div>
        </div>
        <!-- ./col -->
       <!--  <div class="col-lg-3 col-xs-6">
          small box
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>User Registrations</p>
            </div>
            <div class="icon">
               <i class="fa fa-book"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div> -->
        <!-- ./col -->
       <!--  <div class="col-lg-3 col-xs-6">
          small box
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Unique Visitors</p>
            </div>
            <div class="icon">
              <i class="fa fa-book"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div> -->
        <!-- ./col -->
      </div>
   <!-- Main content -->
   <div class="wrapper wrapper-content animated fadeInRight">
  			<div class="row ibox-content">
                <div class="col-lg-12">
                <div class="col-lg-8">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>leads
                            </h5>
                        </div>
                        <div class="ibox-content">
                       <canvas id="bar-chart"></canvas>
                       </div>
                    </div>
                    </div>
                </div>
            </div>
             <div class="row">
			    <!--  <div class="col-lg-12">
			    <div class="ibox float-e-margins">
			        <div class="ibox-title">
			            <h5>Leads By Source</h5>
			        </div>
			        <div class="ibox-content">
			            <div>
			            	  <canvas id="leadsBySource" width="800" height="450"></canvas>
			            </div>
			        </div>
			    </div>
			    </div> -->
			     <div class="col-lg-12">
				     <div class="col-lg-6">
				    <div class="ibox float-e-margins">
				        <div class="ibox-title">
				            <h5>Leads & Conversions By Source</h5>
				        </div>
				        <div class="ibox-content">
				           <!--  <div>
				            	  <canvas id="conversionBySource" width="800" height="450"></canvas>
				            </div> -->
				            <div>
				            	<div class="showcase__section" id="bubble">
								  <div class="spacer --small"></div>
								  <div id="bubbleplots">
								    <div class="bubbleplot" data-num="0">
								     <div class="control-row">
								        Month: <select class="monthdata">
								        </select>
								      </div>
								      <div class="plot" id="myDiv"></div>
								    </div>
								  </div>
								</div>
				            </div>
				        </div>
				    </div>
				    </div>
				    <div class="col-lg-6">
				    	<div class="ibox float-e-margins">
			        <div class="ibox-title">
			            <h5>Conversions revenue By Source</h5>
			        </div>
			        <div class="ibox-content">
			           <div>
			            	<div class="showcase__section" id="bubble">
							  <div class="spacer --small"></div>
							  <div id="bubbleplots">
							    <div class="bubbleplot" data-num1="0">
							    <div class="control-row">
							        Month: <select class="revmonthdata">
							        </select>
							      </div>
							      <div class="revplot" id="revDiv"></div>
							    </div>
							  </div>
							</div>
			            </div>
			        </div>
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
		url : '../getTrainerDashboardDtls',
		mimeType : 'application/json',
		success : function(data) {
			var srcture = '';
			var finalString = '';
			var temp = 0;
			//var a = $('#coursecnt').data('myval'); //getter
			 $('#coursecnt').text(data.coursesCount);
			 $("#trainercnt").text(data.trainerCount);
			 $('#batchOngCnt').text(data.batchOngCount);
			 $('#batchSchCnt').text(data.batchSchCount);
			 $("#branchesCnt").text(data.branchesCount);
			 $("#trainercnt").addClass("about-counter title-bar-counter counter-head");
			 $('#coursecnt').addClass("about-counter title-bar-counter counter-head");
			 //$("#leadscnt").addClass("about-counter title-bar-counter counter-head");
			 $('#branchesCnt').addClass("about-counter title-bar-counter counter-head");
		}
	});
});

</script>
<script>

$(document).ready(function(){
	$.ajax({
		url: "../getLeadByCourse",
		method: "GET",
		success: function(data) {
			
			var courseName = [];
			var leads = [];
			var data = data.aaData;
			for(var i in data) {
				courseName.push(data[i].courseName);
				leads.push(data[i].courseCount);
			}
			console.log('courseName:'+courseName);
			console.log('leads:'+leads);
			var chartdata = {
				labels: courseName,
				datasets : [
					{
						label: 'Leads open by course',
						backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
						data: leads
					}
				]
			};

			var ctx = $("#bar-chart");

			var barGraph = new Chart(ctx, {
				type: 'bar',
				data: chartdata,
			    options: {
			        legend: { display: false },
			        title: {
			          display: true,
			          text: 'Leads open by course'
			        }
			      }
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
});
</script>
<link href="<%=request.getContextPath()%>/resources/assets/plugins/enjoyhint/enjoyhint.css" rel="stylesheet">
  <script src="<%=request.getContextPath()%>/resources/assets/plugins/enjoyhint/enjoyhint.min.js"></script>
<script>

//initialize instance
var enjoyhint_instance = new EnjoyHint({});

//simple config.
//Only one step - highlighting(with description) "New" button
//hide EnjoyHint after a click on the button.
var enjoyhint_script_steps = [
  {
      "next #adminlogostep1": 'Welcome to Tadaay . If you are new to this platfom, please take a virtual tour.<br> Click "Next" to proceed.'
  },
  {
          "next #editprofilestep2": 'Keep your profile up to date. Students would be able to see this information on the website.<br> Please provide all the details accuately, so leads can contact you directly. <br> Click "Next" to proceed.',
        	  shape : 'circle',
              radius: 90
  },
  {
      "next #addbranchestep3" : "Add all your branches with contact details. <br> Click 'Next' to fix it."
  },
  {
      "next #addcoursesstep4" : "Add courses and publish course content including a sample demo video. <br> " +
      "This information would be directly available for all the students when you create batches for this course.<br>" 
          
  },
  {
      "next #addfacultystep5" : "Keep all your faculty information here and the courses they have expetise in. <br> "+
  "You can select the faculty when you want to create any batches.<br>"
         
  },
  {
      "next #addinvitesstep6" : "Do you have a list of leads infomation you want to manage ? <br>" + 
    		  "You can also import multiple leads from excel sheet."
    	  
  },
  {
      "next #addleadsstep7" : "Start managing leads information with complete details including their prefered <br>" + 
      "course and mode they want to join and thier prefered time as well.<br>"
         
  },
  {
      "next #adddemosstep8" : "Schedule a demo for any course and invite the candidates. <br>" + 
      "All the invitees would be receiving an email and they can also confirm their acceptance.<br>"
          
  },
  {
      "next #addbatchesstep9" : "Create new batches and add your leads to the batches. You can also reschedule or cancel them.<br>" + 
      "Also students would be able to see all your scheduled batches from the website <br>" +
      "https://www.tadaay.com/all-batches/find-leading-training-institutes <br>" 
         
  },
  {
      "next #addstudentsstep10" : "When the students are registered into any batches they become your student. <br>"+
      "You can send emails, assign quizzes and assign tasks to all your students in one go.<br>" 
         
  },
  {
      "next #addpaymentsstep11" : "You can track the payment details including paid and pending fees easily from here.<br>" 
         
  },
  {
      "next #addquizzesstep12" : "You can create a quiz by course wise or even by topic wise <br>"+
      "and assign them to your students. Also track their performance. <br>" 
         
  },
  {
      "next #addtasksstep13" : "You can write a tasks and upload them by course wise or even by topic wise, <br>"+
  "and assign them to your students. Also track their performance. <br>" 
        
  }

];

//set script config
enjoyhint_instance.set(enjoyhint_script_steps);

//run Enjoyhint script
enjoyhint_instance.run();
</script>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script>

Plotly.d3.json("../getLeadConversionByMonth", function(data){
	
    var dataLeadObj = data.leadsbysource;
    var months = data.months;
    var leadObj = [],
    listofMonths = [],
    currentLeads = [],
    currentSource = [],
	currentConversion =[];
	
	var allMonthsNames = [];
	allSource = [];
	allLeads = [];
	allconversion = [];
	
	for(var i=0;i<months.length;i++){
		allMonthsNames.push(months[i]);
	}
	
  	for (var i = 0; i < allMonthsNames.length; i++ ){
    	if (listofMonths.indexOf(allMonthsNames[i]) === -1 ){
      		listofMonths.push(allMonthsNames[i]);
    	}
  	}
  
  function getMonthsData(chosenMonth) {
    currentLeads = [];
    currentSource = [];
    currentConversion = [];
    for (var i = 0 ; i < dataLeadObj.length ; i++){
      if (dataLeadObj[i].leadByMonth === chosenMonth) {
        currentLeads.push(dataLeadObj[i].leadBySource);
        currentConversion.push(dataLeadObj[i].conversionBySource);
        currentSource.push(dataLeadObj[i].source);
      } 
    }
  };

// Default Country Data
setBubblePlot('January');
  
function setBubblePlot(chosenMonth) {
    getMonthsData(chosenMonth);  
    
    var trace1 = {
    		x: currentSource,
    	      y: currentLeads,
    		  name: 'Leads By Source', 
    		  type: 'bar',
    		  marker: {
    			    color: '#00a9c9'
    			  }
    		};

    		var trace2 = {
    				x: currentSource,
    	    	      y: currentConversion,
    		  name: 'Conversion By Source', 
    		  type: 'bar',
    		  marker: {
  			    color: '#b0ba36'
  			  }
    		};

    		var data = [trace1, trace2];
    		var layout = {barmode: 'group'};

    		Plotly.newPlot('myDiv', data, layout);
};
  
var innerContainer = document.querySelector('[data-num="0"'),
    plotEl = innerContainer.querySelector('.plot'),
    monthSelector = innerContainer.querySelector('.monthdata');

function assignOptions(textArray, selector) {
  for (var i = 0; i < textArray.length;  i++) {
      var currentOption = document.createElement('option');
      currentOption.text = textArray[i];
      selector.appendChild(currentOption);
  }
}

assignOptions(listofMonths, monthSelector);
updateMonth();

function updateMonth(){
    setBubblePlot(monthSelector.value);
}
  
monthSelector.addEventListener('change', updateMonth, false);
	
});

Plotly.d3.json("../getConversionRevenueByMonth", function(data){
	
    var dataLeadObj = data.revenueBySource;
    var months = data.months;
    
    var listofMonths = [],
    currentSource = [],
	revenueConversion =[];
	
	var allMonthsNames = [];
	
	for(var i=0;i<months.length;i++){
		allMonthsNames.push(months[i]);
	}
	
  	for (var i = 0; i < allMonthsNames.length; i++ ){
    	if (listofMonths.indexOf(allMonthsNames[i]) === -1 ){
      		listofMonths.push(allMonthsNames[i]);
    	}
  	}
  
  function getMonthsData(chosenMonth) {
    currentSource = [];
    revenueConversion = [];
    for (var i = 0 ; i < dataLeadObj.length ; i++){
      if (dataLeadObj[i].leadByMonth === chosenMonth) {
    	revenueConversion.push(dataLeadObj[i].revenueBySource);
        currentSource.push(dataLeadObj[i].source);
      } 
    }
  };

// Default Country Data
setBubblePlot('January');
  
function setBubblePlot(chosenMonth) {
    getMonthsData(chosenMonth);  
    
    var trace1 = {
    		x: currentSource,
    	      y: revenueConversion,
    		  name: 'Revenue By Source', 
    		  type: 'bar',
    		  marker: {
    			    color: '#45adad'
    			  }
    		};

    		var data = [trace1];
    		var layout = {barmode: 'group'};

    		Plotly.newPlot('revDiv', data, layout);
};
  
var innerContainer = document.querySelector('[data-num1="0"'),
    plotEl = innerContainer.querySelector('.revplot'),
    monthSelector = innerContainer.querySelector('.revmonthdata');

console.log(monthSelector);
function assignOptions(textArray, selector) {
  for (var i = 0; i < textArray.length;  i++) {
      var currentOption = document.createElement('option');
      currentOption.text = textArray[i];
      selector.appendChild(currentOption);
  }
}

assignOptions(listofMonths, monthSelector);
updateMonth();

function updateMonth(){
    setBubblePlot(monthSelector.value);
}
  
monthSelector.addEventListener('change', updateMonth, false);
	
});

</script>
</body>
</html>

