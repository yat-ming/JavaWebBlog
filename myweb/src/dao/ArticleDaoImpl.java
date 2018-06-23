package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Article;

public class ArticleDaoImpl extends DaoImpl<Article> {
	
	public ArticleDaoImpl() {
		setInsert("insert article(title,time,content) values(?,?,?)");
		setSelect("select * from article");
		setDel("delete from article where id=?");
		setSelectRow("select count(*) from article");
		setSelectId("select * from article where id=?");
	}
	
	protected Article relToObj(ResultSet rs) throws SQLException {
		Article article = new Article();
		article.setId(rs.getInt(1));
		article.setTitle(rs.getString(2));
		article.setDate(rs.getDate(3));
		article.setContent(rs.getString(4));
		return article;
	}
	
	protected void objToRel(Article t, PreparedStatement pstmt)
			throws SQLException {
		pstmt.setString(1, t.getTitle());
		pstmt.setDate(2, new Date(t.getDate().getTime()));
		pstmt.setString(3, t.getContent());
	}

}
