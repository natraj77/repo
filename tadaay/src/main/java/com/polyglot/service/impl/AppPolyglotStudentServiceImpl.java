package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotStudent;
import com.polyglot.service.AppPolyglotStudentService;

public class AppPolyglotStudentServiceImpl implements AppPolyglotStudentService {
	
	@Autowired
	private BaseDao<AppPolyglotStudent, Integer> studentsDao;
	
	public void setStudentsDao(BaseDao<AppPolyglotStudent, Integer> studentsDao) {
		this.studentsDao = studentsDao;
	}

	public void save(AppPolyglotStudent t) {
		studentsDao.save(t);
	}

	public void delete(AppPolyglotStudent t) {
		studentsDao.delete(t);
	}

	public void delete(Set<AppPolyglotStudent> t) {
		studentsDao.delete(t);
	}

	public AppPolyglotStudent load(Integer id) {
		// TODO Auto-generated method stub
		return studentsDao.load(id);
	}

	public List<AppPolyglotStudent> getAll() {
		// TODO Auto-generated method stub
		return studentsDao.getAll();
	}

	public List<AppPolyglotStudent> runQuery(String sql,
			Map<String, String> params) {
		// TODO Auto-generated method stub
		return studentsDao.runQuery(sql, params);
	}

}
