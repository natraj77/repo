
package com.polyglot.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.polyglot.domain.DmnCourse;
import com.polyglot.service.DmnCourseService;

import jxl.common.Logger;

@Controller
public class NavigationController {

	private static final Logger logger = Logger.getLogger(NavigationController.class);
	
	@Autowired
	public DmnCourseService coursesServ;
	
	@RequestMapping(path = "/trainer/ShowBranches", method = RequestMethod.GET)
	public String showBranches(HttpServletRequest request) {
		logger.debug("Showing branches");
		
		return "Branches";
	}
	
	@RequestMapping(path = "/trainer/ShowCourses", method = RequestMethod.GET)
	public String showCourses(HttpServletRequest request) {
		logger.debug("Showing courses");
		
		return "Courses";
	}
	
	@RequestMapping(path = "/trainer/ShowLeads", method = RequestMethod.GET)
	public String showLeads(HttpServletRequest request) {
		logger.debug("Showing Leads");
		
		return "Leads";
	}
	
	@RequestMapping(path = "/trainer/ShowFaculty", method = RequestMethod.GET)
	public String showFaculty(HttpServletRequest request) {
		logger.debug("Showing faculty");
		
		return "Faculty";
	}
	
	@RequestMapping(path = "/trainer/ShowBatches", method = RequestMethod.GET)
	public String showBatches(HttpServletRequest request) {
		logger.debug("Showing batches");
		
		return "Batches";
	}
	
	@RequestMapping(path = "/trainer/ShowDemos", method = RequestMethod.GET)
	public String showDemos(HttpServletRequest request) {
		logger.debug("Showing demos");
		
		return "Demos";
	}
	
	@RequestMapping(path = "/trainer/ShowRules", method = RequestMethod.GET)
	public String showRules(HttpServletRequest request) {
		logger.debug("Showing rules");
		
		return "Rules";
	}
	
	@RequestMapping(path = "/trainer/ShowStudents", method = RequestMethod.GET)
	public String showStudents(HttpServletRequest request) {
		logger.debug("Showing students");
		
		return "Students";
	}
	
	@RequestMapping(path = "/trainer/ShowPayments", method = RequestMethod.GET)
	public String showPayments(HttpServletRequest request) {
		logger.debug("Showing payments");
		
		return "Payments";
	}
	@RequestMapping(path = "/about", method = RequestMethod.GET)
	public String about(HttpServletRequest request) {
		logger.debug("Showing about");
		
		return "About";
	}
	@RequestMapping(path = "/IT-courses", method = RequestMethod.GET)
	public String allCourses(HttpServletRequest request) {
		logger.debug("Showing ITcourses");
		
		return "ITCourses";
	}

	@RequestMapping(path = "/IT-trainers", method = RequestMethod.GET)
	public String allTrainers(HttpServletRequest request) {
		logger.debug("Showing ITtrainers");
		
		return "ITTrainers";
	}

	@RequestMapping(path = "/videos", method = RequestMethod.GET)
	public String videos(HttpServletRequest request) {
		logger.debug("Showing videos");
		
		return "Videos";
	}
	@RequestMapping(path = "/course", method = RequestMethod.GET)
	public String course(HttpServletRequest request) {
		logger.debug("Showing course");
		
		return "Course";
	}
	
	@RequestMapping(path = "/trainer/EditProfile", method = RequestMethod.GET)
	public String editProfile(HttpServletRequest request) {
		logger.debug("Edit Profile");
		
		return "Profile";
	}
	
	@RequestMapping(path = "/trainer/EditPricing", method = RequestMethod.GET)
	public String editPricing(HttpServletRequest request) {
		logger.debug("Edit Pricing");
		
		return "Pricing";
	}
	
	@RequestMapping(path = "/comingsoon", method = RequestMethod.GET)
	public String comingSoon(HttpServletRequest request) {
		logger.debug("Showing comingsoon");
		
		return "ComingSoon";
	}
	@RequestMapping(path = "/404", method = RequestMethod.GET)
	public String pageNotFound(HttpServletRequest request) {
		logger.debug("Showing 404");
		
		return "404";
	}
	@RequestMapping(path = "/ServerError", method = RequestMethod.GET)
	public String servererror(HttpServletRequest request) {
		logger.debug("Showing servererror");
		
		return "ServerError";
	}
	@RequestMapping(path = "/trainer/ShowEmailTemplates", method = RequestMethod.GET)
	public String showEmailTemplates(HttpServletRequest request) {
		logger.debug("Showing emailtemplates");
		
		return "EmailTemplates";
	}
	@RequestMapping(path = "/trainer/ShowInvites", method = RequestMethod.GET)
	public String Invites(HttpServletRequest request) {
		logger.debug("Showing Invites");
		
		return "Invites";
	}
	@RequestMapping(path = "/trainer/ShowQuizzes", method = RequestMethod.GET)
	public String Quizzes(HttpServletRequest request) {
		logger.debug("Showing Quizzes");
		
		return "Quizzes";
	}
	@RequestMapping(path = "/trainer/ShowQuizResults", method = RequestMethod.GET)
	public String QuizResult(HttpServletRequest request) {
		logger.debug("Showing QuizResult");
		
		return "QuizResults";
	}
	@RequestMapping(path = "/trainer/ShowTasks", method = RequestMethod.GET)
	public String Tasks(HttpServletRequest request) {
		logger.debug("Showing Tasks");
		
		return "Tasks";
	}
	@RequestMapping(path = "/trainer/ShowTaskResults", method = RequestMethod.GET)
	public String TaskResults(HttpServletRequest request) {
		logger.debug("Showing TaskResults");
		
		return "TaskResults";
	}
	
	@RequestMapping(path = "/news", method = RequestMethod.GET)
	public String news(HttpServletRequest request) {
		logger.debug("Showing news");
		
		return "ComingSoon";
	}
	@RequestMapping(path = "/events", method = RequestMethod.GET)
	public String events(HttpServletRequest request) {
		logger.debug("Showing events");
		
		return "AllEvents";
	}
	@RequestMapping(path = "/eventdetails", method = RequestMethod.GET)
	public String eventdetails(HttpServletRequest request) {
		logger.debug("Showing event details");
		
		return "Eventdetails";
	}
	@RequestMapping(path = "/sitemap", method = RequestMethod.GET)
	public String sitemap(HttpServletRequest request) {
		logger.debug("Showing sitemap");
		
		return "Sitemap";
	}
	@RequestMapping(path = "/contact", method = RequestMethod.GET)
	public String contact(HttpServletRequest request) {
		logger.debug("Showing contact");
		
		return "Contact";
	}
	@RequestMapping(path = "/student/ShowBatches", method = RequestMethod.GET)
	public String showStudentBatches(HttpServletRequest request) {
		logger.debug("Showing StudentBatches");
		
		return "StudentBatches";
	}
	@RequestMapping(path = "/student/Dashboard", method = RequestMethod.GET)
	public String showStudentDashboard(HttpServletRequest request) {
		logger.debug("Showing StudentDashboard");
		
		return "StudentDashboard";
	}
	@RequestMapping(path = "/student/ShowDemos", method = RequestMethod.GET)
	public String showStudentDemos(HttpServletRequest request) {
		logger.debug("Showing StudentDemos");
		
		return "StudentDemos";
	}
	@RequestMapping(path = "/student/ShowPayments", method = RequestMethod.GET)
	public String showStudentPayments(HttpServletRequest request) {
		logger.debug("Showing StudentPayments");
		
		return "StudentPayments";
	}
	@RequestMapping(path = "/student/ShowQuizzes", method = RequestMethod.GET)
	public String showStudentQuizzes(HttpServletRequest request) {
		logger.debug("Showing StudentQuizzes");
		
		return "StudentQuizzes";
	}
	@RequestMapping(path = "/student/EditProfile", method = RequestMethod.GET)
	public String showStudentEditProfile(HttpServletRequest request) {
		logger.debug("Showing StudentEditProfile");
		
		return "Profile";
	}
	@RequestMapping(path = "/student/ShowTasks", method = RequestMethod.GET)
	public String showTasks(HttpServletRequest request) {
		logger.debug("Showing StudentTasks");
		
		return "StudentTasks";
	}
	@RequestMapping(path = "/trainer/Dashboard", method = RequestMethod.GET)
	public String showDashboard(HttpServletRequest request) {
		logger.debug("Showing Dashboard");
		
		return "Dashboard";
	}
	@RequestMapping(path = "/trainingInstitute/Dashboard", method = RequestMethod.GET)
	public String showtrainingInstituteDashboard(HttpServletRequest request) {
		logger.debug("Showing trainingInstituteDashboard");
		
		return "Dashboard";
	}
	@RequestMapping(path = "/Signup", method = RequestMethod.GET)
	public String showSignup(HttpServletRequest request) {
		logger.debug("Showing Signup");
		
		return "Signup";
	}
	@RequestMapping(path = "/Login", method = RequestMethod.GET)
	public String showLogin(HttpServletRequest request) {
		logger.debug("Showing Login");
		
		return "Login";
	}
	@RequestMapping(path = "/ResetPassword", method = RequestMethod.GET)
	public String showResetPassword(HttpServletRequest request) {
		logger.debug("Showing ResetPassword");
		
		return "ResetPassword";
	}
	@RequestMapping(path = "/robots.txt", method = RequestMethod.GET)
	public String showRobot(HttpServletRequest request) {
		logger.debug("Showing Robot");
		
		return "Robot";
	}
	@RequestMapping(path = "/sitemap.xml", method = RequestMethod.GET)
	public String showSitemap(HttpServletRequest request) {
		logger.debug("Showing Sitemap");
		
		return "Sitemap";
	}
	@RequestMapping(path = "/recruiter/Dashboard", method = RequestMethod.GET)
	public String showRecruiterDashboard(HttpServletRequest request) {
		logger.debug("Showing Dashboard");
		
		return "RecruiterDashboard";
	}
	@RequestMapping(path = "/recruiter/ShowInvites", method = RequestMethod.GET)
	public String showRecruiterInvites(HttpServletRequest request) {
		logger.debug("Showing Invites");
		
		return "Invites";
	}
	@RequestMapping(path = "/recruiter/ShowQuizzes", method = RequestMethod.GET)
	public String showRecruiterQuizzes(HttpServletRequest request) {
		logger.debug("Showing RecruiterQuizzes");
		
		return "Quizzes";
	}
	@RequestMapping(path = "/recruiter/ShowQuizResults", method = RequestMethod.GET)
	public String showRecruiterQuizResults(HttpServletRequest request) {
		logger.debug("Showing QuizResults");
		
		return "QuizResults";
	}
	@RequestMapping(path = "/recruiter/ShowTasks", method = RequestMethod.GET)
	public String showRecruiterTasks(HttpServletRequest request) {
		logger.debug("Showing RecruiterTasks");
		
		return "Tasks";
	}
	@RequestMapping(path = "/recruiter/ShowTaskResults", method = RequestMethod.GET)
	public String showRecruiterTaskResults(HttpServletRequest request) {
		logger.debug("Showing TaskResults");
		
		return "TaskResults";
	}
	@RequestMapping(path = "/recruiter/EditProfile", method = RequestMethod.GET)
	public String showRecruiterEditProfile(HttpServletRequest request) {
		logger.debug("Showing RecruiterEditProfile");
		
		return "Profile";
	}
	@RequestMapping(path = "/admin/Dashboard", method = RequestMethod.GET)
	public String showAdminDashboard(HttpServletRequest request) {
		logger.debug("Showing Dashboard");
		
		return "AdminDashboard";
	}

	@RequestMapping(path = "/admin/ShowRules", method = RequestMethod.GET)
	public String showAdminRules(HttpServletRequest request) {
		logger.debug("Showing Rules");
		
		return "AdminRules";
	}
	@RequestMapping(path = "/admin/EditProfile", method = RequestMethod.GET)
	public String showAdminEditProfile(HttpServletRequest request) {
		logger.debug("Showing AdminEditProfile");
		
		return "Profile";
	}
	
	@RequestMapping(path = "/admin/ShowCourses", method = RequestMethod.GET)
	public ModelAndView showAdminCourses(HttpServletRequest request) {
		logger.debug("Showing Courses");
		ModelAndView view = new ModelAndView();
		view.setViewName("AdminCourses");
		 List<DmnCourse> courses = new LinkedList<DmnCourse>();
		Set<String> domainList = new HashSet<String>();
	    Set<String> categoryList = new HashSet<String>();
	    Set<String> subCategoryList = new HashSet<String>();
	    Map<String,String> courseList = new HashMap<String,String>();
		  courses.addAll(coursesServ.getAll());
		  for (DmnCourse c : courses) {
			  if(c.getDomain()!=null && !c.getDomain().isEmpty()){
					domainList.add("'"+c.getDomain()+"'");
				}
				if(c.getCategory()!=null && !c.getCategory().isEmpty()){
				categoryList.add("'"+c.getCategory()+"'");
				}
				if(c.getSubCategory()!=null && !c.getSubCategory().isEmpty()){
				subCategoryList.add("'"+c.getSubCategory()+"'");
				}
				if(c.getCourseName()!=null && !c.getCourseName().isEmpty()){
					courseList.put(String.valueOf(c.getId()),c.getCourseName());
				}
		  }
		  view.addObject("domainList", domainList);
		  view.addObject("categoryList", categoryList);
		  view.addObject("subCategoryList", subCategoryList);
		  view.addObject("courseMap", courseList);
		return view;
	}
	
	@RequestMapping(value = "/admin/getCoursesInfo", method = RequestMethod.GET)
	public @ResponseBody JSONObject getAdminCoursesData(HttpServletRequest request) {
		logger.debug("Inside show Courses.");
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    //List<DmnCourse> list = new LinkedList<DmnCourse>();
		    List<DmnCourse> filtered = new LinkedList<DmnCourse>();
		    List<DmnCourse> courses = new LinkedList<DmnCourse>();
		    courses.addAll(coursesServ.getAll());
		    
		    iTotalRecords = courses.size();
		    if (sSearch != null) {
				for (DmnCourse c : courses) {
					
					if ((c.getCourseName()!=null && c.getCourseName().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getDomain()!=null && c.getDomain().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getCategory()!=null && c.getCategory().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getSubCategory()!=null && c.getSubCategory().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getImagePath()!=null && c.getImagePath().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getCompImagePath()!=null && c.getCompImagePath().toLowerCase().contains(sSearch.toLowerCase())) ||
							c.getLevel()!=null && c.getLevel().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getMetaKeywords()!=null && c.getMetaKeywords().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getMetaDescription()!=null && c.getMetaDescription().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getMetaCourseTitle()!=null && c.getMetaCourseTitle().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getCourseTitle()!=null && c.getCourseTitle().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getFeatured()!=null && c.getFeatured().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getTemplate()!=null && c.getTemplate().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getKeywords()!=null && c.getKeywords().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getCourseDesc()!=null && c.getCourseDesc().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getPriortyNo()!=null && c.getPriortyNo().equals(sSearch.toLowerCase()) ||
							c.getRelatedCourses()!=null && c.getRelatedCourses().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getCourseIdentifier()!=null && c.getCourseIdentifier().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getAddCourseInfo()!=null && c.getAddCourseInfo().toLowerCase().contains(sSearch.toLowerCase())) {
						filtered.add(c); // Add a company that matches search criterion
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	courses = filtered;
		    } else {
		    	iTotalDisplayRecords = courses.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = courses.size();
		    
		    if(courses.size()< iDisplayStart + iDisplayLength)
		    	courses = courses.subList(iDisplayStart, courses.size());
		    else
		    	courses = courses.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(courses, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading branch data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(path = "/coursesList", method = RequestMethod.GET)
	public String fetchAllCourses(HttpServletRequest request) {
		logger.debug("Showing ITcourses");		
		return "AllCourses";
	}
	@RequestMapping(path = "/AllQuizzes", method = RequestMethod.GET)
	public String AllQuizzes(HttpServletRequest request) {
		logger.debug("Showing AllQuizzes");
		
		return "AllQuizzes";
	}
	
	@RequestMapping(path = "/Quiz", method = RequestMethod.GET)
	public String Quiz(HttpServletRequest request) {
		logger.debug("Showing Quiz");
		
		return "Quiz";
	}
	@RequestMapping(path = "/AllVideos", method = RequestMethod.GET)
	public String AllVideos(HttpServletRequest request) {
		logger.debug("Showing AllVideos");
		
		return "AllVideos";
	}
	@RequestMapping(path = "/DetailVideo", method = RequestMethod.GET)
	public String DetailVideo(HttpServletRequest request) {
		logger.debug("Showing DetailVideo");
		
		return "DetailVideo";
	}
	@RequestMapping(path = "/SingleVideo", method = RequestMethod.GET)
	public String SingleVideo(HttpServletRequest request) {
		logger.debug("Showing SingleVideo");
		
		return "SingleVideo";
	}
	
	@RequestMapping(path = "/signup/student", method = RequestMethod.GET)
	public String StudentSignup(HttpServletRequest request) {
		logger.debug("Showing StudentSignup");
		
		return "StudentSignup";
	}
	@RequestMapping(path = "/signup/trainer", method = RequestMethod.GET)
	public String TrainerSignup(HttpServletRequest request) {
		logger.debug("Showing TrainerSignup");
		
		return "TrainerSignup";
	}
	@RequestMapping(path = "/signup/training-institute", method = RequestMethod.GET)
	public String TrainingInstituteSignup(HttpServletRequest request) {
		logger.debug("Showing TrainingInstituteSignup");
		
		return "TrainingInstituteSignup";
	}
	@RequestMapping(path = "/signup/recruiter", method = RequestMethod.GET)
	public String RecruiteSignup(HttpServletRequest request) {
		logger.debug("Showing RecruiterSignup");
		
		return "RecruiterSignup";
	}
	@RequestMapping(path = "/maintenance", method = RequestMethod.GET)
	public String MaintenancePage(HttpServletRequest request) {
		logger.debug("Showing MaintenancePage");
		
		return "MaintenancePage";
	}
	@RequestMapping(path = "/mindmap", method = RequestMethod.GET)
	public String Mindmap(HttpServletRequest request) {
		logger.debug("Showing Mindmap");
		
		return "Mindmap";
	}
	
	@RequestMapping(path = "/recruiter/invites", method = RequestMethod.GET)
	public String RecruiterInvites(HttpServletRequest request) {
		logger.debug("Showing RecruiterInvites");
		
		return "Invites";
	}
	@RequestMapping(path = "/index2", method = RequestMethod.GET)
	public String secondindex(HttpServletRequest request) {
		logger.debug("Showing secondindex");
		
		return "secondindex";
	}
	@RequestMapping(path = "trainer/ShowSupportform", method = RequestMethod.GET)
	public String Supportform(HttpServletRequest request) {
		logger.debug("Showing Supportform");
		
		return "SupportForm";
	}
	@RequestMapping(path = "trainer/ShowFeedbackform", method = RequestMethod.GET)
	public String Feedbackform(HttpServletRequest request) {
		logger.debug("Showing Feedbackform");
		
		return "FeedbackForm";
	}
	@RequestMapping(path = "student/ShowSupportform", method = RequestMethod.GET)
	public String studentSupportform(HttpServletRequest request) {
		logger.debug("Showing studentSupportform");
		
		return "SupportForm";
	}
	@RequestMapping(path = "student/ShowFeedbackform", method = RequestMethod.GET)
	public String studentFeedbackform(HttpServletRequest request) {
		logger.debug("Showing studentFeedbackform");
		
		return "FeedbackForm";
	}
	@RequestMapping(path = "recruiter/ShowSupportform", method = RequestMethod.GET)
	public String recruiterSupportform(HttpServletRequest request) {
		logger.debug("Showing recruiterSupportform");
		
		return "SupportForm";
	}
	@RequestMapping(path = "recruiter/ShowFeedbackform", method = RequestMethod.GET)
	public String recruiterFeedbackform(HttpServletRequest request) {
		logger.debug("Showing recruiterFeedbackform");
		
		return "FeedbackForm";
	}
	@RequestMapping(path = "/student/Showinvites", method = RequestMethod.GET)
	public String showinvites(HttpServletRequest request) {
		logger.debug("Showing Studentinvites");
		
		return "Invites";
	}
	@RequestMapping(path = "/recruiter/jobdescription", method = RequestMethod.GET)
	public String showjobdescription(HttpServletRequest request) {
		logger.debug("Showing jobdescription");
		
		return "JobDescription";
	}
	@RequestMapping(path = "/recruiter/jobpositions", method = RequestMethod.GET)
	public String showjobpositions(HttpServletRequest request) {
		logger.debug("Showing jobpositions");
		
		return "JobPositions";
	}
	@RequestMapping(path = "/recruiter/jobapplicants", method = RequestMethod.GET)
	public String showjobapplicants(HttpServletRequest request) {
		logger.debug("Showing jobapplicants");
		
		return "JobApplicants";
	}
	@RequestMapping(path = "/recruiter/jobsubscriptions", method = RequestMethod.GET)
	public String showjobsubscriptions(HttpServletRequest request) {
		logger.debug("Showing jobsubscriptions");
		
		return "JobSubscriptions";
	}
	@RequestMapping(path = "/student/settings", method = RequestMethod.GET)
	public String showstudentsettings(HttpServletRequest request) {
		logger.debug("Showing studentsettings");
		
		return "StudentSettings";
	}
	@RequestMapping(path = "/admin/students", method = RequestMethod.GET)
	public String showstudents(HttpServletRequest request) {
		logger.debug("Showing adminstudents");
		
		return "AdminStudents";
	}
	@RequestMapping(path = "/admin/trainers", method = RequestMethod.GET)
	public String showtrainers(HttpServletRequest request) {
		logger.debug("Showing admintrainers");
		
		return "AdminTrainers";
	}
	@RequestMapping(path = "/admin/institutes", method = RequestMethod.GET)
	public String showinstitutes(HttpServletRequest request) {
		logger.debug("Showing admininstitutes");
		
		return "AdminInstitutes";
	}
	@RequestMapping(path = "/admin/recruiters", method = RequestMethod.GET)
	public String showrecruiters(HttpServletRequest request) {
		logger.debug("Showing adminrecruiters");
		
		return "AdminRecruiters";
	}
	@RequestMapping(path = "/admin/admins", method = RequestMethod.GET)
	public String showadmins(HttpServletRequest request) {
		logger.debug("Showing admins");
		
		return "Admins";
	}
	@RequestMapping(path = "alljobs", method = RequestMethod.GET)
	public String showalljobs(HttpServletRequest request) {
		logger.debug("Showing alljobs");
		
		return "AllJobs";
	}
	@RequestMapping(path = "jobdetails", method = RequestMethod.GET)
	public String showjobdetails(HttpServletRequest request) {
		logger.debug("Showing jobdetails");
		
		return "JobDetails";
	}
	@RequestMapping(path = "jobshome", method = RequestMethod.GET)
	public String showjobshome(HttpServletRequest request) {
		logger.debug("Showing jobshome");
		
		return "JobsHome";
	}
	@RequestMapping(path = "/admin/quizquestions", method = RequestMethod.GET)
	public String showquizquestions(HttpServletRequest request) {
		logger.debug("Showing quizquestions");
		
		return "AdminQuizQuestions";
	}
	@RequestMapping(path = "admin/eventsubscription", method = RequestMethod.GET)
	public String showeventsubscription(HttpServletRequest request) {
		logger.debug("Showing eventsubscription");
		
		return "EventSubscriptions";
	}
	@RequestMapping(path = "quiz-terms", method = RequestMethod.GET)
	public String showquizterms(HttpServletRequest request) {
		logger.debug("Showing quizterms");
		
		return "QuizTerms";
	}
	@RequestMapping(path = "termsandconditions", method = RequestMethod.GET)
	public String showtermsandconditions(HttpServletRequest request) {
		logger.debug("Showing termsandconditions");
		
		return "TadaayTermsConditions";
	}
	
}
