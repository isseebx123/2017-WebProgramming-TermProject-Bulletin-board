package util.dbhelper;

import java.sql.*;

public class DBGalleryLoad {
	public static DBGalleryLoad dbGalleryLoad;

	public static DBGalleryLoad getDBGalleryLoad() {
		if (dbGalleryLoad == null) {
			dbGalleryLoad = new DBGalleryLoad();
		}
		return dbGalleryLoad;
	}

	public String getGalleryRecords(String criteria, String keyword) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		// 单捞磐海捞胶 立加
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebProgrammingTermProject",
				"WebDBID", "qwer1234");

		String query = "select * from upTable";
		if(criteria != null && keyword != null){ 
			query = query + " where " + criteria +" like '%"+ keyword +"%'";
	    }
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);

		StringBuffer buf = new StringBuffer();
		
		while (rs.next()) {
			buf.append("<table>");
			buf.append("<thead>");
			buf.append("<tr>");
			buf.append("	<th>" + rs.getString("title") + "</th>");
			buf.append("</tr>");
			buf.append("</thead>");
			buf.append("<tbody>");
			buf.append("<tr>");
			buf.append("	<td>");
			buf.append("		<img src=/upload/" + rs.getString("upload") + ">");
			buf.append("	</td>");
			buf.append("</tr>");
			buf.append("<tr>");
			buf.append("	<td>" + rs.getString("content") + "</td>");
			buf.append("</tr>");
			buf.append("</tbody>");
			buf.append("</table>");
		}

		rs.close();
		stmt.close();
		conn.close();
		return buf.toString();
	}
}
