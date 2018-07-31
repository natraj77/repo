package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppEmailTemplate;
import com.polyglot.domain.AppPolyglotEvents;
import com.polyglot.service.AppEmailTemplateService;
import com.polyglot.service.AppPolyglotEventsService;

public class AppPolyglotEventsServiceImpl implements AppPolyglotEventsService {

	@Autowired
	private BaseDao<AppPolyglotEvents, Integer> eventsDao;
	
	public void setEventsDao(BaseDao<AppPolyglotEvents, Integer> eventsDao) {
		this.eventsDao = eventsDao;
	}

	public void save(AppPolyglotEvents t) {
		eventsDao.save(t);
	}

	public void delete(AppPolyglotEvents t) {
		eventsDao.delete(t);
	}

	public void delete(Set<AppPolyglotEvents> t) {
		eventsDao.delete(t);
	}

	public AppPolyglotEvents load(Integer id) {
		return eventsDao.load(id);
	}

	public List<AppPolyglotEvents> getAll() {
		return eventsDao.getAll();
	}

	public List<AppPolyglotEvents> runQuery(String sql, Map<String, String> params) {
		return eventsDao.runQuery(sql, params);
	}

}
