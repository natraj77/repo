package com.polyglot.model;

public class AppPolyglotBatchModel {

	private Integer id;
	private String facultyName;
	private String plyBatchNo;
	private String courseName;
	private String schedule;
	private String mode;
	private String branchName;
	private String feeDiscount;
	private Integer facultyId;
	private String batchStatus;
	private String startDate;
	private String batchName;
	private Integer courseId;
	private Integer branchId;
	private Double fee;
	private String hourOfDay;
	private Integer duration;
	private String durationType;
	private String endDate;
	private Integer classTime;

	@Override
	public String toString() {
		return "AppPolyglotBatchModel [id=" + id + ", facultyName="
				+ facultyName + ", plyBatchNo=" + plyBatchNo + ", courseName="
				+ courseName + ", schedule=" + schedule + ", mode=" + mode
				+ ", branchName=" + branchName + ", feeDiscount=" + feeDiscount
				+ ", facultyId=" + facultyId + ", batchStatus=" + batchStatus
				+ ", startDate=" + startDate + ", batchName=" + batchName
				+ ", courseId=" + courseId + ", branchId=" + branchId
				+ ", fee=" + fee + ", hourOfDay=" + hourOfDay + ", duration="
				+ duration + ", durationType=" + durationType + ", endDate="
				+ endDate + "]";
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getDurationType() {
		return durationType;
	}

	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}

	public String getFacultyName() {
		return facultyName;
	}
	
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	public String getPlyBatchNo() {
		return plyBatchNo;
	}

	public void setPlyBatchNo(String plyBatchNo) {
		this.plyBatchNo = plyBatchNo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getFeeDiscount() {
		return feeDiscount;
	}

	public void setFeeDiscount(String feeDiscount) {
		this.feeDiscount = feeDiscount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}

	public String getBatchStatus() {
		return batchStatus;
	}

	public void setBatchStatus(String batchStatus) {
		this.batchStatus = batchStatus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	public String getHourOfDay() {
		return hourOfDay;
	}

	public void setHourOfDay(String hourOfDay) {
		this.hourOfDay = hourOfDay;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Integer getClassTime() {
		return classTime;
	}

	public void setClassTime(Integer classTime) {
		this.classTime = classTime;
	}
}
