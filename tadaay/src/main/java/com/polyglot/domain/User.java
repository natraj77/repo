package com.polyglot.domain;

public class User {

	private int id;
	private String firstName;
	private String lastName;
	private String mobile;
	private String email;
	private String status;
	private String invitedDate;
    private String lastLoginDate;

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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public String getInvitedDate() {
		return invitedDate;
	}
	public void setInvitedDate(String invitedDate) {
		this.invitedDate = invitedDate;
	}
	public String getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName="
				+ lastName + ", mobile=" + mobile + ", email=" + email
				+ ", status=" + status + ", invitedDate=" + invitedDate
				+ ", lastLoginDate=" + lastLoginDate + "]";
	}
}
