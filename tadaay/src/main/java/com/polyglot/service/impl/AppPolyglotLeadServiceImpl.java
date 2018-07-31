package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotLead;
import com.polyglot.service.AppPolyglotLeadService;

public class AppPolyglotLeadServiceImpl implements AppPolyglotLeadService {
	
	@Autowired
	private BaseDao<AppPolyglotLead, Integer> leadDao;
	
	public void setLeadDao(BaseDao<AppPolyglotLead, Integer> leadDao) {
		this.leadDao = leadDao;
	}

	public void save(AppPolyglotLead t) {
		leadDao.save(t);
	}

	public void delete(AppPolyglotLead t) {
		leadDao.delete(t);
	}

	public void delete(Set<AppPolyglotLead> t) {
		leadDao.delete(t);
	}

	public AppPolyglotLead load(Integer id) {
		return leadDao.load(id);
	}

	public List<AppPolyglotLead> getAll() {
		return leadDao.getAll();
	}

	public List<AppPolyglotLead> runQuery(String sql, Map<String, String> params) {
		return leadDao.runQuery(sql, params);
	}
	public List<Object> getCustomData(String query){
		Session session = leadDao.getNewSession();
		List<Object> data = session.createQuery(query).list();
		session.close();
		return data;
	}
}
