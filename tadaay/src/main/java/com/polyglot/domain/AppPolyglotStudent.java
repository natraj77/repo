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
 * AppPolyglotStudent entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_student")
public class AppPolyglotStudent extends AuditEntity {

	// Fields

	private Integer id;
	private String studentName;
	private String courseName;
	private String mode;
	private String joinedDate;
	private String status;
	private String nextInterest;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private Integer batchId;
	private AppUsers appUsers;

	// Constructors

	/** default constructor */
	public AppPolyglotStudent() {
	}

	/** minimal constructor */
	public AppPolyglotStudent(String courseName, String mode, String status,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs) {
		this.courseName = courseName;
		this.mode = mode;
		this.status = status;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	/** full constructor */
	public AppPolyglotStudent(String courseName, String mode,
			String joinedDate, String status, String nextInterest,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs, Integer batchId) {
		this.courseName = courseName;
		this.mode = mode;
		this.joinedDate = joinedDate;
		this.status = status;
		this.nextInterest = nextInterest;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.batchId = batchId;
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

	@Column(name = "student_name", nullable = false, length = 100)
	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	@Column(name = "course_name", nullable = false, length = 100)
	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Column(name = "mode", nullable = false, length = 25)
	public String getMode() {
		return this.mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Column(name = "joined_date", length = 20)
	public String getJoinedDate() {
		return this.joinedDate;
	}

	public void setJoinedDate(String joinedDate) {
		this.joinedDate = joinedDate;
	}

	@Column(name = "status", nullable = false, length = 20)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "next_interest", length = 100)
	public String getNextInterest() {
		return this.nextInterest;
	}

	public void setNextInterest(String nextInterest) {
		this.nextInterest = nextInterest;
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

	@Column(name = "batch_id", nullable = false, length = 50)
	public Integer getBatchId() {
		return batchId;
	}

	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
	}
}