/*package com.polyglot.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

*//**
 * AppPolyglotContact entity. @author MyEclipse Persistence Tools
 *//*
@Entity
@Table(name = "app_polyglot_contact")
public class AppPolyglotContact extends AuditEntity {

	// Fields

	private Integer id;
	private String name;
	private String mobileNumber;
	private String email;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private Set<AppPolyglotBranch> appPolyglotBranchs = new HashSet<AppPolyglotBranch>(
			0);

	// Constructors

	*//** default constructor *//*
	public AppPolyglotContact() {
	}

	*//** minimal constructor *//*
	public AppPolyglotContact(String name, String mobileNumber, String email,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs) {
		this.name = name;
		this.mobileNumber = mobileNumber;
		this.email = email;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	*//** full constructor *//*
	public AppPolyglotContact(String name, String mobileNumber, String email,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			Set<AppPolyglotBranch> appPolyglotBranchs) {
		this.name = name;
		this.mobileNumber = mobileNumber;
		this.email = email;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.appPolyglotBranchs = appPolyglotBranchs;
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

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "mobile_number", nullable = false, length = 10)
	public String getMobileNumber() {
		return this.mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	
	@Column(name = "email", nullable = false, length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "appPolyglotContact")
	public Set<AppPolyglotBranch> getAppPolyglotBranchs() {
		return this.appPolyglotBranchs;
	}

	public void setAppPolyglotBranchs(Set<AppPolyglotBranch> appPolyglotBranchs) {
		this.appPolyglotBranchs = appPolyglotBranchs;
	}

}*/