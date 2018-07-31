package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotTask;
import com.polyglot.service.AppPolyglotTaskService;

public class AppPolyglotTaskServiceImpl implements AppPolyglotTaskService {

	private BaseDao<AppPolyglotTask, Integer> taskDao;

	@Autowired
	public void setTaskDao(BaseDao<AppPolyglotTask, Integer> taskDao) {
		this.taskDao = taskDao;
	}

	@Override
	public void save(AppPolyglotTask t) {
		// TODO Auto-generated method stub
		taskDao.save(t);
	}

	@Override
	public void delete(AppPolyglotTask t) {
		// TODO Auto-generated method stub
		taskDao.delete(t);
	}

	@Override
	public void delete(Set<AppPolyglotTask> t) {
		// TODO Auto-generated method stub
		taskDao.delete(t);
	}

	@Override
	public AppPolyglotTask load(Integer id) {
		// TODO Auto-generated method stub
		return taskDao.load(id);
	}

	@Override
	public List<AppPolyglotTask> getAll() {
		// TODO Auto-generated method stub
		return taskDao.getAll();
	}

	@Override
	public List<AppPolyglotTask> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return taskDao.runQuery(sql, params);
	}

}
