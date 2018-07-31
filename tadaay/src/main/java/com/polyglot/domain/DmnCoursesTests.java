package com.polyglot.domain;

import java.sql.Timestamp;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * DmnCoursesTests entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dmn_courses_tests")
public class DmnCoursesTests extends AuditEntity implements java.io.Serializable {

	// Fields

	private DmnCoursesTestsId id;
	private String question;
	private String choiceA;
	private String correctChoice;
	private String dsblIn;
	private Timestamp lastInsrtUpdTs;
	private String choiceB;
	private String choiceC;
	private String choiceD;

	// Constructors

	/** default constructor */
	public DmnCoursesTests() {
	}

	/** minimal constructor */
	public DmnCoursesTests(DmnCoursesTestsId id) {
		this.id = id;
	}

	/** full constructor */
	public DmnCoursesTests(DmnCoursesTestsId id, String question,
			String choiceA, String correctChoice, String dsblIn,
			Timestamp lastInsrtUpdTs, String choiceB, String choiceC,
			String choiceD) {
		this.id = id;
		this.question = question;
		this.choiceA = choiceA;
		this.correctChoice = correctChoice;
		this.dsblIn = dsblIn;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.choiceB = choiceB;
		this.choiceC = choiceC;
		this.choiceD = choiceD;
	}

	// Property accessors
	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "questionNo", column = @Column(name = "question_no", nullable = false)),
			@AttributeOverride(name = "courseId", column = @Column(name = "courseId", nullable = false)),
			@AttributeOverride(name = "testId", column = @Column(name = "testId", nullable = false)) })
	public DmnCoursesTestsId getId() {
		return this.id;
	}

	public void setId(DmnCoursesTestsId id) {
		this.id = id;
	}

	@Column(name = "question", length = 145)
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "choice_a", length = 145)
	public String getChoiceA() {
		return this.choiceA;
	}

	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}

	@Column(name = "correct_choice", length = 1)
	public String getCorrectChoice() {
		return this.correctChoice;
	}

	public void setCorrectChoice(String correctChoice) {
		this.correctChoice = correctChoice;
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

	@Column(name = "choice_b", length = 45)
	public String getChoiceB() {
		return this.choiceB;
	}

	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}

	@Column(name = "choice_c", length = 45)
	public String getChoiceC() {
		return this.choiceC;
	}

	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}

	@Column(name = "choice_d", length = 45)
	public String getChoiceD() {
		return this.choiceD;
	}

	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD;
	}

}