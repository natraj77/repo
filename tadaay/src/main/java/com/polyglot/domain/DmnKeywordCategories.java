package com.polyglot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "dmn_keyword_categories")
public class DmnKeywordCategories extends AuditEntity {

	private Integer id;
	private String category;
	private String keyword;
	private Integer total;
	private Integer available;
	private Integer exhausted;
	private Integer lastInsrtUpdUsrId;
	private Timestamp lastInsrtUpdTs;

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

	@Column(name = "category", length = 100)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "key_word", length = 100)
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(name = "total", nullable = false)
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Column(name = "available", nullable = false)
	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer available) {
		this.available = available;
	}

	@Column(name = "exhausted", nullable = false)
	public Integer getExhausted() {
		return exhausted;
	}

	public void setExhausted(Integer exhausted) {
		this.exhausted = exhausted;
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

}
