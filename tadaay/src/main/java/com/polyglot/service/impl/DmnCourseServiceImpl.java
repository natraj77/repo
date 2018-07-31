package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnCourse;
import com.polyglot.service.DmnCourseService;

public class DmnCourseServiceImpl implements DmnCourseService {

	private BaseDao<DmnCourse, Integer> courseDao;
	
	@Autowired
	public void setCourseDao(BaseDao<DmnCourse, Integer> courseDao) {
		this.courseDao = courseDao;
	}
	
	public void save(DmnCourse t) {
		courseDao.save(t);
	}

	public void delete(DmnCourse t) {
		courseDao.delete(t);
	}

	public void delete(Set<DmnCourse> t) {
		courseDao.delete(t);
	}

	public DmnCourse load(Integer id) {
		return courseDao.load(id);
	}

	public List<DmnCourse> getAll() {
		return courseDao.getAll();
	}

	public List<DmnCourse> runQuery(String sql, Map<String, String> params) {
		return courseDao.runQuery(sql, params);
	}
	
	public List<Object> getCustomData(String query){
		return courseDao.getNewSession().createQuery(query).list();
	}
}
