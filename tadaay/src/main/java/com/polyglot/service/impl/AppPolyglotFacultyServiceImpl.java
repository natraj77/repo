package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotFaculty;
import com.polyglot.service.AppPolyglotFacultyService;

public class AppPolyglotFacultyServiceImpl implements AppPolyglotFacultyService {

	@Autowired
	private BaseDao<AppPolyglotFaculty, Integer> facultyDao;
	
	public BaseDao<AppPolyglotFaculty, Integer> getFacultyDao() {
		return facultyDao;
	}

	public void setFacultyDao(BaseDao<AppPolyglotFaculty, Integer> facultyDao) {
		this.facultyDao = facultyDao;
	}

	public void save(AppPolyglotFaculty t) {
		facultyDao.save(t);
	}

	public void delete(AppPolyglotFaculty t) {
		facultyDao.delete(t);
	}

	public void delete(Set<AppPolyglotFaculty> t) {
		facultyDao.delete(t);
	}

	public AppPolyglotFaculty load(Integer id) {
		return facultyDao.load(id);
	}

	public List<AppPolyglotFaculty> getAll() {
		return facultyDao.getAll();
	}

	public List<AppPolyglotFaculty> runQuery(String sql,
			Map<String, String> params) {
		return facultyDao.runQuery(sql, params);
	}
	
	@Override
	public List<Object> getCustomData(String query) {
		Session session = facultyDao.getNewSession();
		List<Object> data = session.createQuery(query).list();
		session.close();
		return data;
	}

}
