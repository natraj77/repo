package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "app_polyglot_lead_demo_status")
public class AppPolyglotLeadDemoStatus extends AuditEntity {

	private Integer id;
	private Integer partnerId;
	private Integer leadId;
	private Integer demoId;
	private String emailId;
	private String inviteStatus;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String firstName;
	private String lastName;

	@Override
	public String toString() {
		return "AppPolyglotLeadDemoStatus [id=" + id + ", partnerId=" + partnerId + ", leadId=" + leadId + ", demoId="
				+ demoId + ", emailId=" + emailId + ", inviteStatus=" + inviteStatus + ", lastInsrtUpdUsrId="
				+ lastInsrtUpdUsrId + ", lastInsrtUpdTs=" + lastInsrtUpdTs + "]";
	}

	public AppPolyglotLeadDemoStatus() {

	}

	public AppPolyglotLeadDemoStatus(Integer id, Integer partnerId, Integer leadId, Integer demoId, String emailId,
			String inviteStatus, Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs, String firstName, String lastName) {
		super();
		this.id = id;
		this.setPartnerId(partnerId);
		this.leadId = leadId;
		this.demoId = demoId;
		this.emailId = emailId;
		this.inviteStatus = inviteStatus;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.firstName = firstName;
		this.lastName = lastName;
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

	@Column(name = "lead_id", nullable = false)
	public Integer getLeadId() {
		return leadId;
	}

	public void setLeadId(Integer leadId) {
		this.leadId = leadId;
	}

	@Column(name = "demo_id", nullable = false)
	public Integer getDemoId() {
		return demoId;
	}

	public void setDemoId(Integer demoId) {
		this.demoId = demoId;
	}

	@Column(name = "email_id", length = 100)
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	@Column(name = "invite_status", length = 20)
	public String getInviteStatus() {
		return inviteStatus;
	}

	public void setInviteStatus(String inviteStatus) {
		this.inviteStatus = inviteStatus;
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

	@Column(name = "partner_id", nullable = false)
	public Integer getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}
	
	@Column(name = "first_name", length = 50)
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "last_name", length = 50)
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

}
