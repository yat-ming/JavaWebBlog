package dao;

import java.sql.ResultSet;
import java.util.List;

public interface Dao<T> {
	
	public T find(int id);
	public List<T> findAll();
	public void add(T t);
	public void deleteById(int id);
	public int row();
	

}
