package com.polyglot.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AppPolyglotLeadModel {
	
	
	private Integer id;
	private String branchName;
	private String firstName;
	private String lastName;
	private String course;
	private String mobile;
	private String email;
	private String mode;
	private String schedule;
	private String preferredTimeStart;
	private String preferredTimeEnd;
	private String source;
	private String refferedBy;
	private String preferredTime;
	private String comments;
	private Integer userId;
	private Integer courseId;
	private Integer discount;
	private Integer branchId;
	private String status;
	private String batchName;
	private Double fee;
	private Integer feeDiscount;

	@Override
	public String toString() {
		return "AppPolyglotLeadModel [id=" + id + ", branchName=" + branchName
				+ ", firstName=" + firstName + ", lastName=" + lastName
				+ ", course=" + course + ", mobile=" + mobile + ", email="
				+ email + ", mode=" + mode + ", schedule=" + schedule
				+ ", preferredTimeStart=" + preferredTimeStart
				+ ", preferredTimeEnd=" + preferredTimeEnd + ", source="
				+ source + ", refferedBy=" + refferedBy + ", preferredTime="
				+ preferredTime + ", comments=" + comments + ", userId="
				+ userId + ", courseId=" + courseId + ", discount=" + discount
				+ ", branchId=" + branchId + ", status=" + status
				+ ", batchName=" + batchName + ", fee=" + fee
				+ ", feeDiscount=" + feeDiscount + "]";
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getRefferedBy() {
		return refferedBy;
	}

	public void setRefferedBy(String refferedBy) {
		this.refferedBy = refferedBy;
	}

	public String getPreferredTimeStart() {
		return preferredTimeStart;
	}

	public void setPreferredTimeStart(String preferredTimeStart) {
		this.preferredTimeStart = preferredTimeStart;
	}

	public String getPreferredTimeEnd() {
		return preferredTimeEnd;
	}

	public void setPreferredTimeEnd(String preferredTimeEnd) {
		this.preferredTimeEnd = preferredTimeEnd;
	}

	public String getPreferredTime() {
		return preferredTime;
	}

	public void setPreferredTime(String preferredTime) {
		this.preferredTime = preferredTime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	public Integer getFeeDiscount() {
		return feeDiscount;
	}

	public void setFeeDiscount(Integer feeDiscount) {
		this.feeDiscount = feeDiscount;
	}	
}
