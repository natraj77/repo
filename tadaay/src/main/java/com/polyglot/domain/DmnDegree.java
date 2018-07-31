package com.polyglot.domain;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * DmnDegree entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dmn_degree")
public class DmnDegree extends AuditEntity {

	// Fields

	private String degreeName;
	private String dsblIn;
	private Timestamp lastInsrtUpdTs;

	// Constructors

	/** default constructor */
	public DmnDegree() {
	}

	/** full constructor */
	public DmnDegree(String dsblIn, Timestamp lastInsrtUpdTs) {
		this.dsblIn = dsblIn;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "degree_name", unique = true, nullable = false, length = 20)
	public String getDegreeName() {
		return this.degreeName;
	}

	public void setDegreeName(String degreeName) {
		this.degreeName = degreeName;
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