package util.dbhelper;
import util.dbhelper.DBconn;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import java.sql.Connection;

public class DBBoardLoad {
	public static DBBoardLoad dbBoardLoad;
	
	public static DBBoardLoad getDBBoardLoad(){
		if(dbBoardLoad == null){
			dbBoardLoad = new DBBoardLoad();
		}
		return dbBoardLoad;
	}
	
	/**
	 * board테이블에서 해당하는 board의 entrys를 읽고, 태그를 스트링으로 생성하여 리턴하는 메소드
	 * @param boardName
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public String getBoardRecordsWithCriteriaAndKeyword(String boardName, String criteria, String keyword) throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from Board where boardname='" + boardName + "'";
	    boolean isSearch = false;
	    /* 검색의 경우 sql 추가 */
	    if(criteria != null && keyword != null){ 
	    	sql = sql + "and " + criteria +" like '%"+ keyword +"%'";
	    	isSearch = true;
	    }
	    sql += " order by time DESC";
	    ResultSet rs = st.executeQuery(sql);
	    StringBuffer buf = new StringBuffer();
	    while(rs.next()){ //검색된 결과가 존재하면 true
	    	String TIME 		= rs.getString("time");
	    	String ID			= rs.getString("host");
	    	if(isSearch && criteria.equals("host") && boardName.equals("AnonymousBoard")) continue; //익명게시판은 호스트 기준으로 검색되면 안되므로 스킵함
	    	if(boardName.equals("AnonymousBoard"))	ID = "Anonymous"; //익명게시판이면 작성자를 Anonymous로 함
	    	String TITLE		= rs.getString("title");
	    	String CONTENT		= rs.getString("content");
	    	String FILE			= rs.getString("file");
	        buf.append("<tr>");
	        buf.append("<td class='td1'><a href='./TP2_08_LookStory.jsp?time="+TIME+"&boardname="+boardName
	        		+"&id="+ID+"'>"+TITLE+"</a></td>");
	        buf.append("<td class='td2'>" + ID + "</td>");
	        buf.append("<td class='td3'>" + TIME + "</td>");
	        buf.append("</tr>");
	    }
		return buf.toString();
	}
	
	/**
	 * board테이블에서 해당하는 time의 entry를 읽고, 태그를 결과 정보를 ResultSet을 리턴하는 메소드
	 * @param time
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public ResultSet getStoryRecord(String time) throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from board where time='" + time + "'";
	    ResultSet rs = st.executeQuery(sql);
	    return rs;	    
	}
	
	/**
	 * 해당글의 호스트가 맞는지 확인하는 메소드
	 * @param time
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isHost(String time, String id) throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from board where time='" + time + "'";
	    ResultSet rs = st.executeQuery(sql);
	    String hostId = "";
	    boolean result = false;
	    
	    if(rs.next()){
	    	hostId = rs.getString("host");
	    	if(id == null) result = false;
	    	else if(id.equals(hostId))	result = true;
	    }
	    return result;
	}
	
	public String[] getAllBoardRecordsWithLimits() throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    final int LIMITS = 5;
	    List<String> boardNames = Arrays.asList("AnonymousBoard", "FreeBoard");
	    String[] result = new String[boardNames.size()+1];
	    
	    int index = 0;
	    for(String boardname : boardNames){
	    	String sql = "Select * from Board where boardname='" + boardname + "' order by time DESC limit "+LIMITS;
		    ResultSet rs = st.executeQuery(sql);
		    StringBuffer buf = new StringBuffer();
		    while(rs.next()){ //검색된 결과가 존재하면 true
		    	String TIME 		= rs.getString("time");
		    	String ID			= rs.getString("host");
		    	if(boardname.equals("AnonymousBoard"))	ID = "Anonymous"; //익명게시판이면 작성자를 Anonymous로 함
		    	String TITLE		= rs.getString("title");
		    	String CONTENT		= rs.getString("content");
		    	String FILE			= rs.getString("file");
		    	
		        buf.append("<tr>");
		        buf.append("<td>" + ID + "</td>");
		        buf.append("<td><a href='./TP2_08_LookStory.jsp?time="+TIME+"&boardname="+boardname
		        		+"&id="+ID+"'>"+TITLE+"</a></td>");
		        buf.append("</tr>");
		    }
		    result[index] = buf.toString();
		    index ++;
	    }
	    
	    final int GALLERYLIMITS = 4;
	    String GallerySQL = "select * from upTable limit "+GALLERYLIMITS;
	    ResultSet rs = st.executeQuery(GallerySQL);
	    StringBuffer buf = new StringBuffer();
	    while(rs.next()){
	    	buf.append("<img src=/upload/" + rs.getString("upload") + ">");
	    }
	    result[index] = buf.toString();
	    
		return result; 
	}
	
	/**
	 * 기준과 키워드를 이용하여 board테이블에서 알맞은 record를 가져오는 메소드
	 * @param criteria
	 * @param keyword
	 * @return
	 */
	public String getBoardRecordsWithCriteriaAndKeyword(String criteria, String keyword) throws ClassNotFoundException, SQLException{
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from Board where "+ criteria +" like '%"+ keyword +"%' order by time DESC";
	    ResultSet rs = st.executeQuery(sql);
	    StringBuffer buf = new StringBuffer();
	    while(rs.next()){ //검색된 결과가 존재하면 true
	    	String TIME 		= rs.getString("time");
	    	String ID			= rs.getString("host");
	    	String boardName	= rs.getString("boardName");
	    	if(criteria.equals("host") && boardName.equals("AnonymousBoard")) continue; //익명게시판은 호스트 기준으로 검색되면 안되므로 스킵함
	    	if(boardName.equals("AnonymousBoard"))	ID = "Anonymous"; //익명게시판이면 작성자를 Anonymous로 함
	    	String TITLE		= rs.getString("title");
	    	String CONTENT		= rs.getString("content");
	    	String FILE			= rs.getString("file");
	        buf.append("<tr>");
	        buf.append("<td class='td1'><a href='./TP2_08_LookStory.jsp?time="+TIME+"&boardname="+boardName
	        		+"&id="+ID+"'>"+TITLE+"</a></td>");
	        buf.append("<td class='td2'>" + ID + "</td>");
	        buf.append("<td class='td3'>" + TIME + "</td>");
	        buf.append("</tr>");
	    }
		return buf.toString();
	}
}
