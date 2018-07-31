package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppUsersEducationDetails;
import com.polyglot.service.AppUsersEducationDetailsService;

public class AppUsersEducationDetailsServiceImpl implements AppUsersEducationDetailsService {

	@Autowired
	private BaseDao<AppUsersEducationDetails, Integer> educationDetailsDao;

	public void setEducationDetailsDao(BaseDao<AppUsersEducationDetails, Integer> educationDetailsDao) {
		this.educationDetailsDao = educationDetailsDao;
	}

	@Override
	public void save(AppUsersEducationDetails t) {
		// TODO Auto-generated method stub
		educationDetailsDao.save(t);
	}

	@Override
	public void delete(AppUsersEducationDetails t) {
		// TODO Auto-generated method stub
		educationDetailsDao.delete(t);
	}

	@Override
	public void delete(Set<AppUsersEducationDetails> t) {
		// TODO Auto-generated method stub
		educationDetailsDao.delete(t);
	}

	@Override
	public AppUsersEducationDetails load(Integer id) {
		// TODO Auto-generated method stub
		return educationDetailsDao.load(id);
	}

	@Override
	public List<AppUsersEducationDetails> getAll() {
		// TODO Auto-generated method stub
		return educationDetailsDao.getAll();
	}

	@Override
	public List<AppUsersEducationDetails> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return educationDetailsDao.runQuery(sql, params);
	}

}
