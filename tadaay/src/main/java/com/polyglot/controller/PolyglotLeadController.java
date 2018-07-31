package com.polyglot.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
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

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.domain.AppPolyglotDemo;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppPolyglotLeadDemoStatus;
import com.polyglot.domain.AppPolyglotQuiz;
import com.polyglot.domain.AppPolyglotTask;
import com.polyglot.domain.AppStudentQuiz;
import com.polyglot.domain.AppStudentTask;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.DmnCourse;
import com.polyglot.model.AppPolyglotLeadModel;
import com.polyglot.model.AppPolyglotStudentQuizModel;
import com.polyglot.service.AppPolyglotBatchService;
import com.polyglot.service.AppPolyglotBranchService;
import com.polyglot.service.AppPolyglotCourseService;
import com.polyglot.service.AppPolyglotDemoService;
import com.polyglot.service.AppPolyglotFacultyService;
import com.polyglot.service.AppPolyglotLeadDemoStatusService;
import com.polyglot.service.AppPolyglotLeadService;
import com.polyglot.service.AppPolyglotQuizService;
import com.polyglot.service.AppPolyglotRegistrationService;
import com.polyglot.service.AppPolyglotStudentService;
import com.polyglot.service.AppPolyglotTaskService;
import com.polyglot.service.AppStudentQuizService;
import com.polyglot.service.AppStudentTaskService;
import com.polyglot.service.DmnCourseService;
import com.polyglot.service.PolyglotEmailService;
import com.polyglot.utils.PolyglotConstants;
import com.polyglot.utils.PolyglotFileUtils;

@Controller
public class PolyglotLeadController {
	
	private static final Logger logger = Logger.getLogger(PolyglotLeadController.class);
	
	@Autowired
	private AppPolyglotRegistrationService  registrationService;

	@Autowired
	private AppPolyglotLeadService leadService;

	@Autowired
	private AppPolyglotLeadDemoStatusService demoStatusService;
	
	@Autowired
	private AppPolyglotBatchService batchService;
	
	@Autowired
	private AppPolyglotStudentService studentService;
	
	@Autowired
	private AppPolyglotBranchService branchService;

	@Autowired
	private AppPolyglotCourseService appCourseService;

	@Autowired
	private DmnCourseService courseService;
	
	@Autowired
	private PolyglotEmailService emailService;
	
	@Autowired
	private AppPolyglotFacultyService appFacultyService;

	@Autowired
	private AppStudentTaskService studentTaskService;

	@Autowired
	private AppPolyglotTaskService taskService;
	
	@Autowired
	private AppPolyglotQuizService appQuizService;
	
	@Autowired
	private AppStudentQuizService studentQuizService;
	
	@Autowired
	private AppPolyglotDemoService demoService;
	
	@RequestMapping(value = "getStudentListForPartner", method = RequestMethod.POST)
	public @ResponseBody JSONObject getStudentListForPartner(HttpServletRequest request) {
		logger.debug("Inside getStudentListForPartner");
		JSONObject leadObj = new JSONObject();
		Map<String, String> params = new HashMap<String, String>();
		
		String sql = "from AppUsers u where u.userType =:userType";
		params.put("userType", "U");
		
		List<AppUsers> lstOfUsers = registrationService.runQuery(sql, params);
		AppPolyglotLeadModel leadModel = null;
		List<AppPolyglotLeadModel> lstOfLeads = new ArrayList<AppPolyglotLeadModel>();
		for(AppUsers user: lstOfUsers){
			leadModel = new AppPolyglotLeadModel();
			leadModel.setFirstName(user.getFname());
			leadModel.setLastName(user.getLname());
			leadModel.setMobile(user.getMobile());
			leadModel.setEmail(user.getEmailId());
			leadModel.setUserId(user.getId());
			lstOfLeads.add(leadModel);
		}
		logger.debug("leads list:"+lstOfLeads);
		leadObj.accumulate("leadsObj", lstOfLeads);
		return leadObj;
	}
	
	@RequestMapping(value = "saveUpdateLeadData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateLeadData(HttpServletRequest request , @RequestParam("id") Integer id, HttpSession session) {

		logger.debug("Inside saveUpdateLeadData");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotLeadModel> lstOfLeads = new ArrayList<AppPolyglotLeadModel>();
		AppPolyglotLead lead = new AppPolyglotLead();
		
		String leadObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		JSONObject jsonObj = new JSONObject();
			
		try {
			lstOfLeads = mapper.readValue(StringEscapeUtils.unescapeHtml(leadObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppPolyglotLeadModel.class));
			logger.debug("list of lead objects:"+lstOfLeads);
			
			for(AppPolyglotLeadModel model : lstOfLeads){
				
				lead.setId(model.getId());
				lead.setBranchId(Integer.parseInt(model.getBranchName()));
				lead.setCourseId(model.getCourseId());
				lead.setUserId(model.getUserId());
				lead.setMode(model.getMode());
				lead.setPreferredTime(model.getPreferredTimeStart() + "-" + model.getPreferredTimeEnd());
				lead.setSchedule(model.getSchedule());
				lead.setSource(model.getSource());
				
				lead.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
						.getTimeInMillis()));
				lead.setCreatedDate(new Timestamp(Calendar.getInstance()
						.getTimeInMillis()));
				lead.setLastInsrtUpdUsrId(loggedInUser.getId());
				lead.setLeadStatus(PolyglotConstants.LEAD_STATUS_INVITED);
				lead.setComments(model.getComments());
				lead.setPartnerId(loggedInUser.getId());
				
				//Save lead
				leadService.save(lead);
				jsonObj.accumulate("status", "SUCCESS");
			}
		} catch (JsonParseException jpe) {
			logger.error("Caught exception while parsing the json data : " + jpe, jpe);
			jsonObj.accumulate("status", "Failure");
		} catch (JsonMappingException jme) {
			logger.error("Caught exception while mapping json data: " + jme, jme);
			jsonObj.accumulate("status", "Failure");
		} catch (Exception ex) {
			logger.error("Caught exception while invite data: " + ex, ex);
			jsonObj.accumulate("status", "Failure");
		}
		logger.debug("Exit saveUpdateLeadData");
		return jsonObj;
	}
	
	@RequestMapping(value = "showLeads", method = RequestMethod.GET)
	public @ResponseBody JSONObject showLeads(HttpServletRequest request) {
		logger.debug("Inside show leads.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotLead> lstOfLeads = new ArrayList<AppPolyglotLead>();
		AppUsers exisitngUser = new AppUsers();
		AppPolyglotBranch branch = new AppPolyglotBranch();
		AppPolyglotCourse course = new AppPolyglotCourse();
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords = 0; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    Map<String, String> params = new HashMap<String, String>();
		    params.put("partnerId", String.valueOf(loggedInUser.getId()));
		    params.put("leadStatus", PolyglotConstants.LEAD_STATUS_INVITED);
		    String sql = "from AppPolyglotLead l where  upper(l.leadStatus) =:leadStatus and l.partnerId =:partnerId";
		    
		    lstOfLeads = leadService.runQuery(sql, params);
		    
		    /*//Also add leads that were imported by this user
		    sql = "from AppPolyglotLead l where l.leadStatus =:leadStatus and l.partnerId =:partnerId";
		    
		    params.put("leadStatus", PolyglotConstants.APP_POLYGLOT_LEAD_STATUS_IMPORTED);
		    params.put("partnerId", Integer.valueOf(loggedInUser.getId()).toString());
		    
		    //Here, add the leads that were also imported by this user.
		    list.addAll(leadService.runQuery(sql, params));*/
		    
		    if(!PolyglotFileUtils.isEmpty(lstOfLeads)){
		    	iTotalRecords = lstOfLeads.size();
		    	lstOfLeads.sort(Comparator.comparing(AppPolyglotLead::getLastInsrtUpdTs).reversed());
			    logger.debug("leads objectis size is:"+lstOfLeads.size());
		    }
		    
		    
		    List<AppPolyglotLeadModel> leads = new LinkedList<AppPolyglotLeadModel>();
		    List<AppPolyglotLeadModel> filtered = new LinkedList<AppPolyglotLeadModel>();
		    AppPolyglotLeadModel model = null;
		    if (sSearch != null) {
				for (AppPolyglotLead c : lstOfLeads) {
					if(null != c){
						model = new AppPolyglotLeadModel();
						logger.debug("userId is:"+c.getUserId()+":course id is:"+c.getCourseId()+":branch id is:"+c.getBranchId());
						/**get leads details based on app_user_id*/
						exisitngUser = registrationService.load(c.getUserId());
						/**get course name based on courseId*/
						course = appCourseService.load(c.getCourseId());
						DmnCourse dmnData = null != course ? courseService.load(course.getDmnCourseId()) : null;
						/**get branch name based on branchId*/
						branch = branchService.load(c.getBranchId());
						
						if (null != exisitngUser && null != exisitngUser.getFname() && exisitngUser.getFname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getLname() && exisitngUser.getLname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getMobile() && exisitngUser.getMobile().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getEmailId() && exisitngUser.getEmailId().toUpperCase().contains(sSearch.toUpperCase())
								|| null != dmnData && null != dmnData.getCourseName() && dmnData.getCourseName().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getMode() && c.getMode().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getSchedule() && c.getSchedule().toUpperCase().contains(sSearch.toUpperCase())
								|| null != branch && null != branch.getName() && branch.getName().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getSource() && c.getSource().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getComments() && c.getComments().toUpperCase().contains(sSearch.toUpperCase())) {
							filtered.add(prepareLeadsModel(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(), exisitngUser.getMobile(), exisitngUser.getEmailId(),
									dmnData.getCourseName(), c.getMode(), c.getSchedule(), branch.getName(), c.getSource(), c.getComments(), c.getPreferredTime(), 
									c.getCourseId(), c.getBranchId(), c.getUserId(), model)); // Add a company that matches search criterion
						} else {
							leads.add(prepareLeadsModel(c.getId(), exisitngUser.getFname(), exisitngUser.getLname(), exisitngUser.getMobile(), exisitngUser.getEmailId(),
									dmnData.getCourseName(), c.getMode(), c.getSchedule(), branch.getName(), c.getSource(), c.getComments(), c.getPreferredTime(), 
									c.getCourseId(), c.getBranchId(), c.getUserId(), model));
						}
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	leads = filtered;
		    } else {
		    	iTotalDisplayRecords = leads.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = leads.size();
		    
		    if(leads.size()< iDisplayStart + iDisplayLength)
		    	leads = leads.subList(iDisplayStart, leads.size());
		    else
		    	leads = leads.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
			
			List<AppPolyglotLeadModel> models = new ArrayList<AppPolyglotLeadModel> ();
			AppPolyglotLeadModel object = null;
			for (AppPolyglotLeadModel lead : leads) {
				object = new AppPolyglotLeadModel();
				if(null != lead){
					object.setId(lead.getId());
					object.setFirstName(lead.getFirstName());
					object.setLastName(lead.getLastName());
					//This check is for leads that are uploaded via Excel import
					object.setBranchName(lead.getBranchName());
					object.setCourse(lead.getCourse());
					object.setEmail(lead.getEmail());
					object.setMobile(lead.getMobile());
					object.setMode(lead.getMode());
					if (StringUtils.isEmpty(lead.getPreferredTime())) {
						//Need to set default time. 
						//This is for leads that are loaded via Excel import.
						object.setPreferredTime("12:30 PM-01:30 PM");
					}
					String[] timings = lead.getPreferredTime().split("-");
					if (timings != null && timings.length >=2) {
						object.setPreferredTimeStart(timings[0]);
						object.setPreferredTimeEnd(timings[1]);
					}
					
					object.setPreferredTime(lead.getPreferredTime());
					object.setSchedule(lead.getSchedule());
					object.setSource(lead.getSource());
					object.setComments(lead.getComments());
					object.setUserId(lead.getUserId());
					object.setBranchId(lead.getBranchId());
					object.setCourseId(lead.getCourseId());
				}
				
				models.add(object);
			}
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.accumulate("sEcho", sEcho);
			jsonObj.accumulate("iTotalRecords", iTotalRecords);
			jsonObj.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			jsonObj.accumulate("aaData", array);
			logger.debug("End of ShowLeads data");
			return jsonObj;
		} catch (Exception ex) {
			logger.debug("Caught exception while loading branch data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * 
	 * @param name
	 * @param mobile
	 * @param emailId
	 * @param courseName
	 * @param mode
	 * @param model
	 * @return
	 */
	public AppPolyglotLeadModel prepareLeadsModel(Integer id, String fName, String lName, String mobile, 
			String emailId, String courseName, String mode, String schedule, String branchName, String source, String comments,  String time, 
			Integer courseId, Integer branchId, Integer userId, AppPolyglotLeadModel model){
		model.setId(id);
		model.setCourse(courseName);
		model.setFirstName(fName);
		model.setLastName(lName);
		model.setMobile(mobile);
		model.setEmail(emailId);
		model.setMode(mode);
		model.setSchedule(schedule);
		model.setBranchName(branchName);
		model.setSource(source);
		model.setComments(comments);
		model.setPreferredTime(time);
		model.setCourseId(courseId);
		model.setBranchId(branchId);
		model.setUserId(userId);
		return model;
	}
	
	/**
	 * Method to save the leads who have been sent
	 * emails for demos.
	 * @param leadIds
	 * @param demoId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "addToExistingDemo", method = RequestMethod.POST)
	public @ResponseBody JSONObject addToExistingDemo(@RequestParam(value = "leadIds[]") Integer[] leadIds,
			@RequestParam("demoId") Integer demoId,
			HttpServletRequest request) {
		JSONObject object = new JSONObject();
		logger.debug("Adding selected students to demo with Id : " + demoId);
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppUsers extUser = new AppUsers();
		AppPolyglotDemo demo = demoService.load(demoId);
		String courseName = "";
		if(null != demo){
			AppPolyglotCourse course = appCourseService.load(demo.getCourseId());
			if(null != course){
				DmnCourse dmnCourse = courseService.load(course.getDmnCourseId());
				if(null != dmnCourse){
					courseName = dmnCourse.getCourseName();
				}
			}
		}
		AppPolyglotLeadDemoStatus status = null;
		for (Integer id : leadIds) {
			status = new AppPolyglotLeadDemoStatus();
			AppPolyglotLead lead = leadService.load(id);
			extUser = registrationService.load(lead.getUserId());
			status.setPartnerId(loggedInUser.getId());
			status.setDemoId(demoId);
			status.setEmailId(extUser.getEmailId());
			status.setInviteStatus(PolyglotConstants.APP_POLYGLOT_LEAD_DEMO_STATUS_INVITED);
			status.setLeadId(id);
			status.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			status.setLastInsrtUpdUsrId(loggedInUser.getId());
			status.setFirstName(extUser.getFname());
			status.setLastName(extUser.getLname());

			demoStatusService.save(status);
			
			emailService.sendMailForDemo(lead, demo, extUser.getId(), extUser.getEmailId(), courseName, request);
			
		}
		return object;
	}
	
	/**
	 * Method to create a new batch from leads.
	 * This will start and publish a new batch
	 * @param leadIds
	 * @param courseName
	 * @param branchName
	 * @param facultyId
	 * @param mode
	 * @param discount
	 * @param status
	 * @param schedule
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "createBatchFromLeads", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject createBatchFromLeads(@RequestParam(value = "leadIds[]") Integer [] leadIds,  @RequestParam("courseId") Integer courseId,
			@RequestParam("courseName") String courseName,
			@RequestParam("branchId") Integer branchId,
			@RequestParam("facultyId") Integer facultyId,
			@RequestParam("mode") String mode,
			@RequestParam("fee") String fee,
			@RequestParam("discount") Integer discount,
			@RequestParam("status") String status,
			@RequestParam("dateTime") String dateTime,
			@RequestParam("schedule") String schedule,
			@RequestParam("batchName") String batchName,
			@RequestParam("duration") Integer duration,
			@RequestParam("durationType") String durationType,
			HttpServletRequest request) {
		logger.debug("Inside createBatchFromLeads");
		JSONObject returnObj = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		AppPolyglotLead lead = null;
		
		//Create Batch
		AppPolyglotBatch batch = null;
		try {
			logger.debug("facultyId is:"+facultyId);
			Map<String, String> params = new HashMap<String, String>();
			String sql = "from AppPolyglotFaculty l where l.facultyId =:facultyId";
			
			params.put("facultyId", String.valueOf(facultyId));
			List<AppPolyglotFaculty> lstOfFaculty = appFacultyService.runQuery(sql, params);
			logger.debug("faculty service object is::"+lstOfFaculty);
			batch = new AppPolyglotBatch();
			if(!PolyglotFileUtils.isEmpty(lstOfFaculty)){
				batch.setAppPolyglotFaculty(appFacultyService.load(lstOfFaculty.get(0).getId()));
			}
			batch.setBranchId(branchId);
			//batch.setFacultyName();
			batch.setCourseId(courseId);
			batch.setFeeDiscount(discount);
			batch.setMode(mode);
			batch.setSchedule(schedule);
			//batch.setPlyBatchNo(PolyglotConstants.PLY_BATCH_NUMBER + faculty.getId());
			batch.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			batch.setLastInsrtUpdUsrId(loggedInUser.getId());
			batch.setAppUsers(loggedInUser);
			batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_PROPOSED);
			batch.setStartDate(dateTime);
			batch.setBatchName(batchName);
			batch.setSchedule(schedule);
			batch.setFee(Double.valueOf(fee));
			batch.setDuration(duration);
			batch.setDurationType(durationType);
			//batch.setBatchName(courseName + "-" + branchName + "-" + currentDate);
			
			batchService.save(batch);
		} catch (Exception ex) {
			logger.error("exception while saving batch data:", ex);
		}
		logger.debug("saved data into batch table");
		//Update batch List for the user.
		Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
		
		batches.add(batch);
		for (AppPolyglotBatch b : batches) {
			if (batch.getBatchId() == b.getBatchId()) {
				loggedInUser.getAppPolyglotBatches().remove(b);
				break;
			}
		}
		batches.add(batch);
		loggedInUser.setAppPolyglotBatches(batches);
		
		AppUsers extUsers = new AppUsers();
		try {
			//Update leads
			for (Integer leadId : leadIds) {
				//Write code to send email for the lead
				//Write code to send SMS for the lead
				//Write code to create a batch with the lead
				lead = leadService.load(new Integer(leadId));
				lead.setBatchId(String.valueOf(batch.getBatchId()));
				
				leadService.save(lead);
				/**get the email based on lead id*/
				extUsers = registrationService.load(lead.getUserId());
				
				emailService.sendMailForLead(lead, batch, extUsers.getEmailId(),courseName, request);
			}
		} catch (Exception ex) {
			logger.error("exception while updating leads and sending email"+ex, ex);
		}	
		logger.debug("Exit createBatchFromLeads");
		return returnObj;
	}
	
	/**
	 * Return a list of demos
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getDemoList", method = RequestMethod.GET)
	public @ResponseBody Map<Integer, String> getAllDemoList(HttpServletRequest request) {
		logger.debug("Entry of getDemoList");
		Map<Integer, String> demoList = new HashMap<Integer, String>();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
		Date today = new Date(Calendar.getInstance().getTimeInMillis());

		List<AppPolyglotDemo> validDemos = new ArrayList<AppPolyglotDemo>();
		validDemos = loggedInUser.getAppPolyglotDemos().stream().filter(p -> {
			try {
				logger.debug(sdf.parse(p.getDateTime()).after(today));
				
				return ((p.getDemoStatus().equalsIgnoreCase(PolyglotConstants.DEMO_STATUS_SCHEDULED)
						|| p.getDemoStatus().equalsIgnoreCase(PolyglotConstants.DEMO_STATUS_RESCHEDULED))
						&& sdf.parse(p.getDateTime()).after(today));
			} catch (ParseException e) {
				logger.error("Parse exception while getting demo list:", e);
				return false;
			}
		}).collect(Collectors.toList());

		AppPolyglotBranch branch = null;
		AppPolyglotFaculty faculty = null;
		AppUsers extUser = new AppUsers();
		for (AppPolyglotDemo demo : validDemos) {
			branch = new AppPolyglotBranch();
			faculty = new AppPolyglotFaculty();
			branch = branchService.load(demo.getBranchId());
			faculty = appFacultyService.load(demo.getFacultyId());
			if(null != faculty){
				extUser = registrationService.load(faculty.getFacultyId());
			}
			demoList.put(demo.getId(), branch.getName() + "-" +extUser.getFname()+" "+extUser.getLname() + "-" + demo.getDateTime());
		}
		logger.debug("demoList is:"+demoList);
		logger.debug("Exit of getDemoList");
		return demoList;
	}
	
	/**
	 * Add leads to existing batch
	 * @param leads
	 * @param batchId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "addToExistingBatch", method = RequestMethod.POST)
	public @ResponseBody JSONObject addToExistingBatch(@RequestParam(value = "leadIds[]") Integer[] leads, 
			@RequestParam("batchId") Integer batchId,
			HttpServletRequest request) {
		logger.debug("Adding leads to existing batch");
		JSONObject returnObj = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		AppPolyglotBatch batch = batchService.load(batchId);
		AppUsers extUsers = new AppUsers();
		AppPolyglotCourse course = appCourseService.load(batch.getCourseId());
		String courseName = "";
		if(null != course){
			DmnCourse dmnCourse = courseService.load(course.getDmnCourseId());
			courseName = dmnCourse.getCourseName();
		}
		
		for (Integer leadId : leads) {
			AppPolyglotLead lead = leadService.load(leadId);
			lead.setBatchId(String.valueOf(batch.getBatchId()));
			
			lead.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTime().getTime()));
			lead.setLastInsrtUpdUsrId(loggedInUser.getId());
			
			leadService.save(lead);
			/**get the email based on lead id*/
			extUsers = registrationService.load(lead.getUserId());
			
			emailService.sendMailForLead(lead, batch, extUsers.getEmailId(), courseName, request);
		}
		
		return returnObj;
		
	}
	
	/**
	 * This is a helper method to get required details for forming a batch.
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "getDetailsForBatchFormation", method = RequestMethod.GET)
	public @ResponseBody JSONArray getDetailsForBatchFormation(HttpSession session) {
		logger.debug("Getting details to form a batch");
		JSONArray array = new JSONArray();
		
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		//Courses
		JsonConfig config = new JsonConfig();
		
		try {
			 Map<String, String> params = new HashMap<String, String>();
			 params.put("partnerId", String.valueOf(loggedInUser.getId()));
			 String sql = "from AppPolyglotBatch b where  upper(b.batchStatus) in ('PROPOSED', 'SCHEDULED','IN PROGRESS') and b.appUsers =:partnerId";
			    
			List<AppPolyglotBatch> validBatches = batchService.runQuery(sql, params);
			logger.debug("valid batches:"+validBatches);
			config.setIgnoreDefaultExcludes(false);
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			config.setExcludes(new String[] { "appUsers", "appPolyglotFaculty", "lastInsrtUpdTs", "plyBatchNo", "branchId"
					, "endDate", "fee", "lastInsrtUpdUsrId", "durationType", "duration", "courseId","courseName", "facultyName"
					,"schedule", "mode", "branchName", "feeDiscount", "batchStatus", "startDate", "appPolyglotFaculty"});
			array = JSONArray.fromObject(validBatches, config);
		} catch (Exception ex) {
			logger.error("exception while preparing the data:"+ex, ex);
		}
		logger.debug("return array is:"+array);
		return array;
	}
	
	/**
	 * Method to drop student from course and set status back to Invited.
	 * @param student
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "dropStudent", method = RequestMethod.POST)
	public @ResponseBody JSONObject dropStudentFromCourse(@RequestParam(value = "leadIds[]") Integer[] leadIds, HttpServletRequest request) {
		logger.debug("Inside dropStudent");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		JSONObject object = new JSONObject();
		try{
			for(Integer id: leadIds){
				logger.debug("lead student id is:"+id);
				AppPolyglotLead leadObj = leadService.load(id);
				if(null != leadObj){
					leadObj.setLeadStatus(PolyglotConstants.DROPPED);
					leadObj.setLastInsrtUpdUsrId(loggedInUser.getId());
					leadObj.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance()
							.getTimeInMillis()));
				}
				leadService.save(leadObj);
			}
			logger.debug("lead student updated with lead status as dropped");
		}catch(Exception ex){
			logger.error("exception while dropping the lead student"+ex, ex);
		}
		
		logger.debug("Exit dropStudent");
		return object;
	}
	
	/**
	 * Method to assign multiple tasks to multiple students from the UI.
	 * @param studentIds
	 * @param taskIds
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "saveStudentTask", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveStudentTask(HttpServletRequest request, HttpSession session) {
		logger.debug("Inside saveStudentTask");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		String leadObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		List<AppStudentTask> lstOfStudents = new ArrayList<AppStudentTask>();
		
		Map<String, String> params = new HashMap<String, String>();
		List<AppStudentTask> lstOfTask = new ArrayList<AppStudentTask>();
		AppStudentTask studentTask = new AppStudentTask();
		
		try {
			lstOfStudents = mapper.readValue(StringEscapeUtils.unescapeHtml(leadObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppStudentTask.class));
			logger.debug("list of student objects:"+lstOfStudents);
			
			if(!PolyglotFileUtils.isEmpty(lstOfStudents)){
				for (AppStudentTask student : lstOfStudents) {
					String sql = "from AppStudentTask t where t.studentId =:studentId and t.taskId =:taskId";
					params.put("studentId", String.valueOf(student.getId()));
					params.put("taskId", String.valueOf(student.getTaskId()));
					logger.debug("param map is:"+params);
					lstOfTask = studentTaskService.runQuery(sql, params);
					if(null != lstOfTask && lstOfTask.size()>0){
						studentTask = lstOfTask.get(0);
					}
					studentTask.setStudentId(student.getId());//lead id
					studentTask.setTaskId(student.getTaskId());
					studentTask.setUserId(student.getUserId());
					studentTask.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					studentTask.setLastInsrtUpdUsrId(loggedInUser.getId());
					studentTask.setTaskStatus(PolyglotConstants.TASK_STATUS_ASSIGNED);
					studentTask.setAssignedDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					studentTaskService.save(studentTask);
				}
			}
		} catch (Exception ex) {
			logger.error("error while saving the student task"+ex, ex);
		}
		JSONObject object = new JSONObject();
		logger.debug("Exit saveStudentTask");
		return object;
	}
	
	/**
	 * Method to assign multiple tasks to multiple students from the UI.
	 * @param studentIds
	 * @param taskIds
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "saveStudentQuiz", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveStudentQuiz(HttpServletRequest request, HttpSession session) {
		logger.debug("Inside saveStudentQuiz");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		String leadObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		List<AppStudentQuiz> lstOfStudentQuizes = new ArrayList<AppStudentQuiz>();
		
		Map<String, String> params = new HashMap<String, String>();
		List<AppStudentQuiz> lstOfQuiz = new ArrayList<AppStudentQuiz>();
		AppStudentQuiz studentQuiz = new AppStudentQuiz();
		try {
			lstOfStudentQuizes = mapper.readValue(StringEscapeUtils.unescapeHtml(leadObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppStudentQuiz.class));
			logger.debug("list of student objects:"+lstOfStudentQuizes);
			if(!PolyglotFileUtils.isEmpty(lstOfStudentQuizes)){
				for (AppStudentQuiz studentId : lstOfStudentQuizes) {
					
					String sql = "from AppStudentQuiz q where q.studentId =:studentId and q.taskId =:taskId";
					params.put("studentId", String.valueOf(studentId.getId()));
					params.put("taskId", String.valueOf(studentId.getTaskId()));
					logger.debug("param map is:"+params);
					lstOfQuiz = studentQuizService.runQuery(sql, params);
					if(null != lstOfQuiz && lstOfQuiz.size()>0){
						studentQuiz = lstOfQuiz.get(0);
					}
					studentQuiz.setStudentId(studentId.getId());
					studentQuiz.setTaskId(studentId.getTaskId());
					studentQuiz.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					studentQuiz.setLastInsrtUpdUsrId(loggedInUser.getId());
					studentQuiz.setAssignedDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
					studentQuiz.setStatus(PolyglotConstants.TASK_STATUS_ASSIGNED);
					studentQuiz.setUserId(studentId.getUserId());
					studentQuizService.save(studentQuiz);
				}
			}
		} catch (Exception ex) {
			logger.error("error while saving the student quiz"+ex, ex);
		}
		JSONObject object = new JSONObject();
		logger.debug("Exit saveStudentTask");
		return object;
	}
	
	/**
	 * Return a list of tasks
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getTasksList", method = RequestMethod.GET)
	public @ResponseBody Map<Integer, String> getTasksList(HttpServletRequest request) {
		logger.debug("Inside getTasksList");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		Map<String, String> params = new HashMap<String, String>();
		List<AppPolyglotTask> taskList = new ArrayList<AppPolyglotTask>();
		Map<Integer, String> taskMap = new HashMap<Integer, String>();
		try {
			if(null != loggedInUser){
				String sql = "from AppPolyglotTask t where t.appUsers =:appUsers";
				params.put("appUsers", String.valueOf(loggedInUser.getId()));
				logger.debug("param map is:"+params);
				taskList = taskService.runQuery(sql, params);
			}
			logger.debug("task list is:"+taskList);
			if(!PolyglotFileUtils.isEmpty(taskList)){
				for(AppPolyglotTask task : taskList){
					if(null != task){
						taskMap.put(task.getId(), task.getTaskName());
					}
				}
			}			
		} catch (Exception ex) {
			logger.error("Exception while reading the tasks:"+ex, ex);
		}
		logger.debug("taskmap is:"+taskMap);
		logger.debug("Exit getTasksList");
		return taskMap;
	}
	
	/**
	 * Return a list of tasks
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getStudentQuizList", method = RequestMethod.GET)
	public @ResponseBody Map<Integer, String> getStudentQuizList(HttpServletRequest request) {
		logger.debug("Inside getQuizList");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		Map<String, String> params = new HashMap<String, String>();
		List<AppPolyglotQuiz> quizList = new ArrayList<AppPolyglotQuiz>();
		Map<Integer, String> quizMap = new HashMap<Integer, String>();
		try {
			if(null != loggedInUser){
				String sql = "from AppPolyglotQuiz q where q.appUsers =:appUsers";
				params.put("appUsers", String.valueOf(loggedInUser.getId()));
				logger.debug("param map is:"+params);
				quizList = appQuizService.runQuery(sql, params);
			}
			logger.debug("quiz list is:"+quizList);
			if(!PolyglotFileUtils.isEmpty(quizList)){
				for(AppPolyglotQuiz quiz : quizList){
					if(null != quiz){
						quizMap.put(quiz.getId(), quiz.getQuizName());
					}
				}
			}			
		} catch (Exception ex) {
			logger.error("Exception while reading the quiz:"+ex, ex);
		}
		logger.debug("taskmap is:"+quizMap);
		logger.debug("Exit getQuizList");
		return quizMap;
	}
	
	/**
	 * Call back method from the email link
	 * To enrol a student in a batch
	 * @param batchId
	 * @param leadId
	 * @param partnerId
	 */
	@RequestMapping(value = "registerForBatch", method = RequestMethod.GET)
	public ModelAndView registerForBatch(Integer batchId, Integer leadId, Integer partnerId) {
		logger.debug("inside registerForCourse");
		
		AppPolyglotLead lead = leadService.load(leadId);
		lead.setLeadStatus(PolyglotConstants.REGISTERED);
		
		leadService.save(lead);
		ModelAndView view = new ModelAndView();
		
		view.setViewName("/static/index.jsp");
		return view;
	}
	
	/**
	 * Call back method from the email link
	 * To enrol a student in a demo
	 * @param batchId
	 * @param leadId
	 * @param partnerId
	 */
	@RequestMapping(value = "registerForDemo", method = RequestMethod.GET)
	public ModelAndView registerForDemo(Integer demoId, Integer leadId, Integer partnerId) {
		logger.debug("inside registerForCourse");
		
		AppPolyglotLeadDemoStatus demoSts = demoStatusService.load(demoId);
		
		demoSts.setInviteStatus(PolyglotConstants.REGISTERED);
		demoStatusService.save(demoSts);
		ModelAndView view = new ModelAndView();
		
		view.setViewName("/static/index.jsp");
		return view;
	}
	
	@RequestMapping(value = "sendCourseContent", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject sendCourseContent(HttpServletRequest request , @RequestParam("id") Integer id, HttpSession session) {

		logger.debug("Inside sendCourseContent");
		List<AppPolyglotLeadModel> lstOfLeads = new ArrayList<AppPolyglotLeadModel>();
		
		String leadObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		JSONObject jsonObj = new JSONObject();
			
		try {
			lstOfLeads = mapper.readValue(StringEscapeUtils.unescapeHtml(leadObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppPolyglotLeadModel.class));
			logger.debug("list of lead objects:"+lstOfLeads);
			AppPolyglotCourse courseObj = null;
			for(AppPolyglotLeadModel model : lstOfLeads){
				courseObj = new AppPolyglotCourse();
				courseObj = appCourseService.load(model.getCourseId());
				if(null != courseObj && !PolyglotFileUtils.isEmpty(courseObj.getCourseContent())){
					emailService.sendEmailContent(courseObj.getCourseContent(), model.getEmail(),"Course");
					jsonObj.accumulate("status", "SUCCESS");
				}else{
					jsonObj.accumulate("status", "Failure");
				}
			}
		} catch (JsonParseException jpe) {
			logger.error("Caught exception while parsing the json data : " + jpe, jpe);
			jsonObj.accumulate("status", "Failure");
		} catch (JsonMappingException jme) {
			logger.error("Caught exception while mapping json data: " + jme, jme);
			jsonObj.accumulate("status", "Failure");
		} catch (Exception ex) {
			logger.error("Caught exception while invite data: " + ex, ex);
			jsonObj.accumulate("status", "Failure");
		}
		logger.debug("Exit sendCourseContent");
		return jsonObj;
	}
	
	@RequestMapping(value = "sendAnEmailForLeads", method = RequestMethod.POST)
	public @ResponseBody JSONObject sendAnEmailForLeads(@RequestParam(value = "emailIds[]") String [] emailIds,
			String comments, HttpSession session) {
		logger.debug("Inside sendAnEmailForLeads");
		try {
			for (String email : emailIds) {
				emailService.sendEmailContent(comments, email, "Comments");
			}
		} catch (Exception ex) {
			logger.error("error while saving the sendAnEmailForLeads:"+ex, ex);
		}
		JSONObject object = new JSONObject();
		logger.debug("Exit sendAnEmailForLeads");
		return object;
	}
	
	@RequestMapping(value = "sendVideoContent", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject sendVideoContent(HttpServletRequest request , @RequestParam("id") Integer id, HttpSession session) {

		logger.debug("Inside sendVideoContent");
		List<AppPolyglotLeadModel> lstOfLeads = new ArrayList<AppPolyglotLeadModel>();
		
		String leadObj = request.getParameter("data");
		ObjectMapper mapper = new ObjectMapper();
		JSONObject jsonObj = new JSONObject();
			
		try {
			lstOfLeads = mapper.readValue(StringEscapeUtils.unescapeHtml(leadObj), 
					TypeFactory.defaultInstance().constructCollectionType(List.class, AppPolyglotLeadModel.class));
			logger.debug("list of lead objects:"+lstOfLeads);
			AppPolyglotCourse courseObj = null;
			for(AppPolyglotLeadModel model : lstOfLeads){
				courseObj = new AppPolyglotCourse();
				courseObj = appCourseService.load(model.getCourseId());
				if(null != courseObj && !PolyglotFileUtils.isEmpty(courseObj.getVideoContent())){
					emailService.sendEmailContent(courseObj.getVideoContent(), model.getEmail(),"Video");
					jsonObj.accumulate("status", "SUCCESS");
				}else{
					jsonObj.accumulate("status", "Failure");
				}
			}
		} catch (JsonParseException jpe) {
			logger.error("Caught exception while parsing the json data : " + jpe, jpe);
			jsonObj.accumulate("status", "Failure");
		} catch (JsonMappingException jme) {
			logger.error("Caught exception while mapping json data: " + jme, jme);
			jsonObj.accumulate("status", "Failure");
		} catch (Exception ex) {
			logger.error("Caught exception while invite data: " + ex, ex);
			jsonObj.accumulate("status", "Failure");
		}
		logger.debug("Exit sendVideoContent");
		return jsonObj;
	}
	
	@RequestMapping(value = "showStudentQuizzes", method = RequestMethod.GET)
	public @ResponseBody JSONObject showStudentQuizzes(HttpServletRequest request, HttpSession session) {
		logger.debug("Inside showStudentQuizzes");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("user id is:"+loggedInUser.getId());
		Map<String, String> params = new HashMap<String, String>();
		List<AppPolyglotStudentQuizModel> filtered = new LinkedList<AppPolyglotStudentQuizModel>();
		List<AppPolyglotStudentQuizModel> events = new LinkedList<AppPolyglotStudentQuizModel>();
		final List<AppPolyglotStudentQuizModel> finalEvents = new LinkedList<AppPolyglotStudentQuizModel>();
		AppPolyglotStudentQuizModel quizModel = null;
		     
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		   
		    String sql = "from AppStudentQuiz t where t.userId =:userId";
			params.put("userId", String.valueOf(loggedInUser.getId()));
			logger.debug("param map is:"+params);
		    
			List<AppStudentQuiz> lstOfQuiz = studentQuizService.runQuery(sql, params);
			logger.debug("lstOfQuiz is:"+lstOfQuiz);
		    AppPolyglotQuiz quiz = null;
		    AppUsers extUser = new AppUsers();
		    if (sSearch != null && !PolyglotFileUtils.isEmpty(lstOfQuiz)) {
		    	lstOfQuiz.sort(Comparator.comparing(AppStudentQuiz::getLastInsrtUpdTs).reversed());
				for (AppStudentQuiz c : lstOfQuiz) {
					quizModel = new AppPolyglotStudentQuizModel();
					quiz = new AppPolyglotQuiz();
					if(null != c){
						/**based on task id get the partner id*/
						if(null != c.getTaskId()){
							quiz = appQuizService.load(c.getTaskId());
							if(null != quiz){
								extUser = registrationService.load(quiz.getAppUsers().getId());
								quizModel.setAssignedBy(null != extUser?extUser.getFname()+" "+extUser.getLname():"");
								quizModel.setCourseName(quiz.getQuizName());
							}
						}
						quizModel.setAssignedDate(PolyglotFileUtils.convertTimeStampToString(c.getAssignedDate(), "yyyy-MM-dd hh:mm:ss"));
						
						quizModel.setResult(c.getResult());
						quizModel.setScore(null != c.getScore()?Integer.parseInt(c.getScore()):0);
						quizModel.setStartDate(PolyglotFileUtils.convertTimeStampToString(c.getStartDate(), "yyyy-MM-dd hh:mm:ss"));
						quizModel.setEndDate(PolyglotFileUtils.convertTimeStampToString(c.getEndDate(), "yyyy-MM-dd hh:mm:ss"));
						quizModel.setStatus(c.getStatus());
						quizModel.setQuizIdentifier(quiz.getQuizIdentifier());
						finalEvents.add(quizModel);
					}
				}
		    }
		    events = finalEvents;
		    iTotalRecords = events.size();
		    if (sSearch != null) {
		    	for (AppPolyglotStudentQuizModel c : finalEvents) {
		    		if (null != c && null != c.getAssignedBy() && c.getAssignedBy().toLowerCase().contains(sSearch.toLowerCase()) ||
		    			null != c && null != c.getCourseName() && c.getCourseName().toLowerCase().contains(sSearch.toLowerCase())||
		    			null != c && null != c.getStatus() && c.getStatus().toLowerCase().contains(sSearch.toLowerCase()) ||
		    			null != c && null != c.getResult() && c.getResult().toLowerCase().contains(sSearch.toLowerCase())) {
		    					filtered.add(c); // Add a company that matches search criterion
		    		}
		    	}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	events = filtered;
		    	
		    } else {
		    	iTotalDisplayRecords = events.size();
		    }
		    
		    //Number of branches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = events.size();
		    
		    if(events.size()< iDisplayStart + iDisplayLength)
		    	events = events.subList(iDisplayStart, events.size());
		    else
		    	events = events.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(events, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading student task data : " + ex, ex);
		}
		return null;
	}
	
	@RequestMapping(path = "/ShowSourceSuggestion", method = RequestMethod.GET)
	public @ResponseBody JSONObject ShowSourceSuggestion(HttpServletRequest request, HttpSession session) {
		logger.debug("Entry of ShowSourceSuggestion");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject obj = new JSONObject();
		List<AppPolyglotLead> lstOfLeads = new ArrayList<AppPolyglotLead>();
		Set<String> sourceLst = new HashSet<String>();
		try {
			Map<String, String> params = new HashMap<String, String>();
			String sql = "from AppPolyglotLead l where l.partnerId =:partnerId";
			params.put("partnerId", String.valueOf(loggedInUser.getId()));
			lstOfLeads = leadService.runQuery(sql, params);
			if(!PolyglotFileUtils.isEmpty(lstOfLeads)){
				for(AppPolyglotLead lead : lstOfLeads){
					if(null != lead && !PolyglotFileUtils.isEmpty(lead.getSource())){
						sourceLst.add(lead.getSource().trim());
					}					
				}
			}
		} catch (Exception ex) {
			logger.error("Error while reading the source list from leads:"+ex,ex);
		}
		logger.debug("unique sourceLst is:"+sourceLst);
		obj.accumulate("sourceObj", sourceLst);
		logger.debug("Exit of ShowSourceSuggestion");
		return obj;
	}
	
	/**
	 * Method for Cancelling a demo
	 * @param ids
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateLeadData", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateLeadData(@RequestParam(value = "ids[]") Integer[] ids, @RequestParam("status") String status,
			HttpServletRequest request) {
		JSONObject object = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		logger.debug("Inside updateLeadData");		
				
		for (Integer id : ids) {
			AppPolyglotLead lead = leadService.load(id);
			
			if("invalid".equalsIgnoreCase(status)){
				lead.setLeadStatus(PolyglotConstants.LEAD_STATUS_INVALID);
			}
			lead.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			lead.setLastInsrtUpdUsrId(loggedInUser.getId());
			leadService.save(lead);
		}
		logger.debug("Exit of updateLeadData");
		return object;
	}
}
