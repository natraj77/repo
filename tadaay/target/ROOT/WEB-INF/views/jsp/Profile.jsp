<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Includes.jsp contains all libraries, and top navigation page -->
 
<jsp:include page="Includes.jsp"></jsp:include>
 
<script src="../resources/assets/js/profile.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/plugins/croppie/croppie.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/croppie/croppie.css">
<div id="page-wrapper" class="gray-bg">
	<%@ include file="/static/navbar.html"%>
	<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Profile</h5>
						</div>
						<div class="ibox-content table-responsive">
						<!--table id="branchesDataTable"
								class="display table table-striped table-bordered table-hover"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th><input name="select_all" value="1"
											id="example-select-all" type="checkbox"
											onclick="selectAllRows();" /></th>
										<th><span>Branch Name</span></th>
										<th><span>Address</span></th>
										<th><span>Contact</span></th>
										<th><span>City</span></th>
										<th><span></span></th>
									</tr>
								</thead>
							</table-->
							<div class="ibox float-e-margins">
	          	<div id="profile1" class="col-lg-12 col-md-12 col-sm-12">
	          	<div class="row">
					<!-- RIGHT -->
					<div class="col-lg-9 col-md-9 col-sm-8 col-lg-push-3 col-md-push-3 col-sm-push-4 margin-bottom-80">
						<ul class="nav nav-tabs nav-top-border">
							<li class="active"><a href="#info" data-toggle="tab">Personal Info</a></li>
							<li><a href="#passwordpanel" data-toggle="tab">Password</a></li>
							<li><a href="#media" data-toggle="tab">Social Media</a></li>
							<c:if test="${sessionScope.CURRENT_USER != null}" >
							 <c:if test="${sessionScope.CURRENT_USER.userType =='P' || sessionScope.CURRENT_USER.userType =='T'}">
										<li ><a href="#plans" data-toggle="tab">Plan Details</a></li>
										<li ><a href="#trainerImage" data-toggle="tab">Upload Image</a></li>
									 </c:if> 
							  <c:if test="${sessionScope.CURRENT_USER.userType =='U'}" >
										<li><a href="#education" data-toggle="tab">Education</a></li>
										<li><a href="#experience" data-toggle="tab">Experience</a></li>
										<li><a href="#skillSet" data-toggle="tab">Others</a></li>
									 </c:if>
						 </c:if>
						</ul>
						<div class="tab-content margin-top-20">
							<!-- PERSONAL INFO TAB -->
							<div class="tab-pane fade in active" id="info">
								<form action="" role="form" method="post" name="editprofile" id="editprofile">
								 <c:if test="${sessionScope.CURRENT_USER != null}" >   
                     
		                            <c:if test="${sessionScope.CURRENT_USER.userType =='P'}" >
		                            
										<div class="form-group">
											 <label for="instName" class="control-label">Institute Name</label>
											<input type="text" id="instName" name="instName"  class="form-control" placeholder="Institute Name"/>
										</div>
										<div class="form-group">
									        <label for="inst_date_str" class="control-label">Established</label>
									         <div class="input-group date" id="inst_dateSelector">
										                    <input class="form-control" type="text" id="inst_date_str" name="inst_date_str" placeholder="Established - dd/mm/yyyy">
										                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
										                    </span>
										                </div>
									     </div>
									     <div class="form-group">
											<label for="founder" class="control-label">Founder</label>
											<input type="text" name="founder" id="founder" placeholder="Founder" class="form-control">
										</div>
		                            </c:if>
		                             <c:if test="${sessionScope.CURRENT_USER.userType =='T' || sessionScope.CURRENT_USER.userType =='U' || sessionScope.CURRENT_USER.userType =='R'}" >
											<div class="col-sm-12 row form-group">	
								      	 		<div class="col-sm-6 no-padding">
								      	 			<div class="form-group">
														 <label for="firstName" class="control-label">First Name</label>
														<input type="text" id="firstName" name="firstName" placeholder="First Name" class="form-control" />
													</div>
								      	 		</div>
								      	 		<div class="col-sm-6">
									      	 		<div class="form-group">
												        <label for="lastName" class="control-label">Last Name</label>
												         <input type="text" id="lastName" name="lastName" class="form-control"   placeholder="Last Name" >
											    	 </div>
								      	 		</div>
								      	 	</div>
		                            </c:if>
	                            	<div class="col-sm-12 row form-group">	
								      	 		<div class="col-sm-6 no-padding">
								      	 			<div class="form-group">
														<label for="phone" class="control-label">Contact Number</label>
														<input type="text" id="phone" name="phone" placeholder="+1800-1234-657"  class="form-control">
													</div>
								      	 		</div>
								      	 		<div class="col-sm-6">
								      	 				<div class="form-group">
															<label for="email" class="control-label">Email</label>
															 <input type="email" name="email" id="email"   class="form-control" placeholder="Email Address"/>
														</div>
								      	 		</div>
								      </div>
									 <c:if test="${sessionScope.CURRENT_USER.userType =='T' || sessionScope.CURRENT_USER.userType =='U'}" >
									 <div class="col-sm-12 row form-group">	
								      	 		<div class="col-sm-6 no-padding">
								      	 			<div class="form-group">
														<label for="panNumber" class="control-label">Pancard Number</label>
														 <input type="text" name="panNumber" id="panNumber"   class="form-control" placeholder="Pancard Number"/>
													</div>
								      	 		</div>
								      	 		<div class="col-sm-6">
								      	 			<div class="form-group">
														<label for="passportNumber" class="control-label">Passport Number</label>
														 <input type="text" name="passportNumber" id="passportNumber"   class="form-control" placeholder="Passport Number"/>
													</div>
								      	 		</div>
								      	 		</div>
									<div class="form-group">
										<label for="adharNumber" class="control-label">Adhar Number</label>
										 <input type="text" name="adharNumber" id="adharNumber"   class="form-control" placeholder="Adhar Number"/>
									</div>
		                            </c:if>
									<div class="form-group">
										<label for="about" class="control-label">About</label>
										<textarea id="about" name="about" class="form-control" rows="3" placeholder="About Me..."></textarea>
									</div>
									 
								   <div class="margiv-top10">
										<button class="btn btn-primary"  type="submit" onclick="saveProfile()"><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="button" >Cancel</button>
									</div>
                           
                     				</c:if> 
									
									
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
								      	 		<div class="col-sm-12 row form-group">	
								      	 		<div class="col-sm-6 no-padding">
								      	 			<div class="form-group">
														<label class="control-label">New Password</label>
														<input type="password" id="new_password" name="new_password" class="form-control">
													</div>
								      	 		</div>
								      	 		<div class="col-sm-6">
								      	 				<div class="form-group">
															<label for="confirm_password" class="control-label">Re-type New Password</label>
															<input type="password" id="confirm_password" name="confirm_password" class="form-control">
														</div>
								      	 		</div>
								      	 		</div>
								      	 		
								      	 		
									<div class="margiv-top10">
										<button class="btn btn-primary"  type="submit"><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="button" >Cancel</button>
									</div>
								</form>
							</div>
							<!-- /PASSWORD TAB -->
							<!-- PASSWORD TAB -->
							<div class="tab-pane fade" id="plans" >
								<table class="table table-bordered table-vertical-middle" id="plansDataTable">
									<thead>
										<tr>
											<th>Plan name</th>
											<th>Subscription Date</th>
											<th>Expired Date</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<form action="#" method="post">
									<div class="margiv-top10">
										<a href="../trainer/EditPricing" class="btn btn-primary">Subscribe</a>
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="media">
								<form role="form" action="#" method="post" name="social_media" id="social_media">
									<div class="form-group">
										<label for="media_website" class="control-label">Website Url</label>
										<input type="text" id="media_website" name="media_website" placeholder="http://www.yourwebsite.com" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Facebook</label>
										<input type="text" id="media_fb" name="media_fb" placeholder="facebook" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Twitter</label>
										<input type="text" id="media_tw" name="media_tw" placeholder="Twitter" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Google+</label>
										<input type="text" id="media_gplus" name="media_gplus" placeholder="Google+" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Linkedin</label>
										<input type="text" id="media_in" name="media_in" placeholder="Linkedin" class="form-control">
									</div>
									<div class="form-group">
										<label for="media_p" class="control-label">Pinterest</label>
										<input type="text" id="media_p" name="media_p" placeholder="Pinterest" class="form-control">
									</div>
									<div class="form-group">
										<label for="media_insta" class="control-label">Instagram</label>
										<input type="text" id="media_insta" name="media_insta" placeholder="Pinterest" class="form-control">
									</div>
									 <div class="margiv-top10">
										<button class="btn btn-primary"  type="button" onclick="saveSocialMedia();"><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default"  type="submit" >Cancel</button>
									</div>
								</form>
							</div>
							
							<div class="tab-pane fade" id="trainerImage">
								<form action="#" method="post" enctype="multipart/form-data" id="fileUploadForm">
									<div class="form-group">
										<div>
											<label class="control-label">Trainers page image</label>
										</div>
										<div>
											<input id="uploadFile" disabled="disabled" />
											<div class="fileUpload btn btn-primary">
											    <span>Bowse</span>
											    <input id="uploadBtn" type="file" name="files" class="upload" />
											</div>
											<button class="btn btn-primary red-color"  id="removeimagebtn" type="button"><i class="fa fa-times"></i> Remove</button>
										</div>
										<div class="preview-image" id="dvPreview">
										</div>
										<div>
											<button class="btn btn-primary" id="trainerimage" title="trainerimage"  type="button" onclick="uploadTrainerImages(this);"><i class="fa fa-upload"></i> Upload</button>
										</div>
									</div>
									</form>
									<form action="#" method="post" enctype="multipart/form-data" id="fileUploadLogoForm">
									<div class="form-group">
										<div>
											<label class="control-label">Trainer logo</label>
										</div>
										<div>
											<input id="uploadLogo" disabled="disabled" />
											<div class="fileUpload btn btn-primary">
											    <span>Bowse</span>
											    <input id="logouploadBtn" type="file" name="files" class="upload" />
											</div>
											<button class="btn btn-primary red-color"  id="removeimage" type="button"><i class="fa fa-times"></i> Remove</button>
										</div>
										<div class="preview-image" id="dvlogoPreview">
										</div>
										<div>
											<button class="btn btn-primary" id="logoimage" title="logoimage"  type="button" onclick="uploadTrainerLogos(this);"><i class="fa fa-upload"></i> Upload</button>
										</div>
									</div>
								</form>
							</div>
							
							<div class="tab-pane fade" id="skillSet">
							<form action="" role="form" method="post" name="skillSetForm" id="skillSetForm">
								<div class="after-add-more" id="skillSetSectionDiv">
								    <div class="form-group control-group after-add-more">
								      	<label for="skills" class="control-label">Key Skills</label>
								      		<div class="col-sm-12 row form-group">	
								      	 		<div class="col-sm-6 no-padding">
												 	<select class="form-control" id="skills_0" onchange="performCssChange(this);" name="skills_0">
													<option value="">Select</option>
													<option>Java</option>
													<option>AWS</option>
													<option>Linux</option>
													</select>
											 </div>
											 <div class="col-sm-6">
											 	<select class="form-control" id="years_0" name="years_0" onchange="performCssChange(this);">
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
											</div>
										</div> 
								   <input type="hidden" id="skilLSetId_1" name="skilLSetId_1">
								</div> 
								 <div>
								  	<button class="btn btn-default add-more"  type="button" onclick="addSkillSetDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
								  </div>
								<div class="row form-group">
						           <div class="col-sm-12">
						            <label>Languages</label>
						           	<div class="after-language-more" id="languageSectionDiv">
							      		<div class="col-sm-12 row form-group">	
							      	 		<div class="col-sm-4 no-padding">
							      	 			 <div class="form-group">
							      	 				<input type="text" class="form-control" id="language" name="language" placeholder="language">
								                 </div>
										 	</div>
										 	<div class="col-sm-6">
								              <label class="radio-inline">
								                <input type="checkbox" name="read" id="read" value="y"> Read
								              </label>
								              <label class="radio-inline">
								                <input type="checkbox" name="write" id="write" value="y"> Write
								              </label>
								              <label class="radio-inline">
								                <input type="checkbox" name="speak" id="speak" value="y"> Speak
								              </label>
								              <label for="modeType" style="display: block;" class="error"></label>
								            </div>
										 	<input type="hidden" id="languageId_1" name="languageId_1">
											  <div class="col-sm-1"> 
												<button class="btn btn-default add-more"  type="button" onclick="addlanguageDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
											  </div>
										</div>
									</div> 
						           </div>
								</div>
								<div class="row form-group">
						           <div class="col-sm-12">
						            <label>Certifications</label>
						           	<div class="after-certification-more" id="certificationSectionDiv">
							      		<div class="col-sm-12 row form-group">	
							      	 		<div class="col-sm-4 no-padding">
							      	 			 <div class="form-group">
							      	 				<input type="text" class="form-control" id="certificateName" name="certificateName" placeholder="Certification Name">
								                 </div>
										 	</div>
										 	<div class="col-sm-6">
								              <div class="form-group">
							      	 				<input type="text" class="form-control" id="issuedBy" name="issuedBy" placeholder="Issued By">
								                 </div>
								            </div>
										 	<input type="hidden" id="certificationId_1" name="certificationId_1">
											  <div class="col-sm-1"> 
												<button class="btn btn-default add-more"  type="button" onclick="addCertificationDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
											  </div>
										</div>
									</div> 
						           </div>
								</div>
							<div class="margiv-top10">
										<button class="btn btn-primary" type="button" onclick="saveSkillSetDetails()"><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default" type="submit">Cancel</button>
									</div>
						</form>
								
							</div>
							
							<div class="tab-pane fade" id="experience">
							<form action="" role="form" method="post" name="experienceForm" id="experienceForm">
								<div class="after-add-more" id="experienceSectionDiv">
								    <div class="form-group">
											 <label for="company" class="control-label">Company Name</label>
											<input type="text" class="form-control" name="company_0" onblur="performCssChange(this);" id="company_0">
										</div>
										<div class="form-group">
											 <label for="joiningDate" class="control-label">Designation</label>
											<input type="text" class="form-control" onblur="performCssChange(this);" name="designation_0" id="designation_0">
										</div>
										<div class="form-group">
										<div class="row">
										<div class="col-lg-12">
												<div class="col-lg-6 no-padding">
													<div class="form-group">
														 <label for="joiningDate" class="control-label">Joining Date</label>
														 <div class="input-group date" id="joiningDateSelector">
										                    <input class="form-control" onblur="performCssChange(this);" type="text" id="joiningDate_0" name="joiningDate_0">
										                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
										                    </span>
										                </div>
													</div>
												</div>
												<div class="col-lg-6">
													<div class="form-group">
														 <label for="lastDate" class="control-label">Last date</label>
														 <div class="input-group date" id="lastDateSelector">
										                    <input class="form-control" onblur="performCssChange(this);"  type="text" id="lastDate_0" name="lastDate_0">
										                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
										                    </span>
										                </div>
													</div>
												</div>
											</div>
										</div>
										</div>
										<input type="hidden" id="experienceId_1" name="experienceId_1">
								</div> 
								 <div>
								  	<button class="btn btn-default add-more"  type="button" onclick="addExperienceDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
								  </div>
							<div class="margiv-top10">
										<button class="btn btn-primary" type="button" onclick="saveExperienceDetails()"><i class="fa fa-check"></i> Save Changes</button>
										<button class="btn btn-default" type="submit">Cancel</button>
									</div>
						</form>
								
							</div>
							<div class="tab-pane fade" id="education">
								<form role="form" action="#" method="post" name="educationForm" id="educationForm">
								<div class="after-add-more" id="educationSectionDiv">
										<div class="form-group row">
											<div class="col-lg-12">
												<div class="row">
													<div class="col-lg-6">
														<div class="form-group">
															<label for="degree" class="control-label">Degree</label>
															 	<select class="form-control" id="degree_0" onchange="performCssChange(this);" name="degree_0">
																	<option value="">Select</option>
																	<option>SSC</option>
																	<option>Intermediate</option>
																	<option>Diploma</option>
																	<option>Degree</option>
																	<option>BTech / BE</option>
																	<option>MCA</option>
																	<option>MBA</option>
																	<option>MTech</option>
																</select>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="form-group">
															<label for="specialization" class="control-label">Specialization</label>
												 	<select class="form-control" id="specialization_0" onchange="performCssChange(this);" name="specialization_0">
														<option value="">Select</option>
														<option>MPC</option>
														<option>Bipc</option>
														<option>MEC</option>
														<option>ECE</option>
														<option>CSE</option>
														<option>EEE</option>
													</select>
														</div>
													</div>
								      	 		</div>
											</div>
										</div> 
										  <div class="form-group">
											 <label for="company" class="control-label">College Name</label>
											<input type="text" class="form-control" onblur="performCssChange(this);" name="collegeName_0" id="collegeName_0">
										</div>
										<div class="form-group row">
											<div class="col-lg-12">
												<div class="row">
													<div class="col-lg-6">
														<div class="form-group">
															 <label for="percentage" class="control-label">Percentage</label>
														 <input type="text" onblur="performCssChange(this);" class="form-control" name="percentage_0" id="percentage_0">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="form-group">
														 <label for="passedOut" class="control-label">Passed out Year</label>
															<div class="input-group date" id="passedOutDateSelector">
									                    <input class="form-control" onblur="performCssChange(this);" type="text" id="passedOut_0" name="passedOut_0">
									                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
									                    </span>
									                </div>
														</div>
													</div>
								      	 		</div>
											</div>
										</div> 
										<input type="hidden" id="educationId_1" name="educationId_1">
								</div> 
								 <div>
								  	<button class="btn btn-default add-more"  type="button" onclick="addeducationDiv();"><i class="fa fa-plus" aria-hidden="true"></i></button>
								  </div>
									 <div class="margiv-top10">
										<button class="btn btn-primary"  type="button" onclick="saveEducationDetails()"><i class="fa fa-check"></i> Save Changes</button>
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
							 <img alt="image" src="<%=request.getContextPath()%>/resources/images/no.jpg" class="profile-width image"/>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
					            <span class="pick-action">
					            	<i class="fa fa-camera" aria-hidden="true"></i>
					            </span>
					         </a>
					          <ul class="dropdown-menu pick-action-menu animated fadeInRight m-t-xs">
					            <li><a href="#" data-toggle="modal" data-target="#myModal" onclick="newPhoto()">Change Photo</a></li>
					            <li><a href="#" onclick="removePhoto()">Remove Photo</a></li>
					          </ul>
							
							<!-- <h3 class="size-11 margin-top-0 margin-bottom-10 text-muted">Art Director</h3> -->
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
			</div>
	</div>

	<!--  Include Footer  -->
	<%@ include file="/static/footer.html"%>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Select Profile Photos</h4>
			</div>
			<div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                <ul class="profile-tabs">
                 <li class="active"><a href="#overview" data-toggle="tab" aria-expanded="false">Upload Images</a></li>
                   <li class=""><a href="#your-photos" data-toggle="tab" aria-expanded="false">All Images</a></li>
                </ul>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 profile-desc-tabs">
                <div class="tab-content">
                	 <div class="tab-pane fade active in" id="overview">
                	 	<form action="#" method="post" enctype="multipart/form-data" id="prflImage">
	                	 	<div class="profile-photos-block">
									<div class="panel panel-default">
									  <div class="panel-body">
									  	<div class="row">
									  		<div class="col-md-12 text-center">
												<div id="upload-demo" style="width:350px"></div>
												<input type="file" id="upload" name="files">
									  		</div>
									  		<div id="uploader" onclick="$('#upload').click()">
											    <div class="select-file">Select a photo From your computer</div>
											</div>
									  		<!-- <div class="col-md-4" style="">
												<div id="upload-demo-i" style="background:#e1e1e1;width:300px;padding:30px;height:300px;margin-top:30px"></div>
									  		</div> -->
									  	</div>
								
									  </div>
									</div>
								<!-- <input type="file" name="userprofile_picture"  id="filePhoto" /> -->
	                  		</div>
	                  		<div class="modal-footer">
								<button type="submit" class="btn btn-default" data-dismiss="modal">Cancel</button>
								<button type="button" class="btn btn-primary upload-result" id="saveBtn" onclick="saveProfilePhoto()">Set as Profile photo</button>
							</div>
						</form>
                  	</div>
                  	 <div class="tab-pane fade" id="your-photos">
                  	 	<form action="#" method="post" id="prflYourPhotos">
	                	 	<div class="profile-photos-block image-select" id="altImg">
	                	 		<div class="row mrg-bt">
		                	 		<div class="col-sm-12">
			                  			<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p8.jpg"/>
										</div>
										<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p7.jpg"/>
										</div>
										<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p5.jpg"/>
										</div>
										<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p4.jpg"/>
										</div>
									</div>
								</div>
								<div class="row mrg-bt">
		                	 		<div class="col-sm-12">
			                  			<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p8.jpg"/>
										</div>
										<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p7.jpg"/>
										</div>
										<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p5.jpg"/>
										</div>
										<div class="col-sm-3">
											<img alt="image" src="../resources/assets/img/p6.jpg"/>
										</div>
									</div>
								</div>
								<div class="row mrg-bt">
									<a href="#">See More photos</a>
								</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="saveBtn1" onclick="setOtherPhotos(this)">Set as Profile photo</button>
								</div>
							</form>
                  		</div>
                  	</div>
                  </div>
                </div>
              </div> 
            </div>
		</div>
<script>
$(function () {
    // Handler for .ready() called.
    $(".image-select img").on("click",function(){
        event.preventDefault();
        $(this).toggleClass("active_img");
    })
});
</script>
<script type="text/javascript">
$uploadCrop = $('#upload-demo').croppie({
    enableExif: true,
    viewport: {
        width: 200,
        height: 200,
        type: 'square'
    },
    boundary: {
        width: 300,
        height: 300
    }
});
var reader = '';
$("#upload-demo").hide();
$("#upload").hide();
$('#upload').on('change', function () { 
	reader = new FileReader();
    reader.onload = function (e) {
    	$uploadCrop.croppie('bind', {
    		url: e.target.result
    	}).then(function(){
    		console.log('jQuery bind complete');
    	});
    	$("#upload-demo").show();
    	$("#uploader").hide()
    	$("#upload").show();
    }
    reader.readAsDataURL(this.files[0]);
});
/* 
$('.upload-result').on('click', function (ev) {
	$uploadCrop.croppie('result', {
		type: 'canvas',
		size: 'viewport'
	}).then(function (resp) {

		$.ajax({
			url: "/ajaxpro.php",
			type: "POST",
			data: {"image":resp},
			success: function (data) {
				html = '<img src="' + resp + '" />';
				$("#upload-demo-i").html(html);
			}
		});
	});
}); */
$(document).ready(function() {
	$('#joiningDateSelector').datetimepicker({
        format: 'DD/MM/YYYY'
	   });;
	$('#lastDateSelector').datetimepicker({
        format: 'DD/MM/YYYY'
	   });
	$('#inst_dateSelector').datetimepicker({
        format: 'DD/MM/YYYY'
	   });
	 $('#passedOutDateSelector').datetimepicker({
         format: 'YYYY'
   });
 
  });


</script>
<script>
document.getElementById("uploadBtn").onchange = function () {
    document.getElementById("uploadFile").value = this.value.split("\\").pop();
};
document.getElementById("logouploadBtn").onchange = function () {
    document.getElementById("uploadLogo").value = this.value.split("\\").pop();
};
var pageReader = '';
$(function () {
	$("#dvPreview").hide();
	$("#removeimagebtn").hide();
    $("#uploadBtn").change(function () {
    	$("#removeimagebtn").show();
             $("#dvPreview").show();
             $("#dvPreview").append("<img />");
             pageReader = new FileReader();
             reader.onload = function (e) {
                 $("#dvPreview img").attr("src", e.target.result);
             }
             pageReader.readAsDataURL($(this)[0].files[0]);
    });
});
var logoReader = '';
$(function () {
	$("#dvlogoPreview").hide();
	$("#removeimage").hide();
    $("#logouploadBtn").change(function () {
        $("#dvlogoPreview").html("");
        $("#removeimage").show();
        $("#dvlogoPreview").show();
        $("#dvlogoPreview").append("<img />");
        logoReader = new FileReader();
        logoReader.onload = function (e) {
            $("#dvlogoPreview img").attr("src", e.target.result);
        }
        logoReader.readAsDataURL($(this)[0].files[0]);
    });
});
/* $(document).ready(function(){
    $("#removeimage").click(function(){
        $("#dvlogoPreview").remove();
        $('#uploadLogo').attr({ value: '' }); 
        $("#removeimage").hide();
    });
}); */
</script>
</body>
</html>
