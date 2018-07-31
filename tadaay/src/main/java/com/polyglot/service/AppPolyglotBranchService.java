package com.polyglot.service;

import java.util.List;

import com.polyglot.domain.AppPolyglotBranch;

public interface AppPolyglotBranchService extends BaseService<AppPolyglotBranch, Integer>{

	public List<Object> getCustomQueryData(String query);
}
