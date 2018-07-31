package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppUsers;
import com.polyglot.service.AppPolyglotRegistrationService;

public class AppPolyglotRegistrationServiceImpl implements AppPolyglotRegistrationService {

	@Autowired
	private BaseDao<AppUsers, Integer> registrationDao;
	

	public BaseDao<AppUsers, Integer> getRegistrationDao() {
		return registrationDao;
	}

	public void setRegistrationDao(
			BaseDao<AppUsers, Integer> registrationDao) {
		this.registrationDao = registrationDao;
	}

	public void save(AppUsers t) {
		registrationDao.save(t);
	}

	public void delete(AppUsers t) {
		registrationDao.delete(t);
	}

	public void delete(Set<AppUsers> t) {
		registrationDao.delete(t);
	}

	public AppUsers load(Integer id) {
		return registrationDao.load(id);
	}

	public List<AppUsers> getAll() {
		return registrationDao.getAll();
	}

	public List<AppUsers> runQuery(String sql,
			Map<String, String> params) {
		return registrationDao.runQuery(sql, params);
	}

}
