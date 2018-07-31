/*package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotContact;
import com.polyglot.service.AppPolyglotContactService;

public class AppPolyglotContactServiceImpl implements AppPolyglotContactService{

	@Autowired
	BaseDao<AppPolyglotContact, Integer> contactDao;
	
	public void setContactDao(BaseDao<AppPolyglotContact, Integer> contactDao) {
		this.contactDao = contactDao;
	}
	
	public void save(AppPolyglotContact t) {
		contactDao.save(t);
	}

	public void delete(AppPolyglotContact t) {
		contactDao.delete(t);
	}

	public void delete(Set<AppPolyglotContact> t) {
		contactDao.delete(t);
	}

	public AppPolyglotContact load(Integer id) {
		return contactDao.load(id);
	}

	public List<AppPolyglotContact> getAll() {
		return contactDao.getAll();
	}

	public List<AppPolyglotContact> runQuery(String sql,
			Map<String, String> params) {
		return contactDao.runQuery(sql, params);
	}

}
*/