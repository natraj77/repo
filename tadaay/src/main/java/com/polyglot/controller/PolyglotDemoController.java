package com.polyglot.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.domain.AppPolyglotDemo;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppPolyglotLeadDemoStatus;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.DmnCourse;
import com.polyglot.model.AppPolyglotDemoModel;
import com.polyglot.model.AppPolyglotLeadModel;
import com.polyglot.service.AppPolyglotBranchService;
import com.polyglot.service.AppPolyglotCourseService;
import com.polyglot.service.AppPolyglotDemoService;
import com.polyglot.service.AppPolyglotFacultyService;
import com.polyglot.service.AppPolyglotLeadDemoStatusService;
import com.polyglot.service.AppPolyglotLeadService;
import com.polyglot.service.AppPolyglotRegistrationService;
import com.polyglot.service.DmnCourseService;
import com.polyglot.utils.PolyglotConstants;
import com.polyglot.utils.PolyglotFileUtils;

@Controller
public class PolyglotDemoController {
	private static final Logger logger = Logger.getLogger(PolyglotDemoController.class);
	
	@Autowired
	private AppPolyglotCourseService appCourseService;
	@Autowired
	private DmnCourseService courseService;
	@Autowired
	private AppPolyglotBranchService branchService;
	@Autowired
	private AppPolyglotFacultyService appFacultyService;
	@Autowired
	private AppPolyglotRegistrationService  registrationService;
	@Autowired
	private AppPolyglotDemoService demoService;
	@Autowired
	private AppPolyglotLeadDemoStatusService demoStatusService;
	@Autowired
	private AppPolyglotLeadService leadService;
	
	@RequestMapping(value = "getCourseListForPartnerId", method = RequestMethod.GET)
	public @ResponseBody Map<Integer, String> getCourseListForPartnerId(HttpServletRequest request) {
		logger.debug("Inside getCourseListForPartnerId");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		return prepareDemoCoursedetails(loggedInUser);
	}
	
	/**
	 * 
	 * @param loggedInUser
	 * @return
	 */
	private Map<Integer, String> prepareDemoCoursedetails(AppUsers loggedInUser){
		logger.debug("Inside prepareDemoCoursedetails");
		Map<Integer, String> courseMap = new HashMap<Integer, String>();;
		try {
			if(null != loggedInUser){
				String sql = "from AppPolyglotCourse c where c.appUsers =:appUsers and (c.isActive=:isActive or c.isActive is null))";
				Map<String, String> params = new HashMap<String, String> ();
				
				params.put("appUsers", String.valueOf(loggedInUser.getId()));
				params.put("isActive", PolyglotConstants.Y_STR);
				logger.debug("param map is:"+params);
				
				List<AppPolyglotCourse> coursesForPartner = appCourseService.runQuery(sql, params);
							
				Map<Integer, Integer> partnerMap = new HashMap<Integer, Integer>();
				
				for(AppPolyglotCourse courseObj : coursesForPartner){
					partnerMap.put(courseObj.getDmnCourseId(), courseObj.getId());
				}
				
				for (DmnCourse course : courseService.getAll()) {
					if(partnerMap.containsKey(course.getId())){
						courseMap.put(partnerMap.get(course.getId()), course.getCourseName());
					}
				}
			}
			logger.debug("polyglot course id and domain course name map is:"+courseMap);
		} catch (Exception ex) {
			logger.error("exception while preparing the partner course details:"+ex, ex);
		}
		
		return courseMap;
	}
	
	@RequestMapping(value = "getBranchListForPartnerId", method = RequestMethod.GET)
	public @ResponseBody Map<Integer, String> getBranchListForPartnerId(HttpServletRequest request) {
		logger.debug("Inside getBranchListForPartnerId");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Map<Integer, String> branchMap = new HashMap<Integer, String>();
		branchMap = prepareDemoBranchDetails(loggedInUser);		
		return branchMap;
	}
	
	/**
	 * 
	 * @param loggedInUser
	 * @return
	 */
	private Map<Integer, String> prepareDemoBranchDetails(AppUsers loggedInUser){
		logger.debug("Inside prepareBranchDetails");
		Map<Integer, String> branchMap = new HashMap<Integer, String>();
		try {
			Map<String, String> params = new HashMap<String, String>();
			if(null != loggedInUser){
				String sql = "from AppPolyglotBranch b where b.appUsers =:appUsers and (b.isActive=:isActive or b.isActive is null)";
				params.put("appUsers", String.valueOf(loggedInUser.getId()));
				params.put("isActive", PolyglotConstants.Y_STR);
				logger.debug("param map is:"+params);
				
				List<AppPolyglotBranch> lstOfPartnerBrnchs = branchService.runQuery(sql, params);
				logger.debug("lst of branches for partner id is:"+lstOfPartnerBrnchs+": partner id is:"+loggedInUser.getId());
				
				for (AppPolyglotBranch branch : lstOfPartnerBrnchs) {
					branchMap.put(branch.getId(), branch.getName());
				}
			}
			
			logger.debug("branchMap is:"+branchMap);
		} catch (Exception ex) {
			logger.error("Exception while getting the branch details:"+ex, ex);
		}
		return branchMap;
	}
	
	@RequestMapping(value = "getFacultyListForPartnerId", method = RequestMethod.POST)
	public @ResponseBody Map<Integer, String> getFacultyListForPartnerId(@RequestParam("courseId") Integer courseId, HttpServletRequest request) {
		logger.debug("Inside getFacultyListForPartnerId");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		return prepareDemoFacultyData(loggedInUser, courseId);		
	}
	
	/**
	 * 
	 * @param loggedInUser
	 * @param courseId
	 * @return
	 */
	private Map<Integer, String> prepareDemoFacultyData(AppUsers loggedInUser, Integer courseId){
		logger.debug("Inside prepareDemoFacultyData");
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String> courseParam = new HashMap<String, String>();
		Map<Integer, String> facultyMap = new HashMap<Integer, String>();
		logger.debug("partner id is:"+loggedInUser.getId());
		String sql = null;
		String courseSql = null;
		AppPolyglotCourse courseObj = new AppPolyglotCourse();
		try {
			logger.debug("courseId is:"+courseId);
			/**get domain course id based on course id*/
			courseSql = "from AppPolyglotCourse c where c.id =:courseId";
			courseParam.put("courseId",String.valueOf(courseId));
			List<AppPolyglotCourse> lstOfCourses = appCourseService.runQuery(courseSql, courseParam);
			if(!PolyglotFileUtils.isEmpty(lstOfCourses)){
				courseObj = lstOfCourses.get(0);
			}
			
			if(null != courseObj && null != courseObj.getDmnCourseId()){
				sql = "from AppPolyglotFaculty f where f.appUsers =:appUsers and f.courseId =:courseId and (f.isActive=:isActive or f.isActive is null)";
				params.put("courseId", String.valueOf(courseObj.getDmnCourseId()));
			}else{
				sql = "from AppPolyglotFaculty f where f.appUsers =:appUsers and (f.isActive=:isActive or f.isActive is null)";
			}
			
			params.put("appUsers", String.valueOf(loggedInUser.getId()));
			params.put("isActive", PolyglotConstants.Y_STR);
			
			List<AppPolyglotFaculty> lstOfPartnerFaculty = appFacultyService.runQuery(sql, params);
			List<Integer> lstOfUsers = new ArrayList<Integer>();
			for(AppPolyglotFaculty facultyObj : lstOfPartnerFaculty){
				lstOfUsers.add(facultyObj.getFacultyId());
			}
			logger.debug("list of faculty available:"+lstOfUsers+": for a given course id:"+courseId);
			AppUsers usrObj = null;
			for(Integer userId: lstOfUsers){
				usrObj = new AppUsers();
				usrObj = retrieveAppUserData(userId);
				facultyMap.put(userId, usrObj.getFname()+" "+usrObj.getLname());
			}
			logger.debug("facultyMap is:"+facultyMap);
		} catch (Exception ex) {
			logger.error("Exception while getting the facult details:"+ex, ex);
		}
		return facultyMap;
	}
	
	/**
	 * 
	 * @param usrId
	 * @return
	 */
	private AppUsers retrieveAppUserData(Integer usrId){
		logger.debug("Inside retrieveAppUserData");
		String sql = "from AppUsers u where u.id =:id";
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", String.valueOf(usrId));
		
		List<AppUsers> lstOfUsers = registrationService.runQuery(sql, params);
		return !PolyglotFileUtils.isEmpty(lstOfUsers)?lstOfUsers.get(0):null;
	}
	
	/**
	 * Method to save a Demo
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "saveUpdateDemoData" , method = RequestMethod.POST)
	public @ResponseBody JSONObject saveUpdateDemoData(@RequestBody final AppPolyglotDemoModel model, HttpSession session) {
		logger.debug("Inside saveUpdateDemoData");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		AppPolyglotDemo demo = new AppPolyglotDemo();
		
		JSONObject jsonObj = new JSONObject();
		try {
			if (model.getId() != null) {
				demo = demoService.load(model.getId());
			}
			/**get domain course id based on course table id*/
			AppPolyglotCourse course = appCourseService.load(model.getCourseId());
			logger.debug("domain course id is:"+course.getDmnCourseId());
			/**get faculty id*/
			Map<String, String> params = new HashMap<String, String>();
			String sql = "from AppPolyglotFaculty l where l.facultyId =:facultyId and l.courseId =:courseId";
			
			params.put("facultyId", String.valueOf(model.getFacultyId()));
			params.put("courseId", String.valueOf(course.getDmnCourseId()));
			List<AppPolyglotFaculty> lstOfFaculty = appFacultyService.runQuery(sql, params);
			logger.debug("faculty service object is::"+lstOfFaculty);
			
			demo.setAppUsers(loggedInUser);
			demo.setCourseId(model.getCourseId());
			demo.setBranchId(model.getBranchId());
			if(!PolyglotFileUtils.isEmpty(lstOfFaculty)){
				demo.setFacultyId(lstOfFaculty.get(0).getId());
			}
			demo.setDateTime(model.getStartDate());
			demo.setDemoStatus(model.getDemoStatus());
			demo.setIsActive("Y");
			demo.setFee(new Double(model.getFee()));
			demo.setMode(model.getMode());
			demo.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			demo.setLastInsrtUpdUsrId(loggedInUser.getId());
			demo.setBranchName(model.getBranchName());
			demo.setFacultyName(model.getFacultyName());
			demo.setCourseName(model.getCourseName());
			
			demoService.save(demo);
			logger.debug("demo data saved successfully");
			
			Set<AppPolyglotDemo> demos = loggedInUser.getAppPolyglotDemos();
			
			for (AppPolyglotDemo item : demos) {
				if (demo.getId().equals(item.getId())) {
					demos.remove(item);
					break;
				}
			}
			
			demos.add(demo);
			loggedInUser.setAppPolyglotDemos(demos);
			
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonConfig.setExcludes(new String[] { "appUsers" });

			jsonObj = JSONObject.fromObject(demo, jsonConfig);
		} catch (Exception ex) {
			logger.error("Exception while saving the demo data:"+ex, ex);
		}
		
		return jsonObj;
	}
	
	@RequestMapping(value = "showAllDemos", method = RequestMethod.GET)
	public @ResponseBody JSONObject showDemos(HttpServletRequest request) {
		logger.debug("Inside show all demos");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    logger.debug("show demos data:"+loggedInUser.getAppPolyglotDemos());
		    List<AppPolyglotDemo> demos = loggedInUser.getAppPolyglotDemos().stream().filter(p -> (!PolyglotConstants.Y_STR.equalsIgnoreCase(p.getIsArchive()))).sorted(Comparator.comparing(AppPolyglotDemo::getDateTime).reversed()).collect(Collectors.toList());
		    
		    iTotalRecords = demos.size();
		    logger.debug("demo list is:"+demos);
		    List<AppPolyglotDemoModel> userDemos = new LinkedList<AppPolyglotDemoModel>();
		    List<AppPolyglotDemoModel> filtered = new LinkedList<AppPolyglotDemoModel>();
		    
		    AppPolyglotBranch branch = new AppPolyglotBranch();
			AppPolyglotCourse course = new AppPolyglotCourse();
			AppPolyglotFaculty faculty = new AppPolyglotFaculty();
			AppUsers exisitngUser = new AppUsers();
			AppPolyglotDemoModel demoModel = null;
	    	logger.debug("sSearch value is:"+sSearch);
		    if (sSearch != null) {
				for (AppPolyglotDemo demo : demos) {
					if(null != demo){
						demoModel = new AppPolyglotDemoModel();
						/**get leads details based on app_user_id*/
						if(null != demo.getFacultyId()){
							logger.debug("facult id is:"+demo.getFacultyId());
							faculty = appFacultyService.load(demo.getFacultyId());
							if(null != faculty){
								logger.debug("user id from appusers is:"+faculty.getFacultyId());
								exisitngUser = registrationService.load(faculty.getFacultyId());
							}							
						}
						/**get course name based on courseId*/
						logger.debug("course id is:"+demo.getCourseId());
						course = appCourseService.load(demo.getCourseId());
						DmnCourse dmnData = null != course ? courseService.load(course.getDmnCourseId()) : null;
						if(null != dmnData){
							logger.debug("dmn course name is:"+dmnData.getCourseName());
						}
						/**get branch name based on branchId*/
						branch = branchService.load(demo.getBranchId());
						logger.debug("branch object completed");
						if (null != dmnData && null != dmnData.getCourseName() && dmnData.getCourseName().toUpperCase().contains(sSearch.toUpperCase()) ||
							null != branch && null != branch.getName() &&	branch.getName().toUpperCase().contains(sSearch.toUpperCase()) ||
							null != demo.getMode() && demo.getMode().toUpperCase().contains(sSearch.toUpperCase())||
							null != demo.getDemoStatus() &&	demo.getDemoStatus().toUpperCase().contains(sSearch.toUpperCase()) ||
							null != exisitngUser && null != exisitngUser.getFname() && exisitngUser.getFname().toUpperCase().contains(sSearch.toUpperCase())||
							null != exisitngUser && null != exisitngUser.getLname() && exisitngUser.getLname().toUpperCase().contains(sSearch.toUpperCase())) {
							filtered.add(prepareDemoModel(demo.getId(), dmnData.getCourseName(), demo.getMode(), branch.getName(),
									demo.getDemoStatus(), demo.getDateTime(), demo.getFee(),
									exisitngUser.getFname(), exisitngUser.getLname(), demo.getCourseId(), demo.getBranchId(), demo.getFacultyId(), demoModel)); // Add a company that matches search criterion
						} else {
							userDemos.add(prepareDemoModel(demo.getId(), dmnData.getCourseName(), demo.getMode(), branch.getName(),
									demo.getDemoStatus(), demo.getDateTime(), demo.getFee(),
									exisitngUser.getFname(), exisitngUser.getLname(), demo.getCourseId(), demo.getBranchId(), demo.getFacultyId(), demoModel));
						}
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	userDemos = filtered;
		    } else {
		    	iTotalDisplayRecords = userDemos.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = userDemos.size();
		    
		    if(userDemos.size()< iDisplayStart + iDisplayLength)
		    	userDemos = userDemos.subList(iDisplayStart, userDemos.size());
		    else
		    	userDemos = userDemos.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    
		    List<AppPolyglotDemoModel> models = new ArrayList<AppPolyglotDemoModel> ();
		    AppPolyglotDemoModel model = null;
			for (AppPolyglotDemoModel demo : userDemos) {
				if (null != demo && (PolyglotConstants.BATCH_STATUS_PROPOSED.equalsIgnoreCase(demo.getDemoStatus())
						|| PolyglotConstants.BATCH_STATUS_SCHEDULED.equalsIgnoreCase(demo.getDemoStatus())
						|| PolyglotConstants.BATCH_STATUS_COMPLETED.equalsIgnoreCase(demo.getDemoStatus()))) {
					model = new AppPolyglotDemoModel();
					
					model.setId(demo.getId());
					model.setBranchName(demo.getBranchName());
					model.setCourseName(demo.getCourseName());
					model.setDemoStatus(demo.getDemoStatus());
					model.setFacultyName(demo.getFacultyName());
					model.setFee(demo.getFee().toString());
					model.setMode(demo.getMode());
					model.setStartDate(demo.getStartDate());
					model.setFacultyId(demo.getFacultyId());
					model.setCourseId(demo.getCourseId());
					model.setBranchId(demo.getBranchId());
					models.add(model);
				}
			}
		    
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			//jsonConfig.setExcludes(new String[] { "appUsers" });
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading demo data : " + ex, ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "getArchivedDemos", method = RequestMethod.GET)
	public @ResponseBody JSONArray getArchivedDemos(HttpServletRequest request) {
		logger.debug("Retrieving archived demos");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotDemo> demos = loggedInUser.getAppPolyglotDemos().stream().
				filter(p -> PolyglotConstants.Y_STR.equalsIgnoreCase(p.getIsArchive())).sorted(Comparator.comparing(AppPolyglotDemo::getLastInsrtUpdTs)).collect(Collectors.toList());
		logger.debug("archieved demo list is:"+demos);
		List<AppPolyglotDemo> lstOfDemos = new ArrayList<AppPolyglotDemo>();
		AppPolyglotDemo demoObj = null;
		for(AppPolyglotDemo demo: demos){
			demoObj = new AppPolyglotDemo();
			/**based on course id get course name*/
			DmnCourse course = null;
			if(null != demo && null != demo.getCourseId()){
				AppPolyglotCourse courseObj = appCourseService.load(demo.getCourseId());
				if(null != courseObj){
					course = courseService.load(courseObj.getDmnCourseId());
				}
			}				
			demoObj.setCourseName(null != course?course.getCourseName():"");
			/**get faculty name based on faculty id*/
			AppPolyglotFaculty faculty = null;
			AppUsers extUser = null;
			if(null != demo && null != demo.getFacultyId()){
				faculty = appFacultyService.load(demo.getFacultyId());
				extUser = registrationService.load(faculty.getFacultyId());
			}
			demoObj.setFacultyName(null != extUser?extUser.getFname()+" "+extUser.getLname():"");
			/**branch name based on branch id*/
			AppPolyglotBranch branch = null;
			if(null != demo && null != demo.getBranchId()){
				branch = branchService.load(demo.getBranchId());
			}
			demoObj.setBranchName(null != branch?branch.getName():"");
			demoObj.setMode(demo.getMode());
			demoObj.setDemoStatus(demo.getDemoStatus());
			demoObj.setDateTime(demo.getDateTime());
			demoObj.setFee(demo.getFee());
			
			lstOfDemos.add(demoObj);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[] { "appUsers", "lastInsrtUpdTs", "branchId", "isArchive"
				, "lastInsrtUpdUsrId", "id", "isActive", "courseId","facultyId"});
		JSONArray array = JSONArray.fromObject(lstOfDemos, jsonConfig);
		logger.debug("Exit of getArchivedDemos");
		return array;
	}
	
	/**
	 * Method for Cancelling a demo
	 * @param ids
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateDemoData", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateDemoData(@RequestParam(value = "ids[]") Integer[] ids, @RequestParam("status") String status,
			HttpServletRequest request) {
		JSONObject object = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		logger.debug("Inside updateDemoData");
		
		Set<AppPolyglotDemo> demos = loggedInUser.getAppPolyglotDemos();
		
		for (Integer id : ids) {
			AppPolyglotDemo demo = demoService.load(id);
			
			demo.setIsActive("N");
			if("cancel".equalsIgnoreCase(status)){
				demo.setDemoStatus(PolyglotConstants.DEMO_STATUS_CANCELLED);
			}else if("complete".equalsIgnoreCase(status)){
				demo.setDemoStatus(PolyglotConstants.DEMO_STATUS_COMPLETED);
			}else if("archive".equalsIgnoreCase(status)){
				demo.setIsArchive("Y");
			}
			demo.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			demo.setLastInsrtUpdUsrId(loggedInUser.getId());
			demoService.save(demo);

			//Send email to the lead about the demo cancellation.
			//TODO : write code to update set with the modified demo object.
			for (AppPolyglotDemo d : demos) {
				if (d.getId() == demo.getId()) {
					demo.setCourseName(d.getCourseName());
					demo.setFacultyName(d.getFacultyName());
					demo.setBranchName(d.getBranchName());
					demos.remove(d);
					break;
				}
			}
			demos.add(demo);
		}
		loggedInUser.setAppPolyglotDemos(demos);
		
		return object;
	}
	
	/**
	 * Rescheduling demo to a new date
	 * @param ids
	 * @param demoresheduleDate
	 * @return
	 */
	@RequestMapping(value = "rescheduleDemo", method = RequestMethod.POST)
	public @ResponseBody JSONObject reScheduleDemo(@RequestParam(value = "ids[]") Integer[] ids, 
			@RequestParam("demoresheduleDate") String demoresheduleDate,
			HttpServletRequest request) {
		JSONObject object = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		
		logger.debug("Rescheduling demo to a new date : " + demoresheduleDate);
		Set<AppPolyglotDemo> demos = loggedInUser.getAppPolyglotDemos();

		for (Integer id : ids) {
			AppPolyglotDemo demo = demoService.load(id);
			
			demo.setDateTime(demoresheduleDate);
			demo.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			demo.setLastInsrtUpdUsrId(loggedInUser.getId());
			demoService.save(demo);
			
			//TODO:Send email to the lead about the demo reschedule.
			
			//TODO : write code to update set with the modified demo object.
			for (AppPolyglotDemo d : demos) {
				if (d.getId() == demo.getId()) {
					demo.setCourseName(d.getCourseName());
					demo.setFacultyName(d.getFacultyName());
					demo.setBranchName(d.getBranchName());
					demos.remove(d);
					break;
				}
			}
			demos.add(demo);
		}

		loggedInUser.setAppPolyglotDemos(demos);
		
		return object;
	}
	
	/**
	 * Method returns list of students enrolled for demo.
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getLeadDemoStatus", method = RequestMethod.GET)
	public @ResponseBody JSONArray showLeadDemoStatus(HttpServletRequest request, @RequestParam("demoId") Integer id) {
		logger.debug("Inside getLeadDemoStatus, fetching demo status of students enrolled for the demo.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		List<AppPolyglotLeadDemoStatus> demoStatuses = new ArrayList<AppPolyglotLeadDemoStatus>();
		List<AppPolyglotLeadModel> lstOfUsers = new ArrayList<AppPolyglotLeadModel>();
		String sql = "from AppPolyglotLeadDemoStatus s where s.partnerId =:partnerId and s.demoId =:demoId";
		Map<String, String> params = new HashMap<String, String>();
		params.put("partnerId", String.valueOf(loggedInUser.getId()));
		params.put("demoId", id.toString());

		int leadId = 0;
		AppPolyglotLeadModel sts = null;
		demoStatuses = demoStatusService.runQuery(sql, params);
		if(!PolyglotFileUtils.isEmpty(demoStatuses)){
			for(AppPolyglotLeadDemoStatus demoSts : demoStatuses){
				leadId = demoSts.getLeadId();
				if(leadId != 0){
					AppPolyglotLead lead = leadService.load(leadId);
					if(null != lead){
						sts = new AppPolyglotLeadModel();
						AppUsers users = registrationService.load(lead.getUserId());
						sts.setFirstName(users.getFname());
						sts.setLastName(users.getLname());
						sts.setId(leadId);
						sts.setEmail(users.getEmailId());
						sts.setMobile(users.getMobile());
						sts.setStatus(demoSts.getInviteStatus());
						lstOfUsers.add(sts);
					}
				}
			}
		}		

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray array = JSONArray.fromObject(lstOfUsers, jsonConfig);

		logger.debug("Exit of getLeadDemoStatus");
		return array;
	}
	
	/**
	 * Method to save attendees for a demo
	 * @param ids
	 * @param demoId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUpdateAttendees", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveAttendees(@RequestParam(value = "ids[]") Integer[] ids,
			@RequestParam("demoId") Integer demoId,
			HttpServletRequest request) {
		
		logger.debug("Marking attendees as Attended for the demo with id : " + demoId);
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject object = new JSONObject();
		List<AppPolyglotLeadDemoStatus> list = new ArrayList<AppPolyglotLeadDemoStatus>();
		for (Integer id : ids) {
			String sql = "from AppPolyglotLeadDemoStatus s where s.leadId =:leadId and s.partnerId =:partnerId and s.demoId =:demoId";
			Map<String, String> params = new HashMap<String, String>();
			params.put("leadId", id.toString());
			params.put("partnerId", String.valueOf(loggedInUser.getId()));
			params.put("demoId", demoId.toString());
			
			list.addAll(demoStatusService.runQuery(sql, params));
		}
		
		for (AppPolyglotLeadDemoStatus demoStatus : list) {
			demoStatus.setDemoId(demoId);
			demoStatus.setInviteStatus(PolyglotConstants.APP_POLYGLOT_LEAD_DEMO_STATUS_ATTENDED);
			demoStatus.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			demoStatus.setLastInsrtUpdUsrId(loggedInUser.getId());
			
			demoStatusService.save(demoStatus);
			
			//Send email thanking for attending demo?
		}
		
		return object;
	}
	
	/**
	 * 
	 * @param id
	 * @param courseName
	 * @param mode
	 * @param demoStatus
	 * @param startDate
	 * @param fee
	 * @param fName
	 * @param lName
	 * @param model
	 * @return
	 */
	public AppPolyglotDemoModel prepareDemoModel(Integer id, String courseName, String mode, String branchName, 
			String demoStatus, String startDate, Double fee, String fName, String lName, Integer courseId, 
			Integer branchId, Integer facultyId, AppPolyglotDemoModel model){
		model.setId(id);
		model.setBranchName(branchName);
		model.setCourseName(courseName);
		model.setFee(String.valueOf(fee));
		model.setStartDate(startDate);
		model.setDemoStatus(demoStatus);
		model.setMode(mode);
		model.setFacultyName(fName+" "+lName);
		model.setFacultyId(facultyId);
		model.setCourseId(courseId);
		model.setBranchId(branchId);
		return model;
	}
	
	@RequestMapping(value = "showStudentsDemo", method = RequestMethod.GET)
	public @ResponseBody JSONObject showStudentsDemo(HttpServletRequest request) {
		logger.debug("Inside of showStudentsDemo");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotLeadDemoStatus> leadDemoSts = new ArrayList<AppPolyglotLeadDemoStatus>();
		AppPolyglotBranch branch = new AppPolyglotBranch();
		AppPolyglotCourse course = new AppPolyglotCourse();
		AppPolyglotDemo demoModel = null;
		List<AppPolyglotDemoModel> studentDemos = new LinkedList<AppPolyglotDemoModel>();
	    List<AppPolyglotDemoModel> filtered = new LinkedList<AppPolyglotDemoModel>();
		AppPolyglotDemoModel model = null;
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords = 0; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    logger.debug("student demo user id:"+loggedInUser.getId());
		    /**get the lead id based on logged in user*/
		    String leadSql = "from AppPolyglotLead l where l.userId =:userId";
		    Map<String, String> param = new HashMap<String, String>();
			param.put("userId", String.valueOf(loggedInUser.getId()));
			List<AppPolyglotLead> leadObj = leadService.runQuery(leadSql, param);
			if(!PolyglotFileUtils.isEmpty(leadObj)){
		    	iTotalRecords = leadObj.size();
			    logger.debug("leads demo object is size is:"+leadObj.size());
			    leadObj.sort(Comparator.comparing(AppPolyglotLead::getLastInsrtUpdTs).reversed());
		    }
			
			if (null != sSearch) {
				if(!PolyglotFileUtils.isEmpty(leadObj)){
					for(AppPolyglotLead lead : leadObj){
						String sql = "from AppPolyglotLeadDemoStatus s where s.leadId =:leadId";
						Map<String, String> params = new HashMap<String, String>();
						params.put("leadId", String.valueOf(lead.getId()));
						leadDemoSts = demoStatusService.runQuery(sql, params);
						
						/**get course name based on courseId*/
						logger.debug("course id is:"+lead.getCourseId());
						course = appCourseService.load(lead.getCourseId());						
						DmnCourse dmnData = null != course ? courseService.load(course.getDmnCourseId()) : null;
						if(null != dmnData){
							logger.debug("dmn course name is:"+dmnData.getCourseName());
						}
						/**get branch name based on branchId*/
						branch = branchService.load(lead.getBranchId());
						logger.debug("branch object completed");
						
						if(!PolyglotFileUtils.isEmpty(leadDemoSts)){
				    		for (AppPolyglotLeadDemoStatus demo : leadDemoSts) {
								if(null != demo){
									demoModel = new AppPolyglotDemo();
									model = new AppPolyglotDemoModel();
									/**get demo table id*/
									demoModel = demoService.load(demo.getDemoId());
									if(null != dmnData && null != dmnData.getCourseName() && dmnData.getCourseName().toUpperCase().contains(sSearch.toUpperCase())||
											null != branch && null != branch.getName() && branch.getName().toUpperCase().contains(sSearch.toUpperCase())||
											null != demoModel && null != demoModel.getDemoStatus() && demoModel.getDemoStatus().toUpperCase().contains(sSearch.toUpperCase())||
											null != demoModel && null != demoModel.getDateTime() && demoModel.getDateTime().contains(sSearch)){
										filtered.add(prepareStudentModel(demo.getId(), dmnData.getCourseName(), 
												branch.getName(), demo.getInviteStatus(), demoModel.getDateTime(), model));
									}else{
										/**prepare student demo data*/
										studentDemos.add(prepareStudentModel(demo.getId(), dmnData.getCourseName(), 
												branch.getName(), demo.getInviteStatus(), demoModel.getDateTime(), model));
									}
								}
							}
				    	}
					}
				}
			}
			
			//If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	studentDemos = filtered;
		    } else {
		    	iTotalDisplayRecords = studentDemos.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = studentDemos.size();
		    
		    if(studentDemos.size()< iDisplayStart + iDisplayLength)
		    	studentDemos = studentDemos.subList(iDisplayStart, studentDemos.size());
		    else
		    	studentDemos = studentDemos.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		  
		    List<AppPolyglotDemoModel> models = new ArrayList<AppPolyglotDemoModel> ();
		    AppPolyglotDemoModel modelObj = null;
			for (AppPolyglotDemoModel demo : studentDemos) {
				modelObj = new AppPolyglotDemoModel();
				
				modelObj.setId(demo.getId());
				modelObj.setBranchName(demo.getBranchName());
				modelObj.setCourseName(demo.getCourseName());
				modelObj.setDemoStatus(demo.getDemoStatus());
				modelObj.setStartDate(demo.getStartDate());
				models.add(modelObj);
			}
		    
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			//jsonConfig.setExcludes(new String[] { "appUsers" });
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.accumulate("sEcho", sEcho);
			jsonObj.accumulate("iTotalRecords", iTotalRecords);
			jsonObj.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			jsonObj.accumulate("aaData", array);
			
			logger.debug("Exit of showStudentsDemo");
			return jsonObj;
		} catch (Exception ex) {
			logger.error("Caught exception while loading students demo data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * 
	 * @param id
	 * @param courseName
	 * @param branchName
	 * @param demoStatus
	 * @param startDate
	 * @param model
	 * @return
	 */
	public AppPolyglotDemoModel prepareStudentModel(Integer id, String courseName, String branchName, 
			String demoStatus, String startDate, AppPolyglotDemoModel model){
		model.setId(id);
		model.setBranchName(branchName);
		model.setCourseName(courseName);
		model.setStartDate(startDate);
		model.setDemoStatus(demoStatus);
		return model;
	}
	
	/**
	 * Method for dropping a student demo
	 * @param ids
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateStudentDemo", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateStudentDemo(@RequestParam(value = "demoIds[]") Integer[] demoIds, @RequestParam("status") String status,
			HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		logger.debug("Inside of updateStudentDemo");
		JSONObject object = new JSONObject();
				
		for (Integer id : demoIds) {
			logger.debug("student id is:"+id+":status is:"+status);
			AppPolyglotLeadDemoStatus demoSts = demoStatusService.load(id);
			
			if(null != demoSts){
				demoSts.setInviteStatus(status);			
				demoSts.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				demoSts.setLastInsrtUpdUsrId(loggedInUser.getId());
				demoStatusService.save(demoSts);
			}
		}
		logger.debug("Exit of updateStudentDemo");
		return object;
	}
}
