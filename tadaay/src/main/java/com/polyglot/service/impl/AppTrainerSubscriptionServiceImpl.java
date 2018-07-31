package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppTrainerSubscriptions;
import com.polyglot.service.AppTrainerSubscriptionService;

public class AppTrainerSubscriptionServiceImpl implements AppTrainerSubscriptionService {

	@Autowired
	private BaseDao<AppTrainerSubscriptions, Integer> subscriptionDao;
	
	public void setSubscriptionDao(BaseDao<AppTrainerSubscriptions, Integer> addressDao) {
		this.subscriptionDao = addressDao;
	}
	
	public void save(AppTrainerSubscriptions t) {
		subscriptionDao.save(t);
	}

	public void delete(AppTrainerSubscriptions t) {
		subscriptionDao.delete(t);
	}

	public void delete(Set<AppTrainerSubscriptions> t) {
		subscriptionDao.delete(t);
	}

	public AppTrainerSubscriptions load(Integer id) {
		return subscriptionDao.load(id);
	}

	public List<AppTrainerSubscriptions> getAll() {
		return subscriptionDao.getAll();
	}

	public List<AppTrainerSubscriptions> runQuery(String sql,
			Map<String, String> params) {
		return subscriptionDao.runQuery(sql, params);
	}

}
