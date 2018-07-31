package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnPolyglotPlans;
import com.polyglot.service.DmnPolyglotPlansService;

public class DmnPolyglotPlansServiceImpl implements DmnPolyglotPlansService {

	private BaseDao<DmnPolyglotPlans, Integer> domainPlansDao;

	@Autowired
	public void setDomainPlansDao(BaseDao<DmnPolyglotPlans, Integer> domainPlansDao) {
		this.domainPlansDao = domainPlansDao;
	}

	public void save(DmnPolyglotPlans t) {
		domainPlansDao.save(t);
	}

	public void delete(DmnPolyglotPlans t) {
		// TODO Auto-generated method stub
		domainPlansDao.delete(t);
	}

	public void delete(Set<DmnPolyglotPlans> t) {
		// TODO Auto-generated method stub
		domainPlansDao.delete(t);
	}

	public DmnPolyglotPlans load(Integer id) {
		// TODO Auto-generated method stub
		return domainPlansDao.load(id);
	}

	public List<DmnPolyglotPlans> getAll() {
		// TODO Auto-generated method stub
		return domainPlansDao.getAll();
	}

	public List<DmnPolyglotPlans> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return domainPlansDao.runQuery(sql, params);
	}

}
