package com.polyglot.model;

public class AppPolyglotDemoModel {

	private Integer id;
	private String courseName;
	private String mode;
	private String facultyName;
	private String branchName;
	private String demoStatus;
	private String startDate;
	private String fee;
	private Integer courseId;
	private Integer branchId;
	private Integer facultyId;
	private String hourOfDay;

	@Override
	public String toString() {
		return "AppPolyglotDemoModel [id=" + id + ", courseName=" + courseName
				+ ", mode=" + mode + ", facultyName=" + facultyName
				+ ", branchName=" + branchName + ", demoStatus=" + demoStatus
				+ ", startDate=" + startDate + ", fee=" + fee + ", courseId="
				+ courseId + ", branchId=" + branchId + ", facultyId="
				+ facultyId + "]";
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

	public Integer getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getFacultyName() {
		return facultyName;
	}

	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getDemoStatus() {
		return demoStatus;
	}

	public void setDemoStatus(String demoStatus) {
		this.demoStatus = demoStatus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getHourOfDay() {
		return hourOfDay;
	}

	public void setHourOfDay(String hourOfDay) {
		this.hourOfDay = hourOfDay;
	}

}
