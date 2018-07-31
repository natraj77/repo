/*package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotAddress;
import com.polyglot.service.AppPolyglotAddressService;

public class AppPolyglotAddressServiceImpl implements AppPolyglotAddressService {

	@Autowired
	private BaseDao<AppPolyglotAddress, Integer> addressDao;
	
	public void setAddressDao(BaseDao<AppPolyglotAddress, Integer> addressDao) {
		this.addressDao = addressDao;
	}
	
	public void save(AppPolyglotAddress t) {
		addressDao.save(t);
	}

	public void delete(AppPolyglotAddress t) {
		addressDao.delete(t);
	}

	public void delete(Set<AppPolyglotAddress> t) {
		addressDao.delete(t);
	}

	public AppPolyglotAddress load(Integer id) {
		return addressDao.load(id);
	}

	public List<AppPolyglotAddress> getAll() {
		return addressDao.getAll();
	}

	public List<AppPolyglotAddress> runQuery(String sql,
			Map<String, String> params) {
		return addressDao.runQuery(sql, params);
	}

}
*/