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
 * AppPolyglotAddress entity. @author MyEclipse Persistence Tools
 *//*
@Entity
@Table(name = "app_polyglot_address")
public class AppPolyglotAddress extends AuditEntity {

	// Fields

	private Integer id;
	private String addressLine1;
	private String addressLine2;
	private String addressLine3;
	private String city;
	private String state;
	private String pinCode;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private Set<AppPolyglotBranch> appPolyglotBranchs = new HashSet<AppPolyglotBranch>(
			0);

	// Constructors

	*//** default constructor *//*
	public AppPolyglotAddress() {
	}

	*//** minimal constructor *//*
	public AppPolyglotAddress(String addressLine1, String city, String state,
			String pinCode, Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs) {
		this.addressLine1 = addressLine1;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	*//** full constructor *//*
	public AppPolyglotAddress(String addressLine1, String addressLine2,
			String addressLine3, String city, String state, String pinCode,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			Set<AppPolyglotBranch> appPolyglotBranchs) {
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
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

	@Column(name = "address_line_1", nullable = false, length = 50)
	public String getAddressLine1() {
		return this.addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	@Column(name = "address_line_2", length = 50)
	public String getAddressLine2() {
		return this.addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	@Column(name = "address_line_3", length = 50)
	public String getAddressLine3() {
		return this.addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	@Column(name = "city", nullable = false, length = 50)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "state", nullable = false, length = 50)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "zip_code", nullable = false, length = 6)
	public String getPinCode() {
		return this.pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "appPolyglotAddress")
	public Set<AppPolyglotBranch> getAppPolyglotBranchs() {
		return this.appPolyglotBranchs;
	}

	public void setAppPolyglotBranchs(Set<AppPolyglotBranch> appPolyglotBranchs) {
		this.appPolyglotBranchs = appPolyglotBranchs;
	}

}*/