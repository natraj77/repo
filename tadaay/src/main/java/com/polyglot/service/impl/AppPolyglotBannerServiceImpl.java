package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotBanners;
import com.polyglot.domain.AppStudentTask;
import com.polyglot.service.AppPolyglotBannerService;
import com.polyglot.service.AppStudentTaskService;

public class AppPolyglotBannerServiceImpl implements AppPolyglotBannerService {

	private BaseDao<AppPolyglotBanners, Integer> bannerDao;

	@Autowired
	public void setBannerDao(BaseDao<AppPolyglotBanners, Integer> bannerDao) {
		this.bannerDao = bannerDao;
	}

	@Override
	public void save(AppPolyglotBanners t) {
		// TODO Auto-generated method stub
		bannerDao.save(t);
	}

	@Override
	public void delete(AppPolyglotBanners t) {
		// TODO Auto-generated method stub
		bannerDao.delete(t);
	}

	@Override
	public void delete(Set<AppPolyglotBanners> t) {
		// TODO Auto-generated method stub
		bannerDao.delete(t);
	}

	@Override
	public AppPolyglotBanners load(Integer id) {
		// TODO Auto-generated method stub
		return bannerDao.load(id);
	}

	@Override
	public List<AppPolyglotBanners> getAll() {
		// TODO Auto-generated method stub
		return bannerDao.getAll();
	}

	@Override
	public List<AppPolyglotBanners> runQuery(String sql, Map<String, String> params) {
		// TODO Auto-generated method stub
		return bannerDao.runQuery(sql, params);
	}

}
