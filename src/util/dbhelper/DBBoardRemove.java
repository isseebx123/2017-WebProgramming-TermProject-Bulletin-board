package util.dbhelper;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DBBoardRemove {
	public static DBBoardRemove dbBoardRemove;
	
	public static DBBoardRemove getDBBoardRemove(){
		if(dbBoardRemove == null){
			dbBoardRemove = new DBBoardRemove();
		}
		return dbBoardRemove;
	}
	
	public boolean excuteRemove(String time){
		Connection conn;
		try {
			conn = DBconn.getConnection();
			Statement st = conn.createStatement();
		    final String SQL = "Delete from Board where time='" + time + "'";
		    st.executeUpdate(SQL);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
