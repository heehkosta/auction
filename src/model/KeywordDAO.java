package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class KeywordDAO {
	private DataSource ds;
	private static KeywordDAO dao = new KeywordDAO();
	private KeywordDAO(){
		try{
			InitialContext ic = new InitialContext();
			ds=(DataSource) ic.lookup("java:comp/env/jdbc/mysqlDB");
		}catch(NamingException e){
			e.printStackTrace();
		}
		 
	}
	public static KeywordDAO getInstance(){
		return dao;
	}
	
	//////////////////////공통로직////////////////////////////////////////////////////
	public Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	public void closeAll(PreparedStatement ps,Connection conn) throws SQLException{
		if(ps!=null){
			ps.close();
		}
		if(conn!=null){
			conn.close();
		}
	}

	public void closeAll(ResultSet rs,PreparedStatement ps, Connection conn) throws SQLException{
		if(rs!=null){
			rs.close();
		}
		closeAll(ps, conn);
	}
	
	////////////////////////////////Keyword 로직/////////////////////////////
	
	public void addKeyword (String name) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String searchName = "";
		
		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.SEARCH_BY_NAME_FROM_KEYWORD);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs.next()){
				searchName = rs.getString(1);
			}
			
			if(!searchName.equals(name)){ //입력한 검색어가 디비에 없는경우
				ps = conn.prepareStatement(StringQuery.ADD_BY_KEYWORD_POPULARITY);
				ps.setString(1, name);
				ps.executeUpdate();
			}else{ //입력한 검색어가 디비에 있는경우
				ps = conn.prepareStatement(StringQuery.PLUS_POPULARITY_FROM_KEYWORD);
				ps.setString(1, name);
				ps.executeUpdate();
			}
		}finally{
			closeAll(rs, ps, conn);
		}
	}
}
