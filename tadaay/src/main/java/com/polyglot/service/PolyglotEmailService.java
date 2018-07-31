package com.polyglot.service;

import java.io.StringWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.log.NullLogChute;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazonaws.services.simpleemail.AWSJavaMailTransport;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.MessageAttributeValue;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;
import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.domain.AppPolyglotDemo;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.domain.AppPolyglotTemplates;
import com.polyglot.domain.AppUsers;
import com.polyglot.utils.PolyglotFileUtils;

@Service
public class PolyglotEmailService {

	private Logger logger = Logger.getLogger(PolyglotEmailService.class);

	final String BODY = "Thanks for enrolling for course";
	final String SUBJECT = "Thanks for enrolling";

	private ConfigurationService configService;

	@Autowired
	public void setConfigService(ConfigurationService configService) {
		this.configService = configService;
	}
	
	@Autowired
	private AppPolyglotTemplatesService templateService;

	/**
	 * Method to send SMS message to a given number using AWS
	 */
	public void sendSMS() {

		try {
			Map<String, MessageAttributeValue> smsAttributes = new HashMap<String, MessageAttributeValue>();
			AmazonSNSClient snsClient = new AmazonSNSClient();
			String message = "My SMS message";
			String phoneNumber = "+918801441330";
			PublishResult result = snsClient.publish(new PublishRequest().withMessage(message)
					.withPhoneNumber(phoneNumber).withMessageAttributes(smsAttributes));
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	/**
	 * Method to setup the AWS Mail properties
	 * 
	 * @return
	 */
	public Session getMailProperties() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", configService.getMailProtocol());
		props.setProperty("mail.aws.user", configService.getMailAWSUser());
		props.setProperty("mail.aws.password", configService.getMailAWSPassword());
		Session session = Session.getInstance(props);
		// Create a new Message

		return session;
	}

	public void sendMailForLead(AppPolyglotLead lead, AppPolyglotBatch batch, String email, String courseName,
			HttpServletRequest request) {
		logger.debug("context path : " + request.getContextPath());
		String serverName = request.getServerName();
		int portNumber = request.getServerPort();
		String contextPath = request.getContextPath();

		String link = "http://" + serverName + ":" + portNumber + contextPath + "/registerForBatch?batchId="
				+ batch.getBatchId() + "&leadId=" + lead.getId() + "&partnerId=" + batch.getAppUsers().getId();
		try {
			Map<String, String> params = new HashMap<String, String>();
			params.put("courseName", courseName);
			params.put("batchId", String.valueOf(batch.getBatchId()));
			params.put("courseDate", batch.getStartDate());
			params.put("registrationURL", link);
			Map<String, String> addressMap = new HashMap<String, String>();
			addressMap.put("TO", email);
			initiateEmailTrigger(addressMap, "Thanks for registering for course", params, "Lead Batch");
		} catch (Exception ex) {
			logger.error("Exception while sending the mail for lead:"+ex, ex);
		}

	}
	
	public void sendMailForDemo(AppPolyglotLead lead, AppPolyglotDemo demo, int userId, String email, String courseName,
			HttpServletRequest request) {
		logger.debug("context path : " + request.getContextPath());
		String serverName = request.getServerName();
		int portNumber = request.getServerPort();
		String contextPath = request.getContextPath();

		String link = "http://" + serverName + ":" + portNumber + contextPath + "/registerForDemo?demoId="
				+ demo.getId() + "&leadId=" + lead.getId() + "&partnerId=" + userId;
		try {
			Map<String, String> params = new HashMap<String, String>();
			params.put("courseName", courseName);
			params.put("courseDate", demo.getDateTime());
			params.put("registrationURL", link);
			Map<String, String> addressMap = new HashMap<String, String>();
			addressMap.put("TO", email);
			initiateEmailTrigger(addressMap, "Thanks for registering for Demo", params, "Lead Demo");
		} catch (Exception ex) {
			logger.error("Exception while sending the mail for demo:"+ex, ex);
		}

	}
	
	public void sendEmailAck(String courseName, String branchName, String email, String type) {
		logger.debug("Inside of sendEmailAck");
		try {
			Map<String, String> addressMap = new HashMap<String, String>();
			addressMap.put("TO", email);
			Map<String, String> params = new HashMap<String, String>();
			if("enroll".equalsIgnoreCase(type)){
				params.put("courseName", courseName);
				params.put("branchName", branchName);
				initiateEmailTrigger(addressMap, "Course Enrollment Acknowledgement", params, "Enroll_Ack");
			}
		} catch (Exception ex) {
			logger.error("Exception while sending the mail for demo:"+ex, ex);
		}

	}
	
	public void sendEmailContent(String content, String email, String type) {
		logger.debug("Inside of sendCourseContent");
		try {
			Map<String, String> addressMap = new HashMap<String, String>();
			addressMap.put("TO", email);
			Map<String, String> params = new HashMap<String, String>();
			if("Course".equalsIgnoreCase(type)){
				params.put("courseContent", content);
				initiateEmailTrigger(addressMap, "Course Details", params, "Course Content");
			}else if("Video".equalsIgnoreCase(type)){
				params.put("videoContent", content);
				initiateEmailTrigger(addressMap, "Video Details", params, "Video Content");
			}else if("Comments".equalsIgnoreCase(type)){
				params.put("comments", content);
				initiateEmailTrigger(addressMap, "Comments", params, "Comments");
			}
		} catch (Exception ex) {
			logger.error("Exception while sending the mail for demo:"+ex, ex);
		}

	}

	private void sendMailThroughTemplates(String toList, String subject, String templateName,
			Map<String, String> params) {
		try {
			logger.debug("sendMailThroughTemplates");
			Session session = getMailProperties();
			MimeMessage msg = new MimeMessage(session);
			logger.debug("sendMailThroughTemplates msg"+msg);
			msg.setFrom(new InternetAddress(configService.getFromAddress()));
			logger.debug("sendMailThroughTemplates from"+configService.getFromAddress()+" to "+toList);
			msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(toList));
			msg.setSubject(subject);
			VelocityEngine ve = new VelocityEngine();
			java.util.Properties props = new java.util.Properties();
			props.setProperty(Velocity.RUNTIME_LOG_LOGSYSTEM_CLASS,    NullLogChute.class.getName()); 
			//Velocity.init(props);
			ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
			ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
			try{
				ve.init(props);
			}catch(Exception e){
				logger.error("error creating velocity templates");
			}
			/* next, get the Template */
			Template t = ve.getTemplate(templateName);
			logger.debug("sendMailThroughTemplates templateName"+templateName);
			/* create a context and add data */
			VelocityContext context = new VelocityContext();
			params.forEach((k, v) -> context.put(k, v));
			StringWriter writer = new StringWriter();
			t.merge(context, writer);
			msg.setContent(writer.toString(), "text/html; charset=utf-8");
			sendMail(msg, session);
			logger.debug("sendMailThroughTemplates exit");
		} catch (Exception e) {
			logger.error(e);
		}
	}

	public void sendForGotPasswordLink(String emailId, String userName, HttpServletRequest request) {
		try {
			logger.debug("context path : " + request.getContextPath());
			String serverName = request.getServerName();
			String methodType = request.getProtocol().substring(0, request.getProtocol().indexOf("/"));
			logger.debug("sendForGotPasswordLink"+methodType);
			int portNumber = request.getServerPort();
			String contextPath = request.getContextPath();
			String encoded = Base64.getEncoder().encodeToString(emailId.getBytes());
			String link = methodType + "://" + serverName + ":" + portNumber + contextPath + "/resetPassword?emailId="
					+ encoded;
			logger.debug("sendForGotPasswordLink link"+link);
			Map<String, String> params = new HashMap<String, String>();
			params.put("user", userName);
			params.put("registrationURL", link);
			sendMailThroughTemplates(emailId, "Tadaay - Reset Password", "templates/forgotPassword.vm", params);
		} catch (Exception e) {
			logger.error(e);
		}
	}

	public void sendMail(MimeMessage msg, Session session) {
		try {
			logger.debug("sendMail entry");
			Transport t = new AWSJavaMailTransport(session, null);
			t.connect();
			t.sendMessage(msg, null);
			t.close();
			logger.debug("sendMail exit");
		} catch (Exception e) {
			logger.error("Error while sedning mail." + e, e);
		}
	}

	public int getRandomNumber(int min, int max) {
		return (int) Math.floor(Math.random() * (max - min + 1)) + min;
	}

	public int sendMailForOTPRegistration(String emailId) {
		int otp = getRandomNumber(100000, 999999);
		try {
			Session session = getMailProperties();
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(configService.getFromAddress()));
			msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(emailId));
			msg.setSubject("Welcome to tadaay : new user OTP");
			msg.setText("OTP for new user Registration on Tadaay is " + otp);
			msg.saveChanges();
			sendMail(msg, session);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		return otp;
	}
	
	public   void sendMailForQuestion(String emailId,String mobile,String query,String name){
    	try{        
    	Session session = getMailProperties();
		MimeMessage msg = new MimeMessage(session);
    	msg.setFrom(new InternetAddress("info@tadaay.com"));
    	msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(configService.getQuestionareEmail()));
    	msg.setSubject("Tadaay Queries");
    	msg.setText("Name : "+name+"\n Email : "+emailId+"\n  Mobile : "+mobile+"\n Query : "+query+"\n ");
    	msg.saveChanges();
    	sendMail(msg,session);
        }catch(Exception e){
        	System.out.println(e);
        }
    }
	
	public void requestMailTriggers(String type,HttpServletRequest request) {
		try {
			Map<String, String> params = new HashMap<String, String>();
			AppUsers userObj = (AppUsers)request.getSession().getAttribute("CURRENT_USER");
			params.put("emailId", userObj.getEmailId());
			params.put("mobile", userObj.getMobile());
			params.put("firstName", userObj.getFname());
			params.put("lastName", userObj.getLname());
			if(type.equalsIgnoreCase("D")){
				sendMailThroughTemplates(request.getParameter("emailId"), "Tadaay - Request Demo", "templates/requestDemo.vm", params);
			}else{
				sendMailThroughTemplates(request.getParameter("emailId"), "Tadaay - Request CallBack", "templates/requestCallBack.vm", params);
			}
			
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	/**
	 * 
	 * @param emailId
	 * @param firstName
	 * @param lastName
	 * @param request
	 */
	public void invitesEmail(String emailId, String firstName, String lastName, 
			HttpServletRequest request) {
		try {
			logger.debug("Entry of invitesEmail");
			String serverName = request.getServerName();
			String methodType = request.getProtocol().substring(0, request.getProtocol().indexOf("/"));
			int portNumber = request.getServerPort();
			String contextPath = request.getContextPath();
			String encoded = Base64.getEncoder().encodeToString(emailId.getBytes());
			String link = methodType + "://" + serverName + ":" + portNumber + contextPath + "/resetPassword?emailId="
					+ encoded;

			Map<String, String> params = new HashMap<String, String>();
			params.put("firstName", firstName);
			params.put("lastName", lastName);
			params.put("registrationURL", link);
			
			Map<String, String> addrMap = new HashMap<String, String>();
			addrMap.put("TO", emailId);
			initiateEmailTrigger(addrMap, "Tadaay - Account Setup", params, "INVITES_TMPLATE");
			logger.debug("End of invitesEmail");
		} catch (Exception ex) {
			logger.error("Exception while sending email:"+ex, ex);
		}
	}
	
	/**
	 * Generic Method for email trigger
	 * @param receipentMap
	 * @param subject
	 * @param attributes
	 * @param templateName
	 */
	private void initiateEmailTrigger(Map<String, String> addressMap, String subject, Map<String, String> attributes, String templateName){
		logger.debug("Entry of intiateEmailTrigger");
		String mailContent = "";
		/**check if we need to initiate the email*/
		if(!PolyglotFileUtils.isEmpty(configService.getDryRunEmail()) && !Boolean.parseBoolean(configService.getDryRunEmail())){
			/**Get the mail properties*/
			Session session = getMailProperties();
			mailContent = prepMailContent(templateName, attributes);
			/**email trigger invocation*/
			sendMail(prepareMimeMsgAttr(subject, addressMap, mailContent, session), session);
		}else{
			logger.debug("dry run email value set as"+configService.getDryRunEmail()+":hence email trigger is not initiated");
		}
		logger.debug("Exit of intiateEmailTrigger");
	}
	
	/**
	 * 
	 * @param tmpName
	 * @param contentMap
	 * @return
	 */
	private String prepMailContent(String tmpName, Map<String, String> contentMap){
		logger.debug("Entry of mailContent");
		String content = "";
		content = readMailDataFromDB(tmpName);
		logger.debug("content map is:"+contentMap);
		if("INVITES_TMPLATE".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$fname", contentMap.get("firstName"))
						.replace("$lname", contentMap.get("lastName"));
				//replace the url
				content = content.replace("$registrationURL", contentMap.get("registrationURL"));
			}
		}else if("Lead Batch".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$courseName", contentMap.get("courseName"))
						.replace("$courseDate", contentMap.get("courseDate"));
				//replace the url
				content = content.replace("$registrationURL", contentMap.get("registrationURL"));
			}
		}else if("Lead Demo".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$courseName", contentMap.get("courseName"))
						.replace("$courseDate", contentMap.get("courseDate"));
				//replace the url
				content = content.replace("$registrationURL", contentMap.get("registrationURL"));
			}
		}else if("Course Content".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$courseContent", contentMap.get("courseContent"));
			}
		}else if("Video Content".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$videoContent", contentMap.get("videoContent"));
			}
		}
		else if("Comments".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$comments", contentMap.get("comments"));
			}
		}else if("Enroll_Ack".equalsIgnoreCase(tmpName)){
			if(!PolyglotFileUtils.isEmpty(content)){
				content = content.replace("$courseName", contentMap.get("courseName"));
				content = content.replace("$branchName", contentMap.get("branchName"));
			}
		}
		logger.debug("Exit of mailContent");
		return content;
	}
	
	/**
	 * 
	 * @param tmpName
	 * @return
	 */
	private String readMailDataFromDB(String tmpName){
		logger.debug("Entry of readMailDataFromDB");
		String template_content = "";
		String sqlTemplate = null;
		Map<String, String> paramsTemplate = new HashMap<String, String>();
		try {
			/**Read the template text from app_polyglot_templates table*/
			/**read the content based on template name*/
			sqlTemplate = "from AppPolyglotTemplates t where t.templateName =:templateName and t.templateType =:templateType";
			paramsTemplate.put("templateName", tmpName);
			paramsTemplate.put("templateType", "EMAIL");
			List<AppPolyglotTemplates> templateLst  = templateService.runQuery(sqlTemplate, paramsTemplate);
			if(!PolyglotFileUtils.isEmpty(templateLst)){
				AppPolyglotTemplates template = new AppPolyglotTemplates();
				template = templateLst.get(0);
				template_content = template.getTemplateContent();
			}
		} catch (Exception ex) {
			logger.error("Exception while reading the template data from table:"+ex, ex);
		}
		logger.debug("Exit of readMailDataFromDB");
		return template_content;
	}
	
	/**
	 * MimeMessage attributes setting method
	 * @param subject
	 * @param receipentMap
	 * @param emailContent
	 * @param session
	 * @return
	 */
	private MimeMessage prepareMimeMsgAttr(String subject, Map<String, String > receipentMap, String emailContent, Session session){
		logger.debug("Entry of prepareMimeMsgAttr");
		MimeMessage msg = null;
		try {
			logger.debug("receipentMap is:"+receipentMap);
			msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(configService.getFromAddress()));
			msg.setSubject(subject);
			if(!PolyglotFileUtils.isEmpty(receipentMap) && !PolyglotFileUtils.isEmpty(receipentMap.get("TO"))){
				msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receipentMap.get("TO")));
			}if(!PolyglotFileUtils.isEmpty(receipentMap) && !PolyglotFileUtils.isEmpty(receipentMap.get("CC"))){
				msg.addRecipient(MimeMessage.RecipientType.CC, new InternetAddress(receipentMap.get("CC")));
			}if(!PolyglotFileUtils.isEmpty(receipentMap) && !PolyglotFileUtils.isEmpty(receipentMap.get("BCC"))){
				msg.addRecipient(MimeMessage.RecipientType.BCC, new InternetAddress(receipentMap.get("BCC")));
			}
			msg.setContent(emailContent, "text/html; charset=utf-8");
		} catch (AddressException ae) {
			logger.error("Exception while adding email receipents:"+ae, ae);
		} catch (MessagingException me) {
			logger.error("Exception while adding attributes to mimemessage:"+me, me);
		}
		logger.debug("Exit of prepareMimeMsgAttr");
		return msg;
	}
}
