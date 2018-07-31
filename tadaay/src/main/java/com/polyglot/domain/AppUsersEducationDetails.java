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

@Entity
@Table(name = "app_users_education_details")
public class AppUsersEducationDetails extends AuditEntity {


	private Integer id;
	private AppUsers appUsers;
	private String collegeName;
	private String degree;
	private String specialization;
	private Double percentage;
	private Integer passedOutYear;
	private Timestamp lastInsrtUpdTs;
	private Integer lastInsrtUpdUsrId;
	private String verified;
	private String verifiedByName;
	private Timestamp verifiedDate;
	private String proofPath;
	// Constructors

	/** default constructor */
	public AppUsersEducationDetails() {
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
	@JoinColumn(name = "appuserId", nullable = false)
	public AppUsers getAppUsers() {
		return this.appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}


	@Column(name = "college_name", length = 100)
	public String getCollegeName() {
		return collegeName;
	}
	
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	@Column(name = "degree", length = 20)
	public String getDegree() {
		return this.degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	@Column(name = "specialization", length = 5)
	public String getSpecialization() {
		return this.specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	@Column(name = "percentage", precision = 22, scale = 0)
	public Double getPercentage() {
		return this.percentage;
	}

	public void setPercentage(Double percentage) {
		this.percentage = percentage;
	}

	@Column(name = "last_insrt_upd_ts", nullable = false, length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	@Column(name = "last_insrt_upd_usr_id", nullable = false)
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Column(name = "passed_out_year")
	public Integer getPassedOutYear() {
		return passedOutYear;
	}
	public void setPassedOutYear(Integer passedOutYear) {
		this.passedOutYear = passedOutYear;
	}


	@Column(name = "verified", nullable = true, length = 1)
	public String getVerified() {
		return verified;
	}



	public void setVerified(String verified) {
		this.verified = verified;
	}


	@Column(name = "verified_by_name", nullable = true, length = 32)
	public String getVerifiedByName() {
		return verifiedByName;
	}



	public void setVerifiedByName(String verifiedByName) {
		this.verifiedByName = verifiedByName;
	}


	@Column(name = "verified_datetime", nullable = true, length = 19)
	public Timestamp getVerifiedDate() {
		return verifiedDate;
	}



	public void setVerifiedDate(Timestamp verifiedDate) {
		this.verifiedDate = verifiedDate;
	}


	@Column(name = "proof_path", nullable = true, length = 128)
	public String getProofPath() {
		return proofPath;
	}



	public void setProofPath(String proofPath) {
		this.proofPath = proofPath;
	}

}