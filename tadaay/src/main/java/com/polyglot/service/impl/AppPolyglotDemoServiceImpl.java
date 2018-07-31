package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotDemo;
import com.polyglot.service.AppPolyglotDemoService;

public class AppPolyglotDemoServiceImpl implements AppPolyglotDemoService {

	private BaseDao<AppPolyglotDemo, Integer> demoDao;

	@Autowired
	public void setDemoDao(BaseDao<AppPolyglotDemo, Integer> demoDao) {
		this.demoDao = demoDao;
	}

	public void save(AppPolyglotDemo t) {
		demoDao.save(t);

	}

	public void delete(AppPolyglotDemo t) {
		demoDao.delete(t);

	}

	public void delete(Set<AppPolyglotDemo> t) {
		demoDao.delete(t);

	}

	public AppPolyglotDemo load(Integer id) {

		return demoDao.load(id);
	}

	public List<AppPolyglotDemo> getAll() {
		return demoDao.getAll();
	}

	public List<AppPolyglotDemo> runQuery(String sql, Map<String, String> params) {
		return demoDao.runQuery(sql, params);
	}

}
