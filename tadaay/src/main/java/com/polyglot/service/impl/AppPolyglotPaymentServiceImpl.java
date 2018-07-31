package com.polyglot.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.polyglot.dao.BaseDao;
import com.polyglot.domain.AppPolyglotPayment;
import com.polyglot.service.AppPolyglotPaymentService;

public class AppPolyglotPaymentServiceImpl implements AppPolyglotPaymentService {
	
	@Autowired
	private BaseDao<AppPolyglotPayment, Integer> paymentDao;
	
	public void setPaymentDao(BaseDao<AppPolyglotPayment, Integer> paymentDao) {
		this.paymentDao = paymentDao;
	}

	public void save(AppPolyglotPayment t) {
		paymentDao.save(t);
	}

	public void delete(AppPolyglotPayment t) {
		paymentDao.delete(t);
	}

	public void delete(Set<AppPolyglotPayment> t) {
		paymentDao.delete(t);
	}

	public AppPolyglotPayment load(Integer id) {
		return paymentDao.load(id);
	}

	public List<AppPolyglotPayment> getAll() {
		return paymentDao.getAll();
	}

	public List<AppPolyglotPayment> runQuery(String sql,
			Map<String, String> params) {
		return paymentDao.runQuery(sql, params);
	}

}
