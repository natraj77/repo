package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="dmn_course_list")
public class DmnCourse extends AuditEntity {

	private Integer id;
	private String domain;
	private String category;
	private String subCategory;
	private String courseName;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;
	private String keywords;
	private String imagePath;
	private String featured;
	private String template;
	private String level;
	private String courseTitle;
	private String courseDesc;
	private String compImagePath;
	private String addCourseInfo;
	private String relatedCourses;
	private String metaCourseTitle;
	private String metaKeywords;
	private String metaDescription;
	private String courseIdentifier;
	private Integer priortyNo;
	private String tn3ImagePath;
	

	// Property accessors
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

	@Column(name = "field_name", length = 75)
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Column(name = "category", length = 75)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "sub_category", length = 75)
	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	@Column(name = "course_name", nullable = false, length = 75)
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Column(name = "last_insrt_upd_usr_id", nullable = false)
	public Integer getLastInsrtUpdUsrId() {
		return lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Column(name = "last_insrt_upd_ts", nullable = false, length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}
	
	@Column(name = "keywords", nullable = true, length = 256)
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	@Column(name = "imagePath", nullable = true, length = 45)
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Column(name = "featured", nullable = true, length = 1)
	public String getFeatured() {
		return featured;
	}

	public void setFeatured(String featured) {
		this.featured = featured;
	}
	@Column(name = "template", nullable = true, length = 45)
	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}
	@Column(name = "level", nullable = true, length = 45)
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	@Column(name = "coursetitle", nullable = true, length = 45)
	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	@Column(name = "courseDesc", nullable = true, length = 1024)
	public String getCourseDesc() {
		return courseDesc;
	}

	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}
	@Column(name = "compImagePath", nullable = true, length = 45)
	public String getCompImagePath() {
		return compImagePath;
	}

	public void setCompImagePath(String compImagePath) {
		this.compImagePath = compImagePath;
	}
	@Column(name = "addCourseInfo", nullable = true, length = 65535)
	public String getAddCourseInfo() {
		return addCourseInfo;
	}

	public void setAddCourseInfo(String addCourseInfo) {
		this.addCourseInfo = addCourseInfo;
	}
	@Column(name = "relatedCourses", nullable = true, length = 45)
	public String getRelatedCourses() {
		return relatedCourses;
	}

	public void setRelatedCourses(String relatedCourses) {
		this.relatedCourses = relatedCourses;
	}
	@Column(name = "meta_courseTitle", nullable = true, length = 64)
	public String getMetaCourseTitle() {
		return metaCourseTitle;
	}

	public void setMetaCourseTitle(String metaCourseTitle) {
		this.metaCourseTitle = metaCourseTitle;
	}
	@Column(name = "meta_keywords", nullable = true, length = 128)
	public String getMetaKeywords() {
		return metaKeywords;
	}

	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}
	@Column(name = "meta_description", nullable = true, length = 45)
	public String getMetaDescription() {
		return metaDescription;
	}

	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}
	@Column(name = "course_identifier", nullable = true, length = 45,unique = true)
	public String getCourseIdentifier() {
		return courseIdentifier;
	}

	public void setCourseIdentifier(String courseIdentifier) {
		this.courseIdentifier = courseIdentifier;
	}
	@Column(name = "priorty_no", nullable = true, length = 6)
	public Integer getPriortyNo() {
		return priortyNo;
	}

	public void setPriortyNo(Integer priortyNo) {
		this.priortyNo = priortyNo;
	}
	@Column(name = "tn3_image_path", nullable = true, length = 128)
	public String getTn3ImagePath() {
		return tn3ImagePath;
	}

	public void setTn3ImagePath(String tn3ImagePath) {
		this.tn3ImagePath = tn3ImagePath;
	}
	
}
