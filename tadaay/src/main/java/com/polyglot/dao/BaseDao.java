package com.polyglot.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;

import com.polyglot.domain.AuditEntity;

/**
 * Base Dao interface.
 * @author vishy
 *
 * @param <T>
 * @param <E>
 */
public interface BaseDao<T extends AuditEntity, E> {

	public void save(T t);

	public void delete(T t);

	public void delete(Set<T> t);

	public T load(E id);

	public List<T> getAll();

	public Session getNewSession();

	public List<T> runQuery(String sql, Map<String, String> params);

}