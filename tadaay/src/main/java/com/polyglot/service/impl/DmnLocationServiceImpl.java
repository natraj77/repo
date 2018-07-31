package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnLocation;
import com.polyglot.service.DmnLocationService;

public class DmnLocationServiceImpl implements DmnLocationService {
	
	private BaseDao<DmnLocation, Integer> locationDao;
	
	@Autowired
	public void setLocationDao(BaseDao<DmnLocation, Integer> locationDao) {
		this.locationDao = locationDao;
	}

	public void save(DmnLocation t) {
		locationDao.save(t);
		
	}

	public void delete(DmnLocation t) {
		// TODO Auto-generated method stub
		locationDao.delete(t);
	}

	public void delete(Set<DmnLocation> t) {
		// TODO Auto-generated method stub
		locationDao.delete(t);
	}

	public DmnLocation load(Integer id) {
		// TODO Auto-generated method stub
		return locationDao.load(id);
	}

	public List<DmnLocation> getAll() {
		// TODO Auto-generated method stub
		return locationDao.getAll();
	}

	public List<DmnLocation> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return locationDao.runQuery(sql, params);
	}

}
