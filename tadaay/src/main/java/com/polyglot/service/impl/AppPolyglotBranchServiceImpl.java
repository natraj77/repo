package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotBranch;
import com.polyglot.service.AppPolyglotBranchService;

public class AppPolyglotBranchServiceImpl implements AppPolyglotBranchService {

	@Autowired
	private BaseDao<AppPolyglotBranch, Integer> branchDao;
	
	public void setBranchDao(BaseDao<AppPolyglotBranch, Integer> branchDao) {
		this.branchDao = branchDao;
	}
	
	public void save(AppPolyglotBranch t) {
		branchDao.save(t);
	}

	public void delete(AppPolyglotBranch t) {
		branchDao.delete(t);
	}

	public void delete(Set<AppPolyglotBranch> t) {
		branchDao.delete(t);
	}

	public AppPolyglotBranch load(Integer id) {
		return branchDao.load(id);
	}

	public List<AppPolyglotBranch> getAll() {
		return branchDao.getAll();
	}

	public List<AppPolyglotBranch> runQuery(String sql,
			Map<String, String> params) {
		return branchDao.runQuery(sql, params);
	}
	public List<Object> getCustomQueryData(String query){
        return branchDao.getNewSession().createQuery(query).list();
	}

}
