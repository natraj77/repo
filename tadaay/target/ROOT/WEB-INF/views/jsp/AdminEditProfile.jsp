<!-- Includes.jsp contains all libraries, and top navigation page -->
<jsp:include page="AdminIncludes.jsp"></jsp:include>
<script src="../resources/assets/js/editstudentprofile.js" type="text/javascript"></script>
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>

	<div class="wrapper wrapper-content">
    <div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
	          <div class="ibox float-e-margins">
	          	<div id="profile1" class="col-lg-12 col-md-12 col-sm-12">
					<!-- RIGHT -->
					<div class="col-lg-9 col-md-9 col-sm-8 col-lg-push-3 col-md-push-3 col-sm-push-4 margin-bottom-80">
						<ul class="nav nav-tabs nav-top-border">
							<li class="active"><a href="#info" data-toggle="tab">Personal Info</a></li>
							<li><a href="#avatar" data-toggle="tab">Profile Pics</a></li>
							<li><a href="#media" data-toggle="tab">Education Details</a></li>
							<li><a href="#passwordpanel" data-toggle="tab">Password</a></li>
							<li><a href="#plans" data-toggle="tab">Experience</a></li>
						</ul>
						<div class="tab-content margin-top-20">
							<!-- PERSONAL INFO TAB -->
							<div class="tab-pane fade in active" id="info">
								<form action="" role="form" method="post" name="editstudentprofile" id="editstudentprofile">
									<div class="form-group">
										 <label for="instName" class="control-label">First Name</label>
										<input type="text" id="firstName" name="firstName" class="form-control"/>
									</div>
									<div class="form-group">
										 <label for="instName" class="control-label">Last Name</label>
										<input type="text" id="lastName" name="lastName" class="form-control"/>
									</div>
									<div class="form-group">
										<label for="phone" class="control-label">Phone Number</label>
										<input type="text" id="phone" name="phone" class="form-control">
									</div>
									<div class="form-group">
										<label for="email" class="control-label">Email</label>
										 <input type="text" name="email" id="email" class="form-control"/>
									</div>
									<div class="form-group">
										<label for="about" class="control-label">About</label>
										<textarea id="about" name="about" class="form-control" rows="3"></textarea>
									</div>
								   <div class="margiv-top10">
										<button class="btn btn-primary"  type="submit" ><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="submit" >Cancel</button>
									</div>
								  </form>
							</div>
							<!-- AVATAR TAB -->
							<div class="tab-pane fade" id="avatar">
					             <form enctype="multipart/form-data" action="" role="form" method="post" name="profile_pic">
							        <input id="file-fr" name="file-fr[]" type="file" multiple>
							        <!--div class="margiv-top10">
										<button class="btn btn-primary"  type="submit" ><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="submit" >Cancel</button>
									</div-->
							    </form>
							</div>
							<!-- /AVATAR TAB -->
							<!-- PASSWORD TAB -->
							<div class="tab-pane fade" id="passwordpanel">
								<form action="#" method="post" name="change_password" id="change_password">
									<div class="form-group">
										<label for="password" class="control-label">Current Password</label>
										<input type="password" id="password" name="password" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">New Password</label>
										<input type="password" id="new_password" name="new_password" class="form-control">
									</div>
									<div class="form-group">
										<label for="confirm_password" class="control-label">Re-type New Password</label>
										<input type="password" id="confirm_password" name="confirm_password" class="form-control">
									</div>
									<div class="margiv-top10">
										<button class="btn btn-primary"  type="submit" ><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="submit" >Cancel</button>
									</div>
								</form>
							</div>
							<!-- /PASSWORD TAB -->
							<!-- Experience TAB -->
							<div class="tab-pane fade" id="plans">
								<form action="" role="form" method="post" name="editstudentprofile" id="editstudentprofile">
								<div>
									<div class="form-group control-group after-add-more">
							      	<label for="instName" class="control-label">Key Skills</label>
							      		<div class="col-sm-12 row form-group">	
							      	 		<div class="col-sm-4 no-padding">
											 	<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>Java</option>
												<option>AWS</option>
												<option>Linux</option>
												</select>
										 </div>
										 <div class="col-sm-4">
										 	<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>0</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
												<option>9</option>
												<option>10</option>
											</select>
										 </div>
										  <div class="col-sm-4"> 
											<button class="btn btn-default add-moreskills"  type="button" ><i class="fa fa-plus" aria-hidden="true"></i></button>
										  </div>
										</div>
									</div> 
									<!-- Copy Fields-These are the fields which we get through jquery and then add after the above input,-->
							        <div class="copy-fields hide form-group">
							          <div class="remove-skills col-sm-12 row form-group">
							           <div class="col-sm-4 no-padding">
										 	<select class="form-control" id="years" name="years">
											<option value="">Select</option>
											<option>Java</option>
											<option>AWS</option>
											<option>Linux</option>
										</select>
										 </div>
										  <div class="col-sm-4">
										 	<select class="form-control" id="years" name="years">
											<option value="">Select</option>
											<option>0</option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
											<option>9</option>
											<option>10</option>
										</select>
										 </div>
										  <div class="col-sm-4">
							              <button class="btn btn-danger removebtn" type="button"><i class="fa fa-minus" aria-hidden="true"></i></button>
							            </div>
							          </div>
							        </div> 
									<div class="form-group">
										 <label for="instName" class="control-label">Company Name</label>
										<input type="text" class="form-control" name="company" id="company">
									</div>
									<div class="form-group">
										 <label for="instName" class="control-label">Designation</label>
										<input type="text" class="form-control" name="company" id="company">
									</div>
									<div class="form-group">
										 <label for="instName" class="control-label">Joining Date</label>
										<input type="text" class="form-control" id="JoiningDate" name="JoiningDate">
									</div>
									<div class="form-group">
										 <label for="instName" class="control-label">Last date</label>
										<input type="text" class="form-control" id="JoiningDate" name="JoiningDate">
									</div>
									<!-- <div class="form-group">
										<div class="col-sm-12 row form-group">
										 <div class="col-sm-2 line-ht-35 no-padding"><label>Joining Date</label></div>
										  <div class="col-sm-3 no-padding">
										 	<input type="text" class="form-control" id="JoiningDate" name="JoiningDate">
										 	
										 </div>
										 <div class="col-sm-2 line-ht-35"><label>Last date</label></div>
										  <div class="col-sm-3 no-padding">
										 	<input type="text" class="form-control" name="lastDate" id="lastDate">
										 </div>
										 </div>
									</div>    --> 
							        </div>
							       <div class="copy-company hide">
							          <div class="control-group form-group" style="border-top:1px solid;padding:30px 0px 10px 0px;">
							          		<div>
												<div class="form-group">
													 <label for="instName" class="control-label">Company Name</label>
													<input type="text" class="form-control" name="company" id="company">
												</div>
												<div class="form-group">
													 <label for="instName" class="control-label">Designation</label>
													<input type="text" class="form-control" name="company" id="company">
												</div>
												<div class="form-group">
													 <label for="instName" class="control-label">Joining Date</label>
													<input type="text" class="form-control" id="JoiningDate" name="JoiningDate">
												</div>
												<div class="form-group">
													 <label for="instName" class="control-label">Last date</label>
													<input type="text" class="form-control" id="JoiningDate" name="JoiningDate">
												</div>  
										    </div>
							          </div>
							        </div> 
							          <div class="form-group control-group after-addmore-btn">
							        <button class="btn btn-primary addmore-btn"  type="button" >Add More</button>
							        </div> 
								   <div class="margiv-top10">
										<button class="btn btn-primary"  type="submit" ><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="submit" >Cancel</button>
									</div>
								  </form>
							</div>
							<div class="tab-pane fade" id="media">
								<form role="form" action="#" method="post" name="studentsocial_media" id="studentsocial_media">
								<div class="row edu-separation">
										<div class="col-sm-12 no-padding">
											<div class="col-sm-9">
												<div class="form-group">
												<label class="control-label">SSC</label>
												<input type="text" id="media_fb" name="media_fb" class="form-control" placeholder="School Name">
											</div>
											</div>
											<div class="col-sm-3">
											<div class="form-group">
												<label class="control-label">Percentage</label>
												<input type="text" id="media_fb" name="media_fb" class="form-control">
											</div>
											</div>
										</div>
										<div class="col-sm-12 no-padding">
											<div class="col-sm-6">
												<div class="form-group">
											<label class="control-label">Intermediate</label>
											<input type="text" id="media_tw" name="media_tw" class="form-control" placeholder="College Name">
										</div>
											</div>
											<div class="col-sm-3">
											<div class="form-group">
											<label class="control-label">Specialization</label>
											<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>M.P.C</option>
												<option>Bi.P.C</option>
												<option>C.E.C</option>
												<option>M.E.C</option>
											</select>
											</div>
											</div>
											<div class="col-sm-3">
											<div class="form-group">
												<label class="control-label">Percentage</label>
												<input type="text" id="media_fb" name="media_fb" class="form-control">
											</div>
											</div>
										</div>
										<div class="col-sm-12 no-padding">
											<div class="col-sm-6">
												<div class="form-group">
											<label class="control-label">Diploma</label>
											<input type="text" id="media_tw" name="media_tw" class="form-control" placeholder="College Name">
										</div>
											</div>
											<div class="col-sm-3">
											<div class="form-group">
											<label class="control-label">Specialization</label>
											<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>D.E.C.E</option>
												<option>D.M.E</option>
												<option>D.E.E.E</option>
											</select>
											</div>
											</div>
											<div class="col-sm-3">
											<div class="form-group">
												<label class="control-label">Percentage</label>
												<input type="text" id="media_fb" name="media_fb" class="form-control">
											</div>
											</div>
										</div>
									</div>
									<div class="row edu-separation">
										<div class="col-sm-12 no-padding">
											<div class="col-sm-12">
												<div class="form-group">
											<label class="control-label">UG</label>
											<input type="text" id="media_tw" name="media_tw" class="form-control"  placeholder="College Name">
										</div>
											</div>
										</div>
										<div class="col-sm-12 no-padding">
										<div class="col-sm-4">
											<div class="form-group">
											<label class="control-label">Degree</label>
											<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>BTech/BE</option>
												<option>BSC</option>
												<option>Bcom</option>
											</select>
											</div>
											</div>
											<div class="col-sm-4">
											<div class="form-group">
											<label class="control-label">Specialization</label>
											<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>ECE</option>
												<option>EEE</option>
												<option>CSE</option>
												<option>IT</option>
											</select>
											</div>
											</div>
											<div class="col-sm-4">
											<div class="form-group">
												<label class="control-label">Percentage</label>
												<input type="text" id="media_fb" name="media_fb" class="form-control">
											</div>
											</div>
										</div>
									</div>
									<div class="row edu-separation">
										<div class="col-sm-12 no-padding">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="control-label">PG</label>
												<input type="text" id="media_tw" name="media_tw" class="form-control" placeholder="College Name">
											</div>
											</div>
										</div>
										<div class="col-sm-12 no-padding">
											<div class="col-sm-4">
												<div class="form-group">
												<label class="control-label">Degree</label>
												<select class="form-control" id="years" name="years">
													<option value="">Select</option>
													<option>Mtech</option>
													<option>MCA</option>
													<option>MSC</option>
												</select>
												</div>
											</div>
											<div class="col-sm-4">
											<div class="form-group">
											<label class="control-label">Specialization</label>
											<select class="form-control" id="years" name="years">
												<option value="">Select</option>
												<option>ECE</option>
												<option>EEE</option>
												<option>CSE</option>
												<option>IT</option>
											</select>
											</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<label class="control-label">Percentage</label>
													<input type="text" id="media_fb" name="media_fb" class="form-control">
												</div>
											</div>
										</div>
									</div>
									 <div class="margiv-top10">
										<button class="btn btn-primary"  type="submit" ><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="submit" >Cancel</button>
									</div>
								</form>
							</div>
							<!-- /PASSWORD TAB -->
						</div>
					</div>
					<!-- LEFT -->
					<div class="col-lg-3 col-md-3 col-sm-4 col-lg-pull-9 col-md-pull-9 col-sm-pull-8">					
						<div class="thumbnail text-center">
							 <img alt="image" src="../resources/assets/img/a9.jpg"/>
							<h2 class="size-18 margin-top-10 margin-bottom-0">David Williams</h2>
							<h3 class="size-11 margin-top-0 margin-bottom-10 text-muted">Art Director</h3>
						</div>
						<!-- completed -->
						<div class="margin-bottom-30">
							<label>88% completed profile</label>
							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="width: 88%; min-width: 2em;"></div>
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
 <script>
$('#file-fr').fileinput({
    language: 'fr',
    uploadUrl: '#',
    allowedFileExtensions: ['jpg', 'png', 'gif']
});
if (element.attr('value') !== undefined){
    element.val('');
}
</script> 
<script type="text/javascript">
    $(document).ready(function() {
	//here first get the contents of the div with name class copy-fields and add it to after "after-add-more" div class.
      $(".add-moreskills").click(function(){ 
          var html = $(".copy-fields").html();
          $(".after-add-more").after(html);
      });
      $(".addmore-btn").click(function(){ 
          var html = $(".copy-company").html();
          $(".after-addmore-btn").before(html);
      });
//here it will remove the current value of the remove button which has been pressed
      $("body").on("click",".remove",function(){ 
          $(this).parents(".control-group").remove();
      });
      $("body").on("click",".removebtn",function(){ 
          $(this).parents(".remove-skills").remove();
      });
       $('#JoiningDate').datetimepicker();
      $('#lastDate').datetimepicker();
 
    });
 
</script>

</body>
</html>

