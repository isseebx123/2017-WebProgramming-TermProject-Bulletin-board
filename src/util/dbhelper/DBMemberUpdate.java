package util.dbhelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMemberUpdate {
	public static DBMemberUpdate dbMemberUpdate;
	
	public static DBMemberUpdate getDBMemberUpdate(){
		if(dbMemberUpdate == null){
			dbMemberUpdate = new DBMemberUpdate();
		}
		return dbMemberUpdate;
	}
	
	/**
	 * ȸ�������� DB�� ������Ʈ�ϴ� �޼ҵ�
	 * @param SQL
	 * @param email
	 * @param tel
	 * @param birth
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static void updateMemberInformation(String SQL) throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();

	    st.executeUpdate(SQL);
	}
}
