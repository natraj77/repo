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
@Table(name = "app_polyglot_trainer_subscription")
public class AppTrainerSubscriptions extends AuditEntity {

	// Fields

	private Integer id;
	private String partnerId;
	private Integer studentId;
	private String courseId;
	private String subscribed;
	// Constructors

	/** default constructor */
	public AppTrainerSubscriptions() {
	}

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
	@Column(name = "partner_id", nullable = true, length = 11)
	public String getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}
	@Column(name = "student_id", nullable = true, length = 11)
	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	@Column(name = "course_id", nullable = true, length = 11)
	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	@Column(name = "subscribed", nullable = true, length = 1)
	public String getSubscribed() {
		return subscribed;
	}

	public void setSubscribed(String subscribed) {
		this.subscribed = subscribed;
	}
	
	

}