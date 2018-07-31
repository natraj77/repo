package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotQuiz;
import com.polyglot.service.AppPolyglotQuizService;

public class AppPolyglotQuizServiceImpl implements AppPolyglotQuizService {

	@Autowired
	private BaseDao<AppPolyglotQuiz, Integer> appQuizDao;
	
	public void setAppQuizDao(BaseDao<AppPolyglotQuiz, Integer> appQuizDao) {
		this.appQuizDao = appQuizDao;
	}

	@Override
	public void save(AppPolyglotQuiz t) {
		appQuizDao.save(t);
	}

	@Override
	public void delete(AppPolyglotQuiz t) {
		appQuizDao.delete(t);
	}

	@Override
	public void delete(Set<AppPolyglotQuiz> t) {
		appQuizDao.delete(t);
	}

	@Override
	public AppPolyglotQuiz load(Integer id) {
		return appQuizDao.load(id);
	}

	@Override
	public List<AppPolyglotQuiz> getAll() {
		return appQuizDao.getAll();
	}

	@Override
	public List<AppPolyglotQuiz> runQuery(String sql, Map<String, String> params) {
		return appQuizDao.runQuery(sql, params);
	}

}
