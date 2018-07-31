<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="Includes.jsp"></jsp:include>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

	<div class="wrapper wrapper-content animated fadeInRight">
	<div class="jobchangediv">
		<a class="pull-right" href="#" data-toggle="tooltip" data-placement="left" title="" class="closebtnicon" data-original-title="Never show me this again!">×</a>
		<a href="#" class="jobchangetext">Are you looking for a job change</a>
		<button class="btn btn-default btn-sm" id="yes">yes</button>
		<button  class="btn btn-default btn-sm" id="no">No</button>
	</div>
	<div class="ibox jobchange-block">
		<div class="ibox-content">
			<form id="jobchangeForm">
			          	 <div class="form-group">
			          <div class="row">
			          	 <div class="col-lg-12">
			          	 <div class="col-lg-4">
			          		<label>Notice Period</label>
			          			<div class="form-group">
					           		<div class="form-group">
				                		<input type="text" class="form-control" id="mobile" name="mobile" >
				                	</div>
			          			</div>
			          		</div>
			          		<div class="col-lg-4">
			          		<label>Current CTC</label>
			                	<div class="form-group">
				                		<input type="text" class="form-control" id="mobile" name="mobile" >
				                	</div>
			          		</div>
			          		<div class="col-lg-4">
					             <label>Expected CTC</label>
			                	<div class="form-group">
				                		<input type="text" class="form-control" id="mobile" name="mobile" >
				                	</div>
			          		</div>
			          		</div>
			          </div>
			          </div>
			           <div class="form-group">
				          <div class="row">
				          	 <div class="col-lg-12">
				          	 <div class="col-lg-6">
				          		<label>Total Exp</label>
				          			<div class="form-group">
						           		<div class="form-group">
					                		<input type="text" class="form-control" id="mobile" name="mobile" >
					                	</div>
				          			</div>
				          		</div>
				          		<div class="col-lg-6">
				          		<label>Relevent Exp</label>
				                	<div class="form-group">
					                		<input type="text" class="form-control" id="mobile" name="mobile">
					                	</div>
				          		</div>
				          		</div>
				          </div>
			          </div>
                	 <div class="form-group" style="text-align:right">
                        <input type="button" class="join-now-btn" onclick="sendQuestion();" value="Submit"/>
                    </div>
                </form>
		</div>
	</div>
    <div class="callout callout-info">
        Are you looking for a training 
        <button class="btn btn-default btn-sm" id="courseyes" style="color:#000">yes</button>
		<button  class="btn btn-default btn-sm" id="courseno" style="color:#000">No</button>
      </div>  
      <div class="ibox looking-training">
		<div class="ibox-content">
       <form id="trainingForm">
			          	 <div class="form-group">
			          		<div class="row">
			          	 		<div class="col-lg-12">
					          		<div class="col-lg-4">
					          		<label>Course Name</label>
					                	<div class="form-group">
								              <input type="text" class="form-control" id="coursename" name="coursename" autocomplete="off" placeholder="search for courses"> 
								            <div id="course-box" class="trainer-courses"></div>
							          </div>
					          		</div>
					          		 <div class="col-lg-4">
					          			<label>Mode</label>
					          			<div class="form-group">
								            <div class="col-sm-10">
								              <label class="radio-inline">
								                <input type="radio" name="mode" id="online" value="classroom"> Class Room
								              </label>
								              <label class="radio-inline">
								                <input type="radio" name="mode" id="classroom" value="online"> Online
								              </label>
								              <label for="relevent" style="display: block;" class="error"></label>
								            </div>
					          			</div>
					          		</div>
					          		<div class="col-lg-4 locationdiv">
					          			<label>Location</label>
					          			<div class="form-group">
								           <select class="form-control" name="location" id="location">
								           		<option>Hyderabad</option>
								           		<option>Banglore</option>
								           		<option>Mumbai</option>
								           </select>
					          			</div>
					          		</div>
			          		</div>
			          		</div>
			          </div>
			           <div class="form-group">
			          <div class="row">
			          	 <div class="col-lg-12">
			          <div class="col-lg-6">
					              <div class="form-group">
					                <label for="preferredTimeStart" style="padding: 0;" class="control-label">Preferred
					                  Start Time </label>
					                  <input class="form-control valid" placeholder="Preferred Start Time" id="preferredTimeStart" name="preferredTimeStart" type="text">
					              </div>
			          		</div>
			          		<div class="col-sm-6">
				              <div class="form-group">
				                <label for="preferredTimeEnd" style="padding: 0;" class="control-label">Preferred End Time </label>
				                  <input class="form-control valid" placeholder="Preferred End Time" id="preferredTimeEnd" name="preferredTimeEnd" type="text">
				              </div>
				            </div>
				            </div>
				            </div>
				            </div>
                	 <div class="form-group" style="text-align:right">
                        <input type="button" class="join-now-btn" onclick="sendQuestion();" value="Submit"/>
                    </div>
                </form>
                </div>
                </div>
</div>
	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<script>
$(".jobchange-block").hide();
$(".looking-training").hide();
$(".locationdiv").hide();
$("#yes").click(function(){
    $(".jobchange-block").show();
});
$("#courseyes").click(function(){
    $(".looking-training").show();
});
$(function () {
    $("input[name='mode']").click(function () {
        if ($("#online").is(":checked")) {
            $(".locationdiv").show();
        } else {
            $(".locationdiv").hide();
        }
    });
});
</script>
</body>
</html>
