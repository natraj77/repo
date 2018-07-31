package com.polyglot.service;

import java.util.List;

import com.polyglot.domain.AppPolyglotLead;

public interface AppPolyglotLeadService extends BaseService<AppPolyglotLead, Integer>{

	public List<Object> getCustomData(String query);
	
}
