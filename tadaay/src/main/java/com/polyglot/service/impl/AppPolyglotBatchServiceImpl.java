package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotBatch;
import com.polyglot.service.AppPolyglotBatchService;

public class AppPolyglotBatchServiceImpl implements AppPolyglotBatchService {
	
	@Autowired
	private BaseDao<AppPolyglotBatch, Integer> batchDao;
	
	public void setBatchDao(BaseDao<AppPolyglotBatch, Integer> batchDao) {
		this.batchDao = batchDao;
	}

	public void save(AppPolyglotBatch t) {
		batchDao.save(t);
	}

	public void delete(AppPolyglotBatch t) {
		batchDao.delete(t);
	}

	public void delete(Set<AppPolyglotBatch> t) {
		batchDao.delete(t);
	}

	public AppPolyglotBatch load(Integer id) {
		return batchDao.load(id);
	}

	public List<AppPolyglotBatch> getAll() {
		return batchDao.getAll();
	}

	public List<AppPolyglotBatch> runQuery(String sql,
			Map<String, String> params) {
		return batchDao.runQuery(sql, params);
	}

}
