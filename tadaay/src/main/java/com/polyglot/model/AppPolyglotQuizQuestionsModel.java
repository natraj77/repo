package com.polyglot.model;

public class AppPolyglotQuizQuestionsModel {

	private String courseName;
	private String quizLevel;
	private String topic;
	private Integer numberOfQuestions;

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getQuizLevel() {
		return quizLevel;
	}

	public void setQuizLevel(String quizLevel) {
		this.quizLevel = quizLevel;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public Integer getNumberOfQuestions() {
		return numberOfQuestions;
	}

	public void setNumberOfQuestions(Integer numberOfQuestions) {
		this.numberOfQuestions = numberOfQuestions;
	}

}
