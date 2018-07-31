package com.polyglot.controller;

import java.sql.Timestamp;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import jxl.common.Logger;
import net.sf.json.JSONObject;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.polyglot.domain.AppPolyglotBanners;
import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.domain.AppPolyglotDemo;
import com.polyglot.domain.AppPolyglotEventSubscription;
import com.polyglot.domain.AppPolyglotEvents;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppPolyglotLeadDemoStatus;
import com.polyglot.domain.AppPolyglotNews;
import com.polyglot.domain.AppPolyglotTemplates;
import com.polyglot.domain.AppTrainerSubscriptions;
import com.polyglot.domain.AppUsersSocialMedia;
import com.polyglot.domain.DmnCities;
import com.polyglot.domain.DmnCourse;
import com.polyglot.domain.AppUsers;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.domain.DmnParams;
import com.polyglot.model.AppPolyglotBatchModel;
import com.polyglot.model.AppPolyglotDemoModel;
import com.polyglot.model.AppPolyglotTrainerModel;
import com.polyglot.service.AppEventSubscriptionService;
import com.polyglot.service.AppPolyglotBannerService;
import com.polyglot.service.AppPolyglotBatchService;
import com.polyglot.service.AppPolyglotBranchService;
import com.polyglot.service.AppPolyglotCourseService;
import com.polyglot.service.AppPolyglotDemoService;
import com.polyglot.service.AppPolyglotEventsService;
import com.polyglot.service.AppPolyglotFacultyService;
import com.polyglot.service.AppPolyglotLeadDemoStatusService;
import com.polyglot.service.AppPolyglotLeadService;
import com.polyglot.service.AppPolyglotNewsService;
import com.polyglot.service.AppPolyglotRegistrationService;
import com.polyglot.service.AppPolyglotTemplatesService;
import com.polyglot.service.AppTrainerSubscriptionService;
import com.polyglot.service.ConfigurationService;
import com.polyglot.service.DmnCitiesService;
import com.polyglot.service.DmnCourseService;
import com.polyglot.service.DmnParamsService;
import com.polyglot.service.PolyglotEmailService;

@Controller
public class CoursesAndTrainersController {
	private static final Logger logger = Logger.getLogger(CoursesAndTrainersController.class);

	@Autowired
	public DmnCourseService coursesServ;
	
	@Autowired
	private AppPolyglotCourseService appCourseService; 
	
	@Autowired
	private AppPolyglotBranchService branchService;
	
	@Autowired
	private AppPolyglotBatchService batchService;
	
	@Autowired
	private PolyglotEmailService emailService;
	
	@Autowired
    private ConfigurationService configurationService ;
	
	@Autowired
    private AppPolyglotBannerService bannerService ;
	
	@Autowired
	private ConfigurationService configService;
	
	@Autowired
	private AppPolyglotEventsService eventsService;
	
	@Autowired
	private AppPolyglotFacultyService facultyService;
	
	@Autowired
	private AppPolyglotNewsService newsService;
	
	@Autowired
	private AppPolyglotTemplatesService templateService;
	
	@Autowired
	private AppPolyglotRegistrationService  registrationService;
	
	@Autowired
	private AppTrainerSubscriptionService  subscriptionService;
	
	@Autowired
	private DmnParamsService  paramsService;
	
	@Autowired
	private DmnCitiesService cityService;
	
	@Autowired
	private AppPolyglotDemoService demoService;
	
	@Autowired
	private AppPolyglotLeadService leadService;
	
	@Autowired
	private AppEventSubscriptionService eventSubService;
	
	@Autowired
	private AppPolyglotLeadDemoStatusService leadDemoStatusService;
	
	@RequestMapping(value="all-courses",method=RequestMethod.GET)
	public ModelAndView fetchAllCourseData(){
		ModelAndView view = new ModelAndView();
		try{
				  	  Map<String,Set<String>> leftPanel = new TreeMap<>();
					  List<DmnCourse> coursesList = coursesServ.getAll();
					  Set<String> levels = new TreeSet<>(); 
					  coursesList.forEach((temp) -> {
						   if(temp.getSubCategory()!=null && temp.getSubCategory().trim().length()>0){
						     if(leftPanel.get(temp.getCategory())!=null){
						    	Set<String> tempArr =  leftPanel.get(temp.getCategory());
						    	tempArr.add(temp.getSubCategory());
						    	leftPanel.put(temp.getCategory(),tempArr);
						     }else{
						    	 Set<String> subCategories = new TreeSet<>();
						    	 subCategories.add(temp.getSubCategory());
						    	 leftPanel.put(temp.getCategory(),subCategories);
						     }
						   }
						     if(temp.getLevel()!=null)
						     levels.add(temp.getLevel());
						     //App polylead - course id - Registered.
						     List<AppPolyglotCourse> courseList = appCourseService.runQuery("from AppPolyglotCourse c where c.dmnCourseId="+temp.getId(), null);
						     int learnersCnt = 0; 
						     for(AppPolyglotCourse course : courseList){
						    	 List<AppPolyglotLead> leadList = leadService.runQuery("from AppPolyglotLead o where o.courseId="+course.getId()+" and  o.leadStatus in ('REGISTERED')", null);
						    	 learnersCnt += leadList.size();
						     }
						     List<AppPolyglotCourse> trainerList = appCourseService.runQuery("from AppPolyglotCourse c where c.dmnCourseId="+temp.getId()+" and c.appUsers.userType in ('T','P')", null);
						     temp.setTemplate(learnersCnt+"-"+trainerList.size());
					  });
					  //Collections.sort(coursesList, new CourseComparator());
					  if(!coursesList.isEmpty()){
						  coursesList.sort(Comparator.comparing(DmnCourse::getPriortyNo));
					  }
					  view.addObject("leftPanel", leftPanel);
					  view.addObject("leftPanelLevels", levels);
					  view.addObject("data", coursesList);
				  
			}catch(Exception e){
			logger.error("Error Occured While fetchAllCourseData"+e);
		}
		view.setViewName("AllCourses");
		return view;
	}
	
	@RequestMapping(value="/courses/{courseIdentifier}",method=RequestMethod.GET)
	public ModelAndView getCourseDefaultPage(@PathVariable String courseIdentifier){
		ModelAndView view = new ModelAndView();
		List<DmnCourse> courses = coursesServ.runQuery("from DmnCourse where courseIdentifier='"+courseIdentifier+"'", null);
		List<DmnCourse> recmndList = new ArrayList<>();
		if(courses!=null && !courses.isEmpty()){
		String relatedCourses = courses.get(0).getRelatedCourses();
		if(relatedCourses!= null && !relatedCourses.isEmpty()){
		for(String temp : relatedCourses.split(",")){
			DmnCourse courseTemp = coursesServ.load(Integer.valueOf(temp));
			recmndList.add(courseTemp);
		}
		view.addObject("recommendedCourses", recmndList);
		}
		view.addObject("course", courses.get(0));
		}
		
		view.setViewName("CourseDetails");
		return  view;
	}
	
	@RequestMapping(value="/ContentManagement",method=RequestMethod.GET)
	public ModelAndView  getContentManagement(HttpServletRequest request){
		ModelAndView returnObj = new ModelAndView();
		List<AppPolyglotTemplates> templates = templateService.getAll();
		Map<Integer,Integer> map = new HashMap<>();
		templates.forEach((temp)->{
			map.put(temp.getTemplateId(), temp.getTemplateId());
		});
		returnObj.addObject("templateList",map);
		returnObj.setViewName("ContentManagement");
		return  returnObj;
	}
	
	@RequestMapping(value="/postHTMLContent",method=RequestMethod.POST)
	public @ResponseBody JSONObject  postHTMLContent(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		AppPolyglotTemplates course = templateService.load(Integer.valueOf(request.getParameter("courseId")));
		course.setTemplateContent(request.getParameter("content"));
		templateService.save(course);
		return  returnObj;
	}
	
	@RequestMapping(value="sendDemoAndCallBack",method=RequestMethod.POST)
	public @ResponseBody JSONObject  sendDemoAndCallBack(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		if(request.getParameter("source")!=null){
			if(request.getParameter("source").equalsIgnoreCase("D")){
                emailService.requestMailTriggers("D",request);
			}else{
				emailService.requestMailTriggers("C",request);
			}
		}
		returnObj.accumulate("status", "Request has been Proceesed");
		return  returnObj;
	}
	
	@RequestMapping(value="all-batches/{findTrainersForCourse}",method=RequestMethod.GET)
	public ModelAndView fetchAllTrainersData(HttpServletRequest request,@PathVariable String findTrainersForCourse){
		ModelAndView view = new ModelAndView();
		try{
				  	  Map<String,Set<String>> leftPanel = new TreeMap<>();
					  List<DmnCourse> coursesList = coursesServ.getAll();
					  List<AppPolyglotBatch> batches =  batchService.runQuery("from AppPolyglotBatch where batchStatus='SCHEDULED'  ", null);
					  Collections.sort(batches, new BatchComparator());
					  Set<String> levels = new TreeSet<>(); 
					  coursesList.forEach((temp) -> {
						   if(temp.getSubCategory()!=null && temp.getSubCategory().trim().length()>0){
						     if(leftPanel.get(temp.getCategory())!=null){
						    	Set<String> tempArr =  leftPanel.get(temp.getCategory());
						    	tempArr.add(temp.getSubCategory());
						    	leftPanel.put(temp.getCategory(),tempArr);
						     }else{
						    	 Set<String> subCategories = new TreeSet<>();
						    	 subCategories.add(temp.getSubCategory());
						    	 leftPanel.put(temp.getCategory(),subCategories);
						     }
						   }
						     if(temp.getLevel()!=null)
						     levels.add(temp.getLevel());
						});
					  view.addObject("leftPanel", leftPanel);
					  view.addObject("leftPanelLevels", levels);
					  if(request.getSession().getAttribute("CURRENT_USER")!=null){
						  view.addObject("userLoggedIn", "Y");
					  }else{
						  view.addObject("userLoggedIn", "N");
					  }
					  List<String[]> data = new ArrayList<String[]>();
					  Set<String> citiesList = new TreeSet<String>();
					  Set<String> localityList = new TreeSet<String>();
					  Set<String> classType = new TreeSet<String>();
					  batches.forEach(temp ->{
						 try{
						 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm");
						 Date dd = format.parse(temp.getStartDate());
						 if(dd.after(new Date())){
						 String[] objData = new String[25];
						 classType.add(temp.getMode());
						 List<Object> leadList = leadService.getCustomData("select count(*) from AppPolyglotLead where batchId = "+temp.getBatchId()+" and leadStatus = 'REGISTERED'");
						 objData[21] = String.valueOf(leadList.get(0));
						 objData[19] = String.valueOf(temp.getBatchId());
						 objData[20] = String.valueOf(temp.getCourseId());
						 List<AppPolyglotBranch> branches = branchService.runQuery("from AppPolyglotBranch where id="+temp.getBranchId(), null);
						 if(!branches.isEmpty()){
							 for(AppPolyglotBranch brch : branches){
								List<Object> cityList =  cityService.getCustomData("select cityDesc from DmnCities where cityId="+brch.getCity());
								 if(!cityList.isEmpty()){
									 citiesList.add(String.valueOf(cityList.get(0)));
									 localityList.add(brch.getLocation());
									 objData[7] =String.valueOf(cityList.get(0));
									 objData[8] =brch.getLocation();
								 }
							 }
						 }
						 objData[9] = temp.getAppUsers().getEmailId();
						 objData[10] = temp.getAppUsers().getMobile();
						 objData[24] = temp.getAppUsers().getInstName();
						 objData[11] = String.valueOf(temp.getAppUsers().getId());
						 if(temp.getCourseId()!=null){
							List<AppPolyglotCourse> courseListData =  appCourseService.runQuery("from AppPolyglotCourse where id="+temp.getCourseId(), null);
							if(!courseListData.isEmpty()){
								AppPolyglotCourse course = courseListData.get(0);
								objData[22] = course.getCourseContent();
								objData[23] = course.getVideoContent();
								objData[5] = temp.getDuration()+" "+temp.getDurationType();
								objData[4] = temp.getMode();
								int fee = temp.getFee()!=null?temp.getFee().intValue():0;
								Double discount = new Double(temp.getFeeDiscount());
								Integer discounted = 0;
								if(discount!=null){ 
									discounted = 	fee - ((discount.intValue()*fee)/100);
								}
								objData[12] = String.valueOf(fee);
								objData[13] = String.valueOf(discounted);
								StringBuffer buffer = new StringBuffer();
								if(course.getRealtimeProjs()!=null && course.getRealtimeProjs().equalsIgnoreCase("Y")){
									objData[14] = "";
									buffer.append("RealTime");
								}else{
									objData[14] = "cross";
								}
								if(course.getFeeInInstallments()!=null && course.getFeeInInstallments().equalsIgnoreCase("Y")){
									objData[15] = "";
									buffer.append(" FeeInInstallments");
								}else{
									objData[15] = "cross";
								}
								if(course.getLabAssistance()!=null && course.getLabAssistance().equalsIgnoreCase("Y")){
									objData[16] = "";
									buffer.append(" LabAssistance");
								}else{
									objData[16] = "cross";
								}
								if(course.getPlacementAssistance()!=null && course.getPlacementAssistance().equalsIgnoreCase("Y")){
									objData[17] = "";
									buffer.append(" PlacementAssistance");
								}else{
									objData[17] = "cross";
								}
								objData[18] = buffer.toString();
								if(temp.getSchedule()!=null){
									if(temp.getSchedule().equalsIgnoreCase("Weekends")){
										objData[6] = "Sat - Sun";
									}else{
										objData[6] = "Mon - Fri";
									}
									
								}
								List<DmnCourse> courseList =  coursesServ.runQuery("from DmnCourse where id="+course.getDmnCourseId(), null);
								if(!courseList.isEmpty()){
									DmnCourse dmncourse = courseList.get(0);
									objData[1] = dmncourse.getSubCategory();
									objData[0] = dmncourse.getCourseName();
								}
							}
							
							
						 }
						 if(!temp.getStartDate().isEmpty()){
							   String[] arr = temp.getStartDate().split(" ");
						       String monthString = new DateFormatSymbols().getMonths()[Integer.valueOf(arr[0].split("/")[0])-1];
					           objData[2] = arr[0].split("/")[1]+getOrdinalSuffix(Integer.valueOf(arr[0].split("/")[1]))+" "+monthString.substring(0,3)+" "+arr[0].split("/")[2];
					           objData[3] = arr[1] + arr[2];
					     }
						 data.add(objData);
						}
					  }catch(Exception e){
						  logger.error("Exception from method"+e);
					  }}
					  );
                      view.addObject("data", data);
					  view.addObject("leftPanelCities", citiesList);
					  view.addObject("leftPanelLocality", localityList);
					  generateAdBanners(findTrainersForCourse,view);
				}catch(Exception e){
			logger.error("Error Occured While fetchAllCourseData"+e);
		}
		view.setViewName("AllBatches");
		return view;
	}
	
	private void generateAdBanners(String findTrainersForCourse,ModelAndView view){
		 if(findTrainersForCourse!=null && findTrainersForCourse.trim().length()>0 && !findTrainersForCourse.equalsIgnoreCase("find-leading-training-institutes")){
		  String courseName = findTrainersForCourse.substring(findTrainersForCourse.indexOf("for-")+4, findTrainersForCourse.indexOf("-in"));
		  String city = findTrainersForCourse.substring(findTrainersForCourse.lastIndexOf("-")+1, findTrainersForCourse.length());
		  String subCategory = null;
		  String category = null;
		  view.addObject("courseName", courseName);
		  List<DmnCourse> courseList =  coursesServ.runQuery("from DmnCourse where courseIdentifier='"+courseName+"'", null);
			if(!courseList.isEmpty()){
				DmnCourse course = courseList.get(0);
				subCategory = course.getSubCategory();
				category = course.getCategory();
			}
		  view.addObject("courseNameSetter", subCategory);
		  view.addObject("courseGroupSetter", category);
		  view.addObject("city", city);
		  SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		  String curr_Date = format.format(new Date());
		  List<AppPolyglotBanners> banners =   bannerService.runQuery("from AppPolyglotBanners s where s.cities.cityDesc='"+
				  city+"' and s.courses.courseIdentifier='"+courseName+"' and s.status='APPROVED' and s.isActive='Y'"
				  		+ " and DATE(s.startTime) <= '"+curr_Date+"' AND DATE(s.endTime) > '"+curr_Date+"'", null);
		  List<String[]> dataList = new ArrayList<String[]>(); 
		  for(int temp=0;temp<4;temp++){
				String[] params = new String[2];
				params[0] = "Please Contact us for this Space";
				params[1] = configService.getAdBannerImage();
				dataList.add(params);
		  }
		  if(!banners.isEmpty()){
			   for(int temp=0;temp<banners.size();temp++){
				if(temp<4){
				String[] params = new String[2];
				params[0] = "";
				params[1] = banners.get(temp).getImagePath();
				dataList.set(temp,params);
				}
			  }
			  }
		  view.addObject("addbanners", dataList);
		 }else{
			 List<AppPolyglotBanners> banners =   bannerService.runQuery("from AppPolyglotBanners s where "+
					  " s.status='APPROVED' and s.isActive='Y' and s.cities.cityId=99999", null);
			 List<String[]> dataList = new ArrayList<String[]>(); 
			  for(int temp=0;temp<4;temp++){
					String[] params = new String[2];
					params[0] = "Please Contact us for this Space";
					params[1] = configService.getAdBannerImage();
					dataList.add(params);
			  }
			  if(!banners.isEmpty()){
				   for(int temp=0;temp<banners.size();temp++){
					if(temp<4){
					String[] params = new String[2];
					params[0] = "";
					params[1] = banners.get(temp).getImagePath();
					dataList.set(temp,params);
					}
				  }
				  }
			  view.addObject("addbanners", dataList);
		 }
	}
	
	
	public static String getOrdinalSuffix( int value )
	{
	    int hunRem = value % 100;
	    int tenRem = value % 10;

	    if ( hunRem - tenRem == 10 )
	    {
	        return "th";
	    }
	    switch ( tenRem )
	    {
	    case 1:
	        return "st";
	    case 2:
	        return "nd";
	    case 3:
	        return "rd";
	    default:
	        return "th";
	    }
	}
	
	@RequestMapping(value="AllEvents",method=RequestMethod.GET)
	public ModelAndView fetchAllEventsData(){
		ModelAndView view = new ModelAndView();
		try{
				  	  List<AppPolyglotEvents> events = eventsService.getAll();
				  	 List<AppPolyglotEvents> eventsList = new ArrayList<AppPolyglotEvents>();
					  events.forEach(temp->{
						  Timestamp time = temp.getSchedule();
						    //SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd, yyyy");  
						    SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd, yyyy hh:mm a");  
						    String strDate= formatter.format(time);  
						    temp.setEventDateFormat(strDate);
						    if(time.after(new Date())){
						    	eventsList.add(temp);
							 }
					  });
				  	  view.addObject("data", eventsList);
				  
			}catch(Exception e){
			logger.error("Error Occured While fetchAllCourseData"+e);
		}
		view.setViewName("AllEvents");
		return view;
	}
	
	@RequestMapping(path = "/eventdetails/{eventModifier}", method = RequestMethod.GET)
	public ModelAndView eventdetails(HttpServletRequest request,@PathVariable String eventModifier) {
		logger.debug("Showing event details");
		ModelAndView view = new ModelAndView();
		List<AppPolyglotEvents> eventList = eventsService.runQuery("from AppPolyglotEvents where template.templateType='EVENT' and eventModifier='"+eventModifier+"'", null);
		if(!eventList.isEmpty()){
			AppPolyglotEvents event = eventList.get(0);
			Date d2 = event.getSchedule();
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yy hh.mm.ss.S aa");
			String formattedDate = dateFormat.format(d2).toString();
     	    Date d1 = new Date();
		    long diff = d2.getTime() - d1.getTime();
		    long diffSeconds = diff / 1000 % 60;
		    long diffMinutes = diff / (60 * 1000) % 60;
		    long diffHours = diff / (60 * 60 * 1000);
		    long diffDays = diff / (24 * 60 * 60 * 1000);
		    System.out.println("Time in seconds: " + diffSeconds + " seconds.");
		    System.out.println("Time in minutes: " + diffMinutes + " minutes.");
		    System.out.println("Time in hours: " + diffHours + " hours.");
		    System.out.println("Time in Days: " + diffDays + " Days.");
		    String eventDesc = event.getTemplate().getTemplateContent();
		    eventDesc = eventDesc.replace("${datetime}", String.valueOf(formattedDate));
		    eventDesc = eventDesc.replace("${days}", String.valueOf(diffDays));
		    eventDesc = eventDesc.replace("${hours}", String.valueOf(diffHours));
		    eventDesc = eventDesc.replace("${minutes}", String.valueOf(diffMinutes));
		    eventDesc = eventDesc.replace("${seconds}", String.valueOf(diffSeconds));
		    eventDesc = eventDesc.replace("${city}", event.getCity().getCityDesc());
		    eventDesc = eventDesc.replace("${country}", event.getCountry().getCntryDesc());
		    eventDesc = eventDesc.replace("${organizer}", event.getOrganizer());
		    eventDesc = eventDesc.replace("${venue}", event.getVenue());
		    eventDesc = eventDesc.replace("${location}", event.getLocation());
		    eventDesc = eventDesc.replace("${title}", event.getTitle());
		    view.addObject("template_data", eventDesc);
		    view.addObject("template_title", event.getDescription());
		    view.addObject("meta_title", event.getMetaTitle());
		    view.addObject("meta_description", event.getMetaDescription());
		    view.addObject("meta_keywords", event.getMetaKeywords());
		    view.addObject("eventId", event.getId());
		    view.addObject("time",d2.getTime());
		    view.addObject("eventIdentifier", event.getEventModifier());
		    if(request.getSession().getAttribute("CURRENT_USER")!=null){
				  view.addObject("userLoggedIn", "Y");
			 }else{
				  view.addObject("userLoggedIn", "N");
			}
		}
		view.setViewName("Eventdetails");
		return view;
	}
	
	@RequestMapping(value="/fetchSuggestionsForEvents",method=RequestMethod.POST)
	public @ResponseBody JSONObject  fetchSuggestionsForEvents(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		try{
	    List<AppPolyglotEvents> allEvents = eventsService.getAll();
		Map<String,String> map = new HashMap<String, String>();
	    for(AppPolyglotEvents event : allEvents){
	    	map.put(event.getEventModifier(), event.getTitle());
		}
	    returnObj.accumulate("events", map);
		}catch(Exception e){
			logger.error("Error Occured During Login Module"+e);
		}
		return returnObj;
	}
	
	
	
	@RequestMapping(value="AllNews",method=RequestMethod.GET)
	public ModelAndView fetchAllNewsData(){
		ModelAndView view = new ModelAndView();
		try{
				  	  List<AppPolyglotNews> news = newsService.getAll();
				      news.forEach(temp->{
						  Timestamp time = temp.getSchedule();
						    //SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd, yyyy");  
						    SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd, yyyy hh:mm a");  
						    String strDate= formatter.format(time);  
						    temp.setEventDateFormat(strDate);

					  });
				  	  view.addObject("data", news);
				  
			}catch(Exception e){
			logger.error("Error Occured While fetchAllCourseData"+e);
		}
		view.setViewName("AllNews");
		return view;
	}
	
	@RequestMapping(path = "/newsdetails/{newsModifier}", method = RequestMethod.GET)
	public ModelAndView newsdetails(HttpServletRequest request,@PathVariable String newsModifier) {
		logger.debug("Showing event details");
		ModelAndView view = new ModelAndView();
		List<AppPolyglotNews> newsList = newsService.runQuery("from AppPolyglotNews where template.templateType='NEWS' and eventModifier='"+newsModifier+"'", null);
		if(!newsList.isEmpty()){
			AppPolyglotNews event = newsList.get(0);
			Date d2 = event.getSchedule();
		    Date d1 = new Date();
		    long diff = d2.getTime() - d1.getTime();
		    long diffSeconds = diff / 1000 % 60;
		    long diffMinutes = diff / (60 * 1000) % 60;
		    long diffHours = diff / (60 * 60 * 1000);
		    long diffDays = diff / (24 * 60 * 60 * 1000);
		    System.out.println("Time in seconds: " + diffSeconds + " seconds.");
		    System.out.println("Time in minutes: " + diffMinutes + " minutes.");
		    System.out.println("Time in hours: " + diffHours + " hours.");
		    System.out.println("Time in Days: " + diffDays + " Days.");
		    String eventDesc = event.getTemplate().getTemplateContent();
		    eventDesc.replace("${days}", String.valueOf(diffDays));
		    eventDesc.replace("${hours}", String.valueOf(diffHours));
		    eventDesc.replace("${minutes}", String.valueOf(diffMinutes));
		    eventDesc.replace("${city}", event.getCity().getCityDesc());
		    eventDesc.replace("${country}", event.getCountry().getCntryDesc());
		    eventDesc.replace("${organizer}", event.getOrganizer());
		    eventDesc.replace("${venue}", event.getVenue());
		    eventDesc.replace("${location}", event.getLocation());
		    view.addObject("template_data", eventDesc);
		    view.addObject("template_title", event.getDescription());
		    view.addObject("meta_title", event.getMetaTitle());
		    view.addObject("meta_description", event.getMetaDescription());
		    view.addObject("meta_keywords", event.getMetaKeywords());
		}
		view.setViewName("Newsdetails");
		return view;
	}
	
	@RequestMapping(value="/fetchSuggestionsForNews",method=RequestMethod.POST)
	public @ResponseBody JSONObject  fetchSuggestionsForNews(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		try{
	    List<AppPolyglotNews> allEvents = newsService.getAll();
		Map<String,String> map = new HashMap<String, String>();
	    for(AppPolyglotNews event : allEvents){
	    	map.put(event.getEventModifier(), event.getDescription());
		}
	    returnObj.accumulate("events", map);
		}catch(Exception e){
			logger.error("Error Occured During Login Module"+e);
		}
		return returnObj;
	}
	
	@RequestMapping(path = "/all-trainers/{trainerDesc}", method = RequestMethod.GET)
	public ModelAndView trainers(HttpServletRequest request,@PathVariable String trainerDesc) {
		logger.debug("Showing trainers");
		ModelAndView view = new ModelAndView();
		performTrainersOperations(view,request,trainerDesc);
		return view;
	}
	@RequestMapping(path = "/all-trainers", method = RequestMethod.GET)
	public ModelAndView allTrainers(HttpServletRequest request) {
		logger.debug("Showing trainers");
		ModelAndView view = new ModelAndView();
		performTrainersOperations(view,request,null);
		return view;
	}
	
	private void performTrainersOperations(ModelAndView view,HttpServletRequest request,String trainerDesc){
		List<AppUsers> appUserList = registrationService.runQuery("from AppUsers where userType in ('T','P') and dsblIn='N' and (isPrivate='N' or isPrivate=null or isPrivate='')", null);
		List<AppPolyglotTrainerModel> models = new ArrayList<AppPolyglotTrainerModel>();
		List<Object> cityList = branchService.getCustomQueryData("select distinct city from AppPolyglotBranch");
		Set<String> cities =  new HashSet<String>();
		cityList.forEach((tempObj)->{
			DmnCities cityObj = cityService.load(Integer.valueOf(String.valueOf(tempObj)));
			cities.add(cityObj.getCityDesc());
		});
		
		//Set<Integer> cities = cityList.stream().map(object->Integer.valueOf(String.valueOf(object))).collect(Collectors.toSet());
		if(request.getSession().getAttribute("CURRENT_USER")!=null){
			  view.addObject("userLoggedIn", "Y");
		 }else{
			  view.addObject("userLoggedIn", "N");
		}
		view.addObject("cities", cities);
		List<DmnParams> dmnData = paramsService.runQuery("from DmnParams where section='TRAINER' and dsblIn='N'", null);
		view.addObject("trainerTypes", dmnData);
		appUserList.forEach((temp)->{
			AppPolyglotTrainerModel model = new AppPolyglotTrainerModel();
			model.setAboutUs(temp.getAboutUs());
			model.setPartnerId(String.valueOf(temp.getId()));
			if(!cities.isEmpty())
			model.setCity(cities.iterator().next());
			if(temp.getUserType().equalsIgnoreCase("P")){
				model.setTrainerName(temp.getInstName());
			}else{
				model.setTrainerName(temp.getFname()+" "+temp.getLname());
			}
			model.setEmailId(temp.getEmailId());
			model.setContactNo(temp.getMobile());
			String encoded = Base64.getEncoder().encodeToString(temp.getEmailId().getBytes());
			model.setUser(encoded);
			dmnData.forEach((dnmData)->{
				if(dnmData.getKeyName().equalsIgnoreCase(temp.getUserType())){
					model.setUserType(dnmData.getKeyValue());
				}
			});
			List<AppPolyglotCourse> coursesList = appCourseService.runQuery("from AppPolyglotCourse where appUsers.id="+temp.getId(), null);
			Map<String,String> courseList = new HashMap<String,String>();
			coursesList.forEach((course)->{
				if(course.getDmnCourseId()!=null){
				DmnCourse courseData = coursesServ.load(course.getDmnCourseId());  
				courseList.put(courseData.getCourseName(),courseData.getTn3ImagePath());
				}
			});
			model.setCourses(courseList);
			models.add(model);
		});
		if(trainerDesc!=null){
			String[] courseArray = trainerDesc.split("-");
			if(courseArray.length>0){
				view.addObject("cityData",courseArray[courseArray.length-1]);
			}
			String courseIdentifier = trainerDesc.substring(trainerDesc.indexOf("for")+4,trainerDesc.indexOf("-in"));
			List<DmnCourse> courses = coursesServ.runQuery("from DmnCourse where courseIdentifier='"+courseIdentifier+"'", null);
			if(!courses.isEmpty())
			view.addObject("courseName", courses.get(0).getCourseName());
			//view.addObject("city", courseArray[7]);
		}
		/*if(city!=null){
			view.addObject("city", city);
		}
		if(courseId!=null){
			view.addObject("courseId", courseId);
		}*/
		generateAdBanners(null, view);
		view.setViewName("AllTrainers");
		view.addObject("trainerData", models);
	}
	
	@RequestMapping(value="performSubscription",method=RequestMethod.POST)
	public @ResponseBody JSONObject  performSubscription(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		AppTrainerSubscriptions sub = new AppTrainerSubscriptions();
		AppUsers userObj = (AppUsers)request.getSession().getAttribute("CURRENT_USER");
		if(request.getParameter("courseId")==null && request.getParameter("partnerId")!=null){
			sub.setStudentId(userObj.getId());
			sub.setPartnerId(request.getParameter("partnerId"));
			sub.setSubscribed("Y");
			sub.setCourseId("ALL");
			List<AppTrainerSubscriptions> subList = subscriptionService.runQuery("from AppTrainerSubscriptions where studentId="
					+sub.getStudentId()+" and partnerId='"+sub.getPartnerId()+"'"
							+ "and courseId='"+sub.getCourseId()+"'", null);
			if(subList==null || subList.isEmpty()){
				subscriptionService.save(sub);
				returnObj.accumulate("status", "Y");
			}else{
				returnObj.accumulate("status", "N");
			}
		}else{
			sub.setStudentId(userObj.getId());
			sub.setPartnerId(request.getParameter("partnerId"));
			sub.setCourseId(request.getParameter("courseId"));
			sub.setSubscribed("Y");
			List<AppTrainerSubscriptions> subList = subscriptionService.runQuery("from AppTrainerSubscriptions where studentId="
					+sub.getStudentId()+" and partnerId='"+sub.getPartnerId()+"'"
							+ "and courseId='"+sub.getCourseId()+"'", null);
			if(subList==null || subList.isEmpty()){
				subscriptionService.save(sub);
				returnObj.accumulate("status", "Y");
			}else{
				returnObj.accumulate("status", "N");
			}
		}
		
		return  returnObj;
	}
	
	
	@RequestMapping(value="performBatchSubscription",method=RequestMethod.POST)
	public @ResponseBody JSONObject  performBatchSubscription(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		AppUsers userObj = (AppUsers)request.getSession().getAttribute("CURRENT_USER");
		if(request.getParameter("batchId")!=null && request.getParameter("courseId")!=null){
			List<AppPolyglotLead> leadData = leadService.runQuery("from AppPolyglotLead where courseId="+request.getParameter("courseId")+" and userId="+userObj.getId(), null);
			if(leadData.isEmpty()){
			AppPolyglotBatch batch = batchService.load(Integer.valueOf(request.getParameter("batchId")));
			AppPolyglotLead leadObj = new AppPolyglotLead();
			leadObj.setPartnerId(batch.getAppUsers().getId());
			leadObj.setUserId(userObj.getId());
			leadObj.setMode(batch.getMode());
			leadObj.setPreferredTime(batch.getStartDate());
			leadObj.setBranchId(batch.getBranchId());
			leadObj.setCourseId(batch.getCourseId());
			leadObj.setLeadStatus("REGISTERED");
			leadObj.setBatchId(String.valueOf(batch.getBatchId()));
			leadObj.setCreatedDate(new Timestamp(new Date().getTime()));
			leadObj.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			leadObj.setLastInsrtUpdUsrId(userObj.getId());
			leadObj.setSource("www.tadaay.com");
			leadService.save(leadObj);
			//email trigger
			AppPolyglotBranch branch = branchService.load(batch.getBranchId());
			DmnCourse course = coursesServ.load(batch.getCourseId());
			emailService.sendEmailAck(course.getCourseName(), branch.getName(), userObj.getEmailId(), "enroll");
			returnObj.accumulate("status", "Y");
			}else{
				returnObj.accumulate("status", "N");
			}	
		}
		return  returnObj;
	}
	
	@RequestMapping(value="performDemoSubscription",method=RequestMethod.POST)
	public @ResponseBody JSONObject  performDemoSubscription(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		AppUsers userObj = (AppUsers)request.getSession().getAttribute("CURRENT_USER");
		if(request.getParameter("demoId")!=null && request.getParameter("courseId")!=null){
			List<AppPolyglotLead> leadData = leadService.runQuery("from AppPolyglotLead where courseId="+request.getParameter("courseId")+" and userId="+userObj.getId(), null);
			if(leadData.isEmpty()){
			AppPolyglotDemo demo = demoService.load(Integer.valueOf(request.getParameter("demoId")));
			AppPolyglotLead leadObj = new AppPolyglotLead();
			leadObj.setPartnerId(demo.getAppUsers().getId());
			leadObj.setUserId(userObj.getId());
			leadObj.setMode(demo.getMode());
			leadObj.setPreferredTime(demo.getDateTime());
			leadObj.setBranchId(demo.getBranchId());
			leadObj.setCourseId(demo.getCourseId());
			leadObj.setLeadStatus("INVITED");
			leadObj.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			leadObj.setLastInsrtUpdUsrId(userObj.getId());
			leadObj.setSource("www.tadaay.com");
			leadService.save(leadObj);
			
			AppPolyglotLeadDemoStatus leadStatus = new AppPolyglotLeadDemoStatus();
			leadStatus.setDemoId(demo.getId());
			leadStatus.setLeadId(leadObj.getId());
			leadStatus.setPartnerId(leadObj.getPartnerId());
			leadStatus.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			leadStatus.setLastInsrtUpdUsrId(userObj.getId());
			leadStatus.setInviteStatus("REGISTERED");
			leadStatus.setEmailId(userObj.getEmailId());
			leadStatus.setFirstName("F");
			leadStatus.setLastName("L");
			leadDemoStatusService.save(leadStatus);
			returnObj.accumulate("status", "Y");
			}else{
				returnObj.accumulate("status", "N");
			}
				
		}
		return  returnObj;
	}
	
	@RequestMapping(path = "/trainers/{trainerModifier}", method = RequestMethod.GET)
	public ModelAndView trainerdetails(HttpServletRequest request,@PathVariable String trainerModifier) {
		logger.debug("Showing trainerdetails");
		ModelAndView view = new ModelAndView();
		byte[] s = Base64.getMimeDecoder().decode(trainerModifier);
		String file_string = "";
		for(int i = 0; i < s.length; i++)
		{
		    file_string += (char)s[i];
		}
		List<AppUsers> appUserList = registrationService.runQuery("from AppUsers where emailId = '"+file_string+"' and dsblIn='N'", null);
		AppUsers userObj = appUserList.get(0);
		AppUsersSocialMedia media = userObj.getSocialMediaProfile();
		if(media!=null){
			view.addObject("websiteUrl", media.getWebsiteUrl());	
		}
		view.setViewName("TrainerDetails");
		view.addObject("wallmsg", userObj.getWallMessage());
		view.addObject("contactNo", userObj.getMobile());
		view.addObject("aboutUs", userObj.getAboutUs());
		view.addObject("userId", userObj.getId());
		view.addObject("user", trainerModifier);
		view.addObject("contactEmail", userObj.getEmailId());
		 if(request.getSession().getAttribute("CURRENT_USER")!=null){
			  view.addObject("userLoggedIn", "Y");
		  }else{
			  view.addObject("userLoggedIn", "N");
		  }
		Set<AppPolyglotBranch> branchList =  userObj.getAppPolyglotBranches();
		Set<AppPolyglotCourse> coursesList =  userObj.getAppPolyglotCourses();
		//Set<AppPolyglotDemo> demoList = userObj.getAppPolyglotDemos();
		List<AppPolyglotDemo> demoList = demoService.runQuery("from AppPolyglotDemo where isActive!='N' "
				+ "and demoStatus='SCHEDULED' and appUsers.id="+userObj.getId(), null);
		//Set<AppPolyglotBatch> batchList = userObj.getAppPolyglotBatches();
		List<AppPolyglotBatch> batchList = batchService.runQuery("from AppPolyglotBatch where batchStatus='SCHEDULED' "
				+ "and appUsers.id="+userObj.getId(), null);
		Set<DmnCourse> courseMap = new HashSet<DmnCourse>();
		for(AppPolyglotCourse course : coursesList){
			if(course.getIsActive()==null || course.getIsActive().equalsIgnoreCase("Y")){
			DmnCourse courseRef  = coursesServ.load(course.getDmnCourseId());
			String courseType = "";
			if(course.getOnline()!=null && course.getOnline().equalsIgnoreCase("Y")){
				courseType = "Online";
			}
			if(course.getClassroom()!=null && course.getClassroom().equalsIgnoreCase("Y")){
				if(courseType!="")
				courseType = courseType+" Classroom";
				else
				courseType = "Classroom";
			}
			courseRef.setAddCourseInfo(courseType);
			courseMap.add(courseRef);
			}
		}
		List<AppPolyglotBranch> filteredList = branchList.stream().filter(i -> (i.getIsActive()==null || i.getIsActive().equalsIgnoreCase("Y"))).collect(Collectors.toList());
		filteredList.stream().forEach(u -> {
			DmnCities cityObj = cityService.load(Integer.valueOf(u.getCity()));
			u.setCity(cityObj.getCityDesc());
		});
		if(branchList!=null && !branchList.isEmpty()){
			AppPolyglotBranch branch = branchList.iterator().next();
			view.addObject("mainBranch",branch);
		}
		List<AppPolyglotDemoModel> demoDataList = new ArrayList<>();
		demoList.stream().forEach((temp)->{ 
			try{
			AppPolyglotDemoModel model = new AppPolyglotDemoModel();
			if(temp.getDateTime()!=null){
				 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
				    String dateArr[] = temp.getDateTime().split(" ");
					Date startDate = format.parse(dateArr[0]);
					if(startDate.after(new Date())){
					model.setStartDate(dateArr[0]);
					model.setHourOfDay(dateArr[1]+dateArr[2]);
			
			List<Object> data = appCourseService.getCustomData("select dmnCourseId from AppPolyglotCourse where id="+temp.getCourseId());
		    if(!data.isEmpty()){
		    	List<Object> dmnCourseName = appCourseService.getCustomData("select courseName from DmnCourse where id="+Integer.valueOf(String.valueOf(data.get(0))));
		    	model.setCourseName(String.valueOf(dmnCourseName.get(0)));
		    }
		    List<Object> fcltydata =  facultyService.getCustomData("from AppPolyglotFaculty where id="+temp.getFacultyId());
		    if(!fcltydata.isEmpty()){
		    	AppPolyglotFaculty faculty = (AppPolyglotFaculty)fcltydata.get(0);
		    	if(faculty.getIsPrivate()!=null && faculty.getIsPrivate().equalsIgnoreCase("Y")){
		    		model.setFacultyName("XXXXXX");
		    	}else{
		    		model.setFacultyName(faculty.getAppUsers().getFname()+" "+faculty.getAppUsers().getLname());	
		    	}
		    }
		    
		    model.setCourseId(temp.getCourseId());
		    model.setId(temp.getId());
		    demoDataList.add(model);
			}
					}
		}catch(Exception e){
		logger.error("Error occured while demo date"+e.getMessage());
		}
		});
		List<AppPolyglotBatchModel> batchModelList = new ArrayList<>();
		batchList.stream().forEach((temp)->{
			try{
			AppPolyglotBatchModel model = new AppPolyglotBatchModel();
			if(temp.getStartDate()!=null){
			    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			    String dateArr[] = temp.getStartDate().split(" ");
				Date startDate = format.parse(dateArr[0]);
				if(startDate.after(new Date())){
				model.setStartDate(dateArr[0]);
				model.setHourOfDay(dateArr[1]+dateArr[2]);
			List<Object> data = appCourseService.getCustomData("select dmnCourseId from AppPolyglotCourse where id="+temp.getCourseId());
		    if(!data.isEmpty()){
		    	List<Object> dmnCourseName = appCourseService.getCustomData("select courseName from DmnCourse where id="+Integer.valueOf(String.valueOf(data.get(0))));
		    	model.setCourseName(String.valueOf(dmnCourseName.get(0)));
		    }
		    AppPolyglotFaculty faculty =  temp.getAppPolyglotFaculty();
		       if(faculty!=null){
		    	if(faculty.getIsPrivate()!=null && faculty.getIsPrivate().equalsIgnoreCase("Y")){
		    		model.setFacultyName("XXXXXX");
		    	}else{
		    		AppUsers userData =  faculty.getAppUsers();
		    		if(userData!=null)
		    		model.setFacultyName(userData.getFname()+" "+userData.getLname());	
		    	}
		       }
		    
		    model.setCourseId(temp.getCourseId());
		    model.setId(temp.getBatchId());
		    batchModelList.add(model);
				}
		 }
			}catch(Exception e){
				logger.error("Exception in date formate"+e.getMessage());
			}
		});
		view.addObject("demoList", demoDataList);
		view.addObject("coursesList", courseMap);
		view.addObject("branchList", branchList);
		view.addObject("batchList", batchModelList);
		return view;
	}
	
	
	@RequestMapping(value="performEventSubscription",method=RequestMethod.POST)
	public @ResponseBody JSONObject  performEventSubscription(HttpServletRequest request){
		JSONObject returnObj = new JSONObject();
		AppUsers userObj = (AppUsers)request.getSession().getAttribute("CURRENT_USER");
		if(request.getParameter("eventId")!=null){
			List<AppPolyglotEventSubscription> eventData = eventSubService.runQuery("from AppPolyglotEventSubscription where status='ENROLLED' and  eventId="+request.getParameter("eventId")+" and appUserId="+userObj.getId(), null);
			if(eventData.isEmpty()){
			AppPolyglotEventSubscription leadObj = new AppPolyglotEventSubscription();
			leadObj.setAppUserId(userObj.getId());
			leadObj.setEventId(Integer.valueOf(request.getParameter("eventId")));
			leadObj.setLastInsrtUpdTs(new Timestamp(new Date().getTime()));
			leadObj.setLastInsrtUpdUsrId(userObj.getId());
			leadObj.setStatus("ENROLLED");
			eventSubService.save(leadObj);
			returnObj.accumulate("status", "Y");
			}else{
			   returnObj.accumulate("status", "N");
			}	
		}
		return  returnObj;
	}
	
}

class CourseComparator implements Comparator<DmnCourse>
{
	@Override
	public int compare(DmnCourse o1, DmnCourse o2) {
		return o1.getPriortyNo().compareTo(o2.getPriortyNo());
	}
}

class BatchComparator implements Comparator<AppPolyglotBatch>
{
	@Override
	public int compare(AppPolyglotBatch o1, AppPolyglotBatch o2) {
		 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm");
		 Date dd = null;
		 Date dd1 = null;
		 if(o1.getStartDate()==null || o2.getStartDate()==null){
			 return -1;
		 }
		 try{
		  dd = format.parse(o1.getStartDate());
		  dd1 = format.parse(o2.getStartDate());
		 	}catch(Exception e){
		 }
		 if (dd.before(dd1)) {
	            return -1;
	        } else if (dd.after(dd1)) {
	            return 1;
	        } else {
	            return 0;
	        }    
		 
	}
}