package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppUsersSkillSetDetails;
import com.polyglot.service.AppUsersSkillSetDetailsService;

public class AppUsersSkillSetDetailsServiceImpl implements AppUsersSkillSetDetailsService {
	
	@Autowired
	private BaseDao<AppUsersSkillSetDetails, Integer> skillSetDao;
	
	public void setSkillSetDao(BaseDao<AppUsersSkillSetDetails, Integer> skillSetDao) {
		this.skillSetDao = skillSetDao;
	}

	@Override
	public void save(AppUsersSkillSetDetails t) {
		// TODO Auto-generated method stub
		skillSetDao.save(t);
	}

	@Override
	public void delete(AppUsersSkillSetDetails t) {
		// TODO Auto-generated method stub
		skillSetDao.delete(t);
	}

	@Override
	public void delete(Set<AppUsersSkillSetDetails> t) {
		// TODO Auto-generated method stub
		skillSetDao.delete(t);
	}

	@Override
	public AppUsersSkillSetDetails load(Integer id) {
		// TODO Auto-generated method stub
		return skillSetDao.load(id);
	}

	@Override
	public List<AppUsersSkillSetDetails> getAll() {
		// TODO Auto-generated method stub
		return skillSetDao.getAll();
	}

	@Override
	public List<AppUsersSkillSetDetails> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return skillSetDao.runQuery(sql, params);
	}

}
