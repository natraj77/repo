package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnCntry;
import com.polyglot.service.DmnCountryService;

public class DmnCountryServiceImpl implements DmnCountryService {

	private BaseDao<DmnCntry, Integer> country;
	
	@Autowired
	public void setCountry(BaseDao<DmnCntry, Integer> country) {
		this.country = country;
	}
	
	public void save(DmnCntry t) {
		country.save(t);
	}

	public void delete(DmnCntry t) {
		country.delete(t);
	}

	public void delete(Set<DmnCntry> t) {
		country.delete(t);
	}

	public DmnCntry load(Integer id) {
		return country.load(id);
	}

	public List<DmnCntry> getAll() {
		return country.getAll();
	}

	public List<DmnCntry> runQuery(String sql, Map<String, String> params) {
		return country.runQuery(sql, params);
	}

}
