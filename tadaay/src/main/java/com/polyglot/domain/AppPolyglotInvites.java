package com.polyglot.domain;

import java.sql.Timestamp;

public class AppPolyglotInvites extends AuditEntity implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String firstName;
	private String lastName;
	private String mobile;
	private String email;
	private String status;
	private String role;
	private String invitedDate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}	
	public String getInvitedDate() {
		return invitedDate;
	}
	public void setInvitedDate(String invitedDate) {
		this.invitedDate = invitedDate;
	}
	
	@Override
	public String toString() {
		return "AppPolyglotInvites [id=" + id + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", mobile=" + mobile + ", email="
				+ email + ", status=" + status + ", role=" + role
				+ ", invitedDate=" + invitedDate + "]";
	}
}
