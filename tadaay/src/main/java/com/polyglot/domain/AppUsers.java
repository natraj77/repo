
package com.polyglot.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.GenericGenerator;

/**
 * AppUsers entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "app_users" , uniqueConstraints = {@UniqueConstraint(columnNames={"emailId"})})
public class AppUsers extends AuditEntity implements java.io.Serializable {

	// Fields

	private int id;
	private String fname;
	private String lname;
	private String mobile;
	private String password;
	private Timestamp dob;
	private String gender;
	private String flatno;
	private String aprtmentName;
	private String area;
	private String city;
	private String state;
	private Integer pincode;
	private Timestamp lastInsrtUpdTs;
	private Timestamp instEstblDate;
	private String instName;
	private String instFounder;
	private String country;
	private String dsblIn;
	private Integer lastInsrtUpdUsrId;
	private String dob_str;
	private String inst_date_str;
    private String emailId;
    private String userType;
    private String emailOTP;
    private Integer invitedUsrId;
    private String status;
    private String aboutUs;
    private String wallMessage;
    private String isPrivate;
    private Timestamp invitedDate;
    private Timestamp lastLoginDate;
    private String lastLoginIp;
    private String prflImagePath;
	private String logoPath;
	private String thumbNailPath;
    
    
    private Set<AppPolyglotCourse> appPolyglotCourses = new HashSet<AppPolyglotCourse>(
			0);
    private Set<AppPolyglotBranch> appPolyglotBranches = new HashSet<AppPolyglotBranch>(
			0);
    private Set<AppPolyglotFaculty> appPolyglotFaculty = new HashSet<AppPolyglotFaculty>(
			0);
    private Set<AppPolyglotBatch> appPolyglotBatches = new HashSet<AppPolyglotBatch>(
			0);
    private Set<AppPolyglotStudent> appPolyglotStudents = new HashSet<AppPolyglotStudent>(
			0);
    private Set<AppPolyglotPayment> appPolyglotPayments = new HashSet<AppPolyglotPayment>(
			0);
    private Set<AppPolyglotPlan> appPolyglotPlans = new HashSet<AppPolyglotPlan>(
			0);
    private Set<AppEmailTemplate> appPolyglotEmailTemplates = new HashSet<AppEmailTemplate>(
			0);
    private Set<AppPolyglotDemo> appPolyglotDemos = new HashSet<AppPolyglotDemo>(
			0);
    private Set<AppPolyglotTask> appPolyglotTasks = new HashSet<AppPolyglotTask>(
			0);
    private Set<AppPolyglotQuiz> appPolyglotQuizzes = new HashSet<AppPolyglotQuiz>(
			0);
    
    private AppUsersSocialMedia socialMediaProfile;
    
    private Set<AppUsersEducationDetails> educationDetails = new HashSet<AppUsersEducationDetails>(
			0);

    private Set<AppUsersExperienceDetails> experienceDetails = new HashSet<AppUsersExperienceDetails>(
			0);
    
    private Set<AppUsersSkillSetDetails> skillSetDetails = new HashSet<AppUsersSkillSetDetails>(
			0);
    
	// Constructors

	/** default constructor */
	public AppUsers() {
	}

	/** minimal constructor */
	public AppUsers(int id, String dsblIn) {
		this.id = id;
		this.dsblIn = dsblIn;
	}

	/** full constructor */
	public AppUsers(String fname, String lname, String mobile,
			String password, Timestamp dob, String gender, String flatno,
			String aprtmentName, String area, String city, String state,
			Integer pincode, String qualification, String branch,
			Integer passoutYr, Integer percentage, String compName,
			String designation, Integer yrsofexp, String skills,
			Timestamp lastInsrtUpdTs, Timestamp instEstblDate, String instName,
			String instFounder, String contactPerson, String contactEmail,
			String contactLandline, String contactMobile, String country,
			String dsblIn, Integer lastInsrtUpdUsrId) {
		this.fname = fname;
		this.lname = lname;
		this.mobile = mobile;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.flatno = flatno;
		this.aprtmentName = aprtmentName;
		this.area = area;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.lastInsrtUpdTs = lastInsrtUpdTs;
		this.instEstblDate = instEstblDate;
		this.instName = instName;
		this.instFounder = instFounder;
		this.country = country;
		this.dsblIn = dsblIn;
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	// Property accessors
	

	@Column(name = "fname", length = 20)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "lname", length = 20)
	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Column(name = "mobile", length = 10)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "password", length = 256)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "dob", length = 19)
	public Timestamp getDob() {
		return this.dob;
	}

	public void setDob(Timestamp dob) {
		this.dob = dob;
	}

	@Column(name = "gender", length = 1)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "flatno", length = 45)
	public String getFlatno() {
		return this.flatno;
	}

	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}

	@Column(name = "aprtmentName", length = 45)
	public String getAprtmentName() {
		return this.aprtmentName;
	}

	public void setAprtmentName(String aprtmentName) {
		this.aprtmentName = aprtmentName;
	}

	@Column(name = "area", length = 45)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "city", length = 45)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "state", length = 45)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "pincode")
	public Integer getPincode() {
		return this.pincode;
	}

	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}

	

	@Column(name = "last_insrt_upd_ts", length = 19)
	public Timestamp getLastInsrtUpdTs() {
		return this.lastInsrtUpdTs;
	}

	public void setLastInsrtUpdTs(Timestamp lastInsrtUpdTs) {
		this.lastInsrtUpdTs = lastInsrtUpdTs;
	}

	@Column(name = "inst_estbl_date", length = 19)
	public Timestamp getInstEstblDate() {
		return this.instEstblDate;
	}

	public void setInstEstblDate(Timestamp instEstblDate) {
		this.instEstblDate = instEstblDate;
	}

	@Column(name = "inst_name", length = 45)
	public String getInstName() {
		return this.instName;
	}

	public void setInstName(String instName) {
		this.instName = instName;
	}

	@Column(name = "inst_founder", length = 45)
	public String getInstFounder() {
		return this.instFounder;
	}

	public void setInstFounder(String instFounder) {
		this.instFounder = instFounder;
	}

	

	@Column(name = "country", length = 45)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "dsbl_in", nullable = false, length = 1)
	public String getDsblIn() {
		return this.dsblIn;
	}

	public void setDsblIn(String dsblIn) {
		this.dsblIn = dsblIn;
	}

	@Column(name = "last_insrt_upd_usr_id")
	public Integer getLastInsrtUpdUsrId() {
		return this.lastInsrtUpdUsrId;
	}

	public void setLastInsrtUpdUsrId(Integer lastInsrtUpdUsrId) {
		this.lastInsrtUpdUsrId = lastInsrtUpdUsrId;
	}

	@Transient
	public String getDob_str() {
		return dob_str;
	}

	public void setDob_str(String dob_str) {
		this.dob_str = dob_str;
	}

	@Transient
	public String getInst_date_str() {
		return inst_date_str;
	}

	public void setInst_date_str(String inst_date_str) {
		this.inst_date_str = inst_date_str;
	}
	@Column(name = "emailId")
	public String getEmailId() {
		return emailId;
	}
	@Column(name = "userType")
	public String getUserType() {
		return userType;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotCourse> getAppPolyglotCourses() {
		return this.appPolyglotCourses;
	}

	public void setAppPolyglotCourses(Set<AppPolyglotCourse> appPolyglotCourses) {
		this.appPolyglotCourses = appPolyglotCourses;
	}
	
	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotBranch> getAppPolyglotBranches() {
		return this.appPolyglotBranches;
	}

	public void setAppPolyglotBranches(Set<AppPolyglotBranch> appPolyglotBranches) {
		this.appPolyglotBranches = appPolyglotBranches;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotFaculty> getAppPolyglotFaculty() {
		return appPolyglotFaculty;
	}

	public void setAppPolyglotFaculty(Set<AppPolyglotFaculty> appPolyglotFaculty) {
		this.appPolyglotFaculty = appPolyglotFaculty;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotBatch> getAppPolyglotBatches() {
		return appPolyglotBatches;
	}

	public void setAppPolyglotBatches(Set<AppPolyglotBatch> appPolyglotBatches) {
		this.appPolyglotBatches = appPolyglotBatches;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotStudent> getAppPolyglotStudents() {
		return appPolyglotStudents;
	}

	public void setAppPolyglotStudents(Set<AppPolyglotStudent> appPolyglotStudents) {
		this.appPolyglotStudents = appPolyglotStudents;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotPayment> getAppPolyglotPayments() {
		return appPolyglotPayments;
	}

	public void setAppPolyglotPayments(Set<AppPolyglotPayment> appPolyglotPayments) {
		this.appPolyglotPayments = appPolyglotPayments;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotPlan> getAppPolyglotPlans() {
		return appPolyglotPlans;
	}

	public void setAppPolyglotPlans(Set<AppPolyglotPlan> appPolyglotPlans) {
		this.appPolyglotPlans = appPolyglotPlans;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppEmailTemplate> getAppPolyglotEmailTemplates() {
		return appPolyglotEmailTemplates;
	}

	public void setAppPolyglotEmailTemplates(Set<AppEmailTemplate> appPolyglotEmailTemplates) {
		this.appPolyglotEmailTemplates = appPolyglotEmailTemplates;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotDemo> getAppPolyglotDemos() {
		return appPolyglotDemos;
	}

	public void setAppPolyglotDemos(Set<AppPolyglotDemo> appPolyglotDemos) {
		this.appPolyglotDemos = appPolyglotDemos;
	}
	
	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotTask> getAppPolyglotTasks() {
		return appPolyglotTasks;
	}

	public void setAppPolyglotTasks(Set<AppPolyglotTask> appPolyglotTasks) {
		this.appPolyglotTasks = appPolyglotTasks;
	}
	
	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppPolyglotQuiz> getAppPolyglotQuizzes() {
		return appPolyglotQuizzes;
	}

	public void setAppPolyglotQuizzes(Set<AppPolyglotQuiz> appPolyglotQuizzes) {
		this.appPolyglotQuizzes = appPolyglotQuizzes;
	}

	@Transient
	public String getEmailOTP() {
		return emailOTP;
	}

	public void setEmailOTP(String emailOTP) {
		this.emailOTP = emailOTP;
	}
	
	@Column(name = "invited_usr_id")
	public Integer getInvitedUsrId() {
		return invitedUsrId;
	}

	public void setInvitedUsrId(Integer invitedUsrId) {
		this.invitedUsrId = invitedUsrId;
	}

	@Column(name = "invited_date", length = 19)
	public Timestamp getInvitedDate() {
		return invitedDate;
	}

	public void setInvitedDate(Timestamp invitedDate) {
		this.invitedDate = invitedDate;
	}

	@Column(name = "status", length = 45)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "about_us", length = 1024)
	public String getAboutUs() {
		return aboutUs;
	}

	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	@OneToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public AppUsersSocialMedia getSocialMediaProfile() {
		return socialMediaProfile;
	}

	public void setSocialMediaProfile(AppUsersSocialMedia socialMediaProfile) {
		this.socialMediaProfile = socialMediaProfile;
	}
	@Column(name = "wall_message", length = 512)
	public String getWallMessage() {
		return wallMessage;
	}

	public void setWallMessage(String wallMessage) {
		this.wallMessage = wallMessage;
	}
	
	@Column(name = "is_private", length = 1)
	public String getIsPrivate() {
		return isPrivate;
	}

	public void setIsPrivate(String isPrivate) {
		this.isPrivate = isPrivate;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppUsersEducationDetails> getEducationDetails() {
		return educationDetails;
	}

	public void setEducationDetails(Set<AppUsersEducationDetails> educationDetails) {
		this.educationDetails = educationDetails;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppUsersExperienceDetails> getExperienceDetails() {
		return experienceDetails;
	}

	public void setExperienceDetails(Set<AppUsersExperienceDetails> experienceDetails) {
		this.experienceDetails = experienceDetails;
	}

	@OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY, mappedBy = "appUsers")
	public Set<AppUsersSkillSetDetails> getSkillSetDetails() {
		return skillSetDetails;
	}

	public void setSkillSetDetails(Set<AppUsersSkillSetDetails> skillSetDetails) {
		this.skillSetDetails = skillSetDetails;
	}

	@Column(name = "last_login_datetime", length = 19)
	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	@Column(name = "last_login_ip", length = 16)
	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	
	@Column(name = "profile_image_path", nullable = true, length = 200)
	public String getPrflImagePath() {
		return prflImagePath;
	}

	public void setPrflImagePath(String prflImagePath) {
		this.prflImagePath = prflImagePath;
	}

	@Column(name = "logo_path", nullable = true, length = 200)
	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}

	@Column(name = "thumbnail_path", nullable = true, length = 200)
	public String getThumbNailPath() {
		return thumbNailPath;
	}

	public void setThumbNailPath(String thumbNailPath) {
		this.thumbNailPath = thumbNailPath;
	}

}