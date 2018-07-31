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
@Table(name = "app_users_skillset_details")
public class AppUsersSkillSetDetails extends AuditEntity {

	// Fields

	private Integer id;
	private AppUsers appUsers;
	private String skillSet;
	private Integer years;
	private Timestamp lastInsrtUpdTs;
	private Integer lastInsrtUpdUsrId;

	// Constructors

	/** default constructor */
	public AppUsersSkillSetDetails() {
	}

	/** minimal constructor */
	public AppUsersSkillSetDetails(AppUsers appUsers, String keySkill,
			Integer years, String skillSet, 
			Timestamp lastInsrtUpdTs, Integer lastInsrtUpdUsrId) {
		this.appUsers = appUsers;
		this.skillSet = skillSet;
		this.years = years;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	/** full constructor */
	public AppUsersSkillSetDetails(AppUsers appUsers, String keySkill,
			Integer years, String skillSet, String designation,
			String joiningDate, String lastDate, Timestamp lastInsrtUpdTs,
			Integer lastInsrtUpdUsrId) {
		this.appUsers = appUsers;
		this.skillSet = skillSet;
		this.years = years;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
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

	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "appuserId", nullable = false)
	public AppUsers getAppUsers() {
		return this.appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}
	
	@Column(name = "last_insrt_upd_ts", nullable = false, length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	@Column(name = "last_insrt_upd_usr_id", nullable = false)
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}
	@Column(name = "key_skill", nullable = true, length = 45)
	public String getSkillSet() {
		return skillSet;
	}

	public void setSkillSet(String skillSet) {
		this.skillSet = skillSet;
	}
	@Column(name = "years", nullable = true, length = 4)
	public Integer getYears() {
		return years;
	}

	public void setYears(Integer years) {
		this.years = years;
	}

}