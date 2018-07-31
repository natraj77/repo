package com.polyglot.model;

public class AppPolyglotPaymentModel {

	private Integer id;
	private String firstName;
	private String lastName;
	private Integer studentId;
	private Double totalFee;
	private Double feePaid;
	private Double feePending;
	private String mode;
	private String transactionRef;
	private Double optedDiscount;
	private Integer userId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public Double getFeePaid() {
		return feePaid;
	}

	public void setFeePaid(Double feePaid) {
		this.feePaid = feePaid;
	}

	public Double getFeePending() {
		return feePending;
	}

	public void setFeePending(Double feePending) {
		this.feePending = feePending;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getTransactionRef() {
		return transactionRef;
	}

	public void setTransactionRef(String transactionRef) {
		this.transactionRef = transactionRef;
	}

	public Double getOptedDiscount() {
		return optedDiscount;
	}

	public void setOptedDiscount(Double optedDiscount) {
		this.optedDiscount = optedDiscount;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "AppPolyglotPaymentModel [id=" + id + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", studentId=" + studentId
				+ ", totalFee=" + totalFee + ", feePaid=" + feePaid
				+ ", feePending=" + feePending + ", mode=" + mode
				+ ", transactionRef=" + transactionRef + ", optedDiscount="
				+ optedDiscount + ", userId=" + userId + "]";
	}

}
