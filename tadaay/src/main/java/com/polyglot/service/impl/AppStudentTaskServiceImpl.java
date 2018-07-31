package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppStudentTask;
import com.polyglot.service.AppStudentTaskService;

public class AppStudentTaskServiceImpl implements AppStudentTaskService {

	private BaseDao<AppStudentTask, Integer> studentTaskDao;

	@Autowired
	public void setStudentTaskDao(BaseDao<AppStudentTask, Integer> studentTaskDao) {
		this.studentTaskDao = studentTaskDao;
	}

	@Override
	public void save(AppStudentTask t) {
		// TODO Auto-generated method stub
		studentTaskDao.save(t);
	}

	@Override
	public void delete(AppStudentTask t) {
		// TODO Auto-generated method stub
		studentTaskDao.delete(t);
	}

	@Override
	public void delete(Set<AppStudentTask> t) {
		// TODO Auto-generated method stub
		studentTaskDao.delete(t);
	}

	@Override
	public AppStudentTask load(Integer id) {
		// TODO Auto-generated method stub
		return studentTaskDao.load(id);
	}

	@Override
	public List<AppStudentTask> getAll() {
		// TODO Auto-generated method stub
		return studentTaskDao.getAll();
	}

	@Override
	public List<AppStudentTask> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return studentTaskDao.runQuery(sql, params);
	}

}
