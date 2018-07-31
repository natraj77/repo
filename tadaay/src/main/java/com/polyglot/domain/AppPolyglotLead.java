package com.polyglot.domain;

import java.sql.Timestamp;

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
 * AppPolyglotLead entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_lead")
public class AppPolyglotLead extends AuditEntity {

	// Fields

	private Integer id;
	private String mode;
	private String schedule;
	private String preferredTime;
	private String source;
	private String refferedBy;
	private String batchId;
	private String leadStatus;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private Integer partnerId;
	private String comments;
	private Integer userId;
	private Integer courseId;
	private Integer discount;
	private Integer branchId;
	private Timestamp createdDate;

	
	// Constructors
	/** default constructor */
	public AppPolyglotLead() {
	}

	
	/** full constructor */
	public AppPolyglotLead(Integer id, 
			String mode, String schedule, String preferredTime, String source,
			String refferedBy, String batchId, String leadStatus,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			Integer partnerId, String comments, Integer userId,
			Integer courseId, Integer discount, Integer branchId, Timestamp createdDate) {
		this.id = id;
		this.mode = mode;
		this.schedule = schedule;
		this.preferredTime = preferredTime;
		this.source = source;
		this.refferedBy = refferedBy;
		this.batchId = batchId;
		this.leadStatus = leadStatus;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.partnerId = partnerId;
		this.comments = comments;
		this.userId = userId;
		this.courseId = courseId;
		this.discount = discount;
		this.branchId = branchId;
		this.createdDate = createdDate;
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

	@Column(name = "branch", length = 11)
	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}


	@Column(name = "mode", length = 50)
	public String getMode() {
		return this.mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Column(name = "schedule", length = 30)
	public String getSchedule() {
		return this.schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	@Column(name = "preferred_time", length = 20)
	public String getPreferredTime() {
		return this.preferredTime;
	}

	public void setPreferredTime(String preferredTime) {
		this.preferredTime = preferredTime;
	}

	@Column(name = "source", nullable = false, length = 50)
	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
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

	@Column(name = "reffered_by", nullable = true, length = 50)
	public String getRefferedBy() {
		return refferedBy;
	}

	public void setRefferedBy(String refferedBy) {
		this.refferedBy = refferedBy;
	}
	
	@Column(name = "batch_id", nullable = true, length = 50)
	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}

	@Column(name = "lead_status", nullable = true, length = 50)
	public String getLeadStatus() {
		return leadStatus;
	}

	public void setLeadStatus(String leadStatus) {
		this.leadStatus = leadStatus;
	}

	@Column(name = "partner_id", nullable = false)
	public Integer getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}

	@Column(name = "comments", nullable = true, length = 250)
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Column(name = "app_user_id", length = 11)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "course_id", length = 11)
	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Column(name = "discount", length = 11)
	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	@Column(name = "created_datetime", length = 19)
	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
}