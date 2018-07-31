
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
 * AppUsers entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_banners")
public class AppPolyglotBanners extends AuditEntity implements java.io.Serializable {

	// Fields

	private int id;
	private Integer position;
	private String status;
	private String isActive;
	private String imagePath;	
	private Timestamp startTime;
	private Timestamp endTime;
	private Timestamp createdTime;
	private Timestamp modifiedTime;
	private DmnCities cities;
	private DmnCourse courses;
	private AppUsers users;

	/** default constructor */
	public AppPolyglotBanners() {
	}

	/** minimal constructor */
	public AppPolyglotBanners(int id, Integer position,String status,String isActive,String imagePath,
			Timestamp startTime,Timestamp endTime,Timestamp createdTime,Timestamp modifiedTime,
			DmnCities cities,DmnCourse courses,AppUsers users) {
		this.id = id;
		this.users = users;
		this.courses = courses;
		this.cities = cities;
		this.modifiedTime = modifiedTime;
		this.createdTime = createdTime;
		this.endTime = endTime;
		this.startTime = startTime;
		this.imagePath = imagePath;
		this.isActive = isActive;
		this.status = status;
		this.position = position;
	}

	

	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "bannerId", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "position", nullable = false, length = 4)
	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}
	@Column(name = "status", nullable = false, length = 25)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "is_active", nullable = false, length = 1)
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	@Column(name = "image_path", nullable = false, length = 145)
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Column(name = "start_date", nullable = false)
	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	@Column(name = "end_date", nullable = false)
	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	@Column(name = "created_time", nullable = false)
	public Timestamp getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}
	@Column(name = "modified_time", nullable = false)
	public Timestamp getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(Timestamp modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "city_id", nullable = false)
	public DmnCities getCities() {
		return cities;
	}

	public void setCities(DmnCities cities) {
		this.cities = cities;
	}
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "course_id", nullable = false)
	public DmnCourse getCourses() {
		return courses;
	}

	public void setCourses(DmnCourse courses) {
		this.courses = courses;
	}
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "partner_id", nullable = false)
	public AppUsers getUsers() {
		return users;
	}

	public void setUsers(AppUsers users) {
		this.users = users;
	}
}