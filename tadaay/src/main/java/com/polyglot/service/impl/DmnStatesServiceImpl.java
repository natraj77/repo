package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnStates;
import com.polyglot.service.DmnStatesService;

public class DmnStatesServiceImpl implements DmnStatesService {

	private BaseDao<DmnStates, Integer> states;
	
	@Autowired
	public void setStates(BaseDao<DmnStates, Integer> states) {
		this.states = states;
	}
	
	public void save(DmnStates t) {
		states.save(t);
	}

	public void delete(DmnStates t) {
		states.delete(t);
	}

	public void delete(Set<DmnStates> t) {
		states.delete(t);
	}

	public DmnStates load(Integer id) {
		return states.load(id);
	}

	public List<DmnStates> getAll() {
		return states.getAll();
	}

	public List<DmnStates> runQuery(String sql, Map<String, String> params) {
		return states.runQuery(sql, params);
	}

}
