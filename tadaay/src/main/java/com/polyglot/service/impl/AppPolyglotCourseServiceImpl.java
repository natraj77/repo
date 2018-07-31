package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotCourse;
import com.polyglot.service.AppPolyglotCourseService;

public class AppPolyglotCourseServiceImpl implements AppPolyglotCourseService {
	
	@Autowired
	private BaseDao<AppPolyglotCourse, Integer> appCourseDao;
	
	public void setAppCourseDao(BaseDao<AppPolyglotCourse, Integer> appCourseDao) {
		this.appCourseDao = appCourseDao;
	}

	public void save(AppPolyglotCourse t) {
		appCourseDao.save(t);
	}

	public void delete(AppPolyglotCourse t) {
		appCourseDao.delete(t);
	}

	public void delete(Set<AppPolyglotCourse> t) {
		appCourseDao.delete(t);
	}

	public AppPolyglotCourse load(Integer id) {
		return appCourseDao.load(id);
	}

	public List<AppPolyglotCourse> getAll() {
		return appCourseDao.getAll();
	}

	public List<AppPolyglotCourse> runQuery(String sql,
			Map<String, String> params) {
		return appCourseDao.runQuery(sql, params);
	}
	
	public List<Object> getCustomData(String query){
		Session session = appCourseDao.getNewSession();
		List<Object> data = session.createQuery(query).list();
		session.close();
		return data;
	}

}
