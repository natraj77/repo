package com.polyglot.domain;

import java.util.Date;

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
 * AppPolyglotFaculty entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_faculty")
public class AppPolyglotFaculty extends AuditEntity {

	// Fields

	private Integer id;
	private String mode;
	private Integer lastInsrtUpdUsrId;
	private Date lastInsrtUpdTs;
	private Integer courseId;
	private String courseName;
	private String modeDesc;
	private AppUsers appUsers;
	private Integer facultyId;
	private String isPrivate;
	private String isActive;
	
	// Constructors

	/** default constructor */
	public AppPolyglotFaculty() {
	}

	/** full constructor */
	public AppPolyglotFaculty(String mode, Integer lastInsrtUpdUsrId, Date lastInsrtUpdTs,
			Integer courseId, Integer facultyId, String isPrivate) {
		this.mode = mode;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.courseId = courseId;
		this.facultyId = facultyId;
		this.isPrivate = isPrivate;
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

	@Column(name = "faculty_id", length = 11)
	public Integer getFacultyId() {
		return this.facultyId;
	}

	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}

	@Column(name = "is_private", length = 1)
	public String getIsPrivate() {
		return this.isPrivate;
	}

	public void setIsPrivate(String isPrivate) {
		this.isPrivate = isPrivate;
	}

	@Column(name = "mode", length = 45)
	public String getMode() {
		return this.mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Column(name = "lastInsrtUpdUsrId")
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	//@Temporal(TemporalType.DATE)
	@Column(name = "lastInsrtUpdTs", length = 10)
	public Date getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Date lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	@Column(name = "courseId")
	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	
	@Transient
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Transient
	public String getModeDesc() {
		return modeDesc;
	}

	public void setModeDesc(String modeDesc) {
		this.modeDesc = modeDesc;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}
	
	@Column(name = "is_active", nullable = true, length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
}