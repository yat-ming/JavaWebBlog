package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DButil;

import dao.Dao;

public class DaoImpl<T> implements Dao<T>{
	
	private String insert;
	private String del;
	private String select;
	private String selectId;
	private String selectRow;
	protected void setInsert(String insert) {
		this.insert = insert;
	}
	protected void setDel(String del) {
		this.del = del;
	}
	protected void setSelect(String select) {
		this.select = select;
	}
	protected void setSelectRow(String selectRow) {
		this.selectRow = selectRow;
	}
	protected void setSelectId(String selectId) {
		this.selectId = selectId;
	}
	
	public T find(int id) {
		T t = null;
		Connection conn = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(selectId);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				t = relToObj(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(rs);
			DButil.close(pstmt);
			DButil.close(conn);
		}
		return t;
	}
	
	
	public void add(T t) {
		Connection conn = DButil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(insert);
			objToRel(t, pstmt);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(pstmt);
			DButil.close(conn);
		}
	}

	public List<T> findAll() {
		List<T> lists = new ArrayList<T>();
		Connection conn = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(select);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				T t = relToObj(rs);
				lists.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(rs);
			DButil.close(pstmt);
			DButil.close(conn);
		}
		return lists;
	}
	
	public void deleteById(int id) {
		Connection conn = DButil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(del);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(pstmt);
			DButil.close(conn);
		}
		
	}
	
	public int row() {
		int count = 0;
		Connection conn = DButil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(selectRow);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	protected T relToObj(ResultSet rs) throws SQLException {
		return null;
	}
	
	protected void objToRel(T t, PreparedStatement pstmt) throws SQLException {
	}
	
	
	

}
