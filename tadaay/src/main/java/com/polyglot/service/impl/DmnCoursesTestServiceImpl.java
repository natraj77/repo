package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.DmnCoursesTests;
import com.polyglot.service.DmnCoursesTestService;

public class DmnCoursesTestServiceImpl implements DmnCoursesTestService {

	private BaseDao<DmnCoursesTests, Integer> courseTests;
	
	@Autowired
	public void setCourseTests(BaseDao<DmnCoursesTests, Integer> states) {
		this.courseTests = states;
	}
	
	public void save(DmnCoursesTests t) {
		courseTests.save(t);
	}

	public void delete(DmnCoursesTests t) {
		courseTests.delete(t);
	}

	public void delete(Set<DmnCoursesTests> t) {
		courseTests.delete(t);
	}

	public DmnCoursesTests load(Integer id) {
		return courseTests.load(id);
	}

	public List<DmnCoursesTests> getAll() {
		return courseTests.getAll();
	}

	public List<DmnCoursesTests> runQuery(String sql, Map<String, String> params) {
		return courseTests.runQuery(sql, params);
	}

}
