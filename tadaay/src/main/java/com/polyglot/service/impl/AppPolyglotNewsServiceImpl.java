package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotNews;
import com.polyglot.service.AppPolyglotNewsService;

public class AppPolyglotNewsServiceImpl implements AppPolyglotNewsService {

	@Autowired
	private BaseDao<AppPolyglotNews, Integer> newsDao;
	
	public void setNewsDao(BaseDao<AppPolyglotNews, Integer> newsDao) {
		this.newsDao = newsDao;
	}

	public void save(AppPolyglotNews t) {
		newsDao.save(t);
	}

	public void delete(AppPolyglotNews t) {
		newsDao.delete(t);
	}

	public void delete(Set<AppPolyglotNews> t) {
		newsDao.delete(t);
	}

	public AppPolyglotNews load(Integer id) {
		return newsDao.load(id);
	}

	public List<AppPolyglotNews> getAll() {
		return newsDao.getAll();
	}

	public List<AppPolyglotNews> runQuery(String sql, Map<String, String> params) {
		return newsDao.runQuery(sql, params);
	}

}
