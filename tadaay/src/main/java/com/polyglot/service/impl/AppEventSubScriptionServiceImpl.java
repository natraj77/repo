package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotEventSubscription;
import com.polyglot.domain.AppUsersSkillSetDetails;
import com.polyglot.service.AppEventSubscriptionService;
import com.polyglot.service.AppUsersSkillSetDetailsService;

public class AppEventSubScriptionServiceImpl implements AppEventSubscriptionService {
	
	@Autowired
	private BaseDao<AppPolyglotEventSubscription, Integer> eventSubDao;
	
	public void setEventSubDao(BaseDao<AppPolyglotEventSubscription, Integer> eventSubDao) {
		this.eventSubDao = eventSubDao;
	}

	@Override
	public void save(AppPolyglotEventSubscription t) {
		// TODO Auto-generated method stub
		eventSubDao.save(t);
	}

	@Override
	public void delete(AppPolyglotEventSubscription t) {
		// TODO Auto-generated method stub
		eventSubDao.delete(t);
	}

	@Override
	public void delete(Set<AppPolyglotEventSubscription> t) {
		// TODO Auto-generated method stub
		eventSubDao.delete(t);
	}

	@Override
	public AppPolyglotEventSubscription load(Integer id) {
		// TODO Auto-generated method stub
		return eventSubDao.load(id);
	}

	@Override
	public List<AppPolyglotEventSubscription> getAll() {
		// TODO Auto-generated method stub
		return eventSubDao.getAll();
	}

	@Override
	public List<AppPolyglotEventSubscription> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return eventSubDao.runQuery(sql, params);
	}

}
