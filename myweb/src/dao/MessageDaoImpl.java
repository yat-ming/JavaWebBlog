package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;



import bean.Message;

public class MessageDaoImpl extends DaoImpl<Message>{
	
	public MessageDaoImpl() {
		setSelect("select * from message");
		setInsert("insert message(name,time,content) values(?,?,?)");
		setDel("delete from message where id=?");
		setSelectRow("select count(*) from message");
	}
	
	protected void objToRel(Message message, PreparedStatement pstmt) throws SQLException {
		pstmt.setString(1, message.getName());
		pstmt.setTimestamp(2, new Timestamp(message.getDatetime().getTime()));
		pstmt.setString(3, message.getContent());
	}
	
	protected Message relToObj(ResultSet rs) throws SQLException{
		Message message = new Message();
		message.setId(rs.getInt(1));
		message.setName(rs.getString(2));
		message.setDatetime(rs.getTimestamp(3));
		message.setContent(rs.getString(4));
		return message;
	}

}
