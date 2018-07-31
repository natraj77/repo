package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnKeywordCategories;
import com.polyglot.service.DmnKeywordCategoriesService;

public class DmnKeywordCategoriesServiceImpl implements DmnKeywordCategoriesService {

	private BaseDao<DmnKeywordCategories, Integer> keywordsDao;

	@Autowired
	public void setKeywordsDao(BaseDao<DmnKeywordCategories, Integer> keywordsDao) {
		this.keywordsDao = keywordsDao;
	}

	public void save(DmnKeywordCategories t) {
		// TODO Auto-generated method stub
		keywordsDao.save(t);
	}

	public void delete(DmnKeywordCategories t) {
		// TODO Auto-generated method stub
		keywordsDao.delete(t);
	}

	public void delete(Set<DmnKeywordCategories> t) {
		// TODO Auto-generated method stub
		keywordsDao.delete(t);
	}

	public DmnKeywordCategories load(Integer id) {
		// TODO Auto-generated method stub
		return keywordsDao.load(id);
	}

	public List<DmnKeywordCategories> getAll() {
		// TODO Auto-generated method stub
		return keywordsDao.getAll();
	}

	public List<DmnKeywordCategories> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return keywordsDao.runQuery(sql, params);
	}

}
