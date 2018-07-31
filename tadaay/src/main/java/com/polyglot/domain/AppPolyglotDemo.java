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
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "app_polyglot_demo")
public class AppPolyglotDemo extends AuditEntity {

	private Integer id;
	private String mode;
	private String dateTime;
	private Double fee;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private AppUsers appUsers;
	private String isActive;
	private String demoStatus;
	private Integer courseId;
	private Integer branchId;
	private Integer facultyId;
	
	private String courseName;
	private String branchName;
	private String facultyName;
	private String isArchive;
	

	public AppPolyglotDemo() {

	}

	public AppPolyglotDemo(Integer id, String mode, String dateTime,
			Double fee, Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			AppUsers appUsers, String isActive, String demoStatus,
			Integer courseId, Integer branchId, Integer facultyId) {
		super();
		this.id = id;
		this.mode = mode;
		this.dateTime = dateTime;
		this.fee = fee;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.appUsers = appUsers;
		this.isActive = isActive;
		this.demoStatus = demoStatus;
		this.courseId = courseId;
		this.branchId = branchId;
		this.facultyId = facultyId;
	}	

	@Override
	public String toString() {
		return "AppPolyglotDemo [id=" + id + ", mode=" + mode + ", dateTime="
				+ dateTime + ", fee=" + fee + ", lastInsrtUpdUsrId="
				+ lastInsrtUpdUsrId + ", lastInsrtUpdTs=" + lastInsrtUpdTs
				+ ", appUsers=" + appUsers + ", isActive=" + isActive
				+ ", demoStatus=" + demoStatus + ", courseId=" + courseId
				+ ", branchId=" + branchId + ", facultyId=" + facultyId
				+ ", courseName=" + courseName + ", branchName=" + branchName
				+ ", facultyName=" + facultyName + ", isArchive=" + isArchive
				+ "]";
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "mode", length = 20)
	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Column(name = "date_time", length = 20)
	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	@Column(name = "fee", nullable = false, precision = 22, scale = 0)
	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
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

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}

	@Column(name = "is_active", length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Column(name = "demo_status", length = 10)
	public String getDemoStatus() {
		return demoStatus;
	}

	public void setDemoStatus(String demoStatus) {
		this.demoStatus = demoStatus;
	}

	@Column(name="course_id", length=11)
	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Column(name="branch_id", length=11)
	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	@Column(name="faculty_id", length=11)
	public Integer getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}

	@Transient
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Transient
	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	@Transient
	public String getFacultyName() {
		return facultyName;
	}

	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	@Column(name="is_archive", length=1)
	public String getIsArchive() {
		return isArchive;
	}

	public void setIsArchive(String isArchive) {
		this.isArchive = isArchive;
	}
}
