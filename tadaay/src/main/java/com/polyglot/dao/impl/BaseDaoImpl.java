package com.polyglot.dao.impl;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.polyglot.dao.BaseDao;
import com.polyglot.dao.impl.BaseDaoImpl;
import com.polyglot.domain.AuditEntity;

/**
 * BaseDaoImpl class is the main entry point to hibernate object.
 * @author vishy
 *
 * @param <T>
 * @param <E>
 */

@Transactional
@Repository
public class BaseDaoImpl<T extends AuditEntity, E> implements BaseDao<T, E> {

	private static Logger logger = Logger.getLogger(BaseDaoImpl.class);

	private Class<T> clazz;
	private SessionFactory sessionFactory;
	private Session session;

	@Autowired
	public BaseDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void setClazz(Class<T> clazz) {
		this.clazz = clazz;
	}

	public Session getCurrentSession() {
		session = sessionFactory.getCurrentSession();
		return session;
	}
	
	public Session getNewSession() {
		return sessionFactory.openSession();
	}
	
	public void save(T t) {
		getCurrentSession().saveOrUpdate(t);
	}

	public void delete(T t) {
		getCurrentSession().delete(t);
	}

	public void delete(Set<T> t) {
		for (T t1 : t) {
			getCurrentSession().delete(t1);
		}
	}

	public T load(E id) {
		return (T) getCurrentSession().get(clazz, (Serializable) id);
	}

	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		List<T> objects = getCurrentSession().createCriteria(clazz)
				.addOrder(Order.desc("id")).list();

		logger.debug("Executing BaseDaoImpl.getAll() : " + clazz.getName());

		return objects;
	}

	@SuppressWarnings("unchecked")
	public List<T> runQuery(String sql, Map<String, String> params) {
		logger.info("Executing runQuery(). SQL--> " + sql.toString());
		Query query = getCurrentSession().createQuery(sql);
		if (params != null && !params.isEmpty()) {
			Iterator<Map.Entry<String, String>> iter = params.entrySet()
					.iterator();
			while (iter.hasNext()) {

				Map.Entry<String, String> pairs = (Map.Entry<String, String>) iter
						.next();
				query.setString(pairs.getKey(), pairs.getValue());
			}
		}
		logger.info("Query String --> " + query.getQueryString().toString());
		return query.list();
	}
}
