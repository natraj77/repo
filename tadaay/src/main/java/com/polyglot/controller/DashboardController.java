package com.polyglot.controller;

import java.sql.Timestamp;
import java.time.YearMonth;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.domain.AppPolyglotChart;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppPolyglotPayment;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.DmnCourse;
import com.polyglot.domain.User;
import com.polyglot.service.AppPolyglotBatchService;
import com.polyglot.service.AppPolyglotBranchService;
import com.polyglot.service.AppPolyglotCourseService;
import com.polyglot.service.AppPolyglotFacultyService;
import com.polyglot.service.AppPolyglotLeadService;
import com.polyglot.service.AppPolyglotPaymentService;
import com.polyglot.service.AppPolyglotRegistrationService;
import com.polyglot.service.DmnCourseService;
import com.polyglot.utils.PolyglotConstants;
import com.polyglot.utils.PolyglotFileUtils;

@Controller
public class DashboardController {
	
	private static final Logger logger = Logger.getLogger(DashboardController.class);

	@Autowired
	private AppPolyglotCourseService appCourseService;
	
	@Autowired
	private AppPolyglotBranchService branchService;
	
	@Autowired
	private AppPolyglotLeadService leadService;
	
	@Autowired
	private AppPolyglotFacultyService appFacultyService;
	
	@Autowired
	private AppPolyglotBatchService batchService;
	
	@Autowired
	private AppPolyglotRegistrationService  registrationService;

	@Autowired
	private DmnCourseService courseService;
	
	@Autowired
	private AppPolyglotPaymentService paymentService;
	
	@RequestMapping(value="/getTrainerDashboardDtls",method=RequestMethod.POST)
	public @ResponseBody JSONObject  getTrainerDashboardDtls(HttpSession session){
		logger.debug("Inside getTrainerDashboardDtls");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		List<AppPolyglotCourse> lstOfCourses = new ArrayList<AppPolyglotCourse>();
		List<AppPolyglotFaculty> lstOfFaculty = new ArrayList<AppPolyglotFaculty>();
		List<AppPolyglotBranch> lstOfBranches = new ArrayList<AppPolyglotBranch>();
		List<AppPolyglotBatch> lstInprogressBatches = new ArrayList<AppPolyglotBatch>();
		List<AppPolyglotBatch> lstOfSchduledBatches = new ArrayList<AppPolyglotBatch>();
		
		try{
			Map<String, String> params = new HashMap<String, String>();
			String sql = "from AppPolyglotCourse c where c.appUsers =:partnerId";
			params.put("partnerId", String.valueOf(loggedInUser.getId()));
			//courses offered
			lstOfCourses = appCourseService.runQuery(sql, params);
			sql = "select distinct facultyId from AppPolyglotFaculty f where f.appUsers =:partnerId";
			//trainers available
			lstOfFaculty = appFacultyService.runQuery(sql, params);
			logger.debug("lstOfFaculty size is:"+lstOfFaculty.size());
			sql = "from AppPolyglotBranch b where b.appUsers =:partnerId";
			//branches
			lstOfBranches = branchService.runQuery(sql, params);
			//batches ongoing
			sql = "from AppPolyglotBatch c where c.appUsers =:partnerId and c.batchStatus=:batchStatus";
			params.put("batchStatus", PolyglotConstants.BATCH_STATUS_IN_PROGRESS);
			lstInprogressBatches = batchService.runQuery(sql, params);
			//batches upcoming
			sql = "from AppPolyglotBatch c where c.appUsers =:partnerId and c.batchStatus=:batchStatus";
			params.put("batchStatus", PolyglotConstants.BATCH_STATUS_SCHEDULED);
			lstOfSchduledBatches = batchService.runQuery(sql, params);
			
		}catch(Exception ex){
			logger.error("Error Occured preparing the dashboard details for trainer:"+ex, ex);
		}
		returnObj.accumulate("coursesCount", lstOfCourses.size());
		returnObj.accumulate("trainerCount", lstOfFaculty.size());
		returnObj.accumulate("branchesCount", lstOfBranches.size());
		returnObj.accumulate("batchOngCount", lstInprogressBatches.size());
		returnObj.accumulate("batchSchCount", lstOfSchduledBatches.size());
		logger.debug("Exit getTrainerDashboardDtls");
		return returnObj;
	}
	
	@RequestMapping(value="/getLeadByCourse",method=RequestMethod.GET)
	public @ResponseBody JSONObject  getLeadByCourse(HttpSession session){
		logger.debug("Inside getLeadByCourse");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		List<AppPolyglotLead> lstOfLeads = new ArrayList<AppPolyglotLead>();
		List<AppPolyglotLead> lstOfLeadsByCourse = new ArrayList<AppPolyglotLead>();
		AppPolyglotChart chart = null;
		List<AppPolyglotChart> lstOfChart = new ArrayList<AppPolyglotChart>();
		try{
			//leads by course
			Map<String, String> paramLeads = new HashMap<String, String>();
			String sql = "from AppPolyglotLead c where c.partnerId =:partnerId and c.leadStatus=:leadStatus group by c.courseId";
			//sql = "select count(l.id) as count, dmn.courseName from AppPolyglotLead l, DmnCourse dmn where l.courseId = dmn.id and l.partnerId =:partnerId and l.leadStatus=:leadStatus group by l.courseId";
			paramLeads.put("partnerId", String.valueOf(loggedInUser.getId()));
			paramLeads.put("leadStatus", PolyglotConstants.INVITED);
			lstOfLeads = leadService.runQuery(sql, paramLeads);
			paramLeads.remove("partnerId");//removing from map as same map can be used for below other queries
			for(AppPolyglotLead lead: lstOfLeads){
				chart = new AppPolyglotChart();
				sql = "from AppPolyglotLead where courseId=:courseId and leadStatus=:leadStatus";
				paramLeads.put("courseId", String.valueOf(lead.getCourseId()));
				lstOfLeadsByCourse = leadService.runQuery(sql, paramLeads);
				//get domain_course_id based on lead course id
				AppPolyglotCourse courseObj = appCourseService.load(lead.getCourseId());
				DmnCourse course = courseService.load(null != courseObj ? courseObj.getDmnCourseId():null);
				if(null != course && null != lstOfLeadsByCourse){
					chart.setCourseName(course.getCourseName());
					chart.setCourseCount(String.valueOf(lstOfLeadsByCourse.size()));
					lstOfChart.add(chart);
				}
			}
			logger.debug("lstOfChart is:"+lstOfChart);
			
		}catch(Exception ex){
			logger.error("Error Occured preparing the dashboard details for trainer:"+ex, ex);
		}
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray array = JSONArray.fromObject(lstOfChart, config);
		returnObj.accumulate("aaData", array);
		logger.debug("Exit getLeadByCourse");
		return returnObj;
	}
	
	@RequestMapping(value="/getLeadConversionByMonth",method=RequestMethod.GET)
	public @ResponseBody JSONObject getLeadConversionByMonth(HttpSession session){
		logger.debug("Inside getLeadConversionByMonth");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		List<AppPolyglotLead> lstLeadsByMonths = new ArrayList<AppPolyglotLead>();
		AppPolyglotChart leadUsr = null;
		Set<String> sourceLst = new HashSet<String>();
		List<AppPolyglotChart> lstOfCharts = new ArrayList<AppPolyglotChart>();
		Set<String> monthsObj = new LinkedHashSet<String>();
		List<AppPolyglotLead> lstConversionByMonths = new ArrayList<AppPolyglotLead>();
		//leads by month
		try {
			//prepare unique source names for given partner id
			String sourceSql = "from AppPolyglotLead where partnerId =:partnerId";
			Map<String, String> paramSrc = new HashMap<String, String>();
			paramSrc.put("partnerId", String.valueOf(loggedInUser.getId()));
			List<AppPolyglotLead> lstOfSrcLeads = leadService.runQuery(sourceSql, paramSrc);
			
			if(!PolyglotFileUtils.isEmpty(lstOfSrcLeads)){
				for(AppPolyglotLead srcObj: lstOfSrcLeads){
					if(null != srcObj && null != srcObj.getSource()){
						sourceLst.add(srcObj.getSource().trim());
					}
				}
			}
			logger.debug("sourceLst is:"+sourceLst);
			String sql = null;
			Map<String, String> params = new HashMap<String, String>();
			//get the current year for querying the dash board data
		    int year = Calendar.getInstance().get(Calendar.YEAR);
		    
		    //leads by source
		    for(String source: sourceLst){
		    	logger.debug("Source value is:"+source);
		    	for(int i=0;i<12;i++){
		    		leadUsr = new AppPolyglotChart();
					//params.put("partnerId", String.valueOf(loggedInUser.getId()));
					if(i==0){
						monthsObj.add(YearMonth.now().getMonth().name());
						leadUsr.setLeadByMonth(YearMonth.now().getMonth().name());
					}else{
						monthsObj.add(YearMonth.now().minusMonths(i).getMonth().name());
						leadUsr.setLeadByMonth(YearMonth.now().minusMonths(i).getMonth().name());
					}
					//get the total lead count and converted lead count based on source
					sql = "from AppPolyglotLead c where month(c.createdDate) =:month"
							+ " and year(c.createdDate) =:year and c.source =:source group by c.id";
					params.put("source", source);
					if(i==0){
						params.put("month", String.valueOf(YearMonth.now().getMonth().getValue()));
						params.put("year", String.valueOf(year));
					}else{
						params.put("month", String.valueOf(YearMonth.now().minusMonths(i).getMonth().getValue()));
						params.put("year", String.valueOf(ZonedDateTime.now().minusMonths(i).getYear()));
					}
					logger.debug("params is:"+params);
					lstLeadsByMonths = leadService.runQuery(sql, params);
					params.put("leadStatus", "REGISTERED");
					sql = "from AppPolyglotLead c where month(c.createdDate) =:month"
							+ " and year(c.createdDate) =:year and c.source =:source and c.leadStatus =:leadStatus group by c.id";
					lstConversionByMonths = leadService.runQuery(sql, params);
					params.remove("leadStatus");
					if((null != lstLeadsByMonths && lstLeadsByMonths.size()>0) 
							|| (null!=lstConversionByMonths && lstConversionByMonths.size()>0)){
						leadUsr.setLeadBySource(lstLeadsByMonths.size());
						leadUsr.setConversionBySource(lstConversionByMonths.size());
						leadUsr.setSource(source);
						lstOfCharts.add(leadUsr);
					}
		    	}		    	
		    }		    
		} catch (Exception e) {
			logger.error("Error while preparing the admin dashboard for leads:"+e, e);
		}
		logger.debug("leadsbysource value is:"+lstOfCharts);
		returnObj.accumulate("leadsbysource", lstOfCharts);
		returnObj.accumulate("months", monthsObj);
		logger.debug("Exit getLeadConversionByMonth");
		return returnObj;
	}
	
	@RequestMapping(value="/getAdminLeadByMonth",method=RequestMethod.GET)
	public @ResponseBody JSONObject getAdminLeadByMonth(HttpSession session){
		logger.debug("Inside getAdminLeadByMonth");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		List<AppUsers> lstLeadsByMonths = new ArrayList<AppUsers>();
		AppPolyglotChart leadUsr = null;
		List<AppPolyglotChart> lstOfLeadCharts = new ArrayList<AppPolyglotChart>();
		//leads by month
		try {
			String sql = null;
			Map<String, String> params = new HashMap<String, String>();
			//get the current year for querying the dash board data
		    int year = Calendar.getInstance().get(Calendar.YEAR);
		    
		    //prepare last 12 months		    					    
			for(int i=0;i<12;i++){
				leadUsr = new AppPolyglotChart();
				sql = "from AppUsers c where c.userType=:userType and month(c.invitedDate)=:month and year(c.invitedDate)=:year";
				params.put("userType", "U");
				if(i==0){
					params.put("month", String.valueOf(YearMonth.now().getMonth().getValue()));
					params.put("year", String.valueOf(year));
				}else{
					params.put("month", String.valueOf(YearMonth.now().minusMonths(i).getMonth().getValue()));
					params.put("year", String.valueOf(ZonedDateTime.now().minusMonths(i).getYear()));
				}
				logger.debug("params is:"+params);
				lstLeadsByMonths = registrationService.runQuery(sql, params);
				if(i==0){
					leadUsr.setLeadByMonth(YearMonth.now().getMonth().name());
				}else{
					leadUsr.setLeadByMonth(YearMonth.now().minusMonths(i).getMonth().name());
				}
				
				if(!PolyglotFileUtils.isEmpty(lstLeadsByMonths)){
					leadUsr.setLeadCount(String.valueOf(lstLeadsByMonths.size()));
				}
				lstOfLeadCharts.add(leadUsr);
			}
		} catch (Exception e) {
			logger.error("Error while preparing the admin dashboard for leads:"+e, e);
		}
		logger.debug("lstOfLeadCharts is:"+lstOfLeadCharts);
		returnObj.accumulate("leadCount", lstOfLeadCharts);
		logger.debug("Exit getAdminLeadByMonth");
		return returnObj;
	}
	
	@RequestMapping(value="/getAdminDashboardDtls",method=RequestMethod.POST)
	public @ResponseBody JSONObject  getAdminDashboardDtls(HttpSession session){
		logger.debug("Inside getAdminDashboardDtls");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		List<AppUsers> lstOfStudents = new ArrayList<AppUsers>();
		List<AppUsers> lstOfTrainers = new ArrayList<AppUsers>();
		List<AppUsers> lstOfInstistitute = new ArrayList<AppUsers>();
		List<AppUsers> lstOfRecruiters = new ArrayList<AppUsers>();
		List<AppPolyglotBatch> lstOfBatches = new ArrayList<AppPolyglotBatch>();
		List<AppPolyglotChart> lstOfBatchChrts = new ArrayList<AppPolyglotChart>();
		
		try{
			Map<String, String> params = new HashMap<String, String>();
			String sql = "from AppUsers u where u.userType =:userType";
			params.put("userType", "U");
			//students offered
			lstOfStudents = registrationService.runQuery(sql, params);
			
			//trainers
			params.put("userType", "T");
			lstOfTrainers = registrationService.runQuery(sql, params);

			//Institutes
			params.put("userType", "P");
			lstOfInstistitute = registrationService.runQuery(sql, params);
			
			//Recruiter
			params.put("userType", "R");
			lstOfRecruiters = registrationService.runQuery(sql, params);

			//batches by status
			AppPolyglotChart chart = new AppPolyglotChart();
			sql = "from AppPolyglotBatch where batchStatus=:batchStatus";
			Map<String, String> paramsBatch = new HashMap<String, String>();
			paramsBatch.put("batchStatus", PolyglotConstants.BATCH_STATUS_COMPLETED);
			lstOfBatches = batchService.runQuery(sql, paramsBatch);
			if(!PolyglotFileUtils.isEmpty(lstOfBatches)){
				chart.setBatchStatus(PolyglotConstants.BATCH_STATUS_COMPLETED);
				chart.setBatchCount(String.valueOf(lstOfBatches.size()));
				lstOfBatchChrts.add(chart);
			}
			paramsBatch.put("batchStatus", PolyglotConstants.BATCH_STATUS_IN_PROGRESS);
			lstOfBatches = batchService.runQuery(sql, paramsBatch);
			if(!PolyglotFileUtils.isEmpty(lstOfBatches)){
				AppPolyglotChart chart1 = new AppPolyglotChart();
				chart1.setBatchStatus(PolyglotConstants.BATCH_STATUS_IN_PROGRESS);
				chart1.setBatchCount(String.valueOf(lstOfBatches.size()));
				lstOfBatchChrts.add(chart1);
			}
			paramsBatch.put("batchStatus", PolyglotConstants.BATCH_STATUS_SCHEDULED);
			lstOfBatches = batchService.runQuery(sql, paramsBatch);
			if(!PolyglotFileUtils.isEmpty(lstOfBatches)){
				AppPolyglotChart chart2 = new AppPolyglotChart();
				chart2.setBatchStatus(PolyglotConstants.BATCH_STATUS_SCHEDULED);
				chart2.setBatchCount(String.valueOf(lstOfBatches.size()));
				lstOfBatchChrts.add(chart2);
			}
			
		}catch(Exception ex){
			logger.error("Error Occured preparing the dashboard details for trainer:"+ex, ex);
		}
		returnObj.accumulate("studentCount", lstOfStudents.size());
		returnObj.accumulate("trainersCount", lstOfTrainers.size());
		returnObj.accumulate("instituteCount", lstOfInstistitute.size());
		returnObj.accumulate("recruiterCount", lstOfRecruiters.size());
		returnObj.accumulate("batchesCount", lstOfBatchChrts);
		logger.debug("Exit getAdminDashboardDtls");
		return returnObj;
	}
	
	@RequestMapping(value = "showAdmins", method = RequestMethod.GET)
	public @ResponseBody JSONObject showAdmins(HttpServletRequest request, @RequestParam("userType") String userType) {
		logger.debug("Inside showAdmins leads.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppUsers> userStudent = new ArrayList<AppUsers>();
		logger.debug("logged in user value is:"+loggedInUser.getId()+":user type is:"+userType);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords = 0; //total number of records (not filtered)
		    int iTotalDisplayRecords = 0;//value will be set when code filters companies by keyword
		    
		    String sql = null;
		    Map<String, String> params = new HashMap<String, String>();
		    
		    sql = "from AppUsers where userType=:userType";
	    	params.put("userType", userType);
	    	List<AppUsers> lstOfStudents = registrationService.runQuery(sql, params);
		    logger.debug("lstOfStudents is:"+lstOfStudents);
		    		    
		    if(!PolyglotFileUtils.isEmpty(userStudent)){
		    	iTotalRecords = userStudent.size();
			    logger.debug("leads objectis size is:"+userStudent.size());
		    }		    
		    List<User> admins = new LinkedList<User>();
		    List<User> filtered = new LinkedList<User>();
		    User user = null;
		    if (sSearch != null) {
		    	for(AppUsers usrObj : lstOfStudents){
		    		user = new User();
		    		if(null != usrObj && null != usrObj.getFname() && usrObj.getFname().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getEmailId() && usrObj.getEmailId().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getLname() && usrObj.getLname().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getMobile() && usrObj.getMobile().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getStatus() && usrObj.getStatus().toUpperCase().contains(sSearch.toUpperCase())){
		    			filtered.add(prepareAdminsData(usrObj.getId(), usrObj.getFname(), usrObj.getLname(), usrObj.getMobile(), usrObj.getEmailId(), usrObj.getStatus(), 
		    					PolyglotFileUtils.convertTimeStampToString(usrObj.getInvitedDate(), PolyglotConstants.DATE_FORMAT), PolyglotFileUtils.convertTimeStampToString(usrObj.getLastLoginDate(), PolyglotConstants.DATE_FORMAT), user));
		    		}else{
		    			admins.add(prepareAdminsData(usrObj.getId(), usrObj.getFname(), usrObj.getLname(), usrObj.getMobile(), usrObj.getEmailId(), usrObj.getStatus(), 
		    					PolyglotFileUtils.convertTimeStampToString(usrObj.getInvitedDate(), PolyglotConstants.DATE_FORMAT), PolyglotFileUtils.convertTimeStampToString(usrObj.getLastLoginDate(), PolyglotConstants.DATE_FORMAT), user));
		    		}
		    	}
		    }
		    
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	admins = filtered;
		    } else {
		    	iTotalDisplayRecords = admins.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = admins.size();
		    
		    if(admins.size()< iDisplayStart + iDisplayLength)
		    	admins = admins.subList(iDisplayStart, admins.size());
		    else
		    	admins = admins.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(admins, jsonConfig);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.accumulate("sEcho", sEcho);
			jsonObj.accumulate("iTotalRecords", iTotalRecords);
			jsonObj.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			jsonObj.accumulate("aaData", array);
			logger.debug("End of showAdmins data");
			return jsonObj;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading admins data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * 
	 * @param id
	 * @param fname
	 * @param lname
	 * @param mobile
	 * @param email
	 * @param status
	 * @param invitedDate
	 * @param lastLoginDate
	 * @param user
	 */
	public User prepareAdminsData(int id, String fname, String lname, String mobile, String email, String status,
			String invitedDate, String lastLoginDate, User user){
		user.setId(id);
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setMobile(mobile);
		user.setEmail(email);
		user.setStatus(status);
		user.setInvitedDate(invitedDate);
		user.setLastLoginDate(lastLoginDate);
		return user;
	}
	
	@RequestMapping(value = "showAdminInstitute", method = RequestMethod.GET)
	public @ResponseBody JSONObject showAdminInstitute(HttpServletRequest request) {
		logger.debug("Inside showAdminInstitute.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppUsers> userStudent = new ArrayList<AppUsers>();
		logger.debug("logged in user value is:"+loggedInUser.getId());
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords = 0; //total number of records (not filtered)
		    int iTotalDisplayRecords = 0;//value will be set when code filters companies by keyword
		    
		    String sql = null;
		    Map<String, String> params = new HashMap<String, String>();
		    
		    sql = "from AppUsers where userType=:userType";
	    	params.put("userType", "P");
	    	List<AppUsers> lstOfStudents = registrationService.runQuery(sql, params);
		    logger.debug("lstOfStudents is:"+lstOfStudents);
		    		    
		    if(!PolyglotFileUtils.isEmpty(userStudent)){
		    	iTotalRecords = userStudent.size();
			    logger.debug("leads objectis size is:"+userStudent.size());
		    }		    
		    List<User> admins = new LinkedList<User>();
		    List<User> filtered = new LinkedList<User>();
		    User user = null;
		    if (sSearch != null) {
		    	for(AppUsers usrObj : lstOfStudents){
		    		user = new User();
		    		
		    		if(null != usrObj && null != usrObj.getFname() && usrObj.getFname().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getEmailId() && usrObj.getEmailId().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getLname() && usrObj.getLname().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getMobile() && usrObj.getMobile().toUpperCase().contains(sSearch.toUpperCase())||
		    				null != usrObj && null != usrObj.getStatus() && usrObj.getStatus().toUpperCase().contains(sSearch.toUpperCase())){
		    			filtered.add(prepareAdminsData(usrObj.getId(), usrObj.getFname(), usrObj.getLname(), usrObj.getMobile(), usrObj.getEmailId(), usrObj.getStatus(), 
		    					PolyglotFileUtils.convertTimeStampToString(usrObj.getInvitedDate(), PolyglotConstants.DATE_FORMAT), PolyglotFileUtils.convertTimeStampToString(usrObj.getLastLoginDate(), PolyglotConstants.DATE_FORMAT), user));
		    		}else{
		    			admins.add(prepareAdminsData(usrObj.getId(), usrObj.getFname(), usrObj.getLname(), usrObj.getMobile(), usrObj.getEmailId(), usrObj.getStatus(), 
		    					PolyglotFileUtils.convertTimeStampToString(usrObj.getInvitedDate(), PolyglotConstants.DATE_FORMAT), PolyglotFileUtils.convertTimeStampToString(usrObj.getLastLoginDate(), PolyglotConstants.DATE_FORMAT), user));
		    		}
		    	}
		    }
		    
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	admins = filtered;
		    } else {
		    	iTotalDisplayRecords = admins.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = admins.size();
		    
		    if(admins.size()< iDisplayStart + iDisplayLength)
		    	admins = admins.subList(iDisplayStart, admins.size());
		    else
		    	admins = admins.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(admins, jsonConfig);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.accumulate("sEcho", sEcho);
			jsonObj.accumulate("iTotalRecords", iTotalRecords);
			jsonObj.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			jsonObj.accumulate("aaData", array);
			logger.debug("End of showAdminInstitute data");
			return jsonObj;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading admins data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * This method cancels a batch and notifies its users.
	 * @param ids
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateAdminStudentData", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateAdminStudentData(@RequestParam(value = "ids[]") Integer[] ids,
			HttpServletRequest request) {
		JSONObject object = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		logger.debug("updateAdminStudentData");		
		try {
			for (Integer id : ids) {
				AppUsers usrObj = registrationService.load(id);
				
				usrObj.setUserType("A");
				usrObj.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				usrObj.setLastInsrtUpdUsrId(loggedInUser.getId());
				registrationService.save(usrObj);
			}
		} catch (Exception ex) {
			logger.error("Exception while updating the user type is:"+ex, ex);
		}
		logger.debug("Exit updateAdminStudentData");
		return object;
	}
	
	@RequestMapping(value="/getConversionRevenueByMonth",method=RequestMethod.GET)
	public @ResponseBody JSONObject getConversionRevenueByMonth(HttpSession session){
		logger.debug("Inside getConversionRevenueByMonth");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		List<AppPolyglotPayment> lstOfPayments = new ArrayList<AppPolyglotPayment>();
		AppPolyglotChart leadUsr = null;
		
		Set<String> sourceLst = new HashSet<String>();
		List<AppPolyglotChart> lstOfCharts = new ArrayList<AppPolyglotChart>();
		Set<String> monthsObj = new LinkedHashSet<String>();
		List<AppPolyglotLead> lstConversionByMonths = new ArrayList<AppPolyglotLead>();
		//leads by month
		try {
			//prepare unique source names for given partner id
			String sourceSql = "from AppPolyglotLead where partnerId =:partnerId";
			Map<String, String> paramSrc = new HashMap<String, String>();
			paramSrc.put("partnerId", String.valueOf(loggedInUser.getId()));
			List<AppPolyglotLead> lstOfSrcLeads = leadService.runQuery(sourceSql, paramSrc);
			
			if(!PolyglotFileUtils.isEmpty(lstOfSrcLeads)){
				for(AppPolyglotLead srcObj: lstOfSrcLeads){
					if(null != srcObj && null != srcObj.getSource()){
						sourceLst.add(srcObj.getSource().trim());
					}
				}
			}
			logger.debug("sourceLst is:"+sourceLst);
			String sql = null;
			Map<String, String> revParams = new HashMap<String, String>();
			Map<String, String> params = new HashMap<String, String>();
			//get the current year for querying the dash board data
		    int year = Calendar.getInstance().get(Calendar.YEAR);
		    
		    //leads by source
		    for(String source: sourceLst){
		    	logger.debug("Source value is:"+source);
		    	for(int i=0;i<12;i++){
		    		leadUsr = new AppPolyglotChart();
					//params.put("partnerId", String.valueOf(loggedInUser.getId()));
					if(i==0){
						monthsObj.add(YearMonth.now().getMonth().name());
						leadUsr.setLeadByMonth(YearMonth.now().getMonth().name());
					}else{
						monthsObj.add(YearMonth.now().minusMonths(i).getMonth().name());
						leadUsr.setLeadByMonth(YearMonth.now().minusMonths(i).getMonth().name());
					}
					revParams.put("source", source);
					if(i==0){
						revParams.put("month", String.valueOf(YearMonth.now().getMonth().getValue()));
						revParams.put("year", String.valueOf(year));
					}else{
						revParams.put("month", String.valueOf(YearMonth.now().minusMonths(i).getMonth().getValue()));
						revParams.put("year", String.valueOf(ZonedDateTime.now().minusMonths(i).getYear()));
					}
					
					double revenue = 0.0;
					revParams.put("leadStatus", "REGISTERED");
					logger.debug("revParams is:"+revParams);
					sql = "from AppPolyglotLead c where month(c.createdDate) =:month"
							+ " and year(c.createdDate) =:year and c.source =:source and c.leadStatus =:leadStatus group by c.id";
					lstConversionByMonths = leadService.runQuery(sql, revParams);
					for(AppPolyglotLead leadFee : lstConversionByMonths){
						sql = "select distinct p from AppPolyglotPayment p where p.userId =:userId";
						params.put("userId", String.valueOf(leadFee.getUserId()));
						lstOfPayments = paymentService.runQuery(sql, params);
						logger.debug("lstOfPayments is:"+lstOfPayments);
						if(null != lstOfPayments && lstOfPayments.size() > 0){
							revenue += lstOfPayments.get(0).getTotalFee();
						}						
					}
					logger.debug("revenue amount is:"+revenue);
					if(revenue !=0){
						leadUsr.setRevenueBySource(String.valueOf(revenue));
						leadUsr.setSource(source);
						lstOfCharts.add(leadUsr);
					}					
		    	}		    	
		    }		    
		} catch (Exception e) {
			logger.error("Error while preparing the admin dashboard for leads:"+e, e);
		}
		logger.debug("conversionbyrevenue value is:"+lstOfCharts);
		returnObj.accumulate("revenueBySource", lstOfCharts);
		returnObj.accumulate("months", monthsObj);
		logger.debug("Exit getConversionRevenueByMonth");
		return returnObj;
	}
	
}
