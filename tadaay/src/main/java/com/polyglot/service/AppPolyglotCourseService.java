package com.polyglot.service;

import java.util.List;

import com.polyglot.domain.AppPolyglotCourse;

public interface AppPolyglotCourseService extends
		BaseService<AppPolyglotCourse, Integer> {

	public List<Object> getCustomData(String query);
	
}
