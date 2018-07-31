package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppUsersExperienceDetails;
import com.polyglot.service.AppUsersExperienceDetailsService;

public class AppUsersExperienceDetailsServiceImpl implements AppUsersExperienceDetailsService {
	
	@Autowired
	private BaseDao<AppUsersExperienceDetails, Integer> experienceDetailsDao;
	
	public void setExperienceDetailsDao(BaseDao<AppUsersExperienceDetails, Integer> experienceDetailsDao) {
		this.experienceDetailsDao = experienceDetailsDao;
	}

	@Override
	public void save(AppUsersExperienceDetails t) {
		// TODO Auto-generated method stub
		experienceDetailsDao.save(t);
	}

	@Override
	public void delete(AppUsersExperienceDetails t) {
		// TODO Auto-generated method stub
		experienceDetailsDao.delete(t);
	}

	@Override
	public void delete(Set<AppUsersExperienceDetails> t) {
		// TODO Auto-generated method stub
		experienceDetailsDao.delete(t);
	}

	@Override
	public AppUsersExperienceDetails load(Integer id) {
		// TODO Auto-generated method stub
		return experienceDetailsDao.load(id);
	}

	@Override
	public List<AppUsersExperienceDetails> getAll() {
		// TODO Auto-generated method stub
		return experienceDetailsDao.getAll();
	}

	@Override
	public List<AppUsersExperienceDetails> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return experienceDetailsDao.runQuery(sql, params);
	}

}
