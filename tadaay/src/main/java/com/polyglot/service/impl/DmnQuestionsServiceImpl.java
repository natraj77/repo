package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnQuestions;
import com.polyglot.service.DmnQuestionsService;

public class DmnQuestionsServiceImpl implements DmnQuestionsService {

	private BaseDao<DmnQuestions, Integer> dmnQuestionsDao;

	@Autowired
	public void setDmnQuestionsDao(BaseDao<DmnQuestions, Integer> dmnQuestionsDao) {
		this.dmnQuestionsDao = dmnQuestionsDao;
	}

	@Override
	public void save(DmnQuestions t) {
		dmnQuestionsDao.save(t);
	}

	@Override
	public void delete(DmnQuestions t) {
		dmnQuestionsDao.delete(t);
	}

	@Override
	public void delete(Set<DmnQuestions> t) {
		dmnQuestionsDao.delete(t);
	}

	@Override
	public DmnQuestions load(Integer id) {
		return dmnQuestionsDao.load(id);
	}

	@Override
	public List<DmnQuestions> getAll() {
		return dmnQuestionsDao.getAll();
	}

	@Override
	public List<DmnQuestions> runQuery(String sql, Map<String, String> params) {
		return dmnQuestionsDao.runQuery(sql, params);
	}

}
