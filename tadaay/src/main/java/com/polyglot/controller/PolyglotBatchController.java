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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.DmnCourse;
import com.polyglot.model.AppPolyglotBatchModel;
import com.polyglot.model.AppPolyglotLeadModel;
import com.polyglot.service.AppPolyglotBatchService;
import com.polyglot.service.AppPolyglotBranchService;
import com.polyglot.service.AppPolyglotCourseService;
import com.polyglot.service.AppPolyglotFacultyService;
import com.polyglot.service.AppPolyglotLeadDemoStatusService;
import com.polyglot.service.AppPolyglotLeadService;
import com.polyglot.service.AppPolyglotRegistrationService;
import com.polyglot.service.DmnCourseService;
import com.polyglot.utils.PolyglotConstants;
import com.polyglot.utils.PolyglotFileUtils;

@Controller
public class PolyglotBatchController {
	
	private static final Logger logger = Logger.getLogger(PolyglotBatchController.class);
	
	@Autowired
	private AppPolyglotBatchService batchService;
	
	@Autowired
	private AppPolyglotFacultyService appFacultyService;

	@Autowired
	private AppPolyglotCourseService appCourseService;
	
	@Autowired
	private DmnCourseService courseService;

	@Autowired
	private AppPolyglotBranchService branchService;
	
	@Autowired
	private AppPolyglotRegistrationService  registrationService;
	
	@Autowired
	private AppPolyglotLeadService leadService;
	
	@Autowired
	private AppPolyglotLeadDemoStatusService demoStatusService;
	
	@RequestMapping(value = "saveUpdateBatchData" , method = RequestMethod.POST)
	public @ResponseBody JSONObject saveUpdateBatchData(@RequestBody final AppPolyglotBatchModel model, HttpSession session) {
		logger.debug("Inside saveUpdateBatchData****");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		AppPolyglotBatch batch = new AppPolyglotBatch();
		logger.debug("batch modal data is:"+model);
		try {
			if (model.getId() != null) {
				batch = batchService.load(model.getId());
			}
			
			batch.setBatchName(model.getBatchName());
			batch.setFacultyName(model.getFacultyName());
			batch.setBatchId(model.getId());
			batch.setBranchName(model.getBranchName());
			batch.setCourseName(model.getCourseName());
			batch.setMode(model.getMode());
			batch.setBatchStatus(model.getBatchStatus());
			batch.setFeeDiscount(new Integer(model.getFeeDiscount()));
			batch.setBatchStatus(model.getBatchStatus());
			batch.setStartDate(model.getStartDate());
			batch.setBranchId(model.getBranchId());
			batch.setCourseId(model.getCourseId());
			batch.setDuration(model.getDuration());
			batch.setDurationType(model.getDurationType());
			/**get domain course id based on course table id*/
			AppPolyglotCourse course = appCourseService.load(model.getCourseId());
			logger.debug("domain course id is:"+course.getDmnCourseId());
			
			Map<String, String> params = new HashMap<String, String>();
			String sql = "from AppPolyglotFaculty l where l.facultyId =:facultyId and l.courseId =:courseId";
			
			params.put("facultyId", String.valueOf(model.getFacultyId()));
			params.put("courseId", String.valueOf(course.getDmnCourseId()));
			List<AppPolyglotFaculty> lstOfFaculty = appFacultyService.runQuery(sql, params);
			logger.debug("faculty service object is::"+lstOfFaculty);
			if(!PolyglotFileUtils.isEmpty(lstOfFaculty)){
				batch.setAppPolyglotFaculty(appFacultyService.load(lstOfFaculty.get(0).getId()));
			}
			batch.setSchedule(model.getSchedule());
			batch.setFee(model.getFee());
			batch.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));			
			batch.setLastInsrtUpdUsrId(loggedInUser.getId());
			batch.setAppUsers(loggedInUser);
			batch.setIsArchive(PolyglotConstants.N_STR);
			batch.setClassTime(model.getClassTime());

			batchService.save(batch);
			Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
			
			for (AppPolyglotBatch item : batches) {
				if (batch.getBatchId().equals(item.getBatchId())) {
					batches.remove(item);
					break;
				}
			}
			batches.add(batch);
			loggedInUser.setAppPolyglotBatches(batches);
		} catch (Exception ex) {
			logger.error("exception while saving the batch data:", ex);
		}
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "appUsers" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		JSONObject jsonObj = new JSONObject();
		logger.debug("Exit saveUpdateBatch data");
		return jsonObj;
	}
	
	/**
	 * This method cancels a batch and notifies its users.
	 * @param ids
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateBatchData", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateBatchData(@RequestParam(value = "ids[]") Integer[] ids,  @RequestParam(value = "status") String status,
			HttpServletRequest request) {
		JSONObject object = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		logger.debug("updateBatchData");
		
		Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
		
		try {
			for (Integer id : ids) {
				AppPolyglotBatch batch = batchService.load(id);
				
				if("cancel".equalsIgnoreCase(status)){
					batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_CANCELLED);
				}else if("inprogress".equalsIgnoreCase(status)){
					batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_IN_PROGRESS);
				}else if("complete".equalsIgnoreCase(status)){
					batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_COMPLETED);
				}else if("archive".equalsIgnoreCase(status)){
					batch.setIsArchive("Y");
				}
				batch.setEndDate(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				batch.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				batch.setLastInsrtUpdUsrId(loggedInUser.getId());
				batchService.save(batch);

				
				//Send email to the lead about the demo cancellation.
				//TODO : write code to update set with the modified demo object.
				for (AppPolyglotBatch d : batches) {
					if (d.getBatchId() == batch.getBatchId()) {
						batch.setCourseName(d.getCourseName());
						batch.setFacultyName(d.getFacultyName());
						batch.setBranchName(d.getBranchName());
						batches.remove(d);
						break;
					}
				}
				batches.add(batch);

			}
			loggedInUser.setAppPolyglotBatches(batches);
		} catch (Exception ex) {
			logger.error("Exit updateBatchesData", ex);
		}
		logger.debug("exit cancelBatch");
		return object;
	}
	
	@RequestMapping(value = "showBatches", method = RequestMethod.GET)
	public @ResponseBody JSONObject showBatches(HttpServletRequest request) {
		logger.debug("Inside show batches.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    List<AppPolyglotBatch> list = new LinkedList<AppPolyglotBatch>();
		    if(null != loggedInUser && null != loggedInUser.getAppPolyglotBatches()){
		    	list = loggedInUser.getAppPolyglotBatches().stream().
			    		filter(p -> !PolyglotConstants.Y_STR.equalsIgnoreCase(p.getIsArchive())).sorted(Comparator.comparing(AppPolyglotBatch::getStartDate).reversed()).collect(Collectors.toList());
		    }		    
		    
		    iTotalRecords = list.size();
		    List<AppPolyglotBatchModel> batches = new LinkedList<AppPolyglotBatchModel>();
		    List<AppPolyglotBatchModel> filtered = new LinkedList<AppPolyglotBatchModel>();
			AppPolyglotBranch branch = new AppPolyglotBranch();
			AppPolyglotCourse course = new AppPolyglotCourse();
			AppUsers exisitngUser = new AppUsers();
			AppPolyglotBatchModel batchModel = null;
		    if (sSearch != null) {
				for (AppPolyglotBatch c : list) {
					if(null != c){
						batchModel = new AppPolyglotBatchModel();
						logger.debug(":course id is:"+c.getCourseId()+":branch id is:"+c.getBranchId());
						/**get leads details based on app_user_id*/
						if(null != c.getAppPolyglotFaculty() && null != c.getAppPolyglotFaculty().getFacultyId()){
							logger.debug("facult id is:"+c.getAppPolyglotFaculty().getFacultyId());
							exisitngUser = registrationService.load(c.getAppPolyglotFaculty().getFacultyId());
						}
						
						/**get course name based on courseId*/
						course = appCourseService.load(c.getCourseId());
						DmnCourse dmnData = null != course ? courseService.load(course.getDmnCourseId()) : null;
						/**get branch name based on branchId*/
						branch = branchService.load(c.getBranchId());
						if (null != dmnData && null != dmnData.getCourseName() && dmnData.getCourseName().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getSchedule() && c.getSchedule().toUpperCase().contains(sSearch.toUpperCase())
								|| c.getMode().toUpperCase().contains(sSearch.toUpperCase())
								|| null != branch && null != branch.getName() && branch.getName().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getFname() && exisitngUser.getFname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != exisitngUser && null != exisitngUser.getLname() && exisitngUser.getLname().toUpperCase().contains(sSearch.toUpperCase())
								|| null != c.getBatchStatus() && c.getBatchStatus().toUpperCase().contains(sSearch.toUpperCase())) {
									filtered.add(prepareBatchesModel(c.getBatchId(), c.getBatchName(), branch.getName(), dmnData.getCourseName(),
											c.getFeeDiscount(), c.getFee(), c.getStartDate(),c.getBatchStatus(), c.getMode(), c.getSchedule(),
											exisitngUser.getFname(), exisitngUser.getLname(), c.getBranchId(), c.getCourseId(), c.getAppPolyglotFaculty().getFacultyId(),
											c.getDuration(), c.getDurationType(),c.getClassTime(), batchModel)); // Add a company that matches search criterion // Add a batch that matches search criterion
						} else {
							batches.add(prepareBatchesModel(c.getBatchId(), c.getBatchName(), branch.getName(), dmnData.getCourseName(),
									c.getFeeDiscount(), c.getFee(), c.getStartDate(),c.getBatchStatus(), c.getMode(), c.getSchedule(),
									exisitngUser.getFname(), exisitngUser.getLname(), c.getBranchId(), c.getCourseId(), c.getAppPolyglotFaculty().getFacultyId(),
									c.getDuration(), c.getDurationType(), c.getClassTime(), batchModel));
						}
					}
				}
		    }
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	batches = filtered;
		    } else {
		    	iTotalDisplayRecords = batches.size();
		    }
		    
		    //Number of batches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = batches.size();
		    
		    if(batches.size()< iDisplayStart + iDisplayLength)
		    	batches = batches.subList(iDisplayStart, batches.size());
		    else
		    	batches = batches.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    List<AppPolyglotBatchModel> models = new ArrayList<AppPolyglotBatchModel>();
		    AppPolyglotBatchModel model = null;
		    for (AppPolyglotBatchModel batch : batches) {
		    	model = new AppPolyglotBatchModel();
		    	
		    	model.setBatchName(batch.getBatchName());
		    	model.setId(batch.getId());
		    	model.setBranchName(batch.getBranchName());
		    	model.setCourseName(batch.getCourseName());
		    	model.setFeeDiscount(batch.getFeeDiscount());
		    	model.setStartDate(batch.getStartDate());
		    	model.setBatchStatus(batch.getBatchStatus());
		    	model.setMode(batch.getMode());
		    	model.setFacultyName(batch.getFacultyName());
		    	model.setPlyBatchNo(batch.getPlyBatchNo());
		    	model.setSchedule(batch.getSchedule());
		    	model.setFee(batch.getFee());
		    	model.setBranchId(batch.getBranchId());
		    	model.setCourseId(batch.getCourseId());
		    	model.setFacultyId(batch.getFacultyId());
		    	model.setDuration(batch.getDuration());
		    	model.setDurationType(batch.getDurationType());
		    	model.setClassTime(batch.getClassTime());
		    	models.add(model);
		    	
		    }
			
		    JsonConfig jsonConfig = new JsonConfig();
		    jsonConfig.setExcludes(new String[] { "appUsers" });
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
			logger.error("Caught exception while loading batches data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * Method to reschedule a batch
	 * @param ids
	 * @param batchRescheduleDate
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "rescheduleBatch", method = RequestMethod.POST)
	public @ResponseBody JSONObject rescheduleBatch(@RequestParam(value = "ids[]") Integer[] ids, 
			@RequestParam("batchRescheduleDate") String batchRescheduleDate,
			@RequestParam("batchStatus") String batchStatus,
			HttpServletRequest request) {
		logger.debug("Inside rescheduleBatch");
		JSONObject object = new JSONObject();
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		
		logger.debug("Rescheduling demo to a new date : " + batchRescheduleDate);

		Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
		
		try {
			for (Integer id : ids) {
				AppPolyglotBatch batch = batchService.load(id);
				
				
				batch.setStartDate(batchRescheduleDate);
				batch.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				batch.setLastInsrtUpdUsrId(loggedInUser.getId());
				if (! StringUtils.isEmpty(batchStatus) && batchStatus.equalsIgnoreCase(PolyglotConstants.BATCH_STATUS_SCHEDULED)) {
					batch.setBatchStatus(PolyglotConstants.BATCH_STATUS_SCHEDULED);
				}
					
				
				batchService.save(batch);
				
				//Send email to the lead about the demo cancellation.
				
				//TODO : write code to update set with the modified demo object.
				for (AppPolyglotBatch d : batches) {
					if (d.getBatchId() == batch.getBatchId()) {
						batch.setCourseName(d.getCourseName());
						batch.setFacultyName(d.getFacultyName());
						batch.setBranchName(d.getBranchName());
						batches.remove(d);
						break;
					}
				}
				batches.add(batch);

			}
			logger.debug("batch data is:"+batches);
			loggedInUser.setAppPolyglotBatches(batches);
		} catch (Exception ex) {
			logger.error("Exit rescheduleBatch", ex);
		}

		logger.debug("Exit rescheduleBatch");
		return object;
	}
	
	@RequestMapping(value = "getArchivedBatchesData", method = RequestMethod.GET)
	public @ResponseBody JSONArray getArchivedBatchesData(HttpServletRequest request) {
		logger.debug("Retrieving archived batches");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		List<AppPolyglotBatch> batches = new ArrayList<AppPolyglotBatch>();
		JsonConfig jsonConfig = new JsonConfig();
		List<AppPolyglotBatch> lstOfBatches = new ArrayList<AppPolyglotBatch>();
		try {
			Map<String, String> params = new HashMap<String, String>();
			params.put("partnerId", String.valueOf(loggedInUser.getId()));
			String sql = "from AppPolyglotBatch b where  upper(b.isArchive) in ('Y') and b.appUsers =:partnerId";
			   
			batches = batchService.runQuery(sql, params);
			/*batches = loggedInUser.getAppPolyglotBatches().stream().
					filter(p -> p.getBatchStatus().equalsIgnoreCase(PolyglotConstants.BATCH_STATUS_CANCELLED) || 
							p.getBatchStatus().equalsIgnoreCase(PolyglotConstants.BATCH_STATUS_COMPLETED)).collect(Collectors.toList());*/
			logger.debug("archieved batch list is:"+batches);
			AppPolyglotBatch batchData = null;
			for(AppPolyglotBatch batch : batches){
				batchData = new AppPolyglotBatch();
				batchData.setBatchName(batch.getBatchName());
				/**based on course id get course name*/
				DmnCourse course = null;
				if(null != batch && null != batch.getCourseId()){
					course = courseService.load(batch.getCourseId());
				}				
				batchData.setCourseName(null != course?course.getCourseName():"");
				batchData.setSchedule(batch.getSchedule());
				batchData.setStartDate(batch.getStartDate());
				batchData.setMode(batch.getMode());
				batchData.setBatchName(batch.getBatchName());
				/**get faculty name based on faculty id*/
				AppPolyglotFaculty faculty = null;
				AppUsers extUser = null;
				if(null != batch && null != batch.getAppPolyglotFaculty() && null != batch.getAppPolyglotFaculty().getId()){
					faculty = appFacultyService.load(batch.getAppPolyglotFaculty().getId());
					extUser = registrationService.load(faculty.getFacultyId());
				}
				batchData.setFacultyName(null != extUser?extUser.getFname()+" "+extUser.getLname():"");
				/**branch name based on branch id*/
				AppPolyglotBranch branch = null;
				if(null != batch && null != batch.getBranchId()){
					branch = branchService.load(batch.getBranchId());
				}
				batchData.setBranchName(null != branch?branch.getName():"");
				batchData.setFeeDiscount(batch.getFeeDiscount());
				batchData.setBatchStatus(batch.getBatchStatus());
				
				lstOfBatches.add(batchData);
			}
			
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonConfig.setExcludes(new String[] { "appUsers", "appPolyglotFaculty", "lastInsrtUpdTs", "plyBatchNo", "branchId"
					, "endDate", "fee", "lastInsrtUpdUsrId", "batchId", "durationType", "duration", "courseId"});
		} catch (Exception ex) {
			logger.error("exception in archieve is:"+ex, ex);
		}
		JSONArray array = JSONArray.fromObject(lstOfBatches, jsonConfig);
		logger.debug("Exit archived batches"+array);
		return array;
	}
	
	/**
	 * 
	 * @param id
	 * @param batchName
	 * @param branchName
	 * @param courseName
	 * @param feeDiscount
	 * @param fee
	 * @param startDate
	 * @param batchStatus
	 * @param mode
	 * @param schedule
	 * @param fName
	 * @param lName
	 * @param branchId
	 * @param courseId
	 * @param facultyId
	 * @param model
	 * @return
	 */
	public AppPolyglotBatchModel prepareBatchesModel(Integer id, String batchName, String branchName, String courseName,
			Integer feeDiscount, Double fee, String startDate, String batchStatus, String mode, String schedule,
			String fName, String lName, Integer branchId, Integer courseId, Integer facultyId, 
			Integer duration, String durationType, Integer classTime, AppPolyglotBatchModel model){
		model.setId(id);
		model.setBatchName(batchName);
		model.setBranchName(branchName);
		model.setCourseName(courseName);
		model.setFeeDiscount(String.valueOf(feeDiscount));
		model.setFee(fee);
		model.setStartDate(startDate);
		model.setBatchStatus(batchStatus);
		model.setMode(mode);
		model.setSchedule(schedule);
		model.setFacultyName(fName+" "+lName);
		model.setBranchId(branchId);
		model.setCourseId(courseId);
		model.setFacultyId(facultyId);
		model.setDuration(duration);
		model.setDurationType(durationType);
		model.setClassTime(classTime);
		return model;
	}
	
	/**
	 * Method returns list of students enrolled for demo.
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getLeadBatchStatus", method = RequestMethod.GET)
	public @ResponseBody JSONObject getLeadBatchStatus(HttpServletRequest request, @RequestParam("batchId") Integer id) {
		logger.debug("Inside getLeadBatchStatus, fetching the leads assigned to the batch.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);

		JSONObject returnObj = new JSONObject();
		List<AppPolyglotLead> batchStatus = new ArrayList<AppPolyglotLead>();
		List<AppPolyglotLeadModel> lstOfModel = new ArrayList<AppPolyglotLeadModel>();
		int invitedCnt = 0;
		int registeredCnt = 0;
		int droppedCnt = 0;
		try {
			batchStatus = new ArrayList<AppPolyglotLead>();
			String sql = "from AppPolyglotLead s where s.partnerId =:partnerId and s.batchId =:batchId";
			Map<String, String> params = new HashMap<String, String>();
			params.put("partnerId", String.valueOf(loggedInUser.getId()));
			params.put("batchId", id.toString());
			
			batchStatus = leadService.runQuery(sql, params);
			
			AppPolyglotLeadModel model = null;
			AppUsers extUser = new AppUsers();
			for(AppPolyglotLead lead : batchStatus){
				model = new AppPolyglotLeadModel();
				extUser = registrationService.load(lead.getUserId());
				model.setFirstName(extUser.getFname());
				model.setLastName(extUser.getLname());
				model.setStatus(lead.getLeadStatus());
				model.setId(lead.getId());
				lstOfModel.add(model);
				if(PolyglotConstants.INVITED.equalsIgnoreCase(lead.getLeadStatus())){
					invitedCnt = invitedCnt+1;
				}else if(PolyglotConstants.REGISTERED.equalsIgnoreCase(lead.getLeadStatus())){
					registeredCnt = registeredCnt+1;
				}else if(PolyglotConstants.DROPPED.equalsIgnoreCase(lead.getLeadStatus())){
					droppedCnt = droppedCnt+1;
				}
			}
		} catch (Exception e) {
			logger.error("Exception while loading the batches:"+e, e);
		}

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray array = JSONArray.fromObject(lstOfModel, jsonConfig);

		returnObj.accumulate("model", array);
		returnObj.accumulate("totalCnt", batchStatus.size());
		returnObj.accumulate("invitedCnt", invitedCnt);
		returnObj.accumulate("registeredCnt", registeredCnt);
		returnObj.accumulate("droppedCnt", droppedCnt);
		logger.debug("End of getLeadBatchStatus");
		return returnObj;
	}
	
	/**
	 * Method to save attendees for a batch
	 * @param ids
	 * @param batchId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUpdateInvitees", method = RequestMethod.POST)
	public @ResponseBody JSONObject saveUpdateInvitees(@RequestParam(value = "ids[]") Integer[] ids,
			@RequestParam("batchId") Integer batchId,
			HttpServletRequest request) {
		logger.debug("Entry of saveUpdateInvitees");
		logger.debug("Marking attendees as Attended for the demo with id : " + batchId);
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject object = new JSONObject();
		AppPolyglotLead lead = null;
		try {
			for (Integer id : ids) {
				lead = new AppPolyglotLead();
				lead = leadService.load(id);
				lead.setLeadStatus(PolyglotConstants.REGISTERED);
				lead.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				lead.setLastInsrtUpdUsrId(loggedInUser.getId());
				leadService.save(lead);
			}
		} catch (Exception e) {
			logger.error("Exception while saving the invitees:"+e, e);
		}
		logger.debug("Exit of saveUpdateInvitees");
		return object;
	}
	
	/**
	 * Method to save attendees for a batch
	 * @param ids
	 * @param batchId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateBatchName", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateBatchName(@RequestParam(value = "batchName") String batchName,
			@RequestParam("batchId") Integer batchId,
			HttpServletRequest request) {
		logger.debug("Entry of updateBatchName");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		JSONObject object = new JSONObject();
		AppPolyglotBatch batch = new AppPolyglotBatch();
		try {
			if (null != batchId) {
				batch = batchService.load(batchId);
			}			
			batch.setBatchName(batchName);
			batch.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));			
			batch.setLastInsrtUpdUsrId(loggedInUser.getId());
			batch.setAppUsers(loggedInUser);

			batchService.save(batch);
			
			Set<AppPolyglotBatch> batches = loggedInUser.getAppPolyglotBatches();
			for (AppPolyglotBatch item : batches) {
				if (batch.getBatchId().equals(item.getBatchId())) {
					batches.remove(item);
					break;
				}
			}
			batches.add(batch);
			loggedInUser.setAppPolyglotBatches(batches);
			
		} catch (Exception e) {
			logger.error("Exception while saving the batch name:"+e, e);
		}
		logger.debug("Exit of updateBatchName");
		return object;
	}
	
	@RequestMapping(value = "showStudentBatches", method = RequestMethod.GET)
	public @ResponseBody JSONObject showStudentBatches(HttpServletRequest request) {
		logger.debug("Inside of showStudentBatches.");
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			
		    int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    
		    
		    logger.debug("student batches user id:"+loggedInUser.getId());
		    /**get the lead id based on logged in user*/
		    String leadSql = "from AppPolyglotLead l where l.userId =:userId";
		    Map<String, String> param = new HashMap<String, String>();
			param.put("userId", String.valueOf(loggedInUser.getId()));
			List<AppPolyglotLead> leadObj = leadService.runQuery(leadSql, param);
			if(!PolyglotFileUtils.isEmpty(leadObj)){
		    	iTotalRecords = leadObj.size();
			    logger.debug("leads batch object size is:"+leadObj.size());
		    }
			leadObj.sort(Comparator.comparing(AppPolyglotLead::getLastInsrtUpdTs).reversed());
		    iTotalRecords = leadObj.size();
		    List<AppPolyglotBatchModel> batches = new LinkedList<AppPolyglotBatchModel>();
		    List<AppPolyglotBatchModel> filtered = new LinkedList<AppPolyglotBatchModel>();
			AppPolyglotBranch branch = new AppPolyglotBranch();
			AppPolyglotCourse course = new AppPolyglotCourse();
			AppPolyglotBatch batch = null;
			AppPolyglotBatchModel batchModel = null;
		    if (sSearch != null) {
				if(!PolyglotFileUtils.isEmpty(leadObj)){
					for(AppPolyglotLead lead : leadObj){
						batchModel = new AppPolyglotBatchModel();
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
						/**batch details*/
						logger.debug("batch id is:"+lead.getBatchId());
						if(null != lead.getBatchId()){
							batch = batchService.load(Integer.parseInt(lead.getBatchId()));
						}
						
						if(null != dmnData && null != dmnData.getCourseName() && dmnData.getCourseName().toUpperCase().contains(sSearch.toUpperCase())||
								null != branch && null != branch.getName() && branch.getName().toUpperCase().contains(sSearch.toUpperCase())||
								null != batch && null != batch.getBatchName() && batch.getBatchName().toUpperCase().contains(sSearch.toUpperCase())||
								null != batch && null != batch.getMode() && batch.getMode().contains(sSearch) ||
								null != batch && null != batch.getStartDate() && batch.getStartDate().contains(sSearch)||
								null != batch && null != batch.getBatchStatus() && batch.getBatchStatus().toUpperCase().contains(sSearch.toUpperCase())){
							filtered.add(prepareStudentBatchModel(batch.getBatchId(), dmnData.getCourseName(), 
									branch.getName(), batch.getMode(), batch.getBatchName(), batch.getStartDate(), batch.getDuration(), batch.getDurationType(),
									batch.getBatchStatus(), batch.getEndDate(), batchModel));
						}else{
							/**prepare student demo data*/
							batches.add(prepareStudentBatchModel(batch.getBatchId(), dmnData.getCourseName(), 
									branch.getName(), batch.getMode(), batch.getBatchName(), batch.getStartDate(), batch.getDuration(), batch.getDurationType(),
									batch.getBatchStatus(), batch.getEndDate(), batchModel));
						}
						
					}
				}
			}
		    
		    //If search term exists, send back filtered list, 
		    //else consider original list
		    if (sSearch != null) {
		    	iTotalDisplayRecords = filtered.size();
		    	batches = filtered;
		    } else {
		    	iTotalDisplayRecords = batches.size();
		    }
		    
		    //Number of batches that matches search criterion should be returned
		    int iDisplayStart = request.getParameter("iDisplayStart") != null ? Integer.parseInt(request.getParameter("iDisplayStart")) : 0;
		    int iDisplayLength = request.getParameter("iDisplayLength") != null ? Integer.parseInt(request.getParameter("iDisplayLength")) : 1;
		    
		    if (iDisplayLength == -1) iDisplayLength = batches.size();
		    
		    if(batches.size()< iDisplayStart + iDisplayLength)
		    	batches = batches.subList(iDisplayStart, batches.size());
		    else
		    	batches = batches.subList(iDisplayStart, iDisplayStart + iDisplayLength);
		    
		    List<AppPolyglotBatchModel> models = new ArrayList<AppPolyglotBatchModel>();
		    AppPolyglotBatchModel model = null;
		    for (AppPolyglotBatchModel batchObj : batches) {
		    	model = new AppPolyglotBatchModel();
		    	
		    	model.setBatchName(batchObj.getBatchName());
		    	model.setId(batchObj.getId());
		    	model.setBranchName(batchObj.getBranchName());
		    	model.setCourseName(batchObj.getCourseName());
		    	model.setStartDate(batchObj.getStartDate());
		    	model.setBatchStatus(batchObj.getBatchStatus());
		    	model.setMode(batchObj.getMode());
		    	model.setDuration(batchObj.getDuration());
		    	model.setDurationType(batchObj.getDurationType());
		    	model.setEndDate(batchObj.getEndDate());
		    	models.add(model);		    	
		    }
			
		    JsonConfig jsonConfig = new JsonConfig();
		    jsonConfig.setExcludes(new String[] { "appUsers" });
			jsonConfig.setIgnoreDefaultExcludes(false);
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray array = JSONArray.fromObject(models, jsonConfig);
			
			JSONObject object = new JSONObject();
			object.accumulate("sEcho", sEcho);
			object.accumulate("iTotalRecords", iTotalRecords);
			object.accumulate("iTotalDisplayRecords", iTotalDisplayRecords);
			
			object.accumulate("aaData", array);
			logger.debug("Exit of showStudentBatches");
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading batches data : " + ex, ex);
		}
		return null;
	}
	
	/**
	 * 
	 * @param id
	 * @param courseName
	 * @param branchName
	 * @param mode
	 * @param batchName
	 * @param startDate
	 * @param duration
	 * @param durationType
	 * @param status
	 * @param model
	 * @return
	 */
	public AppPolyglotBatchModel prepareStudentBatchModel(Integer id, String courseName, String branchName, 
			String mode, String batchName, String startDate, Integer duration, String durationType, 
			String status, Timestamp endDate, AppPolyglotBatchModel model){
		model.setId(id);
		model.setBranchName(branchName);
		model.setCourseName(courseName);
		model.setBatchName(batchName);
		model.setMode(mode);
		model.setDuration(duration);
		model.setDurationType(durationType);
		model.setStartDate(startDate);
		model.setBatchStatus(status);
		model.setEndDate(PolyglotFileUtils.convertTimeStampToString(endDate, "MM/dd/yyyy hh:mm a"));
		return model;
	}

	/**
	 * Method for dropping a student demo
	 * @param ids
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateStudentBatches", method = RequestMethod.POST)
	public @ResponseBody JSONObject updateStudentBatches(@RequestParam(value = "batchIds[]") Integer[] batchIds, @RequestParam("status") String status,
			HttpServletRequest request) {
		AppUsers loggedInUser = (AppUsers) request.getSession().getAttribute(PolyglotConstants.APP_POLYGLOT_USER); 
		logger.debug("Inside of updateStudentBatches");
		JSONObject object = new JSONObject();
				
		for (Integer id : batchIds) {
			logger.debug("student id is:"+id+":status is:"+status);
			AppPolyglotBatch batchSts = batchService.load(id);
			
			if(null != batchSts){
				batchSts.setBatchStatus(status);			
				batchSts.setLastInsrtUpdTs(new Timestamp(Calendar.getInstance().getTimeInMillis()));
				batchSts.setLastInsrtUpdUsrId(loggedInUser.getId());
				batchService.save(batchSts);
			}
		}
		logger.debug("Exit of updateStudentDemo");
		return object;
	}
}
