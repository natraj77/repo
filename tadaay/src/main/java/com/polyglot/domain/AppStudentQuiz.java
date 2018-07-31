package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "app_student_quiz")
public class AppStudentQuiz extends AuditEntity {

	private Integer id;
	private Integer studentId;
	private Integer taskId;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String status;
	private String result;
	private Timestamp startDate;
	private Timestamp endDate;
	private String score;
	private Timestamp assignedDate;
	private Integer userId;
	private String userString;

	
	public AppStudentQuiz(Integer id, Integer studentId, Integer taskId,
			Integer lastInsrtUpdUsrId, Timestamp lastInsrtUpdTs, String status,
			String result, Timestamp startDate, Timestamp endDate, String score, Timestamp assignedDate) {
		this.id = id;
		this.studentId = studentId;
		this.taskId = taskId;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.status = status;
		this.result = result;
		this.startDate = startDate;
		this.endDate = endDate;
		this.score = score;
		this.assignedDate = assignedDate;
	}
	
	public AppStudentQuiz() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "AppStudentQuiz [id=" + id + ", studentId=" + studentId
				+ ", taskId=" + taskId + ", lastInsrtUpdUsrId="
				+ lastInsrtUpdUsrId + ", lastInsrtUpdTs=" + lastInsrtUpdTs
				+ ", status=" + status + ", result=" + result + ", startDate="
				+ startDate + ", endDate=" + endDate + ", score=" + score
				+ ", assignedDate=" + assignedDate + ", userId=" + userId + "]";
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

	@Column(name = "student_id", nullable = false)
	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
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
	
	@Column(name = "result", length = 12)
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Column(name = "task_id", nullable = false)
	public Integer getTaskId() {
		return taskId;
	}
	
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	@Column(name = "status", nullable = false, length = 100)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "startDate", nullable = true, length = 19)
	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	@Column(name = "endDate", nullable = true, length = 19)
	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	@Column(name = "score", length = 3)
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	@Column(name = "assigned_date", nullable = true, length = 19)
	public Timestamp getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(Timestamp assignedDate) {
		this.assignedDate = assignedDate;
	}
	
	@Column(name = "app_user_id", length = 11)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	@Column(name = "app_user_answers", length = 512)
	public String getUserString() {
		return userString;
	}

	public void setUserString(String userString) {
		this.userString = userString;
	}
}
