package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnParams;
import com.polyglot.domain.DmnStates;
import com.polyglot.service.DmnParamsService;
import com.polyglot.service.DmnStatesService;

public class DmnParamsServiceImpl implements DmnParamsService {

	private BaseDao<DmnParams, Integer> params;
	
	@Autowired
	public void setParams(BaseDao<DmnParams, Integer> params) {
		this.params = params;
	}
	
	public void save(DmnParams t) {
		params.save(t);
	}

	public void delete(DmnParams t) {
		params.delete(t);
	}

	public void delete(Set<DmnParams> t) {
		params.delete(t);
	}

	public DmnParams load(Integer id) {
		return params.load(id);
	}

	public List<DmnParams> getAll() {
		return params.getAll();
	}

	public List<DmnParams> runQuery(String sql, Map<String, String> paramsData) {
		return params.runQuery(sql, paramsData);
	}

}
