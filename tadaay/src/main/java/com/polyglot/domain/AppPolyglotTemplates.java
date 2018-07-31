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

/**
 * AppPolyglotBatch entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_templates")
public class AppPolyglotTemplates extends AuditEntity {

	// Fields

	private Integer templateId;//template_id;
	private String isActive;//is_active;
	private String templateType;//template_type;
	private String templateName;//template_name;
	private String templateContent;//template_content;
	private Integer lastInsertedUpdUserId;//last_insrt_upd_usr_id;
	private Timestamp lastInsrtUpdTs;
	// Constructors

	/** default constructor */
	public AppPolyglotTemplates() {
	}

	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "template_id", unique = true, nullable = false)
	public Integer getTemplateId() {
		return templateId;
	}

	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}
	@Column(name = "is_active", nullable = true, length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	@Column(name = "template_type", nullable = true, length = 20)
	public String getTemplateType() {
		return templateType;
	}

	public void setTemplateType(String templateType) {
		this.templateType = templateType;
	}
	@Column(name = "template_name", nullable = true, length = 48)
	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	@Column(name = "template_content", nullable = true, length = 16392)
	public String getTemplateContent() {
		return templateContent;
	}

	public void setTemplateContent(String templateContent) {
		this.templateContent = templateContent;
	}
	@Column(name = "last_insrt_upd_usr_id", nullable = true, length = 11)
	public Integer getLastInsertedUpdUserId() {
		return lastInsertedUpdUserId;
	}

	public void setLastInsertedUpdUserId(Integer lastInsertedUpdUserId) {
		this.lastInsertedUpdUserId = lastInsertedUpdUserId;
	}
	@Column(name = "last_insrt_upd_ts", nullable = true)
	public Timestamp getLastInsrtUpdTs() {
		return lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	

}