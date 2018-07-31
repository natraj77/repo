package com.polyglot.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ConfigurationService {

	@Value("${mail.from.address}")
	private String fromAddress;

	@Value("${mail.transport.protocol}")
	private String mailProtocol;

	@Value("${mail.aws.user}")
	private String mailAWSUser;

	@Value("${mail.aws.password}")
	private String mailAWSPassword;

	@Value("${upload.location}")
	private String uploadLocation;
	
	@Value("${questionare.mailId}")
	private String questionareEmail;
	
	@Value("${adBanner.image}")
	private String adBannerImage;
	
	@Value("${dry.run.email}")
	private String dryRunEmail;
	
	@Value("${dry.run.sms}")
	private String dryRunSms;

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getMailProtocol() {
		return mailProtocol;
	}

	public void setMailProtocol(String mailProtocol) {
		this.mailProtocol = mailProtocol;
	}

	public String getMailAWSUser() {
		return mailAWSUser;
	}

	public void setMailAWSUser(String mailAWSUser) {
		this.mailAWSUser = mailAWSUser;
	}

	public String getMailAWSPassword() {
		return mailAWSPassword;
	}

	public void setMailAWSPassword(String mailAWSPassword) {
		this.mailAWSPassword = mailAWSPassword;
	}

	public String getUploadLocation() {
		return uploadLocation;
	}

	public void setUploadLocation(String uploadLocation) {
		this.uploadLocation = uploadLocation;
	}

	public String getQuestionareEmail() {
		return questionareEmail;
	}

	public void setQuestionareEmail(String questionareEmail) {
		this.questionareEmail = questionareEmail;
	}

	public String getAdBannerImage() {
		return adBannerImage;
	}

	public void setAdBannerImage(String adBannerImage) {
		this.adBannerImage = adBannerImage;
	}

	public String getDryRunEmail() {
		return dryRunEmail;
	}

	public void setDryRunEmail(String dryRunEmail) {
		this.dryRunEmail = dryRunEmail;
	}

	public String getDryRunSms() {
		return dryRunSms;
	}

	public void setDryRunSms(String dryRunSms) {
		this.dryRunSms = dryRunSms;
	}

}