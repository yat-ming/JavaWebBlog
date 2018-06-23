package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sun.org.mozilla.javascript.internal.ObjToIntMap;

import bean.Anime;

public class AnimeDaoImpl extends DaoImpl<Anime>{
	
	public AnimeDaoImpl() {
		setSelect("select * from anime");
		setInsert("insert anime(name,year,company,type) values(?,?,?,?)");
		setDel("delete from anime where id=?");
		setSelectRow("select count(*) from anime");
	}
	
	
	protected Anime relToObj(ResultSet rs) throws SQLException{
		Anime anime = new Anime();
		anime.setId(rs.getInt(1));
		anime.setName(rs.getString(2));
		anime.setYear(rs.getInt(3));
		anime.setCompany(rs.getString(4));
		anime.setType(rs.getString(5));
		return anime;
	}
	
	@Override
	protected void objToRel(Anime t, PreparedStatement pstmt)
			throws SQLException {
		pstmt.setString(1, t.getName());
		pstmt.setInt(2, t.getYear());
		pstmt.setString(3, t.getCompany());
		pstmt.setString(4, t.getType());
	}

}
