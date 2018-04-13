package util.dbhelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMemberLoad {
	public static DBMemberLoad dbMemberLoad;
	
	public static DBMemberLoad getDBMemberLoad(){
		if(dbMemberLoad == null){
			dbMemberLoad = new DBMemberLoad();
		}
		return dbMemberLoad;
	}
	
	/**
	 * board���̺��� �ش��ϴ� board�� entrys�� �а�, �±׸� ��Ʈ������ �����Ͽ� �����ϴ� �޼ҵ�
	 * @param boardName
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public String getMemberRecord(String id) throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from Member where id='" + id + "'";
	    ResultSet rs = st.executeQuery(sql);
	    StringBuffer buf = new StringBuffer();
	    if(rs.next()){ //�˻��� ����� �����ϸ� true
	    	String NAME 		= rs.getString("name");
	    	String EMAIL		= rs.getString("email");
	    	String TEL			= rs.getString("tel");
	    	String BIRTH		= rs.getString("birth");
	        buf.append("<tr>");
	        buf.append("<td>�̸�</td>");
	        buf.append("<td>" + NAME + "</td>");
	        buf.append("</tr>");
	        
	        buf.append("<tr>");
	        buf.append("<td>�̸���</td>");
	        buf.append("<td><input name='email' id='email' type='email' value='"+ EMAIL +"'></td>");
	        buf.append("</tr>");
	        
	        buf.append("<tr>");
	        buf.append("<td>��ȭ��ȣ</td>");
	        buf.append("<td><input name='tel' id='tel' type='tel' value='"+ TEL +"' placeholder='ex)01(0)-000(0)-0000' onchange='isTelephoneValidate()'></td>");
	        buf.append("</tr>");
	        
	        buf.append("<tr>");
	        buf.append("<td>�������</td>");
	        buf.append("<td><input name='birth' id='birth' type='date' value='"+ BIRTH +"' onchange='isEmailValidate()'></td>");
	        
	        buf.append("</tr>");
	    }
		return buf.toString();
	}
}
