package com.polyglot.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jxl.common.Logger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.polyglot.domain.AppPolyglotEvents;
import com.polyglot.domain.AppPolyglotNews;
import com.polyglot.domain.AppPolyglotTask;
import com.polyglot.domain.AppPolyglotTemplates;
import com.polyglot.domain.AppStudentTask;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.DmnCities;
import com.polyglot.domain.DmnCntry;
import com.polyglot.model.AppPolyglotEventModel;
import com.polyglot.model.AppPolyglotStudentTaskModel;
import com.polyglot.model.AppPolyglotTemplateModel;
import com.polyglot.service.AppPolyglotEventsService;
import com.polyglot.service.AppPolyglotNewsService;
import com.polyglot.service.AppPolyglotTaskService;
import com.polyglot.service.AppPolyglotTemplatesService;
import com.polyglot.service.AppStudentTaskService;
import com.polyglot.service.DmnCitiesService;
import com.polyglot.service.DmnCountryService;
import com.polyglot.utils.PolyglotConstants;

@Controller
public class AdminController {


	private static final Logger logger = Logger.getLogger(AdminController.class);
	
	@Autowired
	public AppPolyglotEventsService eventsService;
	
	@Autowired
	public AppPolyglotNewsService newsService;
	
	@Autowired
	public DmnCitiesService cityService;
	
	@Autowired
	public DmnCountryService cntryService;
	
	@Autowired
	public AppPolyglotTemplatesService templateService;
	
	@Autowired 
	public AppPolyglotTaskService taskService;
	
	@Autowired
	public AppStudentTaskService studentTaskService;
	
	
	@RequestMapping(path = "/admin/ShowAdminNews", method = RequestMethod.GET)
	public ModelAndView AdminNews(HttpServletRequest request) {
		logger.debug("Showing AdminNews");
		ModelAndView view = new ModelAndView();
		view.setViewName("AdminNews");
		List<String> templateList = new ArrayList<String>();
		List<String> cityList = new ArrayList<String>();
		List<String> cntryList = new ArrayList<String>();
	    cntryService.getAll().forEach((temp)->{
	    	cntryList.add("'"+temp.getCntryId()+" - "+temp.getCntryDesc()+"'");
	    });
	    cityService.getAll().forEach((temp)->{
	    	cityList.add("'"+temp.getCityId()+" - "+temp.getCityDesc()+"'");
	    });
	    templateService.getAll().forEach((temp)->{
	    	templateList.add("'"+temp.getTemplateId()+" - "+temp.getTemplateType()+" - "+temp.getTemplateName()+"'");
	    });
	    view.addObject("templateList", templateList);
		view.addObject("cityList", cityList);
	    view.addObject("cntryList", cntryList);
		return view;
	}
	
	
	
	
	
	@RequestMapping(path = "/admin/ShowAdminEvents", method = RequestMethod.GET)
	public ModelAndView showAdminEvents(HttpServletRequest request) {
		logger.debug("Showing Admin Events");
		ModelAndView view = new ModelAndView();
		view.setViewName("AdminEvents");
		List<String> templateList = new ArrayList<String>();
		List<String> cityList = new ArrayList<String>();
		List<String> cntryList = new ArrayList<String>();
	    cntryService.getAll().forEach((temp)->{
	    	cntryList.add("'"+temp.getCntryId()+" - "+temp.getCntryDesc()+"'");
	    });
	    cityService.getAll().forEach((temp)->{
	    	cityList.add("'"+temp.getCityId()+" - "+temp.getCityDesc()+"'");
	    });
	    templateService.getAll().forEach((temp)->{
	    	templateList.add("'"+temp.getTemplateId()+" - "+temp.getTemplateType()+" - "+temp.getTemplateName()+"'");
	    });
	    view.addObject("templateList", templateList);
		view.addObject("cityList", cityList);
	    view.addObject("cntryList", cntryList);

		return view;
	}
	
	@RequestMapping(value = "deleteAdminEventsData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject deleteAdminEventsData(@RequestParam(value = "eventIds[]") Integer [] ids) {
		JSONObject returnObj = new JSONObject();
		try{
		for(Integer pk : ids){
		AppPolyglotEvents event = eventsService.load(pk);
		eventsService.delete(event);
		}
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	
	
	@RequestMapping(value = "saveUpdateEventsData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateEventsData(@RequestBody final AppPolyglotEventModel model, @RequestParam("id") Integer id, HttpSession session) {
		JSONObject returnObj = new JSONObject();
		try{
		AppPolyglotEvents event = new AppPolyglotEvents();
		if(id!=null){
			event = eventsService.load(id);
		}else{
			event.setLastInsrtUpdUsrId(-1);
			event.setCreatedDate(new Timestamp(new Date().getTime()));
		}
		event.setModifiedDate(new Timestamp(new Date().getTime()));
		event.setTitle(model.getTitle());
		event.setOrganizer(model.getOrganizer());
		event.setDescription(model.getDescription());
		event.setRecurring(model.getRecurring());
		event.setVenue(model.getVenue());
		event.setLocation(model.getLocation());
		if(model.getSchedule()!=null){
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd hh:ss");
			Date d = format.parse(model.getSchedule());
			//System.out.println(d);
			SimpleDateFormat format1 = new SimpleDateFormat("EEE MMM dd, yyyy hh:mm a");
			String dd = format1.format(d);
			Date dds= format1.parse(dd);
			event.setSchedule(new Timestamp(dds.getTime()));
		}
		event.setImagePath(model.getImagePath());
		event.setMetaTitle(model.getMetaTitle());
		event.setMetaDescription(model.getMetaDescription());
		event.setMetaKeywords(model.getMetaKeywords());
		event.setIsActive(model.getIsActive());
		event.setEventModifier(model.getEventIdentifier());
		if(model.getCity()!=null){
			DmnCities cityObj =  cityService.load(Integer.valueOf(model.getCity().split(" -")[0]));
			event.setCity(cityObj);
		}
		if(model.getCountry()!=null){
			DmnCntry cntryObj =  cntryService.load(Integer.valueOf(model.getCountry().split(" -")[0]));
			event.setCountry(cntryObj);
		}
		if(model.getTemplate()!=null){
			AppPolyglotTemplates tempObj =  templateService.load(Integer.valueOf(model.getTemplate().split(" -")[0]));
			event.setTemplate(tempObj);
		}
		
		
		eventsService.save(event);
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	@RequestMapping(value = "/admin/getEventsInfo", method = RequestMethod.GET)
	public @ResponseBody JSONObject getAdminEventsData(HttpServletRequest request) {
		logger.debug("Inside show Events.");
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    //List<DmnCourse> list = new LinkedList<DmnCourse>();
		    List<AppPolyglotEventModel> filtered = new LinkedList<AppPolyglotEventModel>();
		     List<AppPolyglotEventModel> events = new LinkedList<AppPolyglotEventModel>();
		     final List<AppPolyglotEventModel> finalEvents  = new LinkedList<AppPolyglotEventModel>();
		    eventsService.getAll().forEach((temp)->{
		    	AppPolyglotEventModel model = new AppPolyglotEventModel();
		    	
		    	model.setId(temp.getId());
		    	if(temp.getSchedule()!=null){
		    	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd hh:ss");
				String d = format.format(temp.getSchedule());
				model.setSchedule(d);
		    	}
		    	model.setIsActive(temp.getIsActive());
		    	model.setMetaDescription(temp.getMetaDescription());
		    	model.setMetaKeywords(temp.getMetaKeywords());
		    	model.setMetaTitle(temp.getMetaTitle());
		    	model.setImagePath(temp.getImagePath());
		    	model.setTitle(temp.getTitle());
		    	model.setOrganizer(temp.getOrganizer());
		    	model.setDescription(temp.getDescription());
		    	model.setRecurring(temp.getRecurring());
		    	model.setVenue(temp.getVenue());
		    	model.setLocation(temp.getLocation());
		    	model.setCity(temp.getCity().getCityId()+" - "+temp.getCity().getCityDesc());
		    	model.setCountry(temp.getCountry().getCntryId()+" - "+temp.getCountry().getCntryDesc());
		    	model.setTemplate(temp.getTemplate().getTemplateId()+" - "+temp.getTemplate().getTemplateType()+" - "+temp.getTemplate().getTemplateName());
		    	model.setEventIdentifier(temp.getEventModifier());
		    	finalEvents.add(model);
		    });
		    events = finalEvents;
		    iTotalRecords = events.size();
		    if (sSearch != null) {
				for (AppPolyglotEventModel c : events) {
					
					if ((c.getTitle()!=null && c.getTitle().toLowerCase().contains(sSearch.toLowerCase())) || 
							(c.getOrganizer()!=null && c.getOrganizer().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getDescription()!=null && c.getDescription().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getRecurring()!=null && c.getRecurring().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getVenue()!=null && c.getVenue().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getLocation()!=null && c.getLocation().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getCity()!=null && c.getCity().toLowerCase().contains(sSearch.toLowerCase()))) {
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
			logger.debug("Caught exception while loading branch data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(value = "deleteAdminNewsData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject deleteAdminNewsData(@RequestParam(value = "newsIds[]") Integer [] ids) {
		JSONObject returnObj = new JSONObject();
		try{
		for(Integer pk : ids){
		AppPolyglotNews event = newsService.load(pk);
		newsService.delete(event);
		}
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	
	
	@RequestMapping(value = "saveUpdateNewsData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateNewsData(@RequestBody final AppPolyglotEventModel model, @RequestParam("id") Integer id, HttpSession session) {
		JSONObject returnObj = new JSONObject();
		try{
		AppPolyglotNews event = new AppPolyglotNews();
		if(id!=null){
			event = newsService.load(id);
		}else{
			event.setLastInsrtUpdUsrId(-1);
			event.setCreatedDate(new Timestamp(new Date().getTime()));
		}
		event.setModifiedDate(new Timestamp(new Date().getTime()));
		event.setTitle(model.getTitle());
		event.setOrganizer(model.getOrganizer());
		event.setDescription(model.getDescription());
		event.setRecurring(model.getRecurring());
		event.setVenue(model.getVenue());
		event.setLocation(model.getLocation());
		if(model.getSchedule()!=null){
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd hh:ss");
			Date d = format.parse(model.getSchedule());
			//System.out.println(d);
			SimpleDateFormat format1 = new SimpleDateFormat("EEE MMM dd, yyyy hh:mm a");
			String dd = format1.format(d);
			Date dds= format1.parse(dd);
			event.setSchedule(new Timestamp(dds.getTime()));
		}
		event.setImagePath(model.getImagePath());
		event.setMetaTitle(model.getMetaTitle());
		event.setMetaDescription(model.getMetaDescription());
		event.setMetaKeywords(model.getMetaKeywords());
		event.setIsActive(model.getIsActive());
		event.setEventModifier(model.getEventIdentifier());
		if(model.getCity()!=null){
			DmnCities cityObj =  cityService.load(Integer.valueOf(model.getCity().split(" -")[0]));
			event.setCity(cityObj);
		}
		if(model.getCountry()!=null){
			DmnCntry cntryObj =  cntryService.load(Integer.valueOf(model.getCountry().split(" -")[0]));
			event.setCountry(cntryObj);
		}
		if(model.getTemplate()!=null){
			AppPolyglotTemplates tempObj =  templateService.load(Integer.valueOf(model.getTemplate().split(" -")[0]));
			event.setTemplate(tempObj);
		}
		
		
		newsService.save(event);
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	@RequestMapping(value = "/admin/getNewsInfo", method = RequestMethod.GET)
	public @ResponseBody JSONObject getAdminNewsData(HttpServletRequest request) {
		logger.debug("Inside show News.");
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    //List<DmnCourse> list = new LinkedList<DmnCourse>();
		    List<AppPolyglotEventModel> filtered = new LinkedList<AppPolyglotEventModel>();
		     List<AppPolyglotEventModel> events = new LinkedList<AppPolyglotEventModel>();
		     final List<AppPolyglotEventModel> finalEvents  = new LinkedList<AppPolyglotEventModel>();
		    newsService.getAll().forEach((temp)->{
		    	AppPolyglotEventModel model = new AppPolyglotEventModel();
		    	
		    	model.setId(temp.getId());
		    	if(temp.getSchedule()!=null){
		    	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd hh:ss");
				String d = format.format(temp.getSchedule());
				model.setSchedule(d);
		    	}
		    	model.setIsActive(temp.getIsActive());
		    	model.setMetaDescription(temp.getMetaDescription());
		    	model.setMetaKeywords(temp.getMetaKeywords());
		    	model.setMetaTitle(temp.getMetaTitle());
		    	model.setImagePath(temp.getImagePath());
		    	model.setTitle(temp.getTitle());
		    	model.setOrganizer(temp.getOrganizer());
		    	model.setDescription(temp.getDescription());
		    	model.setRecurring(temp.getRecurring());
		    	model.setVenue(temp.getVenue());
		    	model.setLocation(temp.getLocation());
		    	model.setCity(temp.getCity().getCityId()+" - "+temp.getCity().getCityDesc());
		    	model.setCountry(temp.getCountry().getCntryId()+" - "+temp.getCountry().getCntryDesc());
		    	model.setTemplate(temp.getTemplate().getTemplateId()+" - "+temp.getTemplate().getTemplateType()+" - "+temp.getTemplate().getTemplateName());
		    	model.setEventIdentifier(temp.getEventModifier());
		    	finalEvents.add(model);
		    });
		    events = finalEvents;
		    iTotalRecords = events.size();
		    if (sSearch != null) {
				for (AppPolyglotEventModel c : events) {
					
					if ((c.getTitle()!=null && c.getTitle().toLowerCase().contains(sSearch.toLowerCase())) || 
							(c.getOrganizer()!=null && c.getOrganizer().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getDescription()!=null && c.getDescription().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getRecurring()!=null && c.getRecurring().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getVenue()!=null && c.getVenue().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getLocation()!=null && c.getLocation().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getCity()!=null && c.getCity().toLowerCase().contains(sSearch.toLowerCase()))) {
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
			logger.debug("Caught exception while loading branch data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(path = "/admin/ShowTemplates", method = RequestMethod.GET)
	public String showAdminTemplates(HttpServletRequest request) {
		logger.debug("Showing Templates");
		
		return "AdminTemplates";
	}
	
	
	@RequestMapping(value = "deleteAdminTemplatesData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject deleteAdminTemplatesData(@RequestParam(value = "templateIds[]") Integer [] ids) {
		JSONObject returnObj = new JSONObject();
		try{
		for(Integer pk : ids){
		AppPolyglotTemplates template = templateService.load(pk);
		templateService.delete(template);
		}
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	
	
	@RequestMapping(value = "saveUpdateTemplateData", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject saveUpdateTemplateData(@RequestBody final AppPolyglotTemplates model, @RequestParam("id") Integer id, HttpSession session) {
		JSONObject returnObj = new JSONObject();
		try{
		if(id==null){
			model.setLastInsertedUpdUserId(-1);
			model.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
		}else{
			model.setTemplateId(id);
		}
		templateService.save(model);
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
	@RequestMapping(value = "/admin/getAdminTemplateData", method = RequestMethod.GET)
	public @ResponseBody JSONObject getAdminTemplateData(HttpServletRequest request) {
		logger.debug("Inside show News.");
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		    //List<DmnCourse> list = new LinkedList<DmnCourse>();
		     List<AppPolyglotTemplateModel> filtered = new LinkedList<AppPolyglotTemplateModel>();
		     List<AppPolyglotTemplateModel> events = new LinkedList<AppPolyglotTemplateModel>();
		     final List<AppPolyglotTemplateModel> finalList = new LinkedList<AppPolyglotTemplateModel>();
             templateService.getAll().forEach((temp)->{
            	 AppPolyglotTemplateModel model = new AppPolyglotTemplateModel();
            	 model.setTemplateId(temp.getTemplateId());
            	 model.setTemplateName(temp.getTemplateName());
            	 model.setTemplateType(temp.getTemplateType());
            	 model.setIsActive(temp.getIsActive());
            	 model.setTemplateContent(temp.getTemplateContent());
            	 finalList.add(model);
             });
             events = finalList;
		    iTotalRecords = events.size();
		    if (sSearch != null) {
				for (AppPolyglotTemplateModel c : events) {
					
					if ((c.getTemplateName()!=null && c.getTemplateName().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getTemplateType()!=null && c.getTemplateType().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getIsActive()!=null && c.getIsActive().toLowerCase().contains(sSearch.toLowerCase()))) {
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
			logger.debug("Caught exception while loading branch data : " + ex);
			ex.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/admin/getStudentTaskData", method = RequestMethod.GET)
	public @ResponseBody JSONObject getStudentTaskData(HttpServletRequest request, HttpSession session) {
		logger.debug("Inside getStudentTaskData");
		AppUsers loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		logger.debug("user id is:"+loggedInUser.getId());
		Map<String, String> params = new HashMap<String, String>();
		List<AppPolyglotStudentTaskModel> filtered = new LinkedList<AppPolyglotStudentTaskModel>();
		List<AppPolyglotStudentTaskModel> events = new LinkedList<AppPolyglotStudentTaskModel>();
		final List<AppPolyglotStudentTaskModel> finalEvents = new LinkedList<AppPolyglotStudentTaskModel>();
		     
		try{
			String sEcho = request.getParameter("sEcho");
			String sSearch = request.getParameter("sSearch");
			int iTotalRecords; //total number of records (not filtered)
		    int iTotalDisplayRecords;//value will be set when code filters companies by keyword
		   
		    String sql = "from AppStudentTask t where t.userId =:userId";
			params.put("userId", String.valueOf(loggedInUser.getId()));
			logger.debug("param map is:"+params);
			
			List<AppStudentTask> lstOfStuTsks = studentTaskService.runQuery(sql, params);
			AppPolyglotStudentTaskModel obj = null;
			logger.debug("lstOfStuTsks is:"+lstOfStuTsks);
			if(null != lstOfStuTsks){
				lstOfStuTsks.sort(Comparator.comparing(AppStudentTask::getLastInsrtUpdTs).reversed());
				for(AppStudentTask student : lstOfStuTsks){
					if(null != student){
						obj = new AppPolyglotStudentTaskModel();
						AppPolyglotTask task =   taskService.load(student.getTaskId());
						obj.setAssignedBy(task.getAppUsers().getFname()+" "+task.getAppUsers().getLname());
				    	obj.setTaskName(task.getTaskName());
				    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				    	if(null != student.getStartDate())
				    		obj.setStartDate(format.format(student.getStartDate()));
				    	if(null != student.getEndDate())
				    		obj.setEndDate(format.format(student.getEndDate()));
				    	if(null != student.getAssignedDate()){
				    		obj.setAssignedDate(format.format(student.getAssignedDate()));
				    	}
				    	obj.setTaskStatus(student.getTaskStatus());
				    	obj.setId(student.getId());
				    	obj.setTaskId(student.getTaskId());
				    	obj.setResult(student.getResult());
				    	finalEvents.add(obj);
					}
				}
			}
			
			logger.debug("students list is:"+finalEvents);
		    events = finalEvents;
		    iTotalRecords = events.size();
		    if (sSearch != null) {
				for (AppPolyglotStudentTaskModel c : events) {
					
					if ((c.getAssignedBy()!=null && c.getAssignedBy().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getTaskName()!=null && c.getTaskName().toLowerCase().contains(sSearch.toLowerCase())) ||
							(c.getTaskStatus()!=null && c.getTaskStatus().toLowerCase().contains(sSearch.toLowerCase()))) {
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
			logger.debug("End of getStudentTaskData");
			return object;
		} catch (Exception ex) {
			logger.error("Caught exception while loading student task data : " + ex, ex);
		}
		return null;
	}
	
	@RequestMapping(value = "completeTaskAction", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject completeTaskAction(@RequestParam(value = "taskIds[]") Integer [] ids) {
		logger.debug("Inside of completeTaskAction");
		JSONObject returnObj = new JSONObject();
		try{
			if(ids!=null && ids.length>0){
				for(Integer pk : ids){
				  AppStudentTask task = studentTaskService.load(pk);
				  if(task!=null && task.getStartDate()!=null && task.getTaskStatus()!=null && task.getTaskStatus().equalsIgnoreCase("ASSIGNED")){
					  task.setEndDate(new Timestamp(new Date().getTime()));
					  task.setTaskStatus("COMPLETED");
					  studentTaskService.save(task);
				  }
				  
				}
			}
			returnObj.accumulate("status", "SUCCESS");
		}catch(Exception ex){
			logger.error("Exception while completing the tasks:"+ex, ex);
			returnObj.accumulate("status", "FAIL");
		}
		logger.debug("Exit of completeTaskAction");
		return returnObj;
	}
	
	@RequestMapping(value = "updateStartDateForTask", method = RequestMethod.POST)
	public @ResponseBody
	JSONObject updateStartDateForTask(HttpServletRequest request) {
		JSONObject returnObj = new JSONObject();
		try{
		if(request.getParameter("taskId")!=null){ 
			  AppStudentTask task = 	studentTaskService.load(Integer.valueOf(request.getParameter("taskId")));
			  if(task!=null){
				  Date today = new Date();
				  task.setStartDate(new Timestamp(today.getTime()));
				  studentTaskService.save(task);
			  }
		}
		returnObj.accumulate("status", "SUCCESS");
		}catch(Exception e){
		returnObj.accumulate("status", "FAIL");
		}
		return returnObj;
	}
	
}
