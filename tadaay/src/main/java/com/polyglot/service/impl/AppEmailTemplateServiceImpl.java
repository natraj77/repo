package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppEmailTemplate;
import com.polyglot.service.AppEmailTemplateService;

public class AppEmailTemplateServiceImpl implements AppEmailTemplateService {

	@Autowired
	private BaseDao<AppEmailTemplate, Integer> emailTemplateDao;
	
	public void setEmailTemplateDao(BaseDao<AppEmailTemplate, Integer> emailTemplateDao) {
		this.emailTemplateDao = emailTemplateDao;
	}

	public void save(AppEmailTemplate t) {
		emailTemplateDao.save(t);
	}

	public void delete(AppEmailTemplate t) {
		emailTemplateDao.delete(t);
	}

	public void delete(Set<AppEmailTemplate> t) {
		emailTemplateDao.delete(t);
	}

	public AppEmailTemplate load(Integer id) {
		return emailTemplateDao.load(id);
	}

	public List<AppEmailTemplate> getAll() {
		return emailTemplateDao.getAll();
	}

	public List<AppEmailTemplate> runQuery(String sql, Map<String, String> params) {
		return emailTemplateDao.runQuery(sql, params);
	}

}
