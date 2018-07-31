package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnCities;
import com.polyglot.service.DmnCitiesService;

public class DmnCitiesServiceImpl implements DmnCitiesService {

	private BaseDao<DmnCities, Integer> cities;
	
	@Autowired
	public void setCities(BaseDao<DmnCities, Integer> cities) {
		this.cities = cities;
	}
	
	public void save(DmnCities t) {
		cities.save(t);
	}

	public void delete(DmnCities t) {
		cities.delete(t);
	}

	public void delete(Set<DmnCities> t) {
		cities.delete(t);
	}

	public DmnCities load(Integer id) {
		return cities.load(id);
	}

	public List<DmnCities> getAll() {
		return cities.getAll();
	}

	public List<DmnCities> runQuery(String sql, Map<String, String> params) {
		return cities.runQuery(sql, params);
	}
	
	public List<Object> getCustomData(String query){
		Session session = cities.getNewSession();
		List<Object> data = session.createQuery(query).list();
		session.close();
		return data;
	}

}
