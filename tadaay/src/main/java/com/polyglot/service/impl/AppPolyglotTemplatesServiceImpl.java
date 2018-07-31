package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppEmailTemplate;
import com.polyglot.domain.AppPolyglotTemplates;
import com.polyglot.service.AppEmailTemplateService;
import com.polyglot.service.AppPolyglotTemplatesService;

public class AppPolyglotTemplatesServiceImpl implements AppPolyglotTemplatesService {

	@Autowired
	private BaseDao<AppPolyglotTemplates, Integer> templatesDao;
	
	public void setTemplatesDao(BaseDao<AppPolyglotTemplates, Integer> templatesDao) {
		this.templatesDao = templatesDao;
	}

	public void save(AppPolyglotTemplates t) {
		templatesDao.save(t);
	}

	public void delete(AppPolyglotTemplates t) {
		templatesDao.delete(t);
	}

	public void delete(Set<AppPolyglotTemplates> t) {
		templatesDao.delete(t);
	}

	public AppPolyglotTemplates load(Integer id) {
		return templatesDao.load(id);
	}

	public List<AppPolyglotTemplates> getAll() {
		return templatesDao.getAll();
	}

	public List<AppPolyglotTemplates> runQuery(String sql, Map<String, String> params) {
		return templatesDao.runQuery(sql, params);
	}

}
