package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "app_student_task")
public class AppStudentTask extends AuditEntity {

	private Integer id;
	private Integer studentId;
	private Integer taskId;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String taskStatus;
	private String result;
	private Timestamp startDate;
	private Timestamp endDate;
	private Timestamp assignedDate;
	private Integer userId;
	

	public AppStudentTask(Integer id, Integer studentId, Integer taskId, Integer lastInsrtUpdUsrId,
			Timestamp lastInsrtUpdTs,Timestamp startDate,Timestamp endDate, Timestamp assignedDate) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.setTaskId(taskId);
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.startDate = startDate;
		this.endDate = endDate;
		this.assignedDate = assignedDate;
	}
	
	@Override
	public String toString() {
		return "AppStudentTask [id=" + id + ", studentId=" + studentId
				+ ", taskId=" + taskId + ", lastInsrtUpdUsrId="
				+ lastInsrtUpdUsrId + ", lastInsrtUpdTs=" + lastInsrtUpdTs
				+ ", taskStatus=" + taskStatus + ", result=" + result
				+ ", startDate=" + startDate + ", endDate=" + endDate
				+ ", assignedDate=" + assignedDate + ", userId=" + userId + "]";
	}

	public AppStudentTask() {

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

	@Column(name = "student_id", length=11)
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

	@Column(name = "task_status", nullable = false, length = 100)
	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
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
}
