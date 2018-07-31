package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotLeadDemoStatus;
import com.polyglot.service.AppPolyglotLeadDemoStatusService;

public class AppPolyglotLeadDemoStatusServiceImpl implements AppPolyglotLeadDemoStatusService {

	@Autowired
	private BaseDao<AppPolyglotLeadDemoStatus, Integer> demoStatusDao;

	public void setDemoStatusDao(BaseDao<AppPolyglotLeadDemoStatus, Integer> demoStatusDao) {
		this.demoStatusDao = demoStatusDao;
	}

	public void save(AppPolyglotLeadDemoStatus t) {
		demoStatusDao.save(t);
	}

	public void delete(AppPolyglotLeadDemoStatus t) {
		demoStatusDao.delete(t);
	}

	public void delete(Set<AppPolyglotLeadDemoStatus> t) {
		demoStatusDao.delete(t);
	}

	public AppPolyglotLeadDemoStatus load(Integer id) {
		return demoStatusDao.load(id);
	}

	public List<AppPolyglotLeadDemoStatus> getAll() {
		return demoStatusDao.getAll();
	}

	public List<AppPolyglotLeadDemoStatus> runQuery(String sql, Map<String, String> params) {
		return demoStatusDao.runQuery(sql, params);
	}

}
