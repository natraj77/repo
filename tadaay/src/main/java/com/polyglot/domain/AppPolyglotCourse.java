package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * AppPolyglotCourse entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_course")
public class AppPolyglotCourse extends AuditEntity implements Comparable {

	// Fields

	private Integer id;
	private AppUsers appUsers;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
    private String realtimeProjs;
    private String feeInInstallments;
    private String labAssistance;
    private String placementAssistance;
    private Integer dmnCourseId;
    private String online;
    private String classroom;
    private String corporate;
    private String courseContent;
    private String videoContent;
    private String isActive;
	
	// Constructors

	/** default constructor */
	public AppPolyglotCourse() {
	}

	/** full constructor */
	public AppPolyglotCourse(Integer id, AppUsers appUsers,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			String realtimeProjs, String feeInInstallments,
			String labAssistance, String placementAssistance,
			Integer dmnCourseId, String online, String classroom,
			String corporate) {
		this.id = id;
		this.appUsers = appUsers;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.realtimeProjs = realtimeProjs;
		this.feeInInstallments = feeInInstallments;
		this.labAssistance = labAssistance;
		this.placementAssistance = placementAssistance;
		this.dmnCourseId = dmnCourseId;
		this.online = online;
		this.classroom = classroom;
		this.corporate = corporate;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return this.appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}

	@Column(name = "last_insrt_upd_usr_id", nullable = false)
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Column(name = "last_insrt_upd_ts", nullable = false, length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}
	@Column(name = "attr_realtime_projects", nullable = true, length = 1)
	public String getRealtimeProjs() {
		return realtimeProjs;
	}

	public void setRealtimeProjs(String realtimeProjs) {
		this.realtimeProjs = realtimeProjs;
	}
	@Column(name = "attr_fee_in_installments", nullable = true, length = 1)
	public String getFeeInInstallments() {
		return feeInInstallments;
	}

	public void setFeeInInstallments(String feeInInstallments) {
		this.feeInInstallments = feeInInstallments;
	}
	@Column(name = "attr_lab_assistance", nullable = true, length = 1)
	public String getLabAssistance() {
		return labAssistance;
	}

	public void setLabAssistance(String labAssistance) {
		this.labAssistance = labAssistance;
	}
	@Column(name = "attr_placement_assistance", nullable = true, length = 1)
	public String getPlacementAssistance() {
		return placementAssistance;
	}

	public void setPlacementAssistance(String placementAssistance) {
		this.placementAssistance = placementAssistance;
	}

	public int compareTo(Object o) {
		return 0;
	}
	@Column(name = "dmn_course_id", nullable = true, length = 11)
	public Integer getDmnCourseId() {
		return dmnCourseId;
	}

	public void setDmnCourseId(Integer dmnCourseId) {
		this.dmnCourseId = dmnCourseId;
	}

	@Column(name = "attr_online", nullable = true, length = 1)
	public String getOnline() {
		return online;
	}

	public void setOnline(String online) {
		this.online = online;
	}

	@Column(name = "attr_classroom", nullable = true, length = 1)
	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	@Column(name = "attr_corporate", nullable = true, length = 1)
	public String getCorporate() {
		return corporate;
	}

	public void setCorporate(String corporate) {
		this.corporate = corporate;
	}

	@Column(name = "course_path", nullable = true, length = 200)
	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	@Column(name = "video_path", nullable = true, length = 200)
	public String getVideoContent() {
		return videoContent;
	}

	public void setVideoContent(String videoContent) {
		this.videoContent = videoContent;
	}

	@Column(name = "is_active", nullable = true, length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "AppPolyglotCourse [id=" + id + ", appUsers=" + appUsers
				+ ", lastInsrtUpdUsrId=" + lastInsrtUpdUsrId
				+ ", lastInsrtUpdTs=" + lastInsrtUpdTs + ", realtimeProjs="
				+ realtimeProjs + ", feeInInstallments=" + feeInInstallments
				+ ", labAssistance=" + labAssistance + ", placementAssistance="
				+ placementAssistance + ", dmnCourseId=" + dmnCourseId
				+ ", online=" + online + ", classroom=" + classroom
				+ ", corporate=" + corporate + ", courseContent="
				+ courseContent + ", videoContent=" + videoContent
				+ ", isActive=" + isActive + "]";
	}
}