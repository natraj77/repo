package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnYrpassout;
import com.polyglot.service.DmnPassoutYearService;

public class DmnPassoutYearServiceImpl implements DmnPassoutYearService {

	private BaseDao<DmnYrpassout, Integer> passoutYearDao;
	
	@Autowired
	public void setPassoutYearDao(BaseDao<DmnYrpassout, Integer> states) {
		this.passoutYearDao = states;
	}
	
	public void save(DmnYrpassout t) {
		passoutYearDao.save(t);
	}

	public void delete(DmnYrpassout t) {
		passoutYearDao.delete(t);
	}

	public void delete(Set<DmnYrpassout> t) {
		passoutYearDao.delete(t);
	}

	public DmnYrpassout load(Integer id) {
		return passoutYearDao.load(id);
	}

	public List<DmnYrpassout> getAll() {
		return passoutYearDao.getAll();
	}

	public List<DmnYrpassout> runQuery(String sql, Map<String, String> params) {
		return passoutYearDao.runQuery(sql, params);
	}

}
