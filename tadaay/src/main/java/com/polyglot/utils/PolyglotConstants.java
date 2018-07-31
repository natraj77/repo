package com.polyglot.utils;

public interface PolyglotConstants {
	public static final String UPLOAD_LOCATION = "/home/polyglot/uploads";
	public static final String VIDEOS_FOLDER = "VIDEOS";
	public static final String DOCS_FOLDER = "DOCS";
	public static final String PLY_BATCH_NUMBER = "PLYB10000";
	
	public static final String BATCH_STATUS_PROPOSED = "PROPOSED";//Start date should be Take the current date
	public static final String BATCH_STATUS_CONFIRMED = "CONFIRMED";//sheduled -- will get a start date for the batch
	public static final String BATCH_STATUS_IN_PROGRESS = "IN PROGRESS"; //After clicking on start batch. if date is current date.
	public static final String BATCH_STATUS_CANCELLED = "CANCELLED";
	public static final String BATCH_STATUS_COMPLETED = "COMPLETED";
	public static final String BATCH_STATUS_SCHEDULED = "SCHEDULED"; //If future date on start a batch
	public static final String APP_LEAD_XML = "AppPolyglotLead.xml";
	public static final String APP_POLYGLOT_USER = "CURRENT_USER";
	public static final String BATCH_STATUS_ARCHIVED = "ARCHIVED";
	
	public static final String STUDENT_STATUS_INVITED = "INVITED";
	public static final String STUDENT_STATUS_REGISTERD = "REGISTERED";//This status is only after we publish the batch from batch page. 
																		//And in payments page, we only show students who are registered.
	public static final String STUDENT_STATUS_ENROLLED = "ENROLLED";
	public static final String APP_POLYGLOT_DEFAULT_PLAN = "DEFAULT PLAN";
	public static final String APP_POLYGLOT_LEAD_STATUS_IMPORTED = "IMPORTED";
	public static final String APP_POLYGLOT_LEAD_DEMO_STATUS_INVITED = "INVITED FOR DEMO";
	public static final String APP_POLYGLOT_LEAD_DEMO_STATUS_ATTENDED = "ATTENDED DEMO";
	public static final String APP_POLYGLOT_DEFAULT_PLAN_DURATION = "Monthly";
	
	public static final String DEMO_STATUS_SCHEDULED = "SCHEDULED";
	public static final String DEMO_STATUS_CANCELLED = "CANCELLED";
	public static final String DEMO_STATUS_RESCHEDULED = "RESCHEDULED";
	public static final String DEMO_STATUS_COMPLETED = "COMPLETED";
	public static final String DEMO_STATUS_ARCHIVED = "ARCHIVED";
	
	public static final String USER_TYPE_USER = "U";
	public static final String USER_TYPE_PARTNER = "P";
	
	public static final String TASK_STATUS_ASSIGNED = "ASSIGNED";
	public static final String TASK_STATUS_IN_PROGRESS = "IN PROGRESS";
	
	public static final String Y_STR = "Y";
	public static final String N_STR = "N";
	
	public static final String LEAD_STATUS_INVITED = "INVITED";
	public static final String LEAD_STATUS_REGISTERD = "REGISTERED";
	public static final String LEAD_STATUS_INVALID = "INVALID";
	
	public static final String REGISTERED = "REGISTERED";
	public static final String INVITED = "INVITED";
	public static final String DROPPED = "DROPPED";
	public static final String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
	
	public static final String PERMISSION_VIEW_CONTACT_LEAD = "viewContactLead";
	public static final String PERMISSION_ADD_NEW_BATCH = "addNewBatch";
	public static final String PERMISSION_ADD_DEMO = "addDemo";
	public static final String PERMISSION_FORM_BATCH = "formBatch";
	public static final String PERMISSION_PAYMENT_TRACKING = "paymentTracking";
	public static final String PERMISSION_CUSTOM_RULE_ENGINE = "customRuleEngine";
	public static final String PERMISSION_EMAIL_TEMPLATE = "emailTemplate";
	public static final String PERMISSION_ONLINE_QUIZ = "onlineQuiz";
	public static final String PERMISSION_COURSE_CERTIFICATE = "courseCertificate";
			

}
