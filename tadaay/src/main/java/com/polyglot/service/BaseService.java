package com.polyglot.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.polyglot.domain.AuditEntity;

/**
 * Base service interface.
 * @author vishy
 *
 * @param <T>
 * @param <E>
 */
public interface BaseService<T extends AuditEntity, E> {

	public void save(T t);

	public void delete(T t);

	public void delete(Set<T> t);

	public T load(E id);

	public List<T> getAll();

	public List<T> runQuery(String sql, Map<String, String> params);
	
	

}