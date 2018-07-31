package com.polyglot.service;

import java.util.List;

import com.polyglot.domain.AppPolyglotFaculty;

public interface AppPolyglotFacultyService extends BaseService<AppPolyglotFaculty, Integer> {

	public List<Object> getCustomData(String query);
	
}
