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
@Table(name = "app_email_templates")
public class AppEmailTemplate extends AuditEntity {

	private Integer id;
	private String templateName;
	private String fileName;
	private String isActive;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private AppUsers appUsers;

	@Override
	public String toString() {
		return "AppEmailTemplate [id=" + id + ", templateName=" + templateName + ", fileName=" + fileName
				+ ", isActive=" + isActive + ", lastInsrtUpdUsrId=" + lastInsrtUpdUsrId + ", lastInsrtUpdTs="
				+ lastInsrtUpdTs + ", appUsers=" + appUsers + "]";
	}

	public AppEmailTemplate() {

	}

	public AppEmailTemplate(Integer id, String templateName, String fileName, String isActive,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs, AppUsers appUsers) {
		super();
		this.id = id;
		this.templateName = templateName;
		this.fileName = fileName;
		this.isActive = isActive;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.appUsers = appUsers;
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

	@Column(name = "template_name", length = 100)
	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	@Column(name = "file_name", length = 100)
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "is_active", length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Column(name = "last_insrt_upd_usr_id", nullable = false)
	public Integer getLastInsrtUpdUsrId() {
		return lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Column(name = "last_insrt_upd_ts", nullable = false, length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}

}
