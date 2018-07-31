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

@Entity
@Table(name = "app_polyglot_quiz")
public class AppPolyglotQuiz extends AuditEntity {
	private static final long serialVersionUID = 3590430398096053292L;
	
	private Integer id;
	private AppUsers appUsers;
	private String quizName;
	private String isActive;
	private Integer duration;
	private String description;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String quizIdentifier;
	private String negitiveMarks;
	
	private Set<AppPolyglotQuizQuestions> questions = new HashSet<AppPolyglotQuizQuestions>(0);

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
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
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

	@Column(name = "is_active", nullable = false, length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Column(name = "duration", nullable = false)
	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	@Column(name = "quiz_name", nullable = false, length = 100)
	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}

	@Column(name = "description", nullable = true, length = 250)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "polyglotQuiz")
	public Set<AppPolyglotQuizQuestions> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<AppPolyglotQuizQuestions> questions) {
		this.questions = questions;
	}
	@Column(name = "quiz_identifier", nullable = false, length = 45)
	public String getQuizIdentifier() {
		return quizIdentifier;
	}

	public void setQuizIdentifier(String quizIdentifier) {
		this.quizIdentifier = quizIdentifier;
	}
	@Column(name = "negitiveMarks", nullable = true, length = 10)
	public String getNegitiveMarks() {
		return negitiveMarks;
	}

	public void setNegitiveMarks(String negitiveMarks) {
		this.negitiveMarks = negitiveMarks;
	}

}
