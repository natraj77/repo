package com.polyglot.domain;

public class AppPolyglotChart {
	
	private String courseName;
	private String courseCount;
	private String batchStatus;
	private String batchCount;
	private String leadByMonth;
	private String leadCount;
	private String source;
	private int leadBySource;
	private int conversionBySource;
	private String revenueBySource;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseCount() {
		return courseCount;
	}
	public void setCourseCount(String courseCount) {
		this.courseCount = courseCount;
	}
	public String getBatchStatus() {
		return batchStatus;
	}
	public void setBatchStatus(String batchStatus) {
		this.batchStatus = batchStatus;
	}
	public String getBatchCount() {
		return batchCount;
	}
	public void setBatchCount(String batchCount) {
		this.batchCount = batchCount;
	}
	public String getLeadByMonth() {
		return leadByMonth;
	}
	public void setLeadByMonth(String leadByMonth) {
		this.leadByMonth = leadByMonth;
	}
	public String getLeadCount() {
		return leadCount;
	}
	public void setLeadCount(String leadCount) {
		this.leadCount = leadCount;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public int getLeadBySource() {
		return leadBySource;
	}
	public void setLeadBySource(int leadBySource) {
		this.leadBySource = leadBySource;
	}
	public int getConversionBySource() {
		return conversionBySource;
	}
	public void setConversionBySource(int conversionBySource) {
		this.conversionBySource = conversionBySource;
	}
	public String getRevenueBySource() {
		return revenueBySource;
	}
	public void setRevenueBySource(String revenueBySource) {
		this.revenueBySource = revenueBySource;
	}
	@Override
	public String toString() {
		return "AppPolyglotChart [courseName=" + courseName + ", courseCount="
				+ courseCount + ", batchStatus=" + batchStatus
				+ ", batchCount=" + batchCount + ", leadByMonth=" + leadByMonth
				+ ", leadCount=" + leadCount + ", source=" + source
				+ ", leadBySource=" + leadBySource + ", conversionBySource="
				+ conversionBySource + ", revenueBySource=" + revenueBySource
				+ "]";
	}
}
