package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "dmn_polyglot_plans")
public class DmnPolyglotPlans extends AuditEntity {

	private Integer id;
	private String planName;
	private Integer leadAvailability;
	private Integer viewContactLead;
	private Integer addNewBatches;
	private Integer addDemos;
	private Integer formBatches;
	private Integer paymentTracking;
	private Integer numberOfEmails;
	private Integer numberOfSMS;
	private Integer customRuleEngine;
	private Integer emailTemplates;
	private Integer onlineQuizes;
	private Integer courseCertificate;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;

	// Property accessors
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

	@Column(name = "plan_name", length = 50)
	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	@Column(name = "lead_availability", nullable = false)
	public Integer getLeadAvailability() {
		return leadAvailability;
	}

	public void setLeadAvailability(Integer leadAvailability) {
		this.leadAvailability = leadAvailability;
	}

	@Column(name = "view_contact_lead", nullable = false)
	public Integer getViewContactLead() {
		return viewContactLead;
	}

	public void setViewContactLead(Integer viewContactLead) {
		this.viewContactLead = viewContactLead;
	}

	@Column(name = "add_new_batches", nullable = false)
	public Integer getAddNewBatches() {
		return addNewBatches;
	}

	public void setAddNewBatches(Integer addNewBatches) {
		this.addNewBatches = addNewBatches;
	}

	@Column(name = "add_demos", nullable = false)
	public Integer getAddDemos() {
		return addDemos;
	}

	public void setAddDemos(Integer addDemos) {
		this.addDemos = addDemos;
	}

	@Column(name = "form_batches", nullable = false)
	public Integer getFormBatches() {
		return formBatches;
	}

	public void setFormBatches(Integer formBatches) {
		this.formBatches = formBatches;
	}

	@Column(name = "payment_tracking", nullable = false)
	public Integer getPaymentTracking() {
		return paymentTracking;
	}

	public void setPaymentTracking(Integer paymentTracking) {
		this.paymentTracking = paymentTracking;
	}

	@Column(name = "no_of_emails", nullable = false)
	public Integer getNumberOfEmails() {
		return numberOfEmails;
	}

	public void setNumberOfEmails(Integer numberOfEmails) {
		this.numberOfEmails = numberOfEmails;
	}

	@Column(name = "no_of_sms", nullable = false)
	public Integer getNumberOfSMS() {
		return numberOfSMS;
	}

	public void setNumberOfSMS(Integer numberOfSMS) {
		this.numberOfSMS = numberOfSMS;
	}

	@Column(name = "custom_rule_engine", nullable = false)
	public Integer getCustomRuleEngine() {
		return customRuleEngine;
	}

	public void setCustomRuleEngine(Integer customRuleEngine) {
		this.customRuleEngine = customRuleEngine;
	}

	@Column(name = "email_templates", nullable = false)
	public Integer getEmailTemplates() {
		return emailTemplates;
	}

	public void setEmailTemplates(Integer emailTemplates) {
		this.emailTemplates = emailTemplates;
	}

	@Column(name = "online_quizzes", nullable = false)
	public Integer getOnlineQuizes() {
		return onlineQuizes;
	}

	public void setOnlineQuizes(Integer onlineQuizes) {
		this.onlineQuizes = onlineQuizes;
	}

	@Column(name = "course_certificate", nullable = false)
	public Integer getCourseCertificate() {
		return courseCertificate;
	}

	public void setCourseCertificate(Integer courseCertificate) {
		this.courseCertificate = courseCertificate;
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
}
