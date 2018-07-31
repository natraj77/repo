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
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * AppPolyglotBatch entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_polyglot_events")
public class AppPolyglotEvents extends AuditEntity {

	// Fields

	private Integer id;
	private String title;
	private String organizer;
	private String description;
	private Timestamp schedule;
	private String recurring;
	private String imagePath;
	private String venue;
	private String location;
	private DmnCities city;
	private DmnCntry country;
	private AppPolyglotTemplates template;
	private String metaTitle;
	private String metaDescription;
	private String metaKeywords;
	private String isActive;
	private Timestamp createdDate;
	private Timestamp modifiedDate;
	private Integer lastInsrtUpdUsrId;
	private String eventContent;
	private String eventDays;
	private String eventHours;
	private String eventMinutes;
	private String eventModifier;
	private String eventDateFormat;
	// Constructors

	/** default constructor */
	public AppPolyglotEvents() {
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

	@Column(name = "title", nullable = true, length = 128)
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "organizer", nullable = true, length = 45)
	public String getOrganizer() {
		return organizer;
	}


	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	@Column(name = "description", nullable = true, length = 45)
	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "schedule", nullable = true)
	public Timestamp getSchedule() {
		return schedule;
	}


	public void setSchedule(Timestamp schedule) {
		this.schedule = schedule;
	}

	@Column(name = "recurring", nullable = true, length = 45)
	public String getRecurring() {
		return recurring;
	}


	public void setRecurring(String recurring) {
		this.recurring = recurring;
	}

	@Column(name = "image_path", nullable = true, length = 45)
	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Column(name = "venue", nullable = true, length = 45)
	public String getVenue() {
		return venue;
	}


	public void setVenue(String venue) {
		this.venue = venue;
	}

	@Column(name = "location", nullable = true, length = 45)
	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "city", nullable = false)
	public DmnCities getCity() {
		return city;
	}


	public void setCity(DmnCities city) {
		this.city = city;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "country", nullable = false)
	public DmnCntry getCountry() {
		return country;
	}


	public void setCountry(DmnCntry country) {
		this.country = country;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
	@JoinColumn(name = "template", nullable = false)
	public AppPolyglotTemplates getTemplate() {
		return template;
	}


	public void setTemplate(AppPolyglotTemplates template) {
		this.template = template;
	}

	@Column(name = "meta_title", nullable = true, length = 64)
	public String getMetaTitle() {
		return metaTitle;
	}


	public void setMetaTitle(String metaTitle) {
		this.metaTitle = metaTitle;
	}

	@Column(name = "meta_description", nullable = true, length = 45)
	public String getMetaDescription() {
		return metaDescription;
	}


	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}

	@Column(name = "meta_keywords", nullable = true, length = 45)
	public String getMetaKeywords() {
		return metaKeywords;
	}


	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}

	@Column(name = "is_active", nullable = true, length = 1)
	public String getIsActive() {
		return isActive;
	}


	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Column(name = "created_datetime", nullable = true)
	public Timestamp getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "modified_datetime", nullable = true)
	public Timestamp getModifiedDate() {
		return modifiedDate;
	}


	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Column(name = "last_modified_user_id", nullable = true, length = 5)
	public Integer getLastInsrtUpdUsrId() {
		return lastInsrtUpdUsrId;
	}


	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Transient
	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	@Transient
	public String getEventDays() {
		return eventDays;
	}

	public void setEventDays(String eventDays) {
		this.eventDays = eventDays;
	}
	@Transient
	public String getEventHours() {
		return eventHours;
	}

	public void setEventHours(String eventHours) {
		this.eventHours = eventHours;
	}
	@Transient
	public String getEventMinutes() {
		return eventMinutes;
	}

	public void setEventMinutes(String eventMinutes) {
		this.eventMinutes = eventMinutes;
	}
	@Column(name = "event_identifier", nullable = true, length = 45)
	public String getEventModifier() {
		return eventModifier;
	}

	public void setEventModifier(String eventModifier) {
		this.eventModifier = eventModifier;
	}
	@Transient
	public String getEventDateFormat() {
		return eventDateFormat;
	}

	public void setEventDateFormat(String eventDateFormat) {
		this.eventDateFormat = eventDateFormat;
	}

	

}