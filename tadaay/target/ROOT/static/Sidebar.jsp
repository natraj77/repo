<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <c:if test="${sessionScope.CURRENT_USER != null}" >   
	                            <c:if test="${sessionScope.CURRENT_USER.userType =='P'}" >
<nav class="navbar-default navbar-static-side" role="navigation">
  <div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
      <li class="nav-header">
        <div id="editprofilestep2" class="dropdown profile-element"> <span>
            <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" />
          </span>
          <a data-toggle="dropdown" class="dropdown-toggle" href="#" >
            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${instName} </strong>
            </span>
            </span>
            </a> <a href="../trainer/EditProfile">Profile</a>
        </div>
          <div class="logo-element">
              <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" width="40px"/>
          </div>
      </li>
      <li>
        <a href="../trainer/Dashboard"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span> </a>
      </li>
       <li id="addbranchestep3">
        <a href="../trainer/ShowBranches"><i class="fa fa-arrows" aria-hidden="true"></i> <span class="nav-label">Branches</span></a>
      </li>
      <li id="addcoursesstep4">
        <a href="../trainer/ShowCourses"><i class="fa fa-book" aria-hidden="true"></i> <span class="nav-label">Courses</span></a>
      </li>
      <li id="addfacultystep5">
        <a href="../trainer/ShowFaculty"><i class="fa fa-user" aria-hidden="true"></i> <span class="nav-label">Faculty</span></a>
      </li>
      <!--  <li>
        <a href="../trainer/ShowEmailTemplates"><i class="fa fa-columns" aria-hidden="true"></i> <span class="nav-label">Email Templates</span></a>
      </li> -->
     <!--  <li>
        <a href="../trainer/ShowRules"><i class="fa fa-gavel" aria-hidden="true"></i> <span class="nav-label">Rules</span></a>
      </li> -->
      <li id="addinvitesstep6">
        <a href="../trainer/ShowInvites"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Invite</span></a>
      </li>
      <li id="addleadsstep7">
        <a href="../trainer/ShowLeads"><i class="fa fa-line-chart" aria-hidden="true"></i> <span class="nav-label">Leads</span></a>
      </li>
       <li id="adddemosstep8">
        <a href="../trainer/ShowDemos"><i class="fa fa-desktop" aria-hidden="true"></i> <span class="nav-label">Demos</span></a>
      </li>
      <li id="addbatchesstep9">
        <a href="../trainer/ShowBatches"><i class="fa fa-users" aria-hidden="true"></i> <span class="nav-label">Batches</span></a>
      </li>
      <li id="addstudentsstep10">
        <a href="../trainer/ShowStudents"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <span class="nav-label">Students</span></a>
      </li>
      <li id="addpaymentsstep11">
        <a href="../trainer/ShowPayments"><i class="fa fa-money" aria-hidden="true"></i> <span class="nav-label">Payments</span></a>
      </li>
  		 
       <li id="addquizzesstep12" class="display-ul">
          <a href="javascript:void(0)"><i class="fa fa-question" aria-hidden="true"></i> <span class="nav-label">Quizzes</span><span class="fa arrow"></span></a>
          <ul class="nav nav-second-level collapse">
              <li><a href="../trainer/ShowQuizzes">Quizzes</a></li>
              <li><a href="../trainer/ShowQuizResults">Quiz Results</a></li>
          </ul>
      </li>
       <li id="addtasksstep13">
          <a href="javascript:void(0)"><i class="fa fa-tasks" aria-hidden="true"></i> <span class="nav-label">Tasks</span><span class="fa arrow"></span></a>
          <ul class="nav nav-second-level collapse">
              <li><a href="../trainer/ShowTasks">Tasks</a></li>
              <li><a href="../trainer/ShowTaskResults">task Results</a></li>
          </ul>
      </li>
       <!--  <li>
        <a href="../trainer/ShowTasks"><i class="fa fa-tasks" aria-hidden="true"></i> <span class="nav-label">Tasks</span></a>
      </li>
       <li>
        <a href="../trainer/ShowTaskResults"><i class="fa fa-tasks" aria-hidden="true"></i> <span class="nav-label">Task Results</span></a>
      </li> -->
    </ul>
  </div>
</nav>
<!-- <ul class="nav metismenu contact-nav">
       <li>
        <a href="../trainer/ShowSupportform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Support Form</span></a>
      </li>
       <li>
        <a href="../trainer/ShowFeedbackform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Feedback Form</span></a>
      </li>
      </ul> -->
 </c:if>
	                           
<c:if test="${sessionScope.CURRENT_USER.userType =='T'}" >
	<nav class="navbar-default navbar-static-side" role="navigation">
  <div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
      <li class="nav-header">
         <div class="dropdown profile-element"> <span>
            <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" />
          </span>
          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${firstName} ${lastName} </strong>
            </span>
            </span>
            </a> <a href="../trainer/EditProfile">Edit Profile</a>
        </div>
          <div class="logo-element">
              <img alt="image" class="img-circle" src="../resources/assets/img/a9.jpg" width="40px"/>
          </div>
      </li>
      <li>
        <a href="../trainer/Dashboard"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span> </a>
      </li>
        <li>
        <a href="../trainer/ShowCourses"><i class="fa fa-book" aria-hidden="true"></i> <span class="nav-label">Courses</span></a>
      </li>
      <li>
        <a href="../trainer/ShowInvites"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Invite</span></a>
      </li>
    </ul>
    </div>
</nav>
<!--  <ul class="nav metismenu contact-nav">
       <li>
        <a href="../trainer/ShowSupportform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Support Form</span></a>
      </li>
       <li>
        <a href="../trainer/ShowFeedbackform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Feedback Form</span></a>
      </li>
      </ul> -->
</c:if>
<c:if test="${sessionScope.CURRENT_USER.userType =='R'}" >
	<nav class="navbar-default navbar-static-side" role="navigation">
  <div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
      <li class="nav-header">
         <div class="dropdown profile-element"> <span>
            <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" />
          </span>
          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${firstName} ${lastName} </strong>
            </span>
            </span>
            </a> <a href="../recruiter/EditProfile">Edit Profile</a>
        </div>
          <div class="logo-element">
              <img alt="image" class="img-circle" src="../resources/assets/img/a9.jpg" width="40px"/>
          </div>
      </li>
      <li>
        <a href="../recruiter/Dashboard"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span> </a>
      </li>
        <li>
        <a href="../recruiter/invites"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Invite</span></a>
      </li>
       <li>
          <a href="javascript:void(0)"><i class="fa fa-question" aria-hidden="true"></i> <span class="nav-label">Quizzes</span><span class="fa arrow"></span></a>
          <ul class="nav nav-second-level collapse">
              <li><a href="../recruiter/ShowQuizzes">Quizzes</a></li>
              <li><a href="../recruiter/ShowQuizResults">Quiz Results</a></li>
          </ul>
      </li>
       <li>
          <a href="javascript:void(0)"><i class="fa fa-tasks" aria-hidden="true"></i> <span class="nav-label">Tasks</span><span class="fa arrow"></span></a>
          <ul class="nav nav-second-level collapse">
              <li><a href="../recruiter/ShowTasks">Tasks</a></li>
              <li><a href="../recruiter/ShowTaskResults">task Results</a></li>
          </ul>
      </li>
        <li>
        <a href="../recruiter/jobdescription"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Job Templates</span></a>
      </li>
        <li>
        <a href="../recruiter/jobpositions"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Positions</span></a>
      </li>
        <li>
        <a href="../recruiter/jobapplicants"><i class="fa fa-users" aria-hidden="true"></i> <span class="nav-label">Applicants</span></a>
      </li>
     <li>
        <a href="../recruiter/jobsubscriptions"><i class="fa fa-users" aria-hidden="true"></i> <span class="nav-label">Subscriptions</span></a>
      </li> 
    </ul>
    </div>
</nav>
  <ul class="nav metismenu contact-nav">
 <!--  <li>
   <a href="../recruiter/ShowSupportform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Support Form</span></a>
 </li> -->
  <li>
   <a href="../recruiter/ShowFeedbackform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Feedback Form</span></a>
 </li>
 </ul> 
</c:if>
<c:if test="${sessionScope.CURRENT_USER.userType =='U'}" >
	<nav class="navbar-default navbar-static-side" role="navigation">
  <div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
      <li id="step1"  class="nav-header">
         <div class="dropdown profile-element"> <span>
            <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" />
          </span>
         <a data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="true">
           <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${firstName} ${lastName}</strong>
            </span> <span class="text-muted text-xs block">Edit Profile <b class="caret"></b></span> </span> 
            </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="../student/EditProfile">Profile</a></li>
                            <li><a href="../student/settings">Settings</a></li>
                        </ul>
        </div>
          <div class="logo-element">
              <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" width="40px"/>
          </div>
      </li>
       <li>
        <a href="../student/Dashboard"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span> </a>
      </li>
        <li>
        <a href="../student/ShowDemos"><i class="fa fa-play" aria-hidden="true"></i> <span class="nav-label">Demos</span></a>
      </li>
      <li id="step2">
        <a href="../student/ShowBatches"><i class="fa fa-users" aria-hidden="true"></i> <span class="nav-label">Batches</span></a>
      </li>
      <li id="step3">
        <a href="../student/ShowPayments"><i class="fa fa-money" aria-hidden="true"></i> <span class="nav-label">Payments</span></a>
      </li>
      <li id="step4">
        <a href="../student/ShowQuizzes"><i class="fa fa-book" aria-hidden="true"></i> <span class="nav-label">Quizzes</span></a>
      </li>
      <li>
        <a href="../student/ShowTasks"><i class="fa fa-tasks" aria-hidden="true"></i> <span class="nav-label">Tasks</span></a>
      </li>
       <li>
        <a href="../student/Showinvites"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Invite</span></a>
      </li>
      <!--  <li>
        <a href="../student/settings"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Settings</span></a>
      </li> -->
    </ul>
    </div>
</nav>
<!--  <ul class="nav metismenu contact-nav">
       <li>
        <a href="../student/ShowSupportform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Support Form</span></a>
      </li>
       <li>
        <a href="../student/ShowFeedbackform"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span class="nav-label">Feedback Form</span></a>
      </li>
      </ul> -->
</c:if>
<c:if test="${sessionScope.CURRENT_USER.userType =='A'}" >
	<nav class="navbar-default navbar-static-side" role="navigation">
  <div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
      <li class="nav-header">
         <div class="dropdown profile-element"> <span>
             <img alt="image" class="img-circle" src="<%=request.getContextPath()%>/resources/images/no.jpg" />
          </span>
          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${firstName} ${lastName} </strong>
            </span>
            </span>
            </a> <a href="../admin/EditProfile">Edit Profile</a>
        </div>
       <div class="logo-element">
              <img alt="image" class="img-circle" src="../resources/assets/img/a9.jpg" width="40px"/>
          </div>
      </li>
      <li>
        <a href="../admin/Dashboard"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span> </a>
      </li>
      <li>
        <a href="../admin/ShowCourses"><i class="fa fa-book" aria-hidden="true"></i> <span class="nav-label">Courses</span></a>
      </li>
       <li>
        <a href="../admin/ShowTemplates"><i class="fa fa-columns" aria-hidden="true"></i> <span class="nav-label">Templates</span></a>
      </li>
        <li>
        <a href="../admin/ShowAdminEvents"><i class="fa fa-calendar" aria-hidden="true"></i> <span class="nav-label">Events</span></a>
      </li>
       <!--  <li>
        <a href="../admin/eventsubscription"><i class="fa fa-calendar" aria-hidden="true"></i> <span class="nav-label">Event Subscriptions</span></a>
      </li> -->
       <li>
        <a href="../admin/ShowAdminNews"><i class="fa fa-calendar" aria-hidden="true"></i> <span class="nav-label">News</span></a>
      </li>
       <li>
        <a href="../admin/ShowRules"><i class="fa fa-gavel" aria-hidden="true"></i> <span class="nav-label">Rules</span></a>
      </li>
      <li>
        <a href="../admin/students"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <span class="nav-label">Students</span></a>
      </li>
       <li>
        <a href="../admin/trainers"><i class="fa fa-user" aria-hidden="true"></i> <span class="nav-label">Trainers</span></a>
      </li>
       <li>
        <a href="../admin/institutes"><i class="fa fa-university" aria-hidden="true"></i> <span class="nav-label">Training Institutes</span></a>
      </li>
       <li>
        <a href="../admin/recruiters"><i class="fa fa-briefcase" aria-hidden="true"></i> <span class="nav-label">Recruiters</span></a>
      </li>
        <li>
        <a href="../admin/admins"><i class="fa fa-briefcase" aria-hidden="true"></i> <span class="nav-label">Admins</span></a>
      </li>
       <li>
        <a href="../admin/quizquestions"><i class="fa fa-briefcase" aria-hidden="true"></i> <span class="nav-label">Quiz Questions</span></a>
      </li>
    </ul>
  </div>
</nav>
</c:if>
</c:if>
