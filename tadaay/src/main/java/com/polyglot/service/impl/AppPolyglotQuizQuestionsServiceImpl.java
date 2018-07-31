package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotQuizQuestions;
import com.polyglot.service.AppPolyglotQuizQuestionsService;

public class AppPolyglotQuizQuestionsServiceImpl implements AppPolyglotQuizQuestionsService {

	@Autowired
	private BaseDao<AppPolyglotQuizQuestions, Integer> quizQuestionsDao;

	public void setQuizQuestionsDao(BaseDao<AppPolyglotQuizQuestions, Integer> quizQuestionsDao) {
		this.quizQuestionsDao = quizQuestionsDao;
	}

	@Override
	public void save(AppPolyglotQuizQuestions t) {
		quizQuestionsDao.save(t);
	}

	@Override
	public void delete(AppPolyglotQuizQuestions t) {
		quizQuestionsDao.delete(t);
	}

	@Override
	public void delete(Set<AppPolyglotQuizQuestions> t) {
		// TODO Auto-generated method stub
		quizQuestionsDao.delete(t);
	}

	@Override
	public AppPolyglotQuizQuestions load(Integer id) {
		// TODO Auto-generated method stub
		return quizQuestionsDao.load(id);
	}

	@Override
	public List<AppPolyglotQuizQuestions> getAll() {
		// TODO Auto-generated method stub
		return quizQuestionsDao.getAll();
	}

	@Override
	public List<AppPolyglotQuizQuestions> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return quizQuestionsDao.runQuery(sql, params);
	}

}
