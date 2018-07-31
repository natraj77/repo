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

/**
 * AppPolyglotPayment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_payment")
public class AppPolyglotPayment extends AuditEntity {

	// Fields

	private Integer id;
	private Integer studentId;
	private Double totalFee;
	private Double feePaid;
	private Double feePending;
	private String mode;
	private String transactionRef;
	private Double optedDiscount;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private AppUsers appUsers;
	private Integer userId;

	// Constructors

	/** default constructor */
	public AppPolyglotPayment() {
	}

	/** full constructor */
	public AppPolyglotPayment(Integer studentId,
			Double totalFee, Double feePaid, Double feePending, String mode,
			String transactionRef, Double optedDiscount,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs) {
		this.studentId = studentId;
		this.totalFee = totalFee;
		this.feePaid = feePaid;
		this.feePending = feePending;
		this.mode = mode;
		this.transactionRef = transactionRef;
		this.optedDiscount = optedDiscount;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
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

	@Column(name = "student_id", nullable = false)
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "total_fee", nullable = false, precision = 22, scale = 0)
	public Double getTotalFee() {
		return this.totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	@Column(name = "fee_paid", nullable = false, precision = 22, scale = 0)
	public Double getFeePaid() {
		return this.feePaid;
	}

	public void setFeePaid(Double feePaid) {
		this.feePaid = feePaid;
	}

	@Column(name = "fee_pending", nullable = false, precision = 22, scale = 0)
	public Double getFeePending() {
		return this.feePending;
	}

	public void setFeePending(Double feePending) {
		this.feePending = feePending;
	}

	@Column(name = "mode", nullable = false, length = 10)
	public String getMode() {
		return this.mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Column(name = "transaction_ref", nullable = true, length = 50)
	public String getTransactionRef() {
		return this.transactionRef;
	}

	public void setTransactionRef(String transactionRef) {
		this.transactionRef = transactionRef;
	}

	@Column(name = "opted_discount", nullable = false, precision = 22, scale = 0)
	public Double getOptedDiscount() {
		return this.optedDiscount;
	}

	public void setOptedDiscount(Double optedDiscount) {
		this.optedDiscount = optedDiscount;
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

	@Column(name = "app_user_id", length = 11)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}