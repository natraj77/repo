package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppUsersSocialMedia;
import com.polyglot.service.AppUsersSocialMediaService;

public class AppUsersSocialMediaServiceImpl implements AppUsersSocialMediaService {

	@Autowired
	private BaseDao<AppUsersSocialMedia, Integer> socialMediaDao;

	public void setSocialMediaDao(BaseDao<AppUsersSocialMedia, Integer> socialMediaDao) {
		this.socialMediaDao = socialMediaDao;
	}

	@Override
	public void save(AppUsersSocialMedia t) {
		// TODO Auto-generated method stub
		socialMediaDao.save(t);
	}

	@Override
	public void delete(AppUsersSocialMedia t) {
		// TODO Auto-generated method stub
		socialMediaDao.delete(t);
	}

	@Override
	public void delete(Set<AppUsersSocialMedia> t) {
		// TODO Auto-generated method stub
		socialMediaDao.delete(t);
	}

	@Override
	public AppUsersSocialMedia load(Integer id) {
		// TODO Auto-generated method stub
		return socialMediaDao.load(id);
	}

	@Override
	public List<AppUsersSocialMedia> getAll() {
		// TODO Auto-generated method stub
		return socialMediaDao.getAll();
	}

	@Override
	public List<AppUsersSocialMedia> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return socialMediaDao.runQuery(sql, params);
	}

}
