package com.polyglot.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.polyglot.domain.AppEmailTemplate;
import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.domain.AppPolyglotDemo;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.domain.AppPolyglotInvites;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppPolyglotPayment;
import com.polyglot.domain.AppPolyglotPlan;
import com.polyglot.domain.AppPolyglotQuiz;
import com.polyglot.domain.AppPolyglotQuizQuestions;
import com.polyglot.domain.AppPolyglotStudent;
import com.polyglot.domain.AppPolyglotTask;
import com.polyglot.domain.AppStudentQuiz;
import com.polyglot.domain.AppStudentTask;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.AppUsersEducationDetails;
import com.polyglot.domain.AppUsersExperienceDetails;
import com.polyglot.domain.AppUsersSkillSetDetails;
import com.polyglot.domain.AppUsersSocialMedia;
import com.polyglot.domain.DmnCities;
import com.polyglot.domain.DmnCntry;
import com.polyglot.domain.DmnCourse;
import com.polyglot.domain.DmnCoursesTests;
import com.polyglot.domain.DmnDegree;
import com.polyglot.domain.DmnKeywordCategories;
import com.polyglot.domain.DmnLocation;
import com.polyglot.domain.DmnPolyglotPlans;
import com.polyglot.domain.DmnQuestions;
import com.polyglot.domain.DmnStates;
import com.polyglot.domain.DmnYrpassout;
import com.polyglot.domain.PolyglotCourse;
import com.polyglot.domain.PolyglotFaculty;
import com.polyglot.model.AppPolyglotBranchModel;
import com.polyglot.model.AppPolyglotLeadModel;
import com.polyglot.model.AppPolyglotPaymentModel;
import com.polyglot.model.AppPolyglotPlanModel;
import com.polyglot.model.AppPolyglotQuizModel;
import com.polyglot.service.AppEmailTemplateService;
import com.polyglot.service.AppPolyglotBatchService;
import com.polyglot.service.AppPolyglotBranchService;
import com.polyglot.service.AppPolyglotCourseService;
import com.polyglot.service.AppPolyglotDemoService;
import com.polyglot.service.AppPolyglotFacultyService;
import com.polyglot.service.AppPolyglotLeadService;
import com.polyglot.service.AppPolyglotPaymentService;
import com.polyglot.service.AppPolyglotPlanService;
import com.polyglot.service.AppPolyglotQuizQuestionsService;
import com.polyglot.service.AppPolyglotQuizService;
import com.polyglot.service.AppPolyglotRegistrationService;
import com.polyglot.service.AppPolyglotStudentService;
import com.polyglot.service.AppPolyglotTaskService;
import com.polyglot.service.AppStudentQuizService;
import com.polyglot.service.AppStudentTaskService;
import com.polyglot.service.AppUsersEducationDetailsService;
import com.polyglot.service.AppUsersExperienceDetailsService;
import com.polyglot.service.AppUsersSkillSetDetailsService;
import com.polyglot.service.AppUsersSocialMediaService;
import com.polyglot.service.ConfigurationService;
import com.polyglot.service.DmnCitiesService;
import com.polyglot.service.DmnCountryService;
import com.polyglot.service.DmnCourseService;
import com.polyglot.service.DmnCoursesTestService;
import com.polyglot.service.DmnDegreesService;
import com.polyglot.service.DmnKeywordCategoriesService;
import com.polyglot.service.DmnLocationService;
import com.polyglot.service.DmnPassoutYearService;
import com.polyglot.service.DmnPolyglotPlansService;
import com.polyglot.service.DmnQuestionsService;
import com.polyglot.service.DmnStatesService;
import com.polyglot.service.PolyglotEmailService;
import com.polyglot.utils.PolyglotConstants;
import com.polyglot.utils.PolyglotFileUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

@Controller
public class PolyglotController {
	
	private static final Logger logger = Logger.getLogger(PolyglotController.class);

	@Autowired
	private DmnCourseService courseService;
	
	@Autowired
	private AppPolyglotCourseService appCourseService;
	
	@Autowired
	private DmnCoursesTestService courseTestService;
	
	@Autowired
	private AppPolyglotBranchService branchService;
	
	@Autowired
	private AppStudentQuizService studentQuizService;
	
	@Autowired
	private AppPolyglotLeadService leadService;
	
	@Autowired
	private AppPolyglotFacultyService appFacultyService;
	
	@Autowired
	private AppPolyglotBatchService batchService;
	
	@Autowired
	private AppPolyglotStudentService studentService;
	
	@Autowired
	private AppPolyglotRegistrationService  registrationService;
	
	@Autowired
	private DmnCountryService  countryService;
	
	@Autowired
	private DmnStatesService  statesService;
	
	@Autowired
	private DmnCitiesService  citiesService;
	
	@Autowired
	private AppPolyglotPaymentService paymentService;
	
	@Autowired
	private DmnDegreesService degreeService;
	
	@Autowired
	private DmnPassoutYearService passoutYearService;
	
	@Autowired
	private AppPolyglotPlanService planService;
	
	@Autowired
	private DmnLocationService locationService;
	
	@Autowired
	private DmnKeywordCategoriesService keywordService;
	
	@Autowired
	private DmnPolyglotPlansService dmnPlansService;
	
	@Autowired
	private AppEmailTemplateService templateService;
	
	@Autowired
	private AppPolyglotDemoService demoService;
	
	@Autowired
    private ConfigurationService configurationService ;
	
	@Autowired
	private PolyglotEmailService emailService;
	
	@Autowired
	private AppPolyglotTaskService taskService;
	
	@Autowired
	private AppStudentTaskService studentTaskService;
	
	@Autowired
	private DmnQuestionsService dmnQuestionsService;
		
	@Autowired
	private AppPolyglotQuizService appQuizService;
	
	@Autowired
	private AppUsersSocialMediaService socialMediaService;
	
	@Autowired
	private AppPolyglotQuizQuestionsService quizQuestionsService;
	
	@Autowired
	private AppUsersEducationDetailsService educationDetailsService;
	
	@Autowired
	private AppUsersExperienceDetailsService experienceDetailsService;
	
	@Autowired
	private AppUsersSkillSetDetailsService skillSetService;
		
	@Autowired
	private DmnQuestionsService dmnQuestionService;
	
	public static Map<String,String> citiesMap = new HashMap<String, String>();
	public static Map<Integer,String> courseMap = new HashMap<Integer, String>();
	
	
	@RequestMapping(value = "getCourseList", method = RequestMethod.GET)
	public @ResponseBody List<String> getCourseList() {
		logger.debug("Inside getCourseList");
		List<String> courseList = new ArrayList<String>();
		
		for (DmnCourse course : courseService.getAll()) {
			courseList.add(course.getCourseName());
			courseList.add(course.getCategory());
		}
		
		return courseList;
	}
	
	@RequestMapping(value = "getCourseListForPartner", method = RequestMethod.GET)
	public @ResponseBody List<String> getCourseListForPartner(HttpServletRequest request) {
		logger.debug("Inside getCourseListForPatner");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		List<String> courseList = new ArrayList<String>();
		Map<Integer, String> dmnCourseMap = null;
		if(PolyglotFileUtils.isEmpty(courseMap)){
			dmnCourseMap = getCourseListAndId();
		}else{
			dmnCourseMap = courseMap;
		}
				
		for (AppPolyglotCourse course : loggedInUser.getAppPolyglotCourses()) {
			courseList.add(dmnCourseMap.get(course.getDmnCourseId()));
		}
		
		return courseList;
	}
	
	
	
	@RequestMapping(value = "getCourseListAndId", method = RequestMethod.GET)
	public @ResponseBody
	Map<Integer, String> getCourseListAndId() {
		logger.debug("Inside getCourseList");
		Map<Integer, String> courseList = new HashMap<Integer, String>();

		for (DmnCourse course : courseService.getAll()) {
			courseList.put(course.getId(), course.getCourseName());
		}

		return courseList;
	}
	
	@RequestMapping(value = "getBranchList", method = RequestMethod.GET)
	public @ResponseBody List<String> getBranchList() {
		logger.debug("Inside getBranchList");
		List<String> branchList = new ArrayList<String>();
		
		for (AppPolyglotBranch branch : branchService.getAll()) {
			branchList.add(branch.getName());
		}
		
		return branchList;
	}
	
	
	@RequestMapping(value = "getBranchListForPartner", method = RequestMethod.GET)
	public @ResponseBody List<String> getBranchListForPartner(HttpServletRequest request) {
		logger.debug("Inside getBranchList");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<String> branchList = new ArrayList<String>();
		
		for (AppPolyglotBranch branch : loggedInUser.getAppPolyglotBranches()) {
			branchList.add(branch.getName());
		}
		
		return branchList;
	}
	
	
	
	@RequestMapping(value = "getBranchListWithName", method = RequestMethod.GET)
	public @ResponseBody List<String> getBranchListWithName() {
		logger.debug("Inside getBranchList");
		List<String> branchList = new ArrayList<String>();
		
		for (AppPolyglotBranch branch : branchService.getAll()) {
			branchList.add(branch.getName().toUpperCase());
		}
		
		return branchList;
	}
	
	@RequestMapping(value = "getFacultyListWithId", method = RequestMethod.GET)
	public @ResponseBody JSONArray getFacultyList() {
		logger.debug("Inside getFacultyList");
		List<AppPolyglotFaculty> facultyList = appFacultyService.getAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		
		return JSONArray.fromObject(facultyList, jsonConfig);
	}
	
	@RequestMapping(value = "getFacultyListForPartner", method = RequestMethod.POST)
	public @ResponseBody JSONObject getFacultyListForPartner(HttpServletRequest request) {
		logger.debug("Inside getFacultyList");
		JSONObject leadObj = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Map<String, String> params = new HashMap<String, String>();
		
		String sql = "from AppUsers u where u.userType =:userType";
		params.put("userType", "T");
		
		List<AppUsers> lstOfUsers = registrationService.runQuery(sql, params);
		PolyglotFaculty faculty = null;
		List<PolyglotFaculty> lstOfFaculty = new ArrayList<PolyglotFaculty>();
		for(AppUsers user: lstOfUsers){
			faculty = new PolyglotFaculty();
			faculty.setFacultId(user.getId());
			faculty.setfName(user.getFname());
			faculty.setlName(user.getLname());
			faculty.setMobile(user.getMobile());
			faculty.setEmailId(user.getEmailId());
			lstOfFaculty.add(faculty);
		}
		logger.debug("faculty list:"+lstOfFaculty);
		leadObj.accumulate("faculty", lstOfFaculty);
		return leadObj;
	}
	
	@RequestMapping(value = "getStudentListAndId", method = RequestMethod.GET)
	public @ResponseBody
	Map<Integer, String> getStudentListAndId() {
		logger.debug("Inside getStudentListAndId");
		Map<Integer, String> studentList = new HashMap<Integer, String>();

		for (AppPolyglotStudent student : studentService.getAll()) {
			studentList.put(student.getId(), student.getStudentName());
		}

		return studentList;
	}
	
	@RequestMapping(value = "getBatchListAndId", method = RequestMethod.GET)
	public @ResponseBody
	Map<Integer, String> getBatchListAndId() {
		logger.debug("Inside getBatchListAndId");
		Map<Integer, String> batchList = new HashMap<Integer, String>();
		List<AppPolyglotBatch> activeBatches = batchService.getAll().stream().filter(p -> p.getBatchStatus().equalsIgnoreCase(PolyglotConstants.BATCH_STATUS_SCHEDULED) ||
				p.getBatchStatus().equalsIgnoreCase(PolyglotConstants.BATCH_STATUS_IN_PROGRESS) ||
				p.getBatchStatus().equalsIgnoreCase(PolyglotConstants.BATCH_STATUS_PROPOSED)).collect(Collectors.toList());
		
		for (AppPolyglotBatch batch : activeBatches) {
			batchList.put(batch.getBatchId(), batch.getBatchName());
		}

		return batchList;
	}
	
	@RequestMapping(value = "showAppCourses", method = RequestMethod.GET)
	public @ResponseBody JSONObject showCourseData(HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("Inside show courses.");
		
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotCourse> list = new LinkedList<AppPolyglotCourse>();
		    list = loggedInUser.getAppPolyglotCourses().stream().filter(c -> !PolyglotConstants.N_STR.equalsIgnoreCase(c.getIsActive())).collect(Collectors.toList());
		    list.sort(Comparator.comparing(AppPolyglotCourse::getLastInsrtUpdTs).reversed());
		    iTotalRecords = list.size();
		    List<PolyglotCourse> courses = new LinkedList<PolyglotCourse>();
		    List<PolyglotCourse> filtered = new LinkedList<PolyglotCourse>();
		    PolyglotCourse courseElement = null;
		    
		    Map<Integer, String> courseSerachMap = null;
			if(PolyglotFileUtils.isEmpty(courseMap)){
				courseSerachMap = getCourseListAndId();
			}else{
				courseSerachMap = courseMap;
			}
		    logger.debug("sSearch:"+sSearch);
		    if (sSearch != null) {
				for (AppPolyglotCourse c : list) {
					courseElement = new PolyglotCourse();
					if(null != c){
						if (null != c.getDmnCourseId() && courseSerachMap.get(c.getDmnCourseId()).toLowerCase().contains(sSearch.toLowerCase())) {						
							filtered.add(prepareCourseData(c.getId(), c.getDmnCourseId(), courseSerachMap.get(c.getDmnCourseId()), c.getRealtimeProjs(), 
									c.getFeeInInstallments(), c.getLabAssistance(), c.getPlacementAssistance(), c.getOnline(), c.getClassroom(), c.getCorporate(),
									c.getCourseContent(), c.getVideoContent(), courseElement));
						} else {
							courses.add(prepareCourseData(c.getId(), c.getDmnCourseId(), courseSerachMap.get(c.getDmnCourseId()), c.getRealtimeProjs(), 
									c.getFeeInInstallments(), c.getLabAssistance(), c.getPlacementAssistance(), c.getOnline(), c.getClassroom(), c.getCorporate(), 
									c.getCourseContent(), c.getVideoContent(), courseElement));
						}
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
		    
		    //Number of courses that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = courses.size();
		    
		    if(courses.size()< iDisplayStart + iDisplayLength)
		    	courses = courses.subList(iDisplayStart, courses.size());
		    else
		    	courses = courses.subList(iDisplayStart, iDisplayStart + iDisplayLength);
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "appUsers" });
			config.setIgnoreDefaultExcludes(false);
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			
			JSONArray array = JSONArray.fromObject(courses, config);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading course data : " + ex, ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "saveUpdateCourseData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject updateCourseData(HttpServletRequest request, HttpSession session) {
		logger.debug("save course data");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		PolyglotCourse courseObj = new PolyglotCourse();
		String jsonData = request.getParameter("data");
		logger.debug("data is:"+jsonData);
		try {
			courseObj = new ObjectMapper().readValue(jsonData, PolyglotCourse.class);
		} catch (JsonParseException jpe) {
			logger.error("jpe exception while converting object:", jpe);
		} catch (JsonMappingException jme) {
			logger.error("jme exception while converting object:", jme);
		} catch (IOException ioe) {
			logger.error("ioe exception while converting object:",ioe);
		}
		logger.debug("course data is:"+courseObj);
		AppPolyglotCourse params = new AppPolyglotCourse();
		
		try {
			params.setId(courseObj.getId());
			params.setDmnCourseId(courseObj.getDmnCourseId());
			params.setOnline(courseObj.getOnline());
			params.setClassroom(courseObj.getClassroom());
			params.setCorporate(courseObj.getCorporate());
			params.setFeeInInstallments(courseObj.getFeeInInstallments());
			params.setRealtimeProjs(courseObj.getRealtimeProjs());
			params.setLabAssistance(courseObj.getLabAssistance());
			params.setPlacementAssistance(courseObj.getPlacementAssistance());
			params.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
					.getTimeInMillis()));
			params.setLastInsrtUpdUsrId(loggedInUser.getId());
			params.setAppUsers(loggedInUser);
			params.setIsActive(PolyglotConstants.Y_STR);

			appCourseService.save(params);
		} catch (Exception ex) {
			logger.error("exception while storing the course data:", ex);
		}
		Set<AppPolyglotCourse> courses = loggedInUser.getAppPolyglotCourses();
		for (AppPolyglotCourse course : courses) {
			if (course.getId().equals(params.getId())) {
				courses.remove(course);
				break;
			}
		}
		courses.add(params);
		loggedInUser.setAppPolyglotCourses(courses);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		JSONObject jsonObj = JSONObject.fromObject(courseObj, jsonConfig);
		
		
		return jsonObj;
	}
	
	@RequestMapping(value = "deleteCourseData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteCourseData(@RequestParam(value = "courseIds[]") Integer[] ids, HttpSession session) {
		logger.debug("deleting  selected course");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		Set<AppPolyglotCourse> courses = loggedInUser.getAppPolyglotCourses();
		for (Integer id : ids) {
			AppPolyglotCourse appCourse = appCourseService.load(id);
			appCourse.setIsActive(PolyglotConstants.N_STR);
			appCourse.setLastInsrtUpdUsrId(loggedInUser.getId());
			appCourse.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			appCourseService.save(appCourse);
			for (AppPolyglotCourse course : courses) {
				if (course.getId().equals(appCourse.getId())) {
					courses.remove(course);
					break;
				}
			}
			courses.add(appCourse);
		}
		
		loggedInUser.setAppPolyglotCourses(courses);
		logger.debug("Exit of deleteCourseData");
		return returnObj;
	}
		
	@RequestMapping(value = "singleUpload", method = RequestMethod.POST)
	public @ResponseBody
	String singleFileUpload(@RequestParam("file") MultipartFile file,
			@RequestParam("uploadType") String uploadType,
			@RequestParam("uploadCourseName") String uploadCourseName,
			HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		String returnString = "{}";
		
		//Upload path cannot be empty, Else throw exception
		if (StringUtils.isEmpty(configurationService.getUploadLocation())) {
			logger.error("File upload path is empty, Check properties file");
			throw new ResourceNotFoundException("Upload Path is empty");
		}
		File partnerFolder = new File(configurationService.getUploadLocation() + File.separator + loggedInUser.getId());
		if (!partnerFolder.exists()) {
			if (partnerFolder.mkdir()) {
				logger.debug("Successfully created partner folder : " + partnerFolder);
			} else {
				logger.debug("Failed to create partner directory!" + partnerFolder);
			}
		} else {
			logger.debug("partner folder already exists with name : " + partnerFolder);
		}
		File folder = new File(partnerFolder + File.separator + uploadType);
		if (!folder.exists()) {
			if (folder.mkdir()) {
				logger.debug("Successfully created course folder : " + uploadType);
			} else {
				logger.debug("Failed to create upload directory!" + uploadType);
			}
		} else {
			logger.debug("course folder already exists with name : " + uploadType);
		}

		File subFolder = new File(folder + "/" + uploadCourseName);
		if (!subFolder.exists()) {
			if (subFolder.mkdir()) {
				logger.debug("Successfully created sub folder of type : "
						+ uploadCourseName);
			} else {
				logger.debug("Failed to create sub folder directory!");
			}
		} else {
			logger.debug("sub folder already exists with name : " + uploadCourseName);
		}

		File newFile = new File(subFolder + "/" + file.getOriginalFilename());
		JSONObject json = new JSONObject();
		returnString = json.accumulate("content", subFolder + "/" + file.getOriginalFilename()).toString();
		logger.debug("file path is : "+returnString);
		try {
			file.transferTo(newFile);
		} catch (IOException exception) {
			logger.error(exception.getMessage(), exception);
			returnString = "Couldn't upload the file";
		}

		return returnString;
	}
	
	@RequestMapping(value = "showBranches", method = RequestMethod.GET)
	public @ResponseBody JSONObject showBranches(HttpServletRequest request) {
		logger.debug("Inside show branches.");
		
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotBranch> list = new LinkedList<AppPolyglotBranch>();
		    list = loggedInUser.getAppPolyglotBranches().stream().filter(b -> !PolyglotConstants.N_STR.equalsIgnoreCase(b.getIsActive())).collect(Collectors.toList());
		    list.sort(Comparator.comparing(AppPolyglotBranch::getLastInsrtUpdTs).reversed());
		    iTotalRecords = list.size();
		    List<AppPolyglotBranch> branches = new LinkedList<AppPolyglotBranch>();
		    List<AppPolyglotBranch> filtered = new LinkedList<AppPolyglotBranch>();
		    if (sSearch != null) {
				for (AppPolyglotBranch c : list) {
					if (c.getName().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getAddressLine1().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getAddressLine2().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getCity().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getZipCode().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getContactName().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getContactEmail().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getContactMobile().contains(sSearch.toLowerCase())) {
						filtered.add(c); // Add a company that matches search criterion
					} else {
						branches.add(c);
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	branches = filtered;
		    } else {
		    	iTotalDisplayRecords = branches.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = branches.size();
		    
		    if(branches.size()< iDisplayStart + iDisplayLength)
		    	branches = branches.subList(iDisplayStart, branches.size());
		    else
		    	branches = branches.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			
			List<AppPolyglotBranchModel> models = new ArrayList<AppPolyglotBranchModel> ();
			
			for (AppPolyglotBranch branch : branches) {
				AppPolyglotBranchModel model = new AppPolyglotBranchModel();
				
				model.setId(branch.getId());
				model.setAddressLine1(branch.getAddressLine1());
				model.setAddressLine2(branch.getAddressLine2());
				model.setLocation(branch.getLocation());
				model.setCity(citiesMap.get(branch.getCity()));
				model.setPinCode(branch.getZipCode());
				
				model.setContactName(branch.getContactName());
				model.setMobile(branch.getContactMobile());
				model.setEmail(branch.getContactEmail());
				
				model.setName(branch.getName());
				
				model.setAddress(branch.getAddressLine1() + "," 
				+ branch.getAddressLine2() + ","
				+ branch.getLocation() + ","
				+ citiesMap.get(branch.getCity()) + ","
				+ branch.getZipCode());
				
				model.setContact(branch.getContactName() + "\n"
						+ branch.getContactMobile() + "\n"
						+ branch.getContactEmail());
				
				models.add(model);
			}
			
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading branch data : " + ex, ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "saveUpdateBranchData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject updateBranchData(@RequestBody final AppPolyglotBranchModel model, @RequestParam("id") Integer id, HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		logger.debug("saveUpdateBranchData****");
		Timestamp current = new Timestamp(Calendar.getInstance().getTime().getTime());
		AppPolyglotBranch branch = new AppPolyglotBranch();
		
		try{
			if (id != null && id > 0) {
				branch = branchService.load(id);
			}
			
			branch.setName(model.getName());
					
			branch.setContactEmail(model.getEmail());
			branch.setContactMobile(model.getMobile());
			branch.setContactName(model.getContactName());
					
			branch.setAddressLine1(model.getAddressLine1());
			branch.setAddressLine2(model.getAddressLine2());
			branch.setLocation(model.getLocation());
			branch.setCity(model.getCity());
			branch.setZipCode(model.getPinCode());
			
			
			branch.setLastInsrtUpdTs(current);
			branch.setLastInsrtUpdUsrId(loggedInUser.getId());
			branch.setAppUsers(loggedInUser);
			branch.setIsActive(PolyglotConstants.Y_STR);
			//Save branch
			branchService.save(branch);
			
			//Refresh child object
			Set<AppPolyglotBranch> branches = loggedInUser.getAppPolyglotBranches();
			for (AppPolyglotBranch item : branches) {
				if (item.getId().equals(branch.getId())) {
					branches.remove(item);
					break;
				}
			}
			branches.add(branch);
			loggedInUser.setAppPolyglotBranches(branches);
			
			model.setId(branch.getId());
			model.setAddressLine1(branch.getAddressLine1());
			model.setAddressLine2(branch.getAddressLine2());
			model.setLocation(branch.getLocation());
			model.setCity(branch.getCity());
			model.setPinCode(branch.getZipCode());
			
			model.setContactName(branch.getContactName());
			model.setMobile(branch.getContactMobile());
			model.setEmail(branch.getContactEmail());
			
			model.setName(branch.getName());
			
			model.setAddress(branch.getAddressLine1() + "," 
			+ branch.getAddressLine2() + ","
			+ branch.getLocation() + ","
			+ branch.getCity() + ","
			+ branch.getZipCode());
			
			model.setContact(branch.getContactName() + "\n"
					+ branch.getContactMobile() + "\n"
					+ branch.getContactEmail());
			
		}catch(Exception ex){
			logger.error("error while saving the branch details", ex);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		JSONObject jsonObj = JSONObject.fromObject(model, jsonConfig);
		
		return jsonObj;
	}
	
	@RequestMapping(value = "deleteBranchData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteCompanyData(@RequestParam(value = "branchIds[]") Integer [] ids, HttpSession session) {
		logger.debug("deleting  selected branch");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Set<AppPolyglotBranch> branches = loggedInUser.getAppPolyglotBranches();
		JSONObject returnObj = new JSONObject();
		for (Integer id : ids) {
			AppPolyglotBranch branch = branchService.load(id);
			branch.setIsActive(PolyglotConstants.N_STR);
			branch.setLastInsrtUpdUsrId(loggedInUser.getId());
			branch.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			branchService.save(branch);
			
			for (AppPolyglotBranch item : branches) {
				if (item.getId().equals(branch.getId())) {
					branches.remove(item);
					break;
				}
			}
			branches.add(branch);
		}
		
		loggedInUser.setAppPolyglotBranches(branches);
		
		return returnObj;
	}
	
	@RequestMapping(value = "deleteLeadData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteLeadData(@RequestParam(value = "leadIds[]") Integer [] ids, HttpSession session) {
		logger.debug("deleting  selected lead");
		JSONObject returnObj = new JSONObject();
		for (Integer id : ids) {
		AppPolyglotLead lead = leadService.load(id);
		leadService.delete(lead);
		}
		
		return returnObj;
	}

	@RequestMapping(value = "saveUpdateFacultyData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateFacultyData(HttpServletRequest request, HttpSession session) {
		logger.debug("saveUpdateFacultyData****");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		String jsonData = request.getParameter("data");
		PolyglotFaculty facultyObj = null;
		logger.debug("data is:"+jsonData);
		try {
			facultyObj = new ObjectMapper().readValue(jsonData, PolyglotFaculty.class);
		} catch (JsonParseException jpe) {
			logger.error("jpe exception while converting object:", jpe);
		} catch (JsonMappingException jme) {
			logger.error("jme exception while converting object:", jme);
		} catch (Exception ioe) {
			logger.error("ioe exception while converting object:",ioe);
		}
		logger.debug("faculty data is:"+facultyObj);
		
		AppPolyglotFaculty params = new AppPolyglotFaculty();
		params.setId(facultyObj.getId());
		params.setFacultyId(facultyObj.getFacultId());
		params.setCourseId(facultyObj.getCourseId());
		params.setMode(facultyObj.getMode());
		params.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		params.setLastInsrtUpdUsrId(loggedInUser.getId());
		params.setAppUsers(loggedInUser);
		params.setIsPrivate(facultyObj.getIsPrivate());
		params.setIsActive(PolyglotConstants.Y_STR);
		appFacultyService.save(params);
		
		Set<AppPolyglotFaculty> facultyList = loggedInUser.getAppPolyglotFaculty();
		for (AppPolyglotFaculty item : facultyList) {
			if (params.getId().equals(item.getId())) {
				facultyList.remove(item);
				break;
			}
		}
		facultyList.add(params);
		loggedInUser.setAppPolyglotFaculty(facultyList);
		
		DmnCourse course = courseService.load(params.getCourseId());
		params.setCourseName(course.getCourseName());
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObj = JSONObject.fromObject(params, jsonConfig);
		return jsonObj;
	}
	
	@RequestMapping(value = "deleteFacultyData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteFacultyData(@RequestParam(value = "facultyIds[]") Integer [] ids, HttpSession session) {
		logger.debug("deleting  selected Faculty");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Set<AppPolyglotFaculty> facultyList = loggedInUser.getAppPolyglotFaculty();
		JSONObject returnObj = new JSONObject();
		for (Integer id : ids) {
			AppPolyglotFaculty faculty = appFacultyService.load(id);
			faculty.setIsActive(PolyglotConstants.N_STR);
			faculty.setLastInsrtUpdUsrId(loggedInUser.getId());
			faculty.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			appFacultyService.save(faculty);
			for (AppPolyglotFaculty item : facultyList) {
				if (item.getId().equals(item.getId())) {
					facultyList.remove(item);
					break;
				}
			}
			facultyList.add(faculty);
		}
		
		loggedInUser.setAppPolyglotFaculty(facultyList);
		
		return returnObj;
	}

	@RequestMapping(value = "getFacultyList", method = RequestMethod.GET)
	public @ResponseBody
	JSONObject getFacultyList(HttpServletRequest request) {
		logger.debug("Inside getFacultyList");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		String sEcho = request.getParameter("sEcho");
		String sSearch = request.getParameter("sSearch");
		
		int iTotalRecords =0; //total number of records (not filtered)
	    int iTotalDisplayRecords =0;//value will be set when code filters companies by keyword
		
		JSONArray array = null;
		try {
			List<AppPolyglotFaculty> facultyList = new LinkedList<AppPolyglotFaculty> ();
			facultyList = loggedInUser.getAppPolyglotFaculty().stream().filter(f -> !PolyglotConstants.N_STR.equalsIgnoreCase(f.getIsActive())).collect(Collectors.toList());
			facultyList.sort(Comparator.comparing(AppPolyglotFaculty::getLastInsrtUpdTs).reversed());
			iTotalRecords = facultyList.size();
			
			List<PolyglotFaculty> finalList = new ArrayList<PolyglotFaculty>();
			List<PolyglotFaculty> filtered = new LinkedList<PolyglotFaculty>();
			PolyglotFaculty facultyElement = null;
			
			for (AppPolyglotFaculty faculty : facultyList) {

				DmnCourse course = courseService.load(faculty.getCourseId());
				logger.debug("faculty.getFacultyId() is:"+faculty.getFacultyId());
				AppUsers usr = registrationService.load(faculty.getFacultyId());
				faculty.setCourseName(course.getCourseName());
				logger.debug("sSearch:"+sSearch);
				if (sSearch != null) {
					facultyElement = new PolyglotFaculty();
					if (faculty.getCourseName().contains(sSearch) || 
							(usr.getFname()+" "+usr.getLname()).contains(sSearch) ||
							faculty.getMode().contains(sSearch) ||
							usr.getMobile().contains(sSearch)) {
						if(null != usr){
							filtered.add(prepareFacultyData(faculty.getId(),usr.getFname(), usr.getLname(), usr.getMobile(), usr.getEmailId(),
									faculty.getCourseName(), faculty.getMode(), faculty.getFacultyId(), faculty.getIsPrivate(),faculty.getCourseId(), facultyElement));
						}
						
					}else{
						if(null != usr){
							finalList.add(prepareFacultyData(faculty.getId(),usr.getFname(), usr.getLname(), usr.getMobile(), usr.getEmailId(),
									faculty.getCourseName(), faculty.getMode(), faculty.getFacultyId(), faculty.getIsPrivate(),faculty.getCourseId(), facultyElement));
						}
					}
				}
						
			}
			if (sSearch != null) {
				iTotalDisplayRecords = filtered.size();
				finalList = filtered;
			} else {
			    iTotalDisplayRecords = finalList.size();
			}
			logger.debug("finalList:"+finalList);
			//Number of courses that matches search criterion should be returned
			int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
			int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
			
			if (iDisplayLength == -1) iDisplayLength = finalList.size();
			
			if(finalList.size()< iDisplayStart + iDisplayLength)
				finalList = finalList.subList(iDisplayStart, finalList.size());
			else
				finalList = finalList.subList(iDisplayStart, iDisplayStart + iDisplayLength);
			
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setExcludes(new String[] { "appUsers" });
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			array = JSONArray.fromObject(finalList, jsonConfig);
		} catch (Exception e) {
			logger.error("exception while preparing the faculty grid data:", e);
		}
		
		JSONObject object = new JSONObject();
		object.accumulate("sEcho", sEcho);
		object.accumulate("iTotalRecords", iTotalRecords);
		object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
		
		object.accumulate("aaData", array);
		logger.debug("Exit of getFacultyList");
		return object;
	}

	/**
	 * 
	 * @param plyBatchNo
	 * @param id
	 * @param batchStartDate
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "formNewBatch", method = RequestMethod.POST)
	public @ResponseBody String formANewBatch(@RequestParam("plyBatchNo") String plyBatchNo, 
			@RequestParam("batchId") Integer id,
			@RequestParam("batchStartDate") String batchStartDate, HttpServletRequest request) {
		logger.debug("Forming a new batch");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		//Update batch status to 'In progress' and update all lead statuses too.
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String currentDate = sdf.format(Calendar.getInstance().getTime());
		Boolean datesComparison = false;
		try {
			datesComparison = sdf.parse(currentDate).before(sdf.parse(batchStartDate));
		} catch (ParseException e) {
			e.printStackTrace();
			logger.error("Caught exception while processing batch start date comparison");
		}
		logger.debug("Date Comparison : " + datesComparison);
		
		AppPolyglotBatch batch = batchService.load(id);
		if (datesComparison) {
			logger.debug("Batch Start date Selected is current date, So set batch status to In Progress");
			batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_SCHEDULED);
		} else {
			logger.debug("Batch Start date selected is future date, So set batch status to scheduled");
			batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_IN_PROGRESS);
		}
		
		batch.setStartDate(currentDate);
		batchService.save(batch);
		
		Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
		for (AppPolyglotBatch item : batches) {
			if (batch.getBatchId().equals(item.getBatchId())) {
				batches.remove(item);
			}
		}
		batches.add(batch);
		loggedInUser.setAppPolyglotBatches(batches);

		Map<String, String> params = new HashMap<String, String>();
		String sql = "from AppPolyglotLead l where l.batchId =:batchId";
		
		params.put("batchId", plyBatchNo);
		
		List<AppPolyglotLead> leads = leadService.runQuery(sql, params);
		
		for (AppPolyglotLead lead : leads) {
			lead.setLeadStatus(PolyglotConstants.BATCH_STATUS_IN_PROGRESS);
			
			lead.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			lead.setLastInsrtUpdUsrId(-1);
			
			leadService.save(lead);
		}
		
		return "{}";
	}
	
/*	@RequestMapping(value = "cancelBatch", method = RequestMethod.POST)
	public @ResponseBody String cancelBatch(@RequestParam("plyBatchNo") String plyBatchNo, @RequestParam("batchId") Integer id) {
		
		logger.debug("Cancelling batch");
		//Update batch status to 'Cancelled' and update all lead statuses too.

		AppPolyglotBatch batch = batchService.load(id);
		batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_CANCELLED);
		batchService.save(batch);
		
		Map<String, String> params = new HashMap<String, String>();
		String sql = "from AppPolyglotLead l where l.batchId =:batchId";
		
		params.put("batchId", plyBatchNo);
		
		List<AppPolyglotLead> leads = leadService.runQuery(sql, params);
		
		for (AppPolyglotLead lead : leads) {
			lead.setLeadStatus(PolyglotConstants.BATCH_STATUS_CANCELLED);
			
			lead.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			lead.setLastInsrtUpdUsrId(-1);
			
			leadService.save(lead);
		}
		
		return "{}";
	}*/
	
	@RequestMapping(value = "showAppStudents", method = RequestMethod.GET)
	public @ResponseBody JSONObject showStudentsData(HttpServletRequest request) {
		logger.debug("Inside show students.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotLead> list = new LinkedList<AppPolyglotLead>();
		    Map<String, String> params = new HashMap<String, String>();
			
			String sql = "from AppPolyglotLead l where l.partnerId =:partnerId and l.leadStatus =:leadStatus";
			params.put("partnerId", String.valueOf(loggedInUser.getId()));
			params.put("leadStatus", PolyglotConstants.LEAD_STATUS_REGISTERD);
			list = leadService.runQuery(sql, params);
			list.sort(Comparator.comparing(AppPolyglotLead::getLastInsrtUpdTs));
		    iTotalRecords = list.size();
		    List<AppPolyglotLeadModel> students = new LinkedList<AppPolyglotLeadModel>();
		    List<AppPolyglotLeadModel> filtered = new LinkedList<AppPolyglotLeadModel>();
		    AppPolyglotLeadModel studentModel = null;
		    AppPolyglotBranch branch = new AppPolyglotBranch();
		    AppUsers exisitngUser = new AppUsers();
		    AppPolyglotBatch batch = new AppPolyglotBatch();
		    logger.debug("sSearch value is:"+sSearch);
		    if (sSearch != null) {
				for (AppPolyglotLead c : list) {
					if(null != c){
						studentModel = new AppPolyglotLeadModel();
						logger.debug("userId is:"+c.getUserId()+":course id is:"+c.getCourseId()+":branch id is:"+c.getBranchId()+":batch id is:"+c.getBatchId());
						/**get leads details based on app_user_id*/
						exisitngUser = registrationService.load(c.getUserId());
						/**get branch name based on branchId*/
						branch = branchService.load(c.getBranchId());
						/**get status based on batch id from batch table*/
						if(null != c.getBatchId()){
							batch = batchService.load(Integer.parseInt(c.getBatchId()));
						}
						
						if (null != batch && null != batch.getBatchName() && batch.getBatchName().toLowerCase().contains(sSearch.toLowerCase()) ||
								null != exisitngUser && null != exisitngUser.getFname() && exisitngUser.getFname().toLowerCase().contains(sSearch.toLowerCase()) ||
								null != exisitngUser && null != exisitngUser.getLname() && exisitngUser.getLname().toLowerCase().contains(sSearch.toLowerCase()) ||
								c.getMode().toLowerCase().contains(sSearch.toLowerCase()) ||
								null != batch && null != batch.getBatchStatus() && batch.getBatchStatus().toLowerCase().contains(sSearch.toLowerCase())){
							filtered.add(prepareStudentsModel(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(), batch.getBatchName(),
									c.getMode(), batch.getBatchStatus(), exisitngUser.getEmailId(), exisitngUser.getId(), batch.getFee(), batch.getFeeDiscount(), studentModel)); // Add a company that matches search criterion
						} else {
							students.add(prepareStudentsModel(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(), batch.getBatchName(),
									c.getMode(), batch.getBatchStatus(),exisitngUser.getEmailId(), exisitngUser.getId(), batch.getFee(), batch.getFeeDiscount(), studentModel));
						}
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	students = filtered;
		    } else {
		    	iTotalDisplayRecords = students.size();
		    }
		    
		    //Number of courses that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = students.size();
		    
		    if(students.size()< iDisplayStart + iDisplayLength)
		    	students = students.subList(iDisplayStart, students.size());
		    else
		    	students = students.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonConfig.setExcludes(new String[] {
					"lastInsrtUpdTs", "appUsers"});
			JSONArray array = JSONArray.fromObject(students, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading student data : " + ex, ex);
		}
		return null;
	}
	
	
	@RequestMapping(value = "saveStudentData", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateStudentData(@RequestBody final AppPolyglotStudent params, HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		Timestamp current = new Timestamp(Calendar.getInstance()
				.getTimeInMillis());
		
		logger.debug("save update student data****");
		
		//params.setJoinedDate(current);
		params.setLastInsrtUpdTs(current);
		params.setLastInsrtUpdUsrId(-1);
		params.setAppUsers(loggedInUser);

		studentService.save(params);
		Set<AppPolyglotStudent> students = loggedInUser.getAppPolyglotStudents();
		
		for (AppPolyglotStudent student : students) {
			if (params.getId().equals(student.getId())) {
				students.remove(student);
				break;
			}
		}
		students.add(params);
		loggedInUser.setAppPolyglotStudents(students);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		JSONObject jsonObj = JSONObject.fromObject(params, jsonConfig);
		
		return jsonObj;
	}
	
	
	/**
	 * Method to delete one or more students
	 * 
	 * @param ids
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "deleteStudentData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteStudentData(@RequestParam(value = "studentIds[]") Integer [] ids, HttpSession session) {
		logger.debug("deleting  selected student data");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Set<AppPolyglotStudent> students = loggedInUser.getAppPolyglotStudents();
		JSONObject returnObj = new JSONObject();
		for (Integer id : ids) {
			AppPolyglotStudent student = studentService.load(id);
			studentService.delete(student);
			for (AppPolyglotStudent item : students) {
				if (item.getId().equals(item.getId())) {
					students.remove(item);
					break;
				}
			}
			
		}
		
		loggedInUser.setAppPolyglotStudents(students);
		
		return returnObj;
	}
		
	@RequestMapping(value = "submitRegistration", method = RequestMethod.POST)
	public @ResponseBody JSONObject submitRegistration(@RequestBody final AppUsers registration,HttpServletRequest request) {
		logger.debug("submitRegistration");
		System.out.println(registration.getUserType());
		JSONObject returnObj = new JSONObject();
		List<AppUsers> regList = registrationService.runQuery(" from AppUsers s where s.id.emailId='"+registration.getEmailId()+"'", null);
		if(regList!=null && !regList.isEmpty()){
		  returnObj.accumulate("resp", "error");
		}else{
		  HttpSession session = request.getSession();
		  session.setAttribute("userType", registration.getUserType());
		  session.setAttribute("emailId", registration.getEmailId());
		  session.setAttribute("mobile", registration.getMobile());
		  int emailToken = emailService.sendMailForOTPRegistration(registration.getEmailId());
		  registration.setEmailOTP(String.valueOf(emailToken));
		  session.setAttribute("regObj", registration);
		  returnObj.accumulate("resp", "thanksforregistering");
		}
		return returnObj;
	}
	
	@RequestMapping(value = "getDecryptedData", method = RequestMethod.POST)
	public @ResponseBody JSONObject getDecryptedData(@RequestParam(value = "emailId") String emailId) {
		logger.debug("submitRegistration");
		JSONObject returnObj = new JSONObject();
		byte[] s = Base64.getMimeDecoder().decode(emailId);
		String file_string = "";
		for(int i = 0; i < s.length; i++)
		{
		    file_string += (char)s[i];
		}
		returnObj.accumulate("data", file_string);
		return returnObj;
	}
	
	
	@RequestMapping(value = "validateOTPandSaveUser", method = RequestMethod.POST)
	public @ResponseBody JSONObject validateOTPandSaveUser(HttpServletRequest request,@RequestParam(value = "emailOTP") String emailOTP) {
		logger.debug("submitRegistration");
		  JSONObject returnObj = new JSONObject();
		  HttpSession session = request.getSession();
		  
		  if(session.getAttribute("regObj")!=null){
			  AppUsers user = (AppUsers)session.getAttribute("regObj");
			  if(user!=null && user.getEmailOTP()!=null && user.getEmailOTP().equalsIgnoreCase(emailOTP)){
				    user.setLastInsrtUpdUsrId(-1);
				    user.setDsblIn("N");
				    String password = PolyglotFileUtils.cryptWithMD5(user.getPassword());
				    if(password!=null){
				    user.setPassword(password);
					registrationService.save(user);
					session.setAttribute("userId", user.getId());
					returnObj.accumulate("status", "SUCCESS");
				    }else{
				    returnObj.accumulate("status", "FAIL");
				    }
			  }else{
				  returnObj.accumulate("status", "FAIL");
			  }
		  }else{
			  returnObj.accumulate("status", "FAIL");
		  }
		return returnObj;
	}
	
	
	@RequestMapping(value = "/getTokensForVerifications", method = RequestMethod.GET)
	public @ResponseBody JSONObject getTokensForVerifications(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("emailId"));
		logger.debug("submitRegistration");
		JSONObject returnObj = new JSONObject();
		returnObj.accumulate("userType", session.getAttribute("userType"));
		returnObj.accumulate("emailId", session.getAttribute("emailId"));
		returnObj.accumulate("emailIdToken", emailService.sendMailForOTPRegistration(String.valueOf(session.getAttribute("emailId"))));
		returnObj.accumulate("mobile", session.getAttribute("mobile"));
		returnObj.accumulate("mobileToken","456");
		return returnObj;
	}

	@RequestMapping(value = "/static/logoutSession", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject logoutSession(HttpServletRequest request) {
		JSONObject returnObj = new JSONObject();
		HttpSession session = request.getSession();
		session.removeAttribute("emailId");
		session.removeAttribute("userType");
		session.removeAttribute("mobile");
		session.removeAttribute("emailIdToken");
		session.removeAttribute("mobileToken");
		session.invalidate();
		returnObj.accumulate("status", "Y");
		return returnObj;
	}
	
	@RequestMapping(value = "submitRegistrationAndSave", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject submitRegistrationAndSave(
			@RequestBody final AppUsers registration, HttpServletRequest request) {
		logger.debug("submitRegistration");
		System.out.println(registration.getUserType());
		JSONObject returnObj = new JSONObject();
		try {
			HttpSession session = request.getSession();
			registration.setEmailId(String.valueOf(session
					.getAttribute("emailId")));
			registration.setUserType(String.valueOf(session
					.getAttribute("userType")));
			registration.setMobile(String.valueOf(session
					.getAttribute("mobile")));
			registration.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			if (registration.getDob_str() != null) {
				long time = format.parse(registration.getDob_str()).getTime();
				registration.setDob(new Timestamp(time));
			}
			if (registration.getInst_date_str() != null) {
				long insttime = format.parse(registration.getInst_date_str())
						.getTime();
				registration.setInstEstblDate(new Timestamp(insttime));
			}
			registration.setLastInsrtUpdUsrId(-1);
			registration.setDsblIn("N");
			registrationService.save(registration);
			session.setAttribute("userId", registration.getId());
			returnObj.accumulate("status", "SUCCESS");
		} catch (Exception e) {
			logger.error("Error occured during processing " + e);
			returnObj.accumulate("status", "FAIl");
		}
		return returnObj;
	}
	
	@RequestMapping(value = "getDomainCntryData", method = RequestMethod.GET)
	public @ResponseBody JSONObject getDomainData() {
		logger.debug("getDomainData");
		JSONObject returnObj = new JSONObject();
		try{
		List<DmnCntry> countryList = countryService.getAll();
		Map<String,String> countryMap = new HashMap<String, String>();
		for(DmnCntry country : countryList){
			countryMap.put(String.valueOf(country.getCntryId()), country.getCntryDesc());
		}
		returnObj.accumulate("country",countryMap);
		List<DmnDegree> degreeList = degreeService.runQuery("from DmnDegree where dsblIn='N'", null);
		Map<String,String> degreeMap = new HashMap<String, String>();
		for(DmnDegree degree : degreeList){
			degreeMap.put(String.valueOf(degree.getDegreeName()), degree.getDegreeName());
		}
		returnObj.accumulate("degree",degreeMap);
		List<DmnYrpassout> passoutList = passoutYearService.runQuery("from DmnYrpassout where dsblIn='N'", null);
		Map<String,String> passoutMap = new HashMap<String, String>();
		for(DmnYrpassout passout : passoutList){
			passoutMap.put(String.valueOf(passout.getYear()), String.valueOf(passout.getYear()));
		}
		returnObj.accumulate("passout",passoutMap);
		}catch(Exception e){
		logger.error(e);	
		}
		return returnObj;
	}
	
	@RequestMapping(value = "getCitiesByStates", method = RequestMethod.GET)
	public @ResponseBody JSONObject getCitiesByStates(HttpServletRequest request) {
		logger.debug("getDomainData");
		JSONObject returnObj = new JSONObject();
		try{
		int stateId = 0;
			if(request.getParameter("stateId")!=null){
				stateId = Integer.valueOf(request.getParameter("stateId"));	
		}
		List<DmnCities> citiesList = citiesService.runQuery("from DmnCities s where s.dsblIn='N' and s.dmnStates.stateId="+stateId, null);
		Map<String,String> citiesMap = new HashMap<String, String>();
		for(DmnCities country : citiesList){
			citiesMap.put(String.valueOf(country.getCityId()), country.getCityDesc());
		}
		returnObj.accumulateAll(citiesMap);
		}catch(Exception e){
		logger.error(e);	
		}
		return returnObj;
	}
	
	@RequestMapping(value = "getStatesByCountry", method = RequestMethod.GET)
	public @ResponseBody JSONObject getStatesByCountry(HttpServletRequest request) {
		logger.debug("getDomainData");
		JSONObject returnObj = new JSONObject();
		try{
		int cntryId = 0;
		if(request.getParameter("cntryId")!=null){
			cntryId = Integer.valueOf(request.getParameter("cntryId"));	
		}
		List<DmnStates> stateList = statesService.runQuery("from DmnStates s where s.dmnCntry.cntryId="+cntryId, null);
		Map<String,String> stateMap = new HashMap<String, String>();
		for(DmnStates state : stateList){
			stateMap.put(String.valueOf(state.getStateId()), state.getStateDesc());
		}
		returnObj.accumulateAll(stateMap);
		}catch(Exception e){
		logger.error(e);	
		}
		return returnObj;
	}
	
	@RequestMapping(value = "findUser", method = RequestMethod.POST)
	public @ResponseBody JSONObject findUser(@RequestParam(value = "emailId") String emailId, 
			@RequestParam(value = "password") String password,
			HttpServletRequest request) {
		logger.debug("findUser");
		JSONObject returnObj = new JSONObject();
		try {
			// Get all users with emailId.
			String sql = "from AppUsers s where s.emailId =:emailId";
			Map<String, String> params = new HashMap<String, String>();

			params.put("emailId", emailId.trim());

			// List of users with the emailId provided
			List<AppUsers> users = registrationService.runQuery(sql, params);

			// If users found, then get exact match
			if (users != null && users.size() > 0) {
				AppUsers loggedInUser = (AppUsers) users.get(0);
				// Email found, but password or userType didn't match.
				String encypassword = PolyglotFileUtils.cryptWithMD5(password);
				// Email found, but password or userType didn't match.
				if (users.stream().anyMatch(p -> !p.getPassword().equals(encypassword))) {
					returnObj.accumulate("status", "INCORRECT");
				}

				// Login successful
				request.getSession().setAttribute("userType", loggedInUser.getUserType());
				request.getSession().setAttribute("emailId", emailId);
				request.getSession().setAttribute("userId", users.get(0).getId());
				request.getSession().setAttribute("firstName", users.get(0).getFname());
				request.getSession().setAttribute("lastName", users.get(0).getLname());
				request.getSession().setAttribute("password", users.get(0).getPassword());

				// Set user object in session.
				request.getSession().setAttribute(PolyglotConstants.APP_POLYGLOT_USER, loggedInUser);

				returnObj.accumulate("status", "SUCCESS");
				returnObj.accumulate("userType", loggedInUser.getUserType());
				

				checkUserPlansAndPermissions(loggedInUser, request);

			} else {
				// No users found with the emailId provided.
				returnObj.accumulate("status", "DNE");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		return returnObj;
	}
	
	
	//Write code to check if the user already has a subscription plan
	//If not, put him on a default subscription plan (Free plan)
	//Start with the current date and lasts for 30 days
	
	private void checkUserPlansAndPermissions(AppUsers loggedInUser, HttpServletRequest request) {
		logger.debug("checking user plans");
		try {
			if (loggedInUser == null) return ;
			if (loggedInUser.getAppPolyglotPlans() == null || loggedInUser.getAppPolyglotPlans().size() == 0) {
				logger.debug("User doesnt have a plan. So assign a default plan");
				Calendar c = new GregorianCalendar();
				c.add(Calendar.DATE, 30);
				Date d = c.getTime();
				AppPolyglotPlan defaultPlan = new AppPolyglotPlan();
				
				String sql = "from DmnPolyglotPlans p where p.planName =:'Basic'";
				Map<String, String> params = new HashMap<String, String>();
				
				defaultPlan.setPlan(dmnPlansService.runQuery(sql, params).get(0)); //Hard coded 
				defaultPlan.setAppUsers(loggedInUser);
				defaultPlan.setSubscriptionDate(new Timestamp(Calendar.getInstance()
						.getTimeInMillis()));
				//Set expiry date to 30 days from current date
				defaultPlan.setExpiredDate(new Timestamp(d.getTime()));
				defaultPlan.setLastInsrtUpdUsrId(loggedInUser.getId());
				defaultPlan.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
					.getTimeInMillis()));
				defaultPlan.setDuration(PolyglotConstants.APP_POLYGLOT_DEFAULT_PLAN_DURATION);
				defaultPlan.setIsExpired("N");
				
				planService.save(defaultPlan);
			} else {
				logger.debug("User already has plans subscribed. Plan subscrided to is : " + loggedInUser.getAppPolyglotPlans().toArray().toString());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		//Set the user permissions based on plan
		logger.debug("Setting user permissions.");
		HttpSession session = request.getSession();
		AppPolyglotPlan plan = loggedInUser.getAppPolyglotPlans().iterator().next();
		
		if (plan.getPlan().getViewContactLead() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_VIEW_CONTACT_LEAD, PolyglotConstants.PERMISSION_VIEW_CONTACT_LEAD);
		
		if (plan.getPlan().getAddNewBatches() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_ADD_NEW_BATCH, PolyglotConstants.PERMISSION_ADD_NEW_BATCH);

		if (plan.getPlan().getAddDemos() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_ADD_DEMO, PolyglotConstants.PERMISSION_ADD_DEMO);
		
		if (plan.getPlan().getFormBatches() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_FORM_BATCH, PolyglotConstants.PERMISSION_FORM_BATCH);
		
		if (plan.getPlan().getPaymentTracking() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_PAYMENT_TRACKING, PolyglotConstants.PERMISSION_PAYMENT_TRACKING);
		
		if (plan.getPlan().getCustomRuleEngine() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_CUSTOM_RULE_ENGINE, PolyglotConstants.PERMISSION_CUSTOM_RULE_ENGINE);
		
		if (plan.getPlan().getEmailTemplates() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_EMAIL_TEMPLATE, PolyglotConstants.PERMISSION_EMAIL_TEMPLATE);
		
		if (plan.getPlan().getOnlineQuizes() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_ONLINE_QUIZ, PolyglotConstants.PERMISSION_ONLINE_QUIZ);
		
		if (plan.getPlan().getCourseCertificate() == 1)
			session.setAttribute(PolyglotConstants.PERMISSION_COURSE_CERTIFICATE, PolyglotConstants.PERMISSION_COURSE_CERTIFICATE);
		
		logger.debug("All user permissions have been set based on the plan");
		
	}
	
	
	@RequestMapping(value = "showPayments", method = RequestMethod.GET)
	public @ResponseBody JSONObject showPaymentData(HttpServletRequest request) {
		logger.debug("Inside showPaymentData.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotPayment> list = new LinkedList<AppPolyglotPayment>();
		    Map<String, String> params = new HashMap<String, String>();
		    params.put("appUsers", String.valueOf(loggedInUser.getId()));
		    String sql = "from AppPolyglotPayment p where p.appUsers =:appUsers";
		    list = paymentService.runQuery(sql, params);
		    
		    iTotalRecords = list.size();
		    list.sort(Comparator.comparing(AppPolyglotPayment::getLastInsrtUpdTs).reversed());
		    List<AppPolyglotPaymentModel> payments = new LinkedList<AppPolyglotPaymentModel>();
		    List<AppPolyglotPaymentModel> filtered = new LinkedList<AppPolyglotPaymentModel>();
		    AppPolyglotPaymentModel payModel = null;
		    AppUsers exisitngUser = new AppUsers();
		    if (sSearch != null) {
				for (AppPolyglotPayment c : list) {
					payModel = new AppPolyglotPaymentModel();
					if(null != c){
						/**get leads details based on app_user_id*/
						exisitngUser = registrationService.load(c.getUserId());
						if (null != exisitngUser && null != exisitngUser.getFname() && exisitngUser.getFname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getLname() && exisitngUser.getLname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getMode() && c.getMode().toUpperCase().contains(sSearch.toUpperCase())) {
							filtered.add(preparePaymentDtls(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(),
									c.getTotalFee(), c.getFeePaid(), c.getFeePending(), c.getMode(), c.getTransactionRef(),
									c.getOptedDiscount(), payModel)); // Add a company that matches search criterion
						} else {
							payments.add(preparePaymentDtls(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(),
									c.getTotalFee(), c.getFeePaid(), c.getFeePending(), c.getMode(), c.getTransactionRef(),
									c.getOptedDiscount(), payModel));
						}
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	payments = filtered;
		    } else {
		    	iTotalDisplayRecords = payments.size();
		    }
		    
		    //Number of courses that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = payments.size();
		    
		    if(payments.size()< iDisplayStart + iDisplayLength)
		    	payments = payments.subList(iDisplayStart, payments.size());
		    else
		    	payments = payments.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    List<AppPolyglotPaymentModel> models = new ArrayList<AppPolyglotPaymentModel> ();
			
			for (AppPolyglotPaymentModel payment : payments) {
				AppPolyglotPaymentModel model = new AppPolyglotPaymentModel();
				
				model.setId(payment.getId());
				model.setStudentId(payment.getStudentId());
				model.setFirstName(payment.getFirstName());
				model.setLastName(payment.getLastName());
				model.setTotalFee(payment.getTotalFee());
				model.setFeePending(payment.getFeePending());
				model.setFeePaid(payment.getFeePaid());
				model.setMode(payment.getMode());
				model.setTransactionRef(payment.getTransactionRef());
				model.setOptedDiscount(payment.getOptedDiscount());
				
				models.add(model);
			}
		    
		    
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading payment data : " + ex, ex);
		}
		return null;
	}
	
	@RequestMapping(value = "showStudentPayments", method = RequestMethod.GET)
	public @ResponseBody JSONObject showStudentPayments(HttpServletRequest request) {
		logger.debug("Inside showStudentPayments.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotPayment> list = new LinkedList<AppPolyglotPayment>();
		    Map<String, String> params = new HashMap<String, String>();
		    params.put("userId", String.valueOf(loggedInUser.getId()));
		    String sql = "from AppPolyglotPayment p where p.userId =:userId";
		    list = paymentService.runQuery(sql, params);
		    
		    iTotalRecords = list.size();
		    list.sort(Comparator.comparing(AppPolyglotPayment::getLastInsrtUpdTs).reversed());
		    List<AppPolyglotPaymentModel> payments = new LinkedList<AppPolyglotPaymentModel>();
		    List<AppPolyglotPaymentModel> filtered = new LinkedList<AppPolyglotPaymentModel>();
		    AppPolyglotPaymentModel payModel = null;
		    AppUsers exisitngUser = new AppUsers();
		    if (sSearch != null) {
				for (AppPolyglotPayment c : list) {
					payModel = new AppPolyglotPaymentModel();
					if(null != c){
						/**get leads details based on app_user_id*/
						exisitngUser = registrationService.load(c.getUserId());
						if (null != exisitngUser && null != exisitngUser.getFname() && exisitngUser.getFname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getLname() && exisitngUser.getLname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getMode() && c.getMode().toUpperCase().contains(sSearch.toUpperCase())) {
							filtered.add(preparePaymentDtls(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(),
									c.getTotalFee(), c.getFeePaid(), c.getFeePending(), c.getMode(), c.getTransactionRef(),
									c.getOptedDiscount(), payModel)); // Add a company that matches search criterion
						} else {
							payments.add(preparePaymentDtls(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(),
									c.getTotalFee(), c.getFeePaid(), c.getFeePending(), c.getMode(), c.getTransactionRef(),
									c.getOptedDiscount(), payModel));
						}
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	payments = filtered;
		    } else {
		    	iTotalDisplayRecords = payments.size();
		    }
		    
		    //Number of courses that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = payments.size();
		    
		    if(payments.size()< iDisplayStart + iDisplayLength)
		    	payments = payments.subList(iDisplayStart, payments.size());
		    else
		    	payments = payments.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    List<AppPolyglotPaymentModel> models = new ArrayList<AppPolyglotPaymentModel> ();
			
			for (AppPolyglotPaymentModel payment : payments) {
				AppPolyglotPaymentModel model = new AppPolyglotPaymentModel();
				
				model.setId(payment.getId());
				model.setTotalFee(payment.getTotalFee());
				model.setFeePending(payment.getFeePending());
				model.setFeePaid(payment.getFeePaid());
				model.setMode(payment.getMode());
				model.setTransactionRef(payment.getTransactionRef());
				model.setOptedDiscount(payment.getOptedDiscount());
				
				models.add(model);
			}
		    
		    logger.debug("list of payment details is:"+models);
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			logger.debug("Exit showStudentPayments");
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading payment data : " + ex, ex);
		}
		return null;
	}

	/**
	 * 
	 * @param id
	 * @param fName
	 * @param lName
	 * @param totalFee
	 * @param feePaid
	 * @param feePending
	 * @param mode
	 * @param transactionRef
	 * @param optedDiscount
	 * @param model
	 * @return
	 */
	public AppPolyglotPaymentModel preparePaymentDtls(Integer id, String fName, String lName, 
			Double totalFee, Double feePaid, Double feePending, String mode,String transactionRef, Double optedDiscount, AppPolyglotPaymentModel model){
		model.setId(id);
		model.setFirstName(fName);
		model.setLastName(lName);
		model.setMode(mode);
		model.setTotalFee(totalFee);
		model.setFeePaid(feePaid);
		model.setFeePending(feePending);
		model.setTransactionRef(transactionRef);
		model.setOptedDiscount(optedDiscount);
		return model;
	}
	
	
	/**
	 * Method to save update payment information for a student.
	 * @param params
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "saveUpdatePaymentData", method = RequestMethod.POST)
	public @ResponseBody JSONObject updatePaymentData(@RequestBody final AppPolyglotPayment params, HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("updatePaymentData****");
		
		
		params.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
				.getTimeInMillis()));
		params.setLastInsrtUpdUsrId(-1);
		params.setAppUsers(loggedInUser);

		paymentService.save(params);
		Set<AppPolyglotPayment> payments = loggedInUser.getAppPolyglotPayments();
		for (AppPolyglotPayment payment : payments) {
			if (params.getId().equals(payment.getId())) {
				payments.remove(payment);
				
				break;
			}
		}
		
		payments.add(params);
		loggedInUser.setAppPolyglotPayments(payments);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		JSONObject jsonObj = JSONObject.fromObject(params, jsonConfig);
		
		
		return jsonObj;
	}
	
	@RequestMapping(value = "deletePaymentData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deletePaymentData(@RequestParam("id") Integer id, HttpSession session) {
		logger.debug("deleting  selected payment data");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		AppPolyglotPayment params = paymentService.load(id);
		paymentService.delete(params);
		
		Set<AppPolyglotPayment> payments = loggedInUser.getAppPolyglotPayments();
		for (AppPolyglotPayment payment : payments) {
			if (params.getId().equals(payment.getId())) {
				payments.remove(payment);
				break;
			}
		}
		
		loggedInUser.setAppPolyglotPayments(payments);

		return returnObj;
	}
	
	
	/**
	 * Method to 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "checkForgotPassword", method = RequestMethod.POST)
	public @ResponseBody JSONObject checkForgotPassword(HttpServletRequest request) {
		logger.debug("findUser");
		JSONObject returnObj = new JSONObject();
		try{
		String emailId = request.getParameter("emailId");
		logger.debug("findUser"+emailId);
		List<AppUsers> list = registrationService.runQuery("from  AppUsers s where s.emailId='"+emailId+"'", null);
		if(list!=null && !list.isEmpty()){
			logger.debug("findUser size of list"+list.size());
			AppUsers user = list.get(0);
			emailService.sendForGotPasswordLink(emailId,user.getFname()+" "+user.getLname(),request);
			logger.debug("findUser mail Sent");
			returnObj.accumulate("status", "SUCCESS");
		}else { 
			returnObj.accumulate("status", "FAIL");
		}
		}catch(Exception e){
		logger.error(e);	
		}
		return returnObj;
	}
	
	/**
	 * Password submit
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "submitPassword", method = RequestMethod.POST)
	public @ResponseBody JSONObject submitPassword(@RequestBody final AppUsers userParam) {
		logger.debug("submitPassword");
		JSONObject returnObj = new JSONObject();
		try{
		List<AppUsers> list = registrationService.runQuery("from  AppUsers s where s.emailId='"+userParam.getEmailId()+"'", null);
		if(list!=null && !list.isEmpty()){
			AppUsers user = list.get(0);
			String password = PolyglotFileUtils.cryptWithMD5(userParam.getPassword());
			if(password!=null){
				if(PolyglotConstants.INVITED.equalsIgnoreCase(user.getStatus())){
					user.setStatus(PolyglotConstants.REGISTERED);
				}
				user.setPassword(password);
				registrationService.save(user);
				returnObj.accumulate("status", "SUCCESS");
			}else{
				returnObj.accumulate("status", "FAIL");
			}
		}else {
			returnObj.accumulate("status", "FAIL");
		}
		}catch(Exception e){
		logger.error(e);	
		}
		return returnObj;
	}
	
	@RequestMapping(value = "resetPassword" , method = RequestMethod.GET)
	public ModelAndView restPassword(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("resetPassword");
		modelAndView.addObject("emailId", request.getParameter("emailId"));
		modelAndView.addObject("userType", request.getParameter("userType"));
		modelAndView.setViewName("ResetPassword");
		return modelAndView;
	}
	
	
	/**
	 * Utility method to Export to excel
	 * @return
	 */
	@RequestMapping(value = "exportLeadsToExcel" , method = RequestMethod.GET)
	public ModelAndView exportLeadsToExcel() {
		
		ModelAndView modelAndView = new ModelAndView("excelView", "leads", leadService.getAll());
		
		return modelAndView;
	}
	
	/**
	 * Delete branch data
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "deleteBatchData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteBatchData(@RequestParam("id") Integer id, HttpSession session) {
		logger.debug("deleting  selected student data");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		JSONObject returnObj = new JSONObject();
		AppPolyglotBatch batch = batchService.load(id);
		batchService.delete(batch);
		
		Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
		for (AppPolyglotBatch item : batches) {
			if (batch.getBatchId().equals(item.getBatchId())) {
				batches.remove(item);
				break;
			}
		}
		loggedInUser.setAppPolyglotBatches(batches);
		

		return returnObj;
	}
	
	
	/**
	 * Method to get list of all courses for tests
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getAllCoursesListForTests", method = RequestMethod.GET)
	public @ResponseBody JSONObject getAllCoursesListForTests(HttpServletRequest request) {
		logger.debug("getAllCoursesListForTests Start");
		JSONObject returnObj = new JSONObject();
		Map<Integer,String> finalMap = new HashMap<Integer, String>();
		List<DmnCoursesTests> listss = courseTestService.runQuery("from DmnCoursesTests courseTest GROUP BY courseTest.id.courseId", null);
		for(DmnCoursesTests courseTest : listss){
			DmnCourse course = courseService.load(courseTest.getId().getCourseId());
			//List<DmnCoursesTests> subList = courseTestService.runQuery("from DmnCoursesTests courseTest where courseTest.id.courseId="+course.getId(), null);
			finalMap.put(courseTest.getId().getCourseId(), course.getCourseName());
		}
		returnObj.accumulateAll(finalMap);
		return returnObj;
	}
	
	@RequestMapping(value = "getSelectedCoursesTest", method = RequestMethod.GET)
	public @ResponseBody JSONObject getSelectedCoursesTest(HttpServletRequest request) {
		logger.debug("deleting  selected student data");
		JSONObject returnObj = new JSONObject();
		List<DmnCoursesTests> subList = courseTestService.runQuery("from DmnCoursesTests courseTest where courseTest.id.courseId="+request.getParameter("courseId"), null);
		returnObj.accumulate("result", subList);
		return returnObj;
	}
	
	
	/**
	 * Method to get list of all cities
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getLocationsWithCities", method = RequestMethod.GET)
	public @ResponseBody JSONArray getLocationsWithCity(HttpServletRequest request) {
		logger.debug("Returning all the locations with cities");
		
		JSONArray object = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		List<DmnLocation> locations = locationService.getAll();
		
		object = JSONArray.fromObject(locations, jsonConfig);
		return object;
	}
	
	/**
	 * Method to get all Plans
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "showPlans", method = RequestMethod.GET)
	public @ResponseBody JSONObject showPlans(HttpServletRequest request) {
		logger.debug("Inside show plans. Getting user plans");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotPlan> plans = new ArrayList<AppPolyglotPlan> ();
		    plans.addAll(loggedInUser.getAppPolyglotPlans());
		    
		    
		    iTotalRecords = plans.size();
		    List<AppPolyglotPlan> userPlans = new LinkedList<AppPolyglotPlan>();
		    List<AppPolyglotPlan> filtered = new LinkedList<AppPolyglotPlan>();
		    if (sSearch != null) {
				for (AppPolyglotPlan c : plans) {
					if (c.getPlan().getPlanName().toUpperCase().contains(sSearch.toUpperCase())) {
						filtered.add(c); // Add a company that matches search criterion
					} else {
						userPlans.add(c);
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	userPlans = filtered;
		    } else {
		    	iTotalDisplayRecords = userPlans.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = userPlans.size();
		    
		    if(userPlans.size()< iDisplayStart + iDisplayLength)
		    	userPlans = userPlans.subList(iDisplayStart, userPlans.size());
		    else
		    	userPlans = userPlans.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			
			List<AppPolyglotPlanModel> models = new ArrayList<AppPolyglotPlanModel> ();
			
			for (AppPolyglotPlan plan : userPlans) {
				AppPolyglotPlanModel model = new AppPolyglotPlanModel();
				
				model.setId(plan.getId());
				model.setPlanName(plan.getPlan().getPlanName());
				SimpleDateFormat f1 = new SimpleDateFormat("dd/MM/yyyy");
				
				model.setSubscriptionDate(f1.format(new Date(plan.getSubscriptionDate().getTime())));
				model.setExpiredDate(f1.format(new Date(plan.getExpiredDate().getTime())));
				model.setIsExpired(plan.getIsExpired().equalsIgnoreCase("Y") ? "EXPIRED" : "ACTIVE");
				
				models.add(model);
			}
			
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading Plan data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Method to get all plan details
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getPlanDetails", method = RequestMethod.GET)
	public @ResponseBody JSONArray getAllPlanDetails(HttpServletRequest request) {
		logger.debug("Returning all plan details");
		
		JSONArray object = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		List<DmnPolyglotPlans> plans = dmnPlansService.getAll();
		
		object = JSONArray.fromObject(plans, jsonConfig);
		return object;
	}
	
	/**
	 * Method to get all key word categories
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getKeywordCategories", method = RequestMethod.GET)
	public @ResponseBody JSONArray getKeywordCategories(HttpServletRequest request) {
		logger.debug("Returning all keyword categories");
		
		JSONArray keywords = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String sql = "distinct d.category from DmnKeywordCategories d where d.id > 0";
		Map<String, String> params = new HashMap<String, String>();
		
		List<DmnKeywordCategories> keywordCategories = keywordService.runQuery(sql, params);
		keywords = JSONArray.fromObject(keywordCategories, jsonConfig);
		
		
		return keywords;
	}
	
	/**
	 * Get list of all cities
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getCities", method = RequestMethod.GET)
	public @ResponseBody JSONObject getCities(HttpServletRequest request) {
		logger.debug("Returning getCities");
		
		List<DmnCities> cityList = citiesService.runQuery("from DmnCities s where s.dsblIn='N' ", null);
		JSONObject cities = new JSONObject();
				
		for(DmnCities city : cityList){
			citiesMap.put(String.valueOf(city.getCityId()), city.getCityDesc());
		}
		cities.accumulateAll(citiesMap);
		logger.debug("cities:"+cities);
		return cities;
	}
	
	/**
	 * Method to save plan data and start the plan
	 * @param request
	 * @param planName
	 * @param keyword
	 * @param location
	 * @param duration
	 * @return
	 */
	@RequestMapping(value = "saveAndStartPlan", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveAndStartPlan(HttpServletRequest request,
			@RequestParam("planName") String planName,
			@RequestParam("keyword") String keyword,
			@RequestParam("location") String location,
			@RequestParam("duration") String duration) {
		logger.debug("Saving new plan");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Timestamp current = new Timestamp(Calendar.getInstance().getTime().getTime());
		
		
		JSONObject obj = new JSONObject();
		AppPolyglotPlan newPlan = new AppPolyglotPlan();
		
		String sql = "from DmnPolyglotPlans p where p.planName =:planName";
		Map<String, String> params = new HashMap<String, String>();

		params.put("planName", planName);
		
		newPlan.setPlan(dmnPlansService.runQuery(sql, params).get(0));
		newPlan.setDuration(duration);
		newPlan.setIsExpired("N");
		newPlan.setKeyword(keyword);
		newPlan.setAppUsers(loggedInUser);
		newPlan.setLocation(location);
		newPlan.setSubscriptionDate(current);
		
		Calendar c = new GregorianCalendar();
		if (duration.equalsIgnoreCase("Monthly")) {
			c.add(Calendar.DATE, 30);
		}
		if (duration.equalsIgnoreCase("Quarterly")) {
			c.add(Calendar.DATE, 120);
		}

		if (duration.equalsIgnoreCase("Semi Annual")) {
			c.add(Calendar.DATE, 180);
		}

		if (duration.equalsIgnoreCase("Annual")) {
			c.add(Calendar.DATE, 360);
		}

		
		Date d = c.getTime();
		
		newPlan.setExpiredDate(new Timestamp(d.getTime()));
		newPlan.setLastInsrtUpdUsrId(loggedInUser.getId());
		newPlan.setLastInsrtUpdTs(current);
		
		planService.save(newPlan);
		
		
		return obj;
	}
	
	/**
	 * Method to save payment information for student from students page
	 * @param totalPayment
	 * @param totalPaid
	 * @param balance
	 * @param paymentMode
	 * @param leadId
	 * @param studentId
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "saveStudentPayment", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveStudentPayment(HttpServletRequest request, HttpSession session) {
		logger.debug("Saving the student payment");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		String leadObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		List<AppPolyglotPayment> lstOfStdPayments = new ArrayList<AppPolyglotPayment>();
		AppPolyglotPayment payment = null;
		try{
			lstOfStdPayments = mapper.readValue(StringEscapeUtils.unescapeHtml(leadObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppPolyglotPayment.class));
			logger.debug("list of student payment object is:"+lstOfStdPayments);
			if(!PolyglotFileUtils.isEmpty(lstOfStdPayments)){
				for (AppPolyglotPayment stdPayment : lstOfStdPayments) {
					payment = new AppPolyglotPayment();
					
					payment.setAppUsers(loggedInUser);
					payment.setFeePaid(stdPayment.getFeePaid());
					payment.setFeePending(stdPayment.getFeePending());
					payment.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					payment.setLastInsrtUpdUsrId(loggedInUser.getId());
					payment.setMode(stdPayment.getMode());
					payment.setStudentId(stdPayment.getStudentId());
					payment.setTotalFee(stdPayment.getTotalFee());
					payment.setTransactionRef(stdPayment.getTransactionRef());
					payment.setOptedDiscount(stdPayment.getOptedDiscount());
					payment.setUserId(stdPayment.getUserId());
					paymentService.save(payment);
				}
			}
		}catch(Exception ex){
			logger.error("Exception while saving payments:"+ex, ex);
		}
		
		logger.debug("Exit of Payment saving");
		return returnObj;
	}
	
	@RequestMapping(value = "getPaymentBalanceForStudent", method = RequestMethod.POST)
	public @ResponseBody JSONObject getPaymentBalanceForStudent(@RequestParam("userId") Integer userId, HttpServletRequest request) {
		logger.debug("Inside getPaymentBalanceForStudent");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotPayment> list = new ArrayList<AppPolyglotPayment>();
		Map<String, String> params = new HashMap<String, String>();
	    params.put("userId", String.valueOf(userId));
	    String sql = "from AppPolyglotPayment p where p.userId =:userId";
	    list = paymentService.runQuery(sql, params);
	    logger.debug("list of payment object is:"+list);
	    list.sort(Comparator.comparing(AppPolyglotPayment::getLastInsrtUpdTs));
	    AppPolyglotPaymentModel payModel = null;
	    List<AppPolyglotPaymentModel> lstOfPayments = new ArrayList<AppPolyglotPaymentModel>();
	    for(AppPolyglotPayment payObj: list){
	    	payModel = new AppPolyglotPaymentModel();
			payModel.setFeePaid(payObj.getFeePaid());
			payModel.setOptedDiscount(payObj.getOptedDiscount());
	    	lstOfPayments.add(payModel);
		}
	    logger.debug("list of final payment object is:"+lstOfPayments);
	    JSONObject object = new JSONObject();
	    object.accumulate("payObj", lstOfPayments);
	    logger.debug("Exit of getPaymentBalanceForStudent");
		return object;
	}
	
	@RequestMapping(value = "showEmailTemplates", method = RequestMethod.GET)
	public @ResponseBody JSONObject getEmailTemplates(HttpServletRequest request) {
		logger.debug("Inside show plans. Getting user email templates");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppEmailTemplate> templates = new ArrayList<AppEmailTemplate> ();
		    templates.addAll(loggedInUser.getAppPolyglotEmailTemplates());
		    
		    
		    iTotalRecords = templates.size();
		    List<AppEmailTemplate> userTemplates = new LinkedList<AppEmailTemplate>();
		    List<AppEmailTemplate> filtered = new LinkedList<AppEmailTemplate>();
		    if (sSearch != null) {
				for (AppEmailTemplate c : templates) {
					if (c.getTemplateName().toUpperCase().contains(sSearch.toUpperCase())) {
						filtered.add(c); // Add a company that matches search criterion
					} else {
						userTemplates.add(c);
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	userTemplates = filtered;
		    } else {
		    	iTotalDisplayRecords = userTemplates.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = userTemplates.size();
		    
		    if(userTemplates.size()< iDisplayStart + iDisplayLength)
		    	userTemplates = userTemplates.subList(iDisplayStart, userTemplates.size());
		    else
		    	userTemplates = userTemplates.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			
			/*List<AppPolyglotPlanModel> models = new ArrayList<AppPolyglotPlanModel> ();
			
			for (AppEmailTemplate plan : userTemplates) {
				AppPolyglotPlanModel model = new AppPolyglotPlanModel();
				
				model.setId(plan.getId());
				model.setPlanName(plan.getPlanName());
				SimpleDateFormat f1 = new SimpleDateFormat("dd/MM/yyyy");
				
				model.setSubscriptionDate(f1.format(new Date(plan.getSubscriptionDate().getTime())));
				model.setExpiredDate(f1.format(new Date(plan.getExpiredDate().getTime())));
				model.setIsExpired(plan.getIsExpired().equalsIgnoreCase("Y") ? "EXPIRED" : "ACTIVE");
				
				models.add(model);
			}*/
			
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonConfig.setExcludes(new String[] { "appUsers" });
			JSONArray array = JSONArray.fromObject(userTemplates, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading Email Template data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(value = "saveUpdateEmailTemplateData", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveUpdateEmailTempalteData(@RequestParam("id") Integer id,
			@RequestParam("fileName") String fileName,
			@RequestParam("templateName") String templateName,
			@RequestParam("isActive") String isActive,
			HttpServletRequest request) {
		
		logger.debug("Saving template with id : " + id);
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		AppEmailTemplate template = new AppEmailTemplate();
		if (id != null && id > 0) {
			template = templateService.load(id);
		}
		
		template.setFileName(fileName);
		template.setTemplateName(templateName);
		template.setAppUsers(loggedInUser);
		template.setIsActive(isActive);
		template.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		template.setLastInsrtUpdUsrId(loggedInUser.getId());
		
		templateService.save(template);
		
		Set<AppEmailTemplate> templates = loggedInUser.getAppPolyglotEmailTemplates();
		for (AppEmailTemplate t : templates) {
			if (id.equals(t.getId())) {
				templates.remove(t);
				
				break;
			}
		}
		
		templates.add(template);
		loggedInUser.setAppPolyglotEmailTemplates(templates);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObj = JSONObject.fromObject(template, jsonConfig);
		
		return jsonObj;
	}
	
	
	@RequestMapping(value = "deleteTemplateData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteTemplateDate(@RequestParam(value = "ids[]") Integer[] ids, HttpSession session) {
		logger.debug("deleting  selected Email Template");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		Set<AppEmailTemplate> templates = loggedInUser.getAppPolyglotEmailTemplates();
		for (Integer id : ids) {
			AppEmailTemplate template = templateService.load(id);
			templateService.delete(template);
			
			for (AppEmailTemplate t : templates) {
				if (t.getId().equals(template.getId())) {
					templates.remove(template);
					break;
				}
			}
		}
		
		
		
		loggedInUser.setAppPolyglotEmailTemplates(templates);


		return returnObj;
	}
	
	/**
	 * Method to delete demo data
	 * @param ids
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "deleteDemoData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteDemoData(@RequestParam(value = "ids[]") Integer[] ids, HttpSession session) {
		logger.debug("deleting  selected Email Template");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObj = new JSONObject();
		Set<AppPolyglotDemo> demos = loggedInUser.getAppPolyglotDemos();
		for (Integer id : ids) {
			AppPolyglotDemo demo = demoService.load(id);
			demoService.delete(demo);
			
			for (AppPolyglotDemo t : demos) {
				if (t.getId().equals(demo.getId())) {
					demos.remove(demo);
					break;
				}
			}
		}
		
		loggedInUser.setAppPolyglotDemos(demos);


		return returnObj;
	}
		
	/**
	 * Method to send Email.
	 * @param emailId
	 * @param session
	 * @return
	 */
	public @ResponseBody JSONObject sendEmail(@RequestParam("emailId") String emailId, HttpSession session) {
		JSONObject object = new JSONObject();
		
		logger.debug("sending email to " + emailId);
		
		//PolyglotEmailTrigger.sendMail(msg, session);
		
		return object;
	}
	
	@RequestMapping(value = "getLoginDetails", method = RequestMethod.GET)
	public @ResponseBody JSONObject getLoginDetails(HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject object = new JSONObject();
		logger.debug("getLoginDetails :: logged in user is:"+loggedInUser.getId());
		try {
			AppUsers userObj = registrationService.load(loggedInUser.getId());
			logger.debug("last login time is:"+userObj.getLastLoginDate()+":last login ip is:"+userObj.getLastLoginIp());
			object.accumulate("loginTime", PolyglotFileUtils.convertTimeStampToString(userObj.getLastLoginDate(), "yyyy-MM-dd hh:mm:ss"));
			object.accumulate("loginIP", userObj.getLastLoginIp());
		} catch (Exception ex) {
			logger.error("error while getting the last login details:"+ex,ex);
		}
		logger.debug("Exit of getLoginDetails");
		return object;
	}
	
	@RequestMapping(value = "lastLoginUpdate", method = RequestMethod.GET)
	public void lastLoginUpdate(HttpServletRequest request, HttpSession session) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("logged in user is:"+loggedInUser.getId());
		try {
			AppUsers user = registrationService.load(loggedInUser.getId());
			user.setLastLoginDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			user.setLastLoginIp(Inet4Address.getLocalHost().getHostAddress());
			user.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			user.setLastInsrtUpdUsrId(loggedInUser.getId());
			registrationService.save(user);
			logger.debug("last login details updated successfully");
		}catch (UnknownHostException uhe) {
			logger.error("Error while updating the ip address:"+uhe, uhe);
		}	
	}
	
	@RequestMapping(value = "doLogout", method = RequestMethod.GET)
	public void doLogout(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		//AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		//logger.debug("Logging out user with USER ID : " + loggedInUser.getEmailId());
		//request.getSession().invalidate();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			AppUsers user = registrationService.load(loggedInUser.getId());
			user.setLastLoginDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			user.setLastLoginIp(Inet4Address.getLocalHost().getHostAddress());
			user.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			user.setLastInsrtUpdUsrId(loggedInUser.getId());
			registrationService.save(user);
		while (session.getAttributeNames().hasMoreElements()) {
			String sessionVar = session.getAttributeNames().nextElement();
			session.removeAttribute(sessionVar);
			logger.debug("Removing from session :" + sessionVar);
		}
		System.gc();
		session.invalidate();	
		//response.sendRedirect("/");
		}catch(Exception e){
			logger.error("Error Occured during logout");
		}
	}
	
	/**
	 * This method will return the list of tasks created by the loggedInUser (partner)
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "showAppTasks", method = RequestMethod.GET)
	public @ResponseBody JSONObject showTaskData(HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("Inside show Tasks.");
		
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotTask> list = new LinkedList<AppPolyglotTask>();
		    list.addAll((Set<AppPolyglotTask>) loggedInUser.getAppPolyglotTasks());
		    iTotalRecords = list.size();
		    List<AppPolyglotTask> tasks = new LinkedList<AppPolyglotTask>();
		    List<AppPolyglotTask> filtered = new LinkedList<AppPolyglotTask>();
		    if (sSearch != null) {
				for (AppPolyglotTask c : list) {
					if (c.getFileName().toLowerCase().contains(sSearch.toLowerCase()) ||
							c.getFilePath().toLowerCase().contains(sSearch.toLowerCase())) {
						filtered.add(c); // Add a company that matches search criterion
					} else {
						tasks.add(c);
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	tasks = filtered;
		    } else {
		    	iTotalDisplayRecords = tasks.size();
		    }
		    
		    //Number of courses that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = tasks.size();
		    
		    if(tasks.size()< iDisplayStart + iDisplayLength)
		    	tasks = tasks.subList(iDisplayStart, tasks.size());
		    else
		    	tasks = tasks.subList(iDisplayStart, iDisplayStart + iDisplayLength);
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "appUsers" });
			config.setIgnoreDefaultExcludes(false);
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			
			JSONArray array = JSONArray.fromObject(tasks, config);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading task data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "saveUpdateTask" , method = RequestMethod.POST)
	public @ResponseBody JSONObject saveUpdateTask(@RequestParam("id") Integer id, 
			@RequestParam("fileName") String fileName, @RequestParam("taskDescription") String taskDescription,
			@RequestParam("taskName") String taskName, HttpSession session) {
		logger.debug("saveUpdateTask****");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppPolyglotTask task = new AppPolyglotTask();
		
		if (id != null && id > 0) {
			task = taskService.load(id);
		}
		
		task.setAppUsers(loggedInUser);
		task.setFileName(fileName);
		task.setFilePath(configurationService.getUploadLocation());
		task.setIsActive("Y");
		task.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		task.setLastInsrtUpdUsrId(loggedInUser.getId());
		task.setTaskName(taskName);
		task.setTaskDescription(taskDescription);
		
		taskService.save(task);
		
		loggedInUser.getAppPolyglotTasks().add(task);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[] { "appUsers" });

		JSONObject jsonObj = JSONObject.fromObject(task, jsonConfig);
		
		
		return jsonObj;
	}
	
	@RequestMapping(value = "getTaskNames" , method = RequestMethod.GET)
	public @ResponseBody List<String> getTaskNames(HttpSession session) {
		logger.debug("Start of getTaskNames");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotTask> lstOfTasks = new ArrayList<AppPolyglotTask>();
		List<String> taskNames = new ArrayList<String>();
		Map<String, String> params = new HashMap<String, String>();
		
		String sql = "from AppPolyglotTask t where t.appUsers =:appUsers";
		params.put("appUsers", String.valueOf(loggedInUser.getId()));
		lstOfTasks = taskService.runQuery(sql, params);
		if(!PolyglotFileUtils.isEmpty(lstOfTasks)){
			for(AppPolyglotTask task : lstOfTasks){
				taskNames.add(task.getTaskName());
			}
		}
		logger.debug("task names list is:"+taskNames);
		logger.debug("End of getTaskNames");
		return taskNames;
	}
	
	@RequestMapping(value="/submitQuestion",method=RequestMethod.POST)
	public @ResponseBody JSONObject submitQuestionare(HttpServletRequest request) {
		JSONObject returnObj = new JSONObject();
		if (request.getParameter("name") != null && request.getParameter("email") != null
				&& request.getParameter("mobile") != null && request.getParameter("queryId") != null) {
			// load email from properties file.
			emailService.sendMailForQuestion(request.getParameter("email"), request.getParameter("mobile"),
					request.getParameter("queryId"), request.getParameter("name"));
			returnObj.accumulate("status", "SUCCESS");
		} else {
			returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	
	/**
	 * Method to assign multiple tasks to multiple students from the UI.
	 * @param studentIds
	 * @param taskIds
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "assignTaskToStudents", method = RequestMethod.POST)
	public @ResponseBody JSONObject assignTaskToStudents(@RequestParam(value = "studentIds[]") Integer [] studentIds,
			@RequestParam(value = "taskIds[]") Integer [] taskIds,
			HttpSession session) {
		logger.debug("Assigning the given task to the students with Ids : " + Arrays.toString(studentIds).toString());
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		for (Integer taskId : taskIds) {
			for (Integer studentId : studentIds) {
				AppPolyglotStudent student = studentService.load(studentId);
				AppStudentTask studentTask = new AppStudentTask();
				studentTask.setStudentId(studentId);
				studentTask.setTaskId(taskId);
				studentTask.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				studentTask.setLastInsrtUpdUsrId(loggedInUser.getId());
				studentTask.setTaskStatus(PolyglotConstants.TASK_STATUS_ASSIGNED);
				
				studentTaskService.save(studentTask);
			}
		}
		
		
		JSONObject object = new JSONObject();
		
		return object;
	}
	
	
	/**
	 * Method to assign multiple tasks to multiple batches.
	 * @param batchIds
	 * @param taskIds
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "assignTasksToBatches", method = RequestMethod.POST)
	public @ResponseBody JSONObject assignTaskToBatches(@RequestParam(value = "batchIds[]") Integer [] batchIds,
			@RequestParam(value = "taskIds[]") Integer [] taskIds,
			HttpSession session) {
		logger.debug("Assigning the given task to the students with Ids : " + Arrays.toString(batchIds).toString());
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		for (Integer taskId : taskIds) {
			for (Integer batchId : batchIds) {
				AppStudentTask studentTask = new AppStudentTask();
				String sql = "from AppPolyglotStudent s where s.batchId =:batchId";
				Map<String, String> params = new HashMap<String, String>();
				params.put("batchId", batchId.toString());
				
				for (AppPolyglotStudent student : studentService.runQuery(sql, params)) {
					studentTask.setStudentId(student.getId());
					studentTask.setTaskId(taskId);
					studentTask.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					studentTask.setLastInsrtUpdUsrId(loggedInUser.getId());
					studentTask.setTaskStatus(PolyglotConstants.TASK_STATUS_ASSIGNED);
					studentTaskService.save(studentTask);
				}
				
				
			}
		}
		
		
		JSONObject object = new JSONObject();
		
		return object;
	}
	
	/**
	 * Method to delete task data from task table as well as student task table.
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteTaskData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteTaskData(@RequestParam(value = "taskIds[]") Integer [] ids, HttpSession session) {
		logger.debug("deleting  selected task data");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		JSONObject returnObj = new JSONObject();
		Set<AppPolyglotTask> trainerTasks = loggedInUser.getAppPolyglotTasks();
		for (Integer id : ids) {
			AppPolyglotTask task = taskService.load(id);
			taskService.delete(task);
			
			//Remove task content from file system
			String path = configurationService.getUploadLocation() + File.separator + loggedInUser.getId() + File.separator + "task" + File.separator + task.getTaskName();
			File f = new File(path);
			logger.debug("File deletion was success? " + f.delete());
			
			String sql = "from AppStudentTask t where t.taskId=:taskId";
			Map<String, String> params = new HashMap<String, String>();
			params.put("taskId", id.toString());
			List<AppStudentTask> tasks = studentTaskService.runQuery(sql, params);
			
			for (AppStudentTask t : tasks) {
				studentTaskService.delete(t);
				
			}
			
			//Delete task from cache
			for (AppPolyglotTask t1 : trainerTasks) {
				if (t1.getId() == task.getId()) {
					trainerTasks.remove(t1);
					break;
				}
			}

		}
		
		loggedInUser.setAppPolyglotTasks(trainerTasks);
		
		return returnObj;
	}
	
	@RequestMapping(value="/getFeaturedCourses",method=RequestMethod.POST)
	public @ResponseBody JSONObject  loadOnIndexPage(){
		JSONObject returnObj = new JSONObject();
		try{
		List<DmnCourse> allCourses = courseService.getAll();
		List<AppUsers> users = registrationService.runQuery("from  AppUsers s where s.userType in ('P','T')", null);
		List<DmnCourse> featuredList = new ArrayList<>();
		allCourses.forEach(a -> {
			if(a.getFeatured()!=null && a.getFeatured().equalsIgnoreCase("Y")){
				List<AppPolyglotCourse> courseList = appCourseService.runQuery("from AppPolyglotCourse c where c.dmnCourseId="+a.getId(), null);
			     int learnersCnt = 0; 
			     for(AppPolyglotCourse course : courseList){
			    	 List<AppPolyglotLead> leadList = leadService.runQuery("from AppPolyglotLead o where o.courseId="+course.getId()+" and  o.leadStatus in ('REGISTERED')", null);
			    	 learnersCnt += leadList.size();
			     }
			     List<AppPolyglotCourse> trainerList = appCourseService.runQuery("from AppPolyglotCourse c where c.dmnCourseId="+a.getId()+" and c.appUsers.userType in ('T','P')", null);
			    a.setTemplate(learnersCnt+"-"+trainerList.size());
				featuredList.add(a);
			}
		});
		if(!featuredList.isEmpty()){ 
			returnObj.accumulate("featuredCoursesInfo", featuredList);
		}
		List<AppUsers> studnets = registrationService.runQuery("from  AppUsers s where s.userType in ('U')", null);
		List<AppPolyglotLead> leadList  = leadService.runQuery("select distinct o  from AppPolyglotLead o where o.leadStatus in ('INVITED','DROPPED')", null);
		returnObj.accumulate("coursesCount", allCourses.size());
		returnObj.accumulate("leadsCnt", leadList.size());
		returnObj.accumulate("studentsCnt", studnets.size());
		returnObj.accumulate("trainerCount", users.size());
		//returnObj.accumulate("courses", allCourses);
		}catch(Exception e){
			logger.error("Error Occured During Login Module"+e);
		}
		return returnObj;
	}
	
	@RequestMapping(value="/fetchSuggestions",method=RequestMethod.POST)
	public @ResponseBody JSONObject  fetchSuggestions(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		try{
	    List<DmnCourse> allCourses = courseService.getAll();
		returnObj.accumulate("courses", allCourses);
		}catch(Exception e){
			logger.error("Error Occured During Login Module"+e);
		}
		return returnObj;
	}
	
	/**
	 * Method to update personal information on the profile
	 * @param id
	 * @param instituteName
	 * @param email
	 * @param phone
	 * @param about
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/saveProfilePersonalInfo", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateProfilePersonalInfo(@RequestParam("id") String id,
			@RequestParam("instituteName") String instituteName, 
			@RequestParam("phone") String phone,
			@RequestParam("email") String email,
			@RequestParam("about") String about,
			@RequestParam("founder") String founder,
			@RequestParam("establishedDate") String establishedDate,
			@RequestParam("fname") String fname,
			@RequestParam("lname") String lname,
			HttpSession session) {
		JSONObject returnObj = new JSONObject();
		logger.debug("saving user profile");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
		
		logger.debug("current date timestamp : " + timeStamp);
		try {
			AppUsers profile = new AppUsers();
			if (Integer.parseInt(id) > 0) {
				profile = registrationService.load(Integer.parseInt(id));
			}
			
			if (profile == null) profile = new AppUsers();
			if(fname!=null){
				profile.setFname(fname);
				profile.setLname(lname);
			}
			profile.setAboutUs(about);
			profile.setEmailId(email);
			profile.setMobile(phone);
			profile.setInstName(instituteName);
			profile.setInstFounder(founder);
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			
			if (! StringUtils.isEmpty(establishedDate)) {
				long insttime = format.parse(establishedDate)
						.getTime();
				profile.setInstEstblDate(new Timestamp(insttime));
			}
			profile.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			profile.setLastInsrtUpdUsrId(loggedInUser.getId());
			registrationService.save(profile);
			session.setAttribute(PolyglotConstants.APP_POLYGLOT_USER, profile);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		 
		return returnObj;
		
	}
	
	@RequestMapping(value = "/savePassword", method = RequestMethod.POST)
	public @ResponseBody JSONObject updatePassword(@RequestParam("id") Integer id,
			@RequestParam("new_password") String newPassword, 
			HttpSession session) {
		JSONObject returnObj = new JSONObject();
		logger.debug("saving user profile");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		AppUsers profile = new AppUsers();
		if (id > 0) {
			profile = registrationService.load(id);
		}
		
		if (profile == null) profile = new AppUsers();
		
		profile.setPassword(PolyglotFileUtils.cryptWithMD5(newPassword));
		
		profile.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		profile.setLastInsrtUpdUsrId(loggedInUser.getId());
		
		registrationService.save(profile);
		
		return returnObj;
		
	}
	
	@RequestMapping(value = "getProfileInfo", method = RequestMethod.GET)
	public @ResponseBody JSONObject getProfileInfo(@RequestParam("id") Integer id, HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		logger.debug("loading user profile");
		AppUsers profile = new AppUsers();
		if (id > 0) {
			profile = registrationService.load(id);
		}
		Set<AppUsersEducationDetails> educationList =  profile.getEducationDetails();
		List<String[]> educationData = new ArrayList<String[]>();
		educationList.stream().forEach((temp)->{
			String[] strData = new String[5];
					strData[0] = temp.getCollegeName();
					strData[1] = temp.getDegree();
					strData[2] = temp.getSpecialization();
					strData[3] = String.valueOf(temp.getPercentage());
					strData[4] = String.valueOf(temp.getPassedOutYear());
					educationData.add(strData);
		});
		if(!educationData.isEmpty())
		{
			jsonObject.accumulate("educationList", educationData);
		}else{
			jsonObject.accumulate("educationList", "");
		}
		Set<AppUsersExperienceDetails> experienceList =  profile.getExperienceDetails();
		List<String[]> experienceData = new ArrayList<String[]>();
		experienceList.stream().forEach((temp)->{
			String[] strData = new String[4];
					strData[0] = temp.getCompanyName();
					strData[1] = temp.getDesignation();
					strData[2] = temp.getJoiningDate();
					strData[3] = temp.getLastDate();
					experienceData.add(strData);
		});
		if(!experienceData.isEmpty())
		{
			jsonObject.accumulate("experienceList", experienceData);
		}else{
			jsonObject.accumulate("experienceList", "");
		}
		Set<AppUsersSkillSetDetails> skillSetList =  profile.getSkillSetDetails();
		List<String[]> skillSetData = new ArrayList<String[]>();
		skillSetList.stream().forEach((temp)->{
			String[] strData = new String[2];
					strData[0] = temp.getSkillSet();
					strData[1] = String.valueOf(temp.getYears());
					skillSetData.add(strData);
		});
		if(!experienceData.isEmpty())
		{
			jsonObject.accumulate("skillSetList", skillSetData);
		}else{
			jsonObject.accumulate("skillSetList", "");
		}
		if (profile != null) {
			jsonObject.accumulate("password", loggedInUser.getPassword());
			jsonObject.accumulate("instituteName", StringUtils.isEmpty(loggedInUser.getInstName()) ? "" : loggedInUser.getInstName().trim());
			jsonObject.accumulate("phoneNumber", StringUtils.isEmpty(loggedInUser.getMobile()) ? "" : loggedInUser.getMobile().trim());
			jsonObject.accumulate("email", StringUtils.isEmpty(loggedInUser.getEmailId()) ? "" : loggedInUser.getEmailId().trim());
			jsonObject.accumulate("about", StringUtils.isEmpty(loggedInUser.getAboutUs()) ? "" : loggedInUser.getAboutUs().trim());
			jsonObject.accumulate("inst_founder", StringUtils.isEmpty(loggedInUser.getInstFounder()) ? "" : loggedInUser.getInstFounder().trim());
			jsonObject.accumulate("fname", StringUtils.isEmpty(loggedInUser.getFname()) ? "" : loggedInUser.getFname().trim());
			jsonObject.accumulate("lname", StringUtils.isEmpty(loggedInUser.getLname()) ? "" : loggedInUser.getLname().trim());
			if(loggedInUser.getInstEstblDate()!=null){
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				String dateObj = format.format(loggedInUser.getInstEstblDate());
				jsonObject.accumulate("inst_estbl", dateObj);
			}else{
				jsonObject.accumulate("inst_estbl", "");
			}
			AppUsersSocialMedia socialMedia = profile.getSocialMediaProfile();
			
			if(socialMedia != null) {
				jsonObject.accumulate("media_website", StringUtils.isEmpty(socialMedia.getWebsiteUrl()) ? "" : socialMedia.getWebsiteUrl().trim());
				jsonObject.accumulate("media_fb", StringUtils.isEmpty(socialMedia.getFacebookPage()) ? "" : socialMedia.getFacebookPage().trim());
				jsonObject.accumulate("media_tw", StringUtils.isEmpty(socialMedia.getTwitter()) ? "" : socialMedia.getTwitter().trim());
				jsonObject.accumulate("media_gplus", StringUtils.isEmpty(socialMedia.getGooglePlus()) ? "" : socialMedia.getGooglePlus().trim());
				jsonObject.accumulate("media_in", StringUtils.isEmpty(socialMedia.getLinkedIn()) ? "" : socialMedia.getLinkedIn().trim());
				jsonObject.accumulate("media_p", StringUtils.isEmpty(socialMedia.getPintrest()) ? "" : socialMedia.getPintrest().trim());
				jsonObject.accumulate("media_insta", StringUtils.isEmpty(socialMedia.getInstagram()) ? "" : socialMedia.getInstagram().trim());
				
			} else {
				jsonObject.accumulate("media_website", "");
				jsonObject.accumulate("media_fb", "");
				jsonObject.accumulate("media_tw", "");
				jsonObject.accumulate("media_gplus", "");
				jsonObject.accumulate("media_in", "");
				jsonObject.accumulate("media_p", "");
				jsonObject.accumulate("media_insta", "");
			}
			
		} else {
			jsonObject.accumulate("password", "");
			jsonObject.accumulate("instituteName", "");
			jsonObject.accumulate("phoneNumber", "");
			jsonObject.accumulate("email", "");
			jsonObject.accumulate("about", "");
			jsonObject.accumulate("inst_founder","");
			jsonObject.accumulate("inst_estbl","");
			jsonObject.accumulate("media_website", "");
			jsonObject.accumulate("media_fb", "");
			jsonObject.accumulate("media_tw", "");
			jsonObject.accumulate("media_gplus", "");
			jsonObject.accumulate("media_in", "");
			jsonObject.accumulate("media_p", "");
			jsonObject.accumulate("media_insta", "");
			jsonObject.accumulate("fname", "");
			jsonObject.accumulate("lname", "");
		}
		
		return jsonObject;
	}
	
	@RequestMapping(value = "saveEducationDetails", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateEducationDetails(@RequestParam("items") Integer items,
			@RequestBody JSONObject object,
			HttpSession session) {
		JSONObject returnObj = new JSONObject();
		logger.debug("saving user education details");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppUsers profile  = registrationService.load(loggedInUser.getId());
		for(AppUsersEducationDetails edObj : profile.getEducationDetails()){
			educationDetailsService.delete(edObj);
		}
		for (int i = 0; i <= items; i++) {
			AppUsersEducationDetails educationDetails = new AppUsersEducationDetails();
			educationDetails.setAppUsers(profile);
			educationDetails.setCollegeName(object.get("collegeName_" + i).toString());
			educationDetails.setDegree(object.get("degree_" + i).toString());
			educationDetails.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			educationDetails.setLastInsrtUpdUsrId(loggedInUser.getId());
			educationDetails.setPassedOutYear(new Integer(object.get("passedOut_" + i).toString()));
			educationDetails.setPercentage(new Double(object.get("percentage_" + i).toString()));
			educationDetails.setSpecialization(object.get("specialization_" + i).toString());
			educationDetailsService.save(educationDetails);
		}
		return returnObj;
	}
	
	@RequestMapping(value = "saveSkillSetDetails", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveSkillSetDetails(@RequestParam("items") Integer items,
			@RequestBody JSONObject object,
			HttpSession session) {
		JSONObject returnObj = new JSONObject();
		logger.debug("saving user skillset details");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppUsers profile  = registrationService.load(loggedInUser.getId());
		for(AppUsersSkillSetDetails edObj : profile.getSkillSetDetails()){
			skillSetService.delete(edObj);
		}
		for (int i = 0; i <= items; i++) {
			AppUsersSkillSetDetails educationDetails = new AppUsersSkillSetDetails();
			educationDetails.setAppUsers(profile);
			educationDetails.setSkillSet(object.get("skills_" + i).toString());
			educationDetails.setYears(Integer.valueOf(object.get("years_" + i).toString()));
			educationDetails.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			educationDetails.setLastInsrtUpdUsrId(loggedInUser.getId());
			skillSetService.save(educationDetails);
		}
		return returnObj;
	}
	
	
	@RequestMapping(value = "saveExperienceDetails", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateExperienceDetails(@RequestParam("items") Integer items,
			@RequestBody JSONObject object,
			HttpSession session) {
		JSONObject returnObj = new JSONObject();
		logger.debug("saving user experience details");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppUsers profile  = registrationService.load(loggedInUser.getId());
		for(AppUsersExperienceDetails edObj : profile.getExperienceDetails()){
			experienceDetailsService.delete(edObj);
		}
		for (int i = 0; i <= items; i++) {
			AppUsersExperienceDetails experience = new AppUsersExperienceDetails();
			experience.setAppUsers(profile);
			experience.setCompanyName(object.get("company_" + i).toString());
			experience.setDesignation(object.get("designation_" + i).toString());
			experience.setJoiningDate(object.get("joiningDate_" + i).toString());
			experience.setLastDate(object.get("lastDate_" + i).toString());
			experience.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			experience.setLastInsrtUpdUsrId(profile.getId());
			experienceDetailsService.save(experience);
		}
		return returnObj;
	}
	
	@RequestMapping(value = "/saveSocialMedia", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateSocialMedia(@RequestParam("id") Integer id,
			@RequestParam("media_website") String websiteURL, 
			@RequestParam("media_fb") String facebookPage,
			@RequestParam("media_tw") String twitter,
			@RequestParam("media_gplus") String googlePlus,
			@RequestParam("media_in") String linkedIn,
			@RequestParam("media_p") String pintrest,
			@RequestParam("media_insta") String instagram,
			
			HttpSession session) {
		JSONObject returnObj = new JSONObject();
		logger.debug("saving user profile");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppUsers profile  = registrationService.load(loggedInUser.getId());
		AppUsersSocialMedia socialMediaProfile =  profile.getSocialMediaProfile();
		if(socialMediaProfile==null){
			socialMediaProfile = new AppUsersSocialMedia();
		}
		socialMediaProfile.setWebsiteUrl(websiteURL);
		socialMediaProfile.setFacebookPage(facebookPage);
		socialMediaProfile.setTwitter(twitter);
		socialMediaProfile.setGooglePlus(googlePlus);
		socialMediaProfile.setLinkedIn(linkedIn);
		socialMediaProfile.setPintrest(pintrest);
		socialMediaProfile.setInstagram(instagram);
		socialMediaProfile.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		socialMediaProfile.setLastInsrtUpdUsrId(profile.getId());
		socialMediaProfile.setAppUsers(profile);
		socialMediaService.save(socialMediaProfile);
		return returnObj;
	}
	
	@RequestMapping(value = "saveUpdateDmnCourseData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateCourseData(@RequestBody final DmnCourse model, @RequestParam("id") Integer id, HttpSession session) {
		JSONObject returnObj = new JSONObject();
		try{
		model.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
		model.setLastInsrtUpdUsrId(-1);
		courseService.save(model);
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	@RequestMapping(value = "deleteAdminCourseData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject deleteAdminCourseData(@RequestParam(value = "courseIds[]") Integer [] ids) {
		JSONObject returnObj = new JSONObject();
		try{
		for(Integer pk : ids){
		DmnCourse course = courseService.load(pk);
	      courseService.delete(course);
		}
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	/**
	 * Returns the complete URI of the task file.
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getTaskContentURI", method = RequestMethod.GET)
	public @ResponseBody JSONObject getTaskContentURI(@RequestParam ("taskId") Integer id, HttpServletRequest request) {
		logger.debug("Inside of getTaskContentURI" );
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppPolyglotTask task = taskService.load(id);
		String fileExtension = FilenameUtils.getExtension(task.getFileName());
		
		logger.debug("Trying to render file in the browser : " + task.getFileName());
		
		String path = configurationService.getUploadLocation() + File.separator + loggedInUser.getId() + File.separator + "task";
		String fileName = task.getFileName();
		JSONObject returnObject = new JSONObject();
		
		returnObject.accumulate("filePath", path);
		returnObject.accumulate("fileExtension", fileExtension);
		returnObject.accumulate("fileName", fileName);
		logger.debug("filePath is:"+path+":fileExtension is:"+fileExtension+":fileName is:"+fileName);
		logger.debug("Exit of getTaskContentURI" );
		return returnObject;
	}
	
	/**
	 * Method to retrieve and show all quizzes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getQuizList", method = RequestMethod.GET)
	public @ResponseBody JSONObject showAllQuizzes(HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("Inside show all quizzes");
		
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotQuiz> quizzes = loggedInUser.getAppPolyglotQuizzes().stream().filter(p -> p.getIsActive().equalsIgnoreCase("Y")).collect(Collectors.toList());
		    
		    iTotalRecords = quizzes.size();
		    List<AppPolyglotQuiz> userQuizzes = new LinkedList<AppPolyglotQuiz>();
		    List<AppPolyglotQuiz> filtered = new LinkedList<AppPolyglotQuiz>();
		    if (sSearch != null) {
				for (AppPolyglotQuiz c : quizzes) {
					if (c.getQuizName().toUpperCase().contains(sSearch.toUpperCase()) ||
							c.getQuestions().stream().anyMatch(p -> p.getCourseName().contains(sSearch)) ) {
						filtered.add(c); // Add a company that matches search criterion
					} else {
						userQuizzes.add(c);
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	userQuizzes = filtered;
		    } else {
		    	iTotalDisplayRecords = userQuizzes.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = userQuizzes.size();
		    
		    if(userQuizzes.size()< iDisplayStart + iDisplayLength)
		    	userQuizzes = userQuizzes.subList(iDisplayStart, userQuizzes.size());
		    else
		    	userQuizzes = userQuizzes.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    
		    List<AppPolyglotQuizModel> models = new ArrayList<AppPolyglotQuizModel> ();
			
			for (AppPolyglotQuiz quiz : userQuizzes) {
				AppPolyglotQuizModel model = new AppPolyglotQuizModel();
				
				model.setQuizId(quiz.getId());
				model.setDuration(quiz.getDuration());
				model.setQuizName(quiz.getQuizName());
				model.setDescription(quiz.getDescription());
				
				models.add(model);
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
			logger.debug("Caught exception while loading Email Template data : " + ex, ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Method to update quiz data
	 * @param params
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "updateQuiz", method = RequestMethod.POST)
	public JSONObject saveUpdateQuizData(@RequestParam("quizId") String quizId, 
			@RequestParam("quizName") String quizName, 
			@RequestParam("duration") String duration,
			@RequestParam("description") String description, 
			HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Timestamp current = new Timestamp(Calendar.getInstance().getTime().getTime());
		AppPolyglotQuiz quiz = appQuizService.load(Integer.parseInt(quizId));
		
		quiz.setQuizName(quizName);
		quiz.setDescription(description);
		quiz.setDuration(Integer.parseInt(duration));
		quiz.setLastInsrtUpdTs(current);
		quiz.setLastInsrtUpdUsrId(loggedInUser.getId());
		
		appQuizService.save(quiz);
		
		Set<AppPolyglotQuiz> quizzes = loggedInUser.getAppPolyglotQuizzes();
		for (AppPolyglotQuiz item : quizzes) {
			if (quiz.getId().equals(item.getId())) {
				quizzes.remove(item);
				break;
			}
		}
		quizzes.add(quiz);
		loggedInUser.setAppPolyglotQuizzes(quizzes);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers", "questions" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObj = JSONObject.fromObject(quiz, jsonConfig);
		return jsonObj;
		
	}
	
	/**
	 * Method to save a new quiz
	 * @param params
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "createNewQuiz", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveNewQuiz(
			@RequestParam("quizName") String quizName, 
			@RequestParam("duration") Integer duration,
			@RequestParam("description") String description,
			@RequestParam("questionItems") Integer items,
			HttpServletRequest request,
			@RequestBody JSONObject object) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Timestamp current = new Timestamp(Calendar.getInstance().getTime().getTime());
		AppPolyglotQuiz quiz = new AppPolyglotQuiz();
		
		quiz.setQuizName(quizName);
		quiz.setIsActive("Y");
		quiz.setDescription(description);
		quiz.setAppUsers(loggedInUser);
		quiz.setLastInsrtUpdTs(current);
		quiz.setDuration(duration);
		quiz.setLastInsrtUpdUsrId(loggedInUser.getId());
		
		appQuizService.save(quiz);
		
		for (int i = 0; i < items; i++) {
			AppPolyglotQuizQuestions quizQuestion = new AppPolyglotQuizQuestions();
			
			quizQuestion.setCourseName(object.get("courseName_" + i).toString());
			quizQuestion.setNumberOfQuestions(Integer.parseInt(object.get("noQuestions_" + i).toString()));
			quizQuestion.setQuizLevel(object.get("level_" + i).toString());
			quizQuestion.setTopic(object.get("topic_" + i).toString());
			quizQuestion.setPolyglotQuiz(quiz);
			quizQuestion.setLastInsrtUpdTs(current);
			quizQuestion.setLastInsrtUpdUsrId(loggedInUser.getId());
			
			quizQuestionsService.save(quizQuestion);
		}
		
		
		Set<AppPolyglotQuiz> quizzes = loggedInUser.getAppPolyglotQuizzes();
		for (AppPolyglotQuiz item : quizzes) {
			if (quiz.getId().equals(item.getId())) {
				quizzes.remove(item);
				break;
			}
		}
		quizzes.add(quiz);
		loggedInUser.setAppPolyglotQuizzes(quizzes);
		
		
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObj = JSONObject.fromObject(quiz, jsonConfig);
		return jsonObj;
		
	}
	
	@RequestMapping(value = "deleteQuizData", method = RequestMethod.POST)
	public @ResponseBody JSONObject deleteAppQuizData(@RequestParam(value = "quizIds[]") Integer[] ids, HttpSession session) {
		logger.debug("deleting quiz data");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		Set<AppPolyglotQuiz> quizzes = loggedInUser.getAppPolyglotQuizzes();
		JSONObject returnObj = new JSONObject();
		for (Integer id : ids) {
			AppPolyglotQuiz quiz = appQuizService.load(id);
			quiz.setIsActive("N");
			appQuizService.save(quiz);
			
			for (AppPolyglotQuiz item : quizzes) {
				if (quiz.getId().equals(item.getId())) {
					quizzes.remove(item);
					break;
				}
			}
			quizzes.add(quiz);
		}
		
		loggedInUser.setAppPolyglotQuizzes(quizzes);
		
		
		return returnObj;
				
	}
	
	/**
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "saveUpdateInvitesData", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveUpdateInvitesData(HttpServletRequest request , HttpSession session) {
		logger.debug("saveUpdateInvitesData****");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject returnObject = new JSONObject();
		List<String> extLeadsList = new ArrayList<String>();
		String sqlEmail = null;
		Map<String, String> params = new HashMap<String, String>();		
		
		String inviteObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		List<AppPolyglotInvites> listOfInvites = new ArrayList<AppPolyglotInvites>();
		try {
			AppUsers insertUser = null;
			listOfInvites = mapper.readValue(StringEscapeUtils.unescapeHtml(inviteObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppPolyglotInvites.class));
			logger.debug("list of invite objects:"+listOfInvites);
			for(AppPolyglotInvites invObj : listOfInvites){
				/**check the given lead email is already available on the system*/
				sqlEmail = "from AppUsers s where s.emailId =:emailId";
				params.put("emailId", invObj.getEmail().trim());
				
				// List of users with the emailId provided
				List<AppUsers> existingUser = registrationService.runQuery(sqlEmail, params);
				
				logger.debug("existing lead found with the email id:"+existingUser);
				
				if(PolyglotFileUtils.isEmpty(existingUser)){//if no user found
					insertUser = new AppUsers();
					insertUser.setFname(invObj.getFirstName());
					insertUser.setLname(invObj.getLastName());
					insertUser.setMobile(invObj.getMobile());
					insertUser.setEmailId(invObj.getEmail());
					insertUser.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
							.getTimeInMillis()));
					insertUser.setLastInsrtUpdUsrId(loggedInUser.getId());
					insertUser.setUserType(invObj.getRole());
					insertUser.setInvitedUsrId(loggedInUser.getId());
					insertUser.setStatus(invObj.getStatus());
					insertUser.setDsblIn("N");
					/**set is_private only for P, T and R roles*/
					if(!"U".equalsIgnoreCase(invObj.getRole())){
						insertUser.setIsPrivate("Y");
					}
					insertUser.setInvitedDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					registrationService.save(insertUser);
					
					emailService.invitesEmail(invObj.getEmail(), invObj.getFirstName(), invObj.getLastName(), request);
				}else{
					extLeadsList.add(invObj.getEmail());
				}
			}
			logger.debug("list of leads are already in system"+extLeadsList);
			returnObject.accumulate("status", "SUCCESS");
			returnObject.accumulate("emailList", extLeadsList);
		} catch (JsonParseException jpe) {
			logger.error("Caught exception while parsing the json data : " + jpe, jpe);
			returnObject.accumulate("status", "Failure");
		} catch (JsonMappingException jme) {
			logger.error("Caught exception while mapping json data: " + jme,jme);
			returnObject.accumulate("status", "Failure");
		} catch (Exception ex) {
			logger.error("Caught exception while invite data: " + ex,ex);
			returnObject.accumulate("status", "Failure");
		}
		
		return returnObject;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "reSendInviteeEmail", method = RequestMethod.POST)
	public @ResponseBody JSONObject reSendInviteeEmail(@RequestParam("firstName") String firstName, 
			@RequestParam("lastName") String lastName,
			@RequestParam("email") String email, HttpServletRequest request) {
		JSONObject object = new JSONObject();
		logger.debug("Inside of reSendInviteeEmail");
		emailService.invitesEmail(email, firstName, lastName, request);
		object.accumulate("status", "SUCCESS");
		logger.debug("Exit of reSendInviteeEmail");
		return object;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "invites", method = RequestMethod.GET)
	public @ResponseBody JSONObject showInvitesData(HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("Inside show invites data.");
				
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppUsers> existingUser = new LinkedList<AppUsers>();
		    AppPolyglotInvites inviteUsr = null;
		    List<AppPolyglotInvites> lstOfInvites = new LinkedList<AppPolyglotInvites>();
		    List<AppPolyglotInvites> filteredInvites = new LinkedList<AppPolyglotInvites>();
		    
		    String sql = "from AppUsers s where s.invitedUsrId =:invited_usr_id";
			Map<String, String> params = new HashMap<String, String>();
			params.put("invited_usr_id", String.valueOf(loggedInUser.getId()));

			existingUser = registrationService.runQuery(sql, params);
			existingUser.sort(Comparator.comparing(AppUsers::getLastInsrtUpdTs).reversed());
		    iTotalRecords = existingUser.size();
		    logger.debug("existing leads size"+iTotalRecords);
		    
		    if (sSearch != null) {
				if(!PolyglotFileUtils.isEmpty(existingUser)){
					for (AppUsers lead : existingUser) {
						inviteUsr = new AppPolyglotInvites();
						if (lead.getFname().toLowerCase().contains(sSearch.toLowerCase()) ||
								lead.getLname().toLowerCase().contains(sSearch.toLowerCase()) ||
								lead.getMobile().toLowerCase().contains(sSearch.toLowerCase())||
								lead.getEmailId().toLowerCase().contains(sSearch.toLowerCase())) {
							if(!PolyglotFileUtils.isEmpty(lead.getStatus()) && "invited".equalsIgnoreCase(lead.getStatus())){
								filteredInvites.add(prepareInvites(lead.getFname(), lead.getLname(), lead.getMobile(), lead.getEmailId(), 
										lead.getId(), lead.getStatus(), PolyglotFileUtils.convertTimeStampToString(lead.getInvitedDate()), inviteUsr));
							}
						} else {
							if(!PolyglotFileUtils.isEmpty(lead.getStatus()) && "invited".equalsIgnoreCase(lead.getStatus())){
								lstOfInvites.add(prepareInvites(lead.getFname(), lead.getLname(), lead.getMobile(), lead.getEmailId(), 
										lead.getId(), lead.getStatus(), PolyglotFileUtils.convertTimeStampToString(lead.getInvitedDate()), inviteUsr));
							}
						}
					}
				}
		    }
		    
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filteredInvites.size();
		    	lstOfInvites = filteredInvites;
		    } else {
		    	iTotalDisplayRecords = lstOfInvites.size();
		    }
		    
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = lstOfInvites.size();
		    
		    if(lstOfInvites.size()< iDisplayStart + iDisplayLength)
		    	lstOfInvites = lstOfInvites.subList(iDisplayStart, lstOfInvites.size());
		    else
		    	lstOfInvites = lstOfInvites.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "appUsers" });
			config.setIgnoreDefaultExcludes(false);
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			logger.debug("lstOfInvites is:"+lstOfInvites);
			JSONArray array = JSONArray.fromObject(lstOfInvites, config);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			logger.debug("before returning the object");
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading invites data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * 
	 * @param firstName
	 * @param lastName
	 * @param mobile
	 * @param email
	 * @param status
	 * @param inviteUsr
	 */
	public AppPolyglotInvites prepareInvites(String firstName, String lastName, String mobile, String email, 
			Integer id, String status, String invitedDate, AppPolyglotInvites inviteUsr){
		inviteUsr.setFirstName(firstName);
		inviteUsr.setLastName(lastName);
		inviteUsr.setMobile(mobile);
		inviteUsr.setEmail(email);
		inviteUsr.setStatus(status);
		inviteUsr.setId(id);
		inviteUsr.setInvitedDate(invitedDate);
		return inviteUsr;
	}
	
	/**
	 * 
	 * @param id
	 * @param dmnCourseId
	 * @param name
	 * @param schedule
	 * @param duration
	 * @param durationType
	 * @param courseFee
	 * @param realtimeProjs
	 * @param feeInInstallments
	 * @param labAssistance
	 * @param placementAssistance
	 * @param course
	 * @return
	 */
	public PolyglotCourse prepareCourseData(Integer id, Integer dmnCourseId, String name, String realtimeProjs,
			String feeInInstallments, String labAssistance, String placementAssistance, String online, String classroom, 
			String corporate, String courseContent, String videoContent, PolyglotCourse course){
		course.setId(id);
		course.setDmnCourseId(dmnCourseId);
		course.setName(name);
		course.setOnline(online);
		course.setClassroom(classroom);
		course.setCorporate(corporate);
		course.setRealtimeProjs(realtimeProjs);
		course.setLabAssistance(labAssistance);
		course.setFeeInInstallments(feeInInstallments);
		course.setPlacementAssistance(placementAssistance);
		course.setCourseContent(courseContent);
		course.setVideoContent(videoContent);
		return course;
	}

	/**
	 * 
	 * @param name
	 * @param mobile
	 * @param emailId
	 * @param courseName
	 * @param mode
	 * @param facultyElement
	 * @return
	 */
	public PolyglotFaculty prepareFacultyData(Integer id, String fName, String lName, String mobile, 
			String emailId, String courseName, String mode, Integer facultId, String isPrivate, Integer courseId, PolyglotFaculty facultyElement){
		facultyElement.setId(id);
		facultyElement.setCourseName(courseName);
		facultyElement.setfName(fName);
		facultyElement.setlName(lName);
		facultyElement.setMobile(mobile);
		facultyElement.setEmailId(emailId);
		facultyElement.setMode(mode);
		facultyElement.setFacultId(facultId);
		facultyElement.setCourseId(courseId);
		facultyElement.setIsPrivate(isPrivate);
		return facultyElement;
	}
	
	@RequestMapping(value = "getQuizCourseNames", method = RequestMethod.GET)
	public @ResponseBody List<String> getQuizCourseNames(HttpServletRequest request) {
		logger.debug("Inside getQuizCourseNames");
		
		List<String> courseList = new ArrayList<String>();
		List<DmnQuestions> quizzes = dmnQuestionsService.getAll().stream().filter(PolyglotFileUtils.distinctByKey(DmnQuestions::getCourseName)).collect(Collectors.toList());
		
		for (DmnQuestions quiz : quizzes) {
			courseList.add(quiz.getCourseName());
		}
		
		return courseList;
	}
	
	@RequestMapping(value = "getTopicsForCourseName", method = RequestMethod.GET)
	public @ResponseBody List<String> getTopicsForCourseName(String courseName, String quizLevel) {
		logger.debug("Inside getTopicsForCourseName");
		
		List<String> topicList = new ArrayList<String>();
		String sql = "from DmnQuestions c where c.courseName =:courseName and c.quizLevel =:quizLevel";
		Map<String, String> params = new HashMap<String, String>();
		params.put("courseName", courseName);
		params.put("quizLevel", quizLevel);
		
		List<DmnQuestions> quizzes = dmnQuestionsService.runQuery(sql, params).stream().filter(PolyglotFileUtils.distinctByKey(DmnQuestions::getTopic)).collect(Collectors.toList());
		
		for (DmnQuestions quiz : quizzes) {
			topicList.add(quiz.getTopic());
		}
		
		return topicList;
	}
	
	
	
	@RequestMapping(value = "getQuizIdForSelection", method = RequestMethod.GET)
	public @ResponseBody Integer getQuizIdForSelection(String courseName, String quizLevel, String topic) {
		logger.debug("Inside getQuizIdForSelection");
		
		String sql = "from DmnQuestions c where c.courseName =:courseName and c.quizLevel =:quizLevel and c.topic =:topic";
		Map<String, String> params = new HashMap<String, String>();
		params.put("courseName", courseName);
		params.put("quizLevel", quizLevel);
		params.put("topic", topic);
		
		List<DmnQuestions> quizzes = dmnQuestionsService.runQuery(sql, params);
		
		return (quizzes != null && quizzes.size() > 0) ? quizzes.get(0).getId() : 0;
	}
	
	@RequestMapping(value = "saveUpdateCourseContent", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateCourseContent(HttpServletRequest request, HttpSession session, @RequestParam("courseId") Integer courseId, 
			@RequestParam("content") String content, @RequestParam("source") String source) {
		logger.debug("save course content");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppPolyglotCourse params = new AppPolyglotCourse();
		logger.debug("course id:"+courseId+"::content is:"+content);
		try {
			params = appCourseService.load(courseId);
			
			params.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
					.getTimeInMillis()));
			params.setLastInsrtUpdUsrId(loggedInUser.getId());
			if("course".equalsIgnoreCase(source)){
				params.setCourseContent(content);
			}else if("video".equalsIgnoreCase(source)){
				params.setVideoContent(content);
			}
			params.setAppUsers(loggedInUser);			
			logger.debug("course data is:"+params);
			appCourseService.save(params);
		} catch (Exception ex) {
			logger.error("exception while storing the course content:", ex);
		}
		
		Set<AppPolyglotCourse> courses = loggedInUser.getAppPolyglotCourses();
		for (AppPolyglotCourse course : courses) {
			if (course.getId().equals(params.getId())) {
				courses.remove(course);
				break;
			}
		}
		courses.add(params);
		loggedInUser.setAppPolyglotCourses(courses);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		JSONObject jsonObj = JSONObject.fromObject(params, jsonConfig);
		logger.debug("End of the course content");		
		return jsonObj;
	}
	
	@RequestMapping(value = "convertExcelData", method = RequestMethod.POST)
	public @ResponseBody
	String convertExcelData(@RequestParam("file") MultipartFile file,
			HttpSession session) {
		logger.debug("entry in convertExcelData");
		List<AppPolyglotInvites> lstOfInvData = new LinkedList<AppPolyglotInvites>();
		AppPolyglotInvites inviteObj = null;
		String returnString = "{}";
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		try {
			
			fis = new FileInputStream(returnFile(file));
			//Get the workbook instance for XLS file 
			logger.debug("file input stream created");
			workbook = new HSSFWorkbook(fis);
			//Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(0);
			//Get iterator to all the rows in current sheet
			Iterator<Row> rowIterator = sheet.iterator();
			
			while(rowIterator.hasNext()) {
				Row row = rowIterator.next();
				inviteObj = new AppPolyglotInvites();
				inviteObj.setFirstName(row.getCell(0).getStringCellValue());
				inviteObj.setLastName(row.getCell(1).getStringCellValue());
				HSSFCell yourCell = (HSSFCell) row.getCell(2);
				yourCell.setCellType(Cell.CELL_TYPE_STRING);
				inviteObj.setMobile(String.valueOf(yourCell.getStringCellValue()));
				inviteObj.setEmail(row.getCell(3).getStringCellValue());
				inviteObj.setStatus(row.getCell(4).getStringCellValue());
				inviteObj.setRole(row.getCell(5).getStringCellValue());
				lstOfInvData.add(inviteObj);
			}		    
		} catch (Exception ex) {
			logger.error("exception while reading the data:"+ex,ex);
		} finally {
			try {
				fis.close();
				workbook.close();
			} catch (IOException e) {
				// ignore
			}
		}
		logger.debug("list of invite object:"+lstOfInvData);
		JSONObject object = new JSONObject();
		returnString = object.accumulate("InvData", lstOfInvData).toString();
		logger.debug("exit in convertExcelData");
		return returnString;
	}
	
	/**
	 * 
	 * @param id
	 * @param fName
	 * @param lName
	 * @param courseName
	 * @param mode
	 * @param batchStatus
	 * @param model
	 * @param appUserId
	 * @return
	 */
	public AppPolyglotLeadModel prepareStudentsModel(Integer id, String fName, String lName, String batchName, String mode, 
			String batchStatus, String email, Integer appUserId, Double fee, Integer feeDiscount, AppPolyglotLeadModel model){
		model.setId(id);
		model.setBatchName(batchName);
		model.setFirstName(fName);
		model.setLastName(lName);
		model.setMode(mode);
		model.setStatus(batchStatus);
		model.setEmail(email);
		model.setUserId(appUserId);
		model.setFee(fee);
		model.setFeeDiscount(feeDiscount);
		return model;
	}
	
	public File returnFile(MultipartFile file){
		logger.debug("Inside returnFile");
		File partnerFolder = new File(configurationService.getUploadLocation());
		if (!partnerFolder.exists()) {
			if (partnerFolder.mkdir()) {
				logger.debug("Successfully created partner folder : " + partnerFolder);
			} else {
				logger.debug("Failed to create partner directory!" + partnerFolder);
			}
		} else {
			logger.debug("partner folder already exists with name : " + partnerFolder);
		}
		File folder = new File(partnerFolder + File.separator + "Invites");
		if (!folder.exists()) {
			if (folder.mkdir()) {
				logger.debug("Successfully created course folder : " + "Invites");
			} else {
				logger.debug("Failed to create upload directory!" + "Invites");
			}
		} else {
			logger.debug("course folder already exists with name : " + "Invites");
		}
		File newFile = null;
		try {
			newFile = new File(folder + "/" + file.getOriginalFilename());
			newFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(file.getBytes());
			fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.debug("Exit returnFile");
		return newFile;
	}
	
	@RequestMapping(path = "/assignedquizterms/{quizIdentifier}", method = RequestMethod.GET)
	public ModelAndView AssignedQuizTerms(HttpServletRequest request,@PathVariable String quizIdentifier) {
		logger.debug("Showing Assigned-quiz-terms");
		ModelAndView model = new ModelAndView();
		quizIdentifier = "1";
		if(quizIdentifier!=null){
			List<AppPolyglotQuiz> quizList = appQuizService.runQuery("from AppPolyglotQuiz where quizIdentifier="+quizIdentifier, null);
              if(quizList!=null && !quizList.isEmpty()){
          		  AppPolyglotQuiz quiz = quizList.get(0);
            	  List<AppPolyglotQuizQuestions> questions = quizQuestionsService.runQuery("from AppPolyglotQuizQuestions s where s.polyglotQuiz.id="+quiz.getId(), null);
            	  model.addObject("quizId", quiz.getId());
            	  model.addObject("quizIdentifier", quiz.getQuizIdentifier());
            	  model.addObject("quizDesc", quiz.getDescription());
            	  model.addObject("quizName", quiz.getQuizName());
            	  List<String> categories = new ArrayList<String>();
            	  int noOfQuestions = 0; 
            	  for(AppPolyglotQuizQuestions question : questions){
            		  categories.add(question.getCourseName());
            		  noOfQuestions+=question.getNumberOfQuestions();
            	  }
            	  model.addObject("noOfQuestions", noOfQuestions);
            	  model.addObject("duration", quiz.getDuration());
            	  model.addObject("negitiveMarks", quiz.getNegitiveMarks());
            	  model.addObject("categories", categories);
            	 }
			}
		model.setViewName("AssignedQuizTerms");
		return model;
	}
	
	@RequestMapping(value = "removePrflPhoto", method = RequestMethod.POST)
	public @ResponseBody
	String removePrflPhoto(HttpServletRequest request, 
			HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		logger.debug("Entry of removePrflPhoto");
		String returnString = "{}";		
		try {
			loggedInUser.setPrflImagePath(null);
			loggedInUser.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
					.getTimeInMillis()));
			loggedInUser.setLastInsrtUpdUsrId(loggedInUser.getId());
			
			registrationService.save(loggedInUser);
        } catch (Exception e) {
            logger.error("Exception while parsing the images");
        }
		logger.debug("Exit of removePrflPhoto");
		return returnString;
	}
	
	@RequestMapping(value = "photoUploadPrfl", method = RequestMethod.POST)
	public @ResponseBody
	String photoUploadPrfl(@RequestParam("files") MultipartFile uploadfiles, HttpServletRequest request, 
			HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		logger.debug("Entry of photoUploadPrfl");
		String returnString = "{}";		
		try {
            saveUploadedFiles(Arrays.asList(uploadfiles), loggedInUser, "profile", session);
        } catch (IOException e) {
            logger.error("Exception while parsing the images");
        }
		logger.debug("Exit of photoUploadPrfl");
		return returnString;
	}
	
	@RequestMapping(value = "photoUploadLogo", method = RequestMethod.POST)
	public @ResponseBody
	String photoUploadLogo(@RequestParam("files") MultipartFile uploadfiles, HttpServletRequest request, 
			HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		logger.debug("Entry of photoUploadLogo");
		String returnString = "{}";		
		try {
            saveUploadedFiles(Arrays.asList(uploadfiles), loggedInUser, "logo", session);
        } catch (IOException e) {
            logger.error("Exception while parsing the images");
        }
		logger.debug("Exit of photoUploadLogo");
		return returnString;
	}
	
	@RequestMapping(value = "photoUploadImage", method = RequestMethod.POST)
	public @ResponseBody
	String photoUploadImage(@RequestParam("files") MultipartFile uploadfiles, HttpServletRequest request, 
			HttpSession session) {
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		logger.debug("Entry of photoUploadImage");
		String returnString = "{}";		
		try {
            saveUploadedFiles(Arrays.asList(uploadfiles), loggedInUser, "image", session);
        } catch (IOException e) {
            logger.error("Exception while parsing the images");
        }
		logger.debug("Exit of photoUploadImage");
		return returnString;
	}
	
    private void saveUploadedFiles(List<MultipartFile> files, AppUsers usrObj, String fileName, HttpSession session) throws IOException {

        for (MultipartFile file : files) {
        	if(!file.isEmpty()){
        		//Upload path cannot be empty, Else throw exception
        		if (StringUtils.isEmpty(configurationService.getUploadLocation())) {
        			logger.error("File upload path is empty, Check properties file");
        			throw new ResourceNotFoundException("Upload Path is empty");
        		}
        		File partnerFolder = new File(configurationService.getUploadLocation() + File.separator + usrObj.getId());
        		if (!partnerFolder.exists()) {
        			if (partnerFolder.mkdir()) {
        				logger.debug("Successfully created partner folder : " + partnerFolder);
        			} else {
        				logger.debug("Failed to create partner directory!" + partnerFolder);
        			}
        		} else {
        			logger.debug("partner folder already exists with name : " + partnerFolder);
        		}
        		String uploadType = "TrainerImages";
        		File folder = new File(partnerFolder + File.separator + uploadType);
        		if (!folder.exists()) {
        			if (folder.mkdir()) {
        				logger.debug("Successfully created course folder : " + uploadType);
        			} else {
        				logger.debug("Failed to create upload directory!" + uploadType);
        			}
        		} else {
        			logger.debug("course folder already exists with name : " + uploadType);
        		}
        		File newFile = new File(folder+"/"+file.getOriginalFilename());
        		
        		try {
        			file.transferTo(newFile);
        		} catch (IOException exception) {
        			logger.error(exception.getMessage(), exception);
        		}
        		//save into the table with path
        		try {
        			if("logo".equalsIgnoreCase(fileName)){
        				usrObj.setLogoPath(folder+"/"+file.getOriginalFilename());
        			}else if("image".equalsIgnoreCase(fileName)){
        				usrObj.setThumbNailPath(folder+"/"+file.getOriginalFilename());
        			}else if("profile".equalsIgnoreCase(fileName)){
        				usrObj.setPrflImagePath(folder+"/"+file.getOriginalFilename());
        			}
        			usrObj.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
        					.getTimeInMillis()));
        			usrObj.setLastInsrtUpdUsrId(usrObj.getId());
        			
        			registrationService.save(usrObj);
        			session.setAttribute(PolyglotConstants.APP_POLYGLOT_USER, usrObj);
        		} catch (Exception ex) {
        			logger.error("exception while storing the trainer logo content:", ex);
        		}
        	}
        }
    }
    
    @RequestMapping(path = "/quizdetails/{quizIdentifier}", method = RequestMethod.GET)
	public ModelAndView quizDetails(HttpServletRequest request,@PathVariable String quizIdentifier) {
		logger.debug("Showing QuizDetails");
		ModelAndView model = new ModelAndView();
		if(quizIdentifier!=null){
			List<AppPolyglotQuiz> quizList = appQuizService.runQuery("from AppPolyglotQuiz where quizIdentifier="+quizIdentifier, null);
              if(quizList!=null && !quizList.isEmpty()){
            	  AppPolyglotQuiz quiz = quizList.get(0);
            	  Set<AppPolyglotQuizQuestions> questions = quiz.getQuestions();
            	  Map<String,List<DmnQuestions>> courseQuestions = new HashMap<String, List<DmnQuestions>>(); 
        		   int noOFQuestions = 0;
            	  for(AppPolyglotQuizQuestions question : questions){
            		  String query = "from DmnQuestions where courseName='"+question.getCourseName()+"'";
            		  if(question.getTopic()!=null){
            			  query = "from DmnQuestions where topic='"+question.getTopic()+"' and courseName='"+question.getCourseName()+"'";
            		  }
            		  List<DmnQuestions> questionList = dmnQuestionService.runQuery(query, null);
            		  questionList.stream().forEach((temp)->{
            			  if(temp.getCorrectOption()!=null && temp.getCorrectOption().indexOf(",")>0)
            			    temp.setCorrectOption(",");
            			  else
            				temp.setCorrectOption("");
            		  });
            		  noOFQuestions+=questionList.size();
            		  courseQuestions.put(question.getCourseName(), questionList);
            	  }
            	  AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
              	  List<AppStudentQuiz> studentQuizList = studentQuizService.runQuery("from AppStudentQuiz where taskId="+quiz.getId()+" and userId="+loggedInUser.getId(), null);
              	  if(!studentQuizList.isEmpty()){
              		  AppStudentQuiz studentQuiz = studentQuizList.get(0);
              		  studentQuiz.setStartDate(new Timestamp(new Date().getTime()));
              		  studentQuiz.setStatus("IN PROGRESS");
              		  studentQuiz.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
              		  studentQuiz.setLastInsrtUpdUsrId(loggedInUser.getId());
              		  studentQuizService.save(studentQuiz);
              		  
              	  }  
            	  JSONObject object = new JSONObject();
            	  object.accumulate("quizData", courseQuestions);
            	  model.addObject("quizDataObj", object);
            	  model.addObject("courseMap", courseQuestions);
            	  model.addObject("time", quiz.getDuration());
            	  model.addObject("quizId", quiz.getId());
            	  model.addObject("quizName", quiz.getQuizName());
            	  model.addObject("noOfQuestions", noOFQuestions);
              }
		}   
		model.setViewName("QuizDetails");
       return model;
	}
	
	
	@RequestMapping(value = "postQuizAnswers", method = RequestMethod.POST)
	public void postQuizAnswers(HttpServletRequest request,
			HttpSession session) {
		try{
			System.out.println(request.getParameter("allData"));
			System.out.println(request.getParameter("quizIdentifier"));
			System.out.println(request.getParameter("quizId"));
            String allData =   request.getParameter("allData"); 
            String tempData = request.getParameter("tempData"); 
			Map<String,Map<String,String>> dataMap = new HashMap<String, Map<String,String>>();
            if(allData!=null && allData.trim().length()>0){
				String[] arrData = allData.split("\\|");
				if(arrData!=null && arrData.length>0){
					for(String temp : arrData){
						if(temp!=null && temp.trim().length()>0){
							String[] data = temp.split("-");
							 if(data!=null && data.length>0){
								 if(dataMap.get(data[0])==null)
								 {
									 Map<String,String> map = new HashMap<String, String>();
									 map.put(data[1], data[2]);
									 dataMap.put(data[0], map);
									 
								 }else{
									 Map<String,String> map = dataMap.get(data[0]);
									 map.put(data[1], data[2]);
									 dataMap.put(data[0], map);
								 }
						}
					}
				}
			}
		 }
            Map<String,Map<String,String>> dataAnswers = new HashMap<String, Map<String,String>>();
            List<AppPolyglotQuiz> quizList = appQuizService.runQuery("from AppPolyglotQuiz where id="+request.getParameter("quizId"), null);
            int totalQuestions = 0;
        	if(quizList!=null && !quizList.isEmpty()){
          	  AppPolyglotQuiz quiz = quizList.get(0);
          	  Set<AppPolyglotQuizQuestions> questions = quiz.getQuestions();
          	  for(AppPolyglotQuizQuestions question : questions){
          		 String temp = tempData.substring(tempData.indexOf(question.getCourseName()+"@"),tempData.length()).split("@")[1];
    			 int index = Integer.valueOf(temp);
          		 Map<String,String> batchesAnswers = new HashMap<String, String>();
          		  String query = "from DmnQuestions where courseName='"+question.getCourseName()+"'";
          		  if(question.getTopic()!=null){
          			  query = "from DmnQuestions where topic='"+question.getTopic()+"' and courseName='"+question.getCourseName()+"'";
          		  }
          		  List<DmnQuestions> questionList = dmnQuestionService.runQuery(query, null);
          		  for (DmnQuestions dmnQuestions : questionList) {
          			  batchesAnswers.put(String.valueOf(index++), dmnQuestions.getCorrectOption());
			      }
          		totalQuestions+=questionList.size();
          		dataAnswers.put(question.getCourseName(), batchesAnswers);
          		batchesAnswers = new HashMap<String, String>();
          	  }
          	  }
            System.out.println(dataAnswers);
            int questionsAnswered = 0;
            if(dataMap!=null && dataMap.size()>0){
            	for(String key : dataMap.keySet()){
            		if(dataAnswers!=null && dataAnswers.get(key)!=null){
            			Map<String,String> questionAndAnswers = dataAnswers.get(key);
            			Map<String,String> userAnswered = dataMap.get(key);
                         for(String keyData : userAnswered.keySet()){
                        	 String userAnswer = userAnswered.get(keyData);
                        	 if(userAnswer!=null && userAnswer.lastIndexOf(",")==userAnswer.length()){
                        		 userAnswer = userAnswer.substring(0,userAnswer.length()-1);
                        	 }
                        	 String correctAnswer = questionAndAnswers.get(keyData);
                        	 String[] correctData = correctAnswer.split(",");
                        	 String[] userData = userAnswer.split(",");
                        	 if(userData.length==correctData.length){
                        		 int allMatch = 0;
                        		 for(String temp : userData){
                        		    if(correctAnswer.indexOf(temp)!=-1){
                        		    	allMatch++;
                        		    }
                        		 }
                        		 if(allMatch==correctData.length){
                        			 questionsAnswered++;
                        		 }
                        		 
                        	 }
                        	 
                         }
            		}
            		}
            	}
            System.out.println("questionsAnswered"+questionsAnswered+" total Questions "+totalQuestions);
            float percentageScored = (((float) questionsAnswered) / ((float) totalQuestions))*100;
            System.out.println("percentageScored"+percentageScored);
            AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
        	  List<AppStudentQuiz> studentQuizList = studentQuizService.runQuery("from AppStudentQuiz where taskId="+request.getParameter("quizId")+" and userId="+loggedInUser.getId(), null);
        	  if(!studentQuizList.isEmpty()){
        		  AppStudentQuiz studentQuiz = studentQuizList.get(0);
        		  studentQuiz.setEndDate(new Timestamp(new Date().getTime()));
        		  studentQuiz.setStatus("COMPLETED");
        		  studentQuiz.setScore(String.valueOf(percentageScored));
        		  studentQuiz.setUserString(dataMap.toString()+"_"+tempData);
        		  studentQuiz.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
        		  studentQuiz.setLastInsrtUpdUsrId(loggedInUser.getId());
        		  studentQuizService.save(studentQuiz);
        		  
        	  } 
            System.out.println(dataMap.size());
            System.out.println(dataMap);
		}catch(Exception e){
			
		}
		
	}
}