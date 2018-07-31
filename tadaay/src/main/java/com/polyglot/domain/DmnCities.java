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
 * DmnCities entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dmn_cities")
public class DmnCities extends AuditEntity implements java.io.Serializable {

	// Fields

	private Integer cityId;
	private DmnStates dmnStates;
	private String cityDesc;
	private String cityLongDesc;
	private String cityCode;
	private String dsblIn;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;

	// Constructors

	/** default constructor */
	public DmnCities() {
	}

	/** minimal constructor */
	public DmnCities(DmnStates dmnStates, String dsblIn) {
		this.dmnStates = dmnStates;
		this.dsblIn = dsblIn;
	}

	/** full constructor */
	public DmnCities(DmnStates dmnStates, String cityDesc, String cityLongDesc,
			String cityCode, String dsblIn, Integer lastInsrtUpdUsrId,
			Timestamp lastInsrtUpdTs) {
		this.dmnStates = dmnStates;
		this.cityDesc = cityDesc;
		this.cityLongDesc = cityLongDesc;
		this.cityCode = cityCode;
		this.dsblIn = dsblIn;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "city_id", unique = true, nullable = false)
	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "state_id", nullable = false)
	public DmnStates getDmnStates() {
		return this.dmnStates;
	}

	public void setDmnStates(DmnStates dmnStates) {
		this.dmnStates = dmnStates;
	}

	@Column(name = "city_desc", length = 45)
	public String getCityDesc() {
		return this.cityDesc;
	}

	public void setCityDesc(String cityDesc) {
		this.cityDesc = cityDesc;
	}

	@Column(name = "city_long_desc", length = 45)
	public String getCityLongDesc() {
		return this.cityLongDesc;
	}

	public void setCityLongDesc(String cityLongDesc) {
		this.cityLongDesc = cityLongDesc;
	}

	@Column(name = "city_code", length = 5)
	public String getCityCode() {
		return this.cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	@Column(name = "dsbl_in", nullable = false, length = 1)
	public String getDsblIn() {
		return this.dsblIn;
	}

	public void setDsblIn(String dsblIn) {
		this.dsblIn = dsblIn;
	}

	@Column(name = "last_insrt_upd_usr_id")
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Column(name = "last_insrt_upd_ts", length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

}