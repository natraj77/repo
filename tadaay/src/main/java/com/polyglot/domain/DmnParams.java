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
@Table(name = "dmn_params")
public class DmnParams extends AuditEntity implements java.io.Serializable {

	// Fields
	private Integer id;
    private String keyName;
	private String keyValue;
	private String dsblIn;
	private Timestamp lastInsrtUpdTs;
	private Integer lastInsrtUpdUsrId;
	private String section ;
	
	@Column(name = "keyname", length = 45)
	public String getKeyName() {
		return keyName;
	}
	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}
	@Column(name = "keyvalue", length = 45)
	public String getKeyValue() {
		return keyValue;
	}
	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
	@Column(name = "dsbld_in", length = 1)
	public String getDsblIn() {
		return dsblIn;
	}
	public void setDsblIn(String dsblIn) {
		this.dsblIn = dsblIn;
	}
	@Column(name = "last_insrt_upd_ts", length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return lastInsrtUpdTs;
	}
	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}
	@Column(name = "last_insrt_upd_usr_id", length = 11)
	public Integer getLastInsrtUpdUsrId() {
		return lastInsrtUpdUsrId;
	}
	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}
	@Column(name = "section", length = 45)
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
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

	
	
}