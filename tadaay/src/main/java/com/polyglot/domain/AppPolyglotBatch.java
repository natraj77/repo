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

/**
 * AppPolyglotBatch entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_batch")
public class AppPolyglotBatch extends AuditEntity {

	// Fields

	private Integer batchId;
	private String plyBatchNo;
	private String courseName;
	private String schedule;
	private String mode;
	private String branchName;
	private Integer feeDiscount;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String batchStatus;
	private String startDate;
	private AppUsers appUsers;
	private String batchName;	
	private Integer courseId;
	private Integer branchId;
	private AppPolyglotFaculty appPolyglotFaculty;
	private String facultyName;
	private Double fee;
	private Integer duration;
	private String durationType;
	private Timestamp endDate;
	private String isArchive;
	private Integer classTime;

	// Constructors

	/** default constructor */
	public AppPolyglotBatch() {
	}

	/** minimal constructor */
	public AppPolyglotBatch(String plyBatchNo, String courseName,
			String schedule, String mode, String branchName,
			Integer feeDiscount, Integer lastInsrtUpdUsrId,
			Timestamp lastInsrtUpdTs, String batchName) {
		this.plyBatchNo = plyBatchNo;
		this.courseName = courseName;
		this.schedule = schedule;
		this.mode = mode;
		this.branchName = branchName;
		this.feeDiscount = feeDiscount;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.batchName = batchName;
	}

	/** full constructor */
	public AppPolyglotBatch(AppPolyglotFaculty appPolyglotFaculty,
			String plyBatchNo, String courseName, String schedule, String mode,
			String branchName, Integer feeDiscount, Integer lastInsrtUpdUsrId,
			Timestamp lastInsrtUpdTs, String batchName) {
		this.appPolyglotFaculty = appPolyglotFaculty;
		this.plyBatchNo = plyBatchNo;
		this.courseName = courseName;
		this.schedule = schedule;
		this.mode = mode;
		this.branchName = branchName;
		this.feeDiscount = feeDiscount;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.batchName = batchName;
	}
	
	@Override
	public String toString() {
		return "AppPolyglotBatch [batchId=" + batchId + ", plyBatchNo="
				+ plyBatchNo + ", courseName=" + courseName + ", schedule="
				+ schedule + ", mode=" + mode + ", branchName=" + branchName
				+ ", feeDiscount=" + feeDiscount + ", lastInsrtUpdUsrId="
				+ lastInsrtUpdUsrId + ", lastInsrtUpdTs=" + lastInsrtUpdTs
				+ ", batchStatus=" + batchStatus + ", startDate=" + startDate
				+ ", appUsers=" + appUsers + ", batchName=" + batchName
				+ ", courseId=" + courseId + ", branchId=" + branchId
				+ ", appPolyglotFaculty=" + appPolyglotFaculty
				+ ", facultyName=" + facultyName + ", fee=" + fee
				+ ", duration=" + duration + ", durationType=" + durationType
				+ ", endDate=" + endDate + ", isArchive=" + isArchive + "]";
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "batch_id", unique = true, nullable = false)
	public Integer getBatchId() {
		return this.batchId;
	}

	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "faculty_id")
	public AppPolyglotFaculty getAppPolyglotFaculty() {
		return this.appPolyglotFaculty;
	}

	public void setAppPolyglotFaculty(AppPolyglotFaculty appPolyglotFaculty) {
		this.appPolyglotFaculty = appPolyglotFaculty;
	}

	@Column(name = "ply_batch_no", nullable = true, length = 50)
	public String getPlyBatchNo() {
		return this.plyBatchNo;
	}

	public void setPlyBatchNo(String plyBatchNo) {
		this.plyBatchNo = plyBatchNo;
	}

	@Transient
	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Column(name = "schedule", nullable = false, length = 30)
	public String getSchedule() {
		return this.schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	@Column(name = "mode", nullable = false, length = 50)
	public String getMode() {
		return this.mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Transient
	public String getBranchName() {
		return this.branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	@Column(name = "fee_discount", nullable = false, precision = 22, scale = 0)
	public Integer getFeeDiscount() {
		return this.feeDiscount;
	}

	public void setFeeDiscount(Integer feeDiscount) {
		this.feeDiscount = feeDiscount;
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

	@Column(name = "batch_status", nullable = false, length = 50)
	public String getBatchStatus() {
		return batchStatus;
	}

	public void setBatchStatus(String batchStatus) {
		this.batchStatus = batchStatus;
	}

	@Column(name = "start_date", length = 20)
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}

	@Column(name = "batch_name", nullable = true, length = 100)
	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	@Column(name = "course_id", length = 11)
	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Column(name = "branch_id", length = 11)
	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	@Transient
	public String getFacultyName() {
		return facultyName;
	}

	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	@Column(name = "fee", nullable = false, precision = 22, scale = 0)
	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	@Column(name = "duration" , length = 11)
	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	@Column(name = "duration_type", length = 45)
	public String getDurationType() {
		return durationType;
	}

	public void setDurationType(String durationType) {
		this.durationType = durationType;
	}

	@Column(name = "end_date", length = 19)
	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	
	@Column(name="is_archive", length=1)
	public String getIsArchive() {
		return isArchive;
	}

	public void setIsArchive(String isArchive) {
		this.isArchive = isArchive;
	}

	@Column(name="class_time", length=11)
	public Integer getClassTime() {
		return classTime;
	}

	public void setClassTime(Integer classTime) {
		this.classTime = classTime;
	}
}