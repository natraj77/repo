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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "app_users_social_media")
public class AppUsersSocialMedia extends AuditEntity {

	private Integer id;
	private AppUsers appUsers;
	private String photoUri;
	private String websiteUrl;
	private String facebookPage;
	private String twitter;
	private String googlePlus;
	private String linkedIn;
	private String pintrest;
	private String instagram;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;

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

	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "appuserId", nullable = false)
	public AppUsers getAppUsers() {
		return appUsers;
	}

	public void setAppUsers(AppUsers appUsers) {
		this.appUsers = appUsers;
	}

	@Column(name = "photo_uri", nullable = true, length = 50)
	public String getPhotoUri() {
		return photoUri;
	}

	public void setPhotoUri(String photoUri) {
		this.photoUri = photoUri;
	}

	@Column(name = "website_url", nullable = true, length = 50)
	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	@Column(name = "facebook_page", nullable = true, length = 50)
	public String getFacebookPage() {
		return facebookPage;
	}

	public void setFacebookPage(String facebookPage) {
		this.facebookPage = facebookPage;
	}

	@Column(name = "twitter", nullable = true, length = 50)
	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	@Column(name = "google_plus", nullable = true, length = 50)
	public String getGooglePlus() {
		return googlePlus;
	}

	public void setGooglePlus(String googlePlus) {
		this.googlePlus = googlePlus;
	}

	@Column(name = "linkedin", nullable = true, length = 50)
	public String getLinkedIn() {
		return linkedIn;
	}

	public void setLinkedIn(String linkedIn) {
		this.linkedIn = linkedIn;
	}

	@Column(name = "pintrest", nullable = true, length = 50)
	public String getPintrest() {
		return pintrest;
	}

	public void setPintrest(String pintrest) {
		this.pintrest = pintrest;
	}

	@Column(name = "instagram", nullable = true, length = 50)
	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
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
}
