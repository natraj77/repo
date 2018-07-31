package com.polyglot.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class PolyglotCourse implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private AppUsers appUsers;
	private String name;
	private String online;
	private String classroom;
	private String corporate;
    private String realtimeProjs;
    private String feeInInstallments;
    private String labAssistance;
    private String placementAssistance;
    private Integer dmnCourseId;
    private String mode;
    private String courseContent;
    private String videoContent;
    
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public AppUsers getAppUsers() {
		return appUsers;
	}
	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRealtimeProjs() {
		return realtimeProjs;
	}
	public void setRealtimeProjs(String realtimeProjs) {
		this.realtimeProjs = realtimeProjs;
	}
	public String getFeeInInstallments() {
		return feeInInstallments;
	}
	public void setFeeInInstallments(String feeInInstallments) {
		this.feeInInstallments = feeInInstallments;
	}
	public String getLabAssistance() {
		return labAssistance;
	}
	public void setLabAssistance(String labAssistance) {
		this.labAssistance = labAssistance;
	}
	public String getPlacementAssistance() {
		return placementAssistance;
	}
	public void setPlacementAssistance(String placementAssistance) {
		this.placementAssistance = placementAssistance;
	}
	public Integer getDmnCourseId() {
		return dmnCourseId;
	}
	public void setDmnCourseId(Integer dmnCourseId) {
		this.dmnCourseId = dmnCourseId;
	}
	public String getOnline() {
		return online;
	}
	public void setOnline(String online) {
		this.online = online;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public String getCorporate() {
		return corporate;
	}
	public void setCorporate(String corporate) {
		this.corporate = corporate;
	}
	public String getCourseContent() {
		return courseContent;
	}
	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}
	public String getVideoContent() {
		return videoContent;
	}
	public void setVideoContent(String videoContent) {
		this.videoContent = videoContent;
	}
	@Override
	public String toString() {
		return "PolyglotCourse [id=" + id + ", appUsers=" + appUsers
				+ ", name=" + name + ", online=" + online + ", classroom="
				+ classroom + ", corporate=" + corporate + ", realtimeProjs="
				+ realtimeProjs + ", feeInInstallments=" + feeInInstallments
				+ ", labAssistance=" + labAssistance + ", placementAssistance="
				+ placementAssistance + ", dmnCourseId=" + dmnCourseId
				+ ", mode=" + mode + ", courseContent=" + courseContent
				+ ", videoContent=" + videoContent + "]";
	}
}