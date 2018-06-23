package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Image;

public class ImageDaoImpl extends DaoImpl<Image>{
	
	public ImageDaoImpl(){
		setSelect("select * from gallery");
		setInsert("insert gallery(name,src) values(?,?)");
		setDel("delete from gallery where id=?");
		setSelectRow("select count(*) from gallery");
		setSelectId("select * from gallery where id=?");
	}
	
	protected Image relToObj(ResultSet rs) throws SQLException {
		Image image = new Image();
		image.setId(rs.getInt(1));
		image.setName(rs.getString(2));
		image.setSrc(rs.getString(3));
		return image;
	}
	
	@Override
	protected void objToRel(Image t, PreparedStatement pstmt)
			throws SQLException {
		pstmt.setString(1, t.getName());
		pstmt.setString(2, t.getSrc());
	}

}
