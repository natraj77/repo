package com.polyglot.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * DmnCoursesTestsId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class DmnCoursesTestsId implements java.io.Serializable {

	// Fields

	private Integer questionNo;
	private Integer courseId;
	private Integer testId;

	// Constructors

	/** default constructor */
	public DmnCoursesTestsId() {
	}

	/** full constructor */
	public DmnCoursesTestsId(Integer questionNo, Integer courseId,
			Integer testId) {
		this.questionNo = questionNo;
		this.courseId = courseId;
		this.testId = testId;
	}

	// Property accessors

	@Column(name = "question_no", nullable = false)
	public Integer getQuestionNo() {
		return this.questionNo;
	}

	public void setQuestionNo(Integer questionNo) {
		this.questionNo = questionNo;
	}

	@Column(name = "courseId", nullable = false)
	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Column(name = "testId", nullable = false)
	public Integer getTestId() {
		return this.testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof DmnCoursesTestsId))
			return false;
		DmnCoursesTestsId castOther = (DmnCoursesTestsId) other;

		return ((this.getQuestionNo() == castOther.getQuestionNo()) || (this
				.getQuestionNo() != null && castOther.getQuestionNo() != null && this
				.getQuestionNo().equals(castOther.getQuestionNo())))
				&& ((this.getCourseId() == castOther.getCourseId()) || (this
						.getCourseId() != null
						&& castOther.getCourseId() != null && this
						.getCourseId().equals(castOther.getCourseId())))
				&& ((this.getTestId() == castOther.getTestId()) || (this
						.getTestId() != null && castOther.getTestId() != null && this
						.getTestId().equals(castOther.getTestId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getQuestionNo() == null ? 0 : this.getQuestionNo()
						.hashCode());
		result = 37 * result
				+ (getCourseId() == null ? 0 : this.getCourseId().hashCode());
		result = 37 * result
				+ (getTestId() == null ? 0 : this.getTestId().hashCode());
		return result;
	}

}