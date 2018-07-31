package com.polyglot.service;

import java.util.List;

import com.polyglot.domain.DmnCities;

public interface DmnCitiesService extends BaseService<DmnCities, Integer>{

	public List<Object> getCustomData(String query);
}
