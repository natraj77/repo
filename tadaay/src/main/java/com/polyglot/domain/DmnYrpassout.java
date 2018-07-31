package com.polyglot.domain;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * DmnYrpassout entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dmn_yrpassout")
public class DmnYrpassout extends AuditEntity {

	// Fields

	private Integer year;
	private String dsblIn;
	private Timestamp lastInsrtUpdTs;

	// Constructors

	/** default constructor */
	public DmnYrpassout() {
	}

	/** full constructor */
	public DmnYrpassout(String dsblIn, Timestamp lastInsrtUpdTs) {
		this.dsblIn = dsblIn;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "year", unique = true, nullable = false)
	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
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

}