package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotPlan;
import com.polyglot.service.AppPolyglotPlanService;

public class AppPolyglotPlanServiceImpl implements AppPolyglotPlanService {

	private BaseDao<AppPolyglotPlan, Integer> plansDao;
	
	@Autowired
	public void setPlansDao(BaseDao<AppPolyglotPlan, Integer> plansDao) {
		this.plansDao = plansDao;
	}
	
	public void save(AppPolyglotPlan t) {
		plansDao.save(t);
	}

	public void delete(AppPolyglotPlan t) {
		// TODO Auto-generated method stub
		plansDao.delete(t);
	}

	public void delete(Set<AppPolyglotPlan> t) {
		// TODO Auto-generated method stub
		plansDao.delete(t);
	}

	public AppPolyglotPlan load(Integer id) {
		// TODO Auto-generated method stub
		return plansDao.load(id);
	}

	public List<AppPolyglotPlan> getAll() {
		// TODO Auto-generated method stub
		return plansDao.getAll();
	}

	public List<AppPolyglotPlan> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return plansDao.runQuery(sql, params);
	}

}
