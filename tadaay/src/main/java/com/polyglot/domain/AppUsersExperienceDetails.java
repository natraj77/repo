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
@Table(name = "app_users_experience_details")
public class AppUsersExperienceDetails extends AuditEntity {

	// Fields

	private Integer id;
	private AppUsers appUsers;
	private String companyName;
	private String designation;
	private String joiningDate;
	private String lastDate;
	private Timestamp lastInsrtUpdTs;
	private Integer lastInsrtUpdUsrId;
	private String verified;
	private String verifiedByName;
	private Timestamp verifiedDate;
	private String proofPath;

	// Constructors

	/** default constructor */
	public AppUsersExperienceDetails() {
	}

	/** minimal constructor */
	public AppUsersExperienceDetails(AppUsers appUsers, String keySkill,
			Integer years, String companyName, String designation,
			Timestamp lastInsrtUpdTs, Integer lastInsrtUpdUsrId) {
		this.appUsers = appUsers;
		this.companyName = companyName;
		this.designation = designation;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	/** full constructor */
	public AppUsersExperienceDetails(AppUsers appUsers, String keySkill,
			Integer years, String companyName, String designation,
			String joiningDate, String lastDate, Timestamp lastInsrtUpdTs,
			Integer lastInsrtUpdUsrId) {
		this.appUsers = appUsers;
		this.companyName = companyName;
		this.designation = designation;
		this.joiningDate = joiningDate;
		this.lastDate = lastDate;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
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

	

	@Column(name = "company_name", nullable = false, length = 100)
	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "designation", length = 50)
	public String getDesignation() {
		return this.designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	@Column(name = "joining_date", length = 10)
	public String getJoiningDate() {
		return this.joiningDate;
	}

	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}

	@Column(name = "last_date", length = 10)
	public String getLastDate() {
		return this.lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
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