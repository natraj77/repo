package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnDegree;
import com.polyglot.service.DmnDegreesService;

public class DmnDegreesServiceImpl implements DmnDegreesService {

	private BaseDao<DmnDegree, Integer> degreeDao;
	
	@Autowired
	public void setDegreeDao(BaseDao<DmnDegree, Integer> states) {
		this.degreeDao = states;
	}
	
	public void save(DmnDegree t) {
		degreeDao.save(t);
	}

	public void delete(DmnDegree t) {
		degreeDao.delete(t);
	}

	public void delete(Set<DmnDegree> t) {
		degreeDao.delete(t);
	}

	public DmnDegree load(Integer id) {
		return degreeDao.load(id);
	}

	public List<DmnDegree> getAll() {
		return degreeDao.getAll();
	}

	public List<DmnDegree> runQuery(String sql, Map<String, String> params) {
		return degreeDao.runQuery(sql, params);
	}

}
