package com.polyglot.service;

import java.util.List;

import com.polyglot.domain.DmnCourse;

public interface DmnCourseService extends BaseService<DmnCourse, Integer>{

	public List<Object> getCustomData(String query);
	
}
