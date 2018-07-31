package com.polyglot.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * DmnStates entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dmn_states")
public class DmnStates extends AuditEntity implements java.io.Serializable {

	// Fields

	private Integer stateId;
	private DmnCntry dmnCntry;
	private String stateDesc;
	private String stateLongDesc;
	private String stateCode;
	private String dsblIn;
	private Timestamp lastInsrtUpdTs;
	private Integer lastInsrtUpdUsrId;
	private Set<DmnCities> dmnCitieses = new HashSet<DmnCities>(0);

	// Constructors

	/** default constructor */
	public DmnStates() {
	}

	/** minimal constructor */
	public DmnStates(DmnCntry dmnCntry) {
		this.dmnCntry = dmnCntry;
	}

	/** full constructor */
	public DmnStates(DmnCntry dmnCntry, String stateDesc, String stateLongDesc,
			String stateCode, String dsblIn, Timestamp lastInsrtUpdTs,
			Integer lastInsrtUpdUsrId, Set<DmnCities> dmnCitieses) {
		this.dmnCntry = dmnCntry;
		this.stateDesc = stateDesc;
		this.stateLongDesc = stateLongDesc;
		this.stateCode = stateCode;
		this.dsblIn = dsblIn;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.dmnCitieses = dmnCitieses;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "state_id", unique = true, nullable = false)
	public Integer getStateId() {
		return this.stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cntry_id", nullable = false)
	public DmnCntry getDmnCntry() {
		return this.dmnCntry;
	}

	public void setDmnCntry(DmnCntry dmnCntry) {
		this.dmnCntry = dmnCntry;
	}

	@Column(name = "state_desc", length = 45)
	public String getStateDesc() {
		return this.stateDesc;
	}

	public void setStateDesc(String stateDesc) {
		this.stateDesc = stateDesc;
	}

	@Column(name = "state_long_desc", length = 45)
	public String getStateLongDesc() {
		return this.stateLongDesc;
	}

	public void setStateLongDesc(String stateLongDesc) {
		this.stateLongDesc = stateLongDesc;
	}

	@Column(name = "state_code", length = 5)
	public String getStateCode() {
		return this.stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	@Column(name = "dsbl_in", length = 1)
	public String getDsblIn() {
		return this.dsblIn;
	}

	public void setDsblIn(String dsblIn) {
		this.dsblIn = dsblIn;
	}

	@Column(name = "last_insrt_upd_ts", length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	@Column(name = "last_insrt_upd_usr_id")
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "dmnStates")
	public Set<DmnCities> getDmnCitieses() {
		return this.dmnCitieses;
	}

	public void setDmnCitieses(Set<DmnCities> dmnCitieses) {
		this.dmnCitieses = dmnCitieses;
	}

}