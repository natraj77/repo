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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * DmnCntry entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dmn_cntry")
public class DmnCntry extends AuditEntity implements java.io.Serializable {

	// Fields

	private Integer cntryId;
	private String cntryDesc;
	private String cntryCode;
	private String cntryLongDesc;
	private String dsblIn;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private Set<DmnStates> dmnStateses = new HashSet<DmnStates>(0);

	// Constructors

	/** default constructor */
	public DmnCntry() {
	}

	/** minimal constructor */
	public DmnCntry(String cntryDesc, String cntryCode) {
		this.cntryDesc = cntryDesc;
		this.cntryCode = cntryCode;
	}

	/** full constructor */
	public DmnCntry(String cntryDesc, String cntryCode, String cntryLongDesc,
			String dsblIn, Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			Set<DmnStates> dmnStateses) {
		this.cntryDesc = cntryDesc;
		this.cntryCode = cntryCode;
		this.cntryLongDesc = cntryLongDesc;
		this.dsblIn = dsblIn;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.dmnStateses = dmnStateses;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "cntry_id", unique = true, nullable = false)
	public Integer getCntryId() {
		return this.cntryId;
	}

	public void setCntryId(Integer cntryId) {
		this.cntryId = cntryId;
	}

	@Column(name = "cntry_desc", nullable = false, length = 45)
	public String getCntryDesc() {
		return this.cntryDesc;
	}

	public void setCntryDesc(String cntryDesc) {
		this.cntryDesc = cntryDesc;
	}

	@Column(name = "cntry_code", nullable = false, length = 5)
	public String getCntryCode() {
		return this.cntryCode;
	}

	public void setCntryCode(String cntryCode) {
		this.cntryCode = cntryCode;
	}

	@Column(name = "cntry_long_desc", length = 45)
	public String getCntryLongDesc() {
		return this.cntryLongDesc;
	}

	public void setCntryLongDesc(String cntryLongDesc) {
		this.cntryLongDesc = cntryLongDesc;
	}

	@Column(name = "dsbl_in", length = 1)
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "dmnCntry")
	public Set<DmnStates> getDmnStateses() {
		return this.dmnStateses;
	}

	public void setDmnStateses(Set<DmnStates> dmnStateses) {
		this.dmnStateses = dmnStateses;
	}

}