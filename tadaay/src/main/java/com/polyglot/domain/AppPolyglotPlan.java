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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "app_polyglot_plan")
public class AppPolyglotPlan extends AuditEntity {

	private Integer id;
	private DmnPolyglotPlans plan;
	private Timestamp subscriptionDate;
	private Timestamp expiredDate;
	private String isExpired;
	private String keyword;
	private String location;
	private String duration;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private AppUsers appUsers;
	
	
	@Override
	public String toString() {
		return "AppPolyglotPlan [id=" + id + ", planName=" + plan.getPlanName() + ", subscriptionDate=" + subscriptionDate
				+ ", expiredDate=" + expiredDate + ", isExpired=" + isExpired + ", keyword=" + keyword + ", location="
				+ location + ", duration=" + duration + ", lastInsrtUpdUsrId=" + lastInsrtUpdUsrId + ", lastInsrtUpdTs="
				+ lastInsrtUpdTs + ", appUsers=" + appUsers + "]";
	}

	public AppPolyglotPlan() {
		
	}
	
	public AppPolyglotPlan(Integer id, DmnPolyglotPlans planName,
			Timestamp subscriptionDate, Timestamp expiredDate,
			String isExpired,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs,
			AppUsers appUsers) {
		super();
		this.id = id;
		this.plan = planName;
		this.subscriptionDate = subscriptionDate;
		this.isExpired = isExpired;
		this.expiredDate = expiredDate;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.appUsers = appUsers;
	}
	

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "plan_id", nullable = false)
	public DmnPolyglotPlans getPlan() {
		return plan;
	}

	public void setPlan(DmnPolyglotPlans plan) {
		this.plan = plan;
	}

	@Column(name = "subscription_date", nullable = false, length = 19)
	public Timestamp getSubscriptionDate() {
		return subscriptionDate;
	}

	public void setSubscriptionDate(Timestamp subscriptionDate) {
		this.subscriptionDate = subscriptionDate;
	}

	@Column(name = "expiration_date", nullable = false, length = 19)
	public Timestamp getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(Timestamp expiredDate) {
		this.expiredDate = expiredDate;
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

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}

	@Column(name = "is_expired", nullable = false, length = 1)
	public String getIsExpired() {
		return isExpired;
	}

	public void setIsExpired(String isExpired) {
		this.isExpired = isExpired;
	}
	
	@Column(name = "keyword", nullable = true, length = 100)
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(name = "location", nullable = true, length = 100)
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "duration", nullable = false, length = 25)
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

}
