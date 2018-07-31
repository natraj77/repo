package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppStudentQuiz;
import com.polyglot.service.AppStudentQuizService;

public class AppStudentQuizServiceImpl implements AppStudentQuizService {

	private BaseDao<AppStudentQuiz, Integer> studentQuizDao;

	@Autowired
	public void setStudentQuizDao(BaseDao<AppStudentQuiz, Integer> studentQuizDao) {
		this.studentQuizDao = studentQuizDao;
	}

	@Override
	public void save(AppStudentQuiz t) {
		// TODO Auto-generated method stub
		studentQuizDao.save(t);
	}

	@Override
	public void delete(AppStudentQuiz t) {
		// TODO Auto-generated method stub
		studentQuizDao.delete(t);
	}

	@Override
	public void delete(Set<AppStudentQuiz> t) {
		// TODO Auto-generated method stub
		studentQuizDao.delete(t);
	}

	@Override
	public AppStudentQuiz load(Integer id) {
		// TODO Auto-generated method stub
		return studentQuizDao.load(id);
	}

	@Override
	public List<AppStudentQuiz> getAll() {
		// TODO Auto-generated method stub
		return studentQuizDao.getAll();
	}

	@Override
	public List<AppStudentQuiz> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return studentQuizDao.runQuery(sql, params);
	}

}
