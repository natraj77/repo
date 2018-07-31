package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
@Table(name = "dmn_questions")
public class DmnQuestions extends AuditEntity {

	private Integer id;
	private String courseName;
	private String quizLevel;
	private String topic;
	private Integer topicId;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String questionText;
	private String questionHasImage;
	private String questionImagePath;
	private String optionAText;
	private String optionAHasImage;
	private String optionAImagePath;
	private String optionBText;
	private String optionBHasImage;
	private String optionBImagePath;
	private String optionCText;
	private String optionCHasImage;
	private String optionCImagePath;
	private String optionDText;
	private String optionDHasImage;
	private String optionDImagePath;
	private String optionEText;
	private String optionEHasImage;
	private String optionEImagePath;
	private String optionFText;
	private String optionFHasImage;
	private String optionFImagePath;
	
	private String correctOption;

	
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


	@Column(name = "course_name", length = 100)
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Column(name = "quiz_level", length = 25)
	public String getQuizLevel() {
		return quizLevel;
	}

	public void setQuizLevel(String quizLevel) {
		this.quizLevel = quizLevel;
	}

	@Column(name = "topic", length = 50)
	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	@Column(name = "topic_id", nullable = false)
	public Integer getTopicId() {
		return topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	
	@Column(name = "question_text", nullable = false)
	@Type(type="text")
	public String getQuestionText() {
		return questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	@Column(name = "question_has_image", length = 1, nullable = true)
	public String getQuestionHasImage() {
		return questionHasImage;
	}

	public void setQuestionHasImage(String questionHasImage) {
		this.questionHasImage = questionHasImage;
	}

	@Column(name = "question_image_path", length = 100, nullable = true)
	public String getQuestionImagePath() {
		return questionImagePath;
	}

	public void setQuestionImagePath(String questionImagePath) {
		this.questionImagePath = questionImagePath;
	}

	@Column(name = "option_a_text", nullable = false)
	@Type(type="text")
	public String getOptionAText() {
		return optionAText;
	}

	public void setOptionAText(String optionAText) {
		this.optionAText = optionAText;
	}

	@Column(name = "option_a_has_image", length = 1, nullable = true)
	public String getOptionAHasImage() {
		return optionAHasImage;
	}

	public void setOptionAHasImage(String optionAHasImage) {
		this.optionAHasImage = optionAHasImage;
	}

	@Column(name = "option_a_image_path", length = 100, nullable = true)
	public String getOptionAImagePath() {
		return optionAImagePath;
	}

	public void setOptionAImagePath(String optionAImagePath) {
		this.optionAImagePath = optionAImagePath;
	}

	@Column(name = "option_b_text", nullable = false)
	@Type(type="text")
	public String getOptionBText() {
		return optionBText;
	}

	public void setOptionBText(String optionBText) {
		this.optionBText = optionBText;
	}

	@Column(name = "option_b_has_image", length = 1, nullable = true)
	public String getOptionBHasImage() {
		return optionBHasImage;
	}

	public void setOptionBHasImage(String optionBHasImage) {
		this.optionBHasImage = optionBHasImage;
	}

	@Column(name = "option_b_image_path", length = 100, nullable = true)
	public String getOptionBImagePath() {
		return optionBImagePath;
	}

	public void setOptionBImagePath(String optionBImagePath) {
		this.optionBImagePath = optionBImagePath;
	}

	@Column(name = "option_c_text", nullable = false)
	@Type(type="text")
	public String getOptionCText() {
		return optionCText;
	}

	public void setOptionCText(String optionCText) {
		this.optionCText = optionCText;
	}

	@Column(name = "option_c_has_image", length = 1, nullable = true)
	public String getOptionCHasImage() {
		return optionCHasImage;
	}

	public void setOptionCHasImage(String optionCHasImage) {
		this.optionCHasImage = optionCHasImage;
	}

	@Column(name = "option_c_image_path", length = 100, nullable = true)
	public String getOptionCImagePath() {
		return optionCImagePath;
	}

	public void setOptionCImagePath(String optionCImagePath) {
		this.optionCImagePath = optionCImagePath;
	}

	@Column(name = "option_d_text", nullable = false)
	@Type(type="text")
	public String getOptionDText() {
		return optionDText;
	}

	public void setOptionDText(String optionDText) {
		this.optionDText = optionDText;
	}

	@Column(name = "option_d_has_image", length = 1, nullable = true)
	public String getOptionDHasImage() {
		return optionDHasImage;
	}

	public void setOptionDHasImage(String optionDHasImage) {
		this.optionDHasImage = optionDHasImage;
	}

	@Column(name = "option_d_image_path", length = 100, nullable = true)
	public String getOptionDImagePath() {
		return optionDImagePath;
	}

	public void setOptionDImagePath(String optionDImagePath) {
		this.optionDImagePath = optionDImagePath;
	}

	@Column(name = "option_e_text", nullable = false)
	@Type(type="text")
	public String getOptionEText() {
		return optionEText;
	}

	public void setOptionEText(String optionEText) {
		this.optionEText = optionEText;
	}

	@Column(name = "option_e_has_image", length = 1, nullable = true)
	public String getOptionEHasImage() {
		return optionEHasImage;
	}

	public void setOptionEHasImage(String optionEHasImage) {
		this.optionEHasImage = optionEHasImage;
	}

	@Column(name = "option_e_image_path", length = 100, nullable = true)
	public String getOptionEImagePath() {
		return optionEImagePath;
	}

	public void setOptionEImagePath(String optionEImagePath) {
		this.optionEImagePath = optionEImagePath;
	}

	@Column(name = "option_f_text", nullable = false)
	@Type(type="text")
	public String getOptionFText() {
		return optionFText;
	}

	public void setOptionFText(String optionFText) {
		this.optionFText = optionFText;
	}

	@Column(name = "option_f_has_image", length = 1, nullable = true)
	public String getOptionFHasImage() {
		return optionFHasImage;
	}

	public void setOptionFHasImage(String optionFHasImage) {
		this.optionFHasImage = optionFHasImage;
	}

	@Column(name = "option_f_image_path", length = 100, nullable = true)
	public String getOptionFImagePath() {
		return optionFImagePath;
	}

	public void setOptionFImagePath(String optionFImagePath) {
		this.optionFImagePath = optionFImagePath;
	}

	@Column(name = "correct_option", length = 20, nullable = true)
	public String getCorrectOption() {
		return correctOption;
	}

	public void setCorrectOption(String correctOption) {
		this.correctOption = correctOption;
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
