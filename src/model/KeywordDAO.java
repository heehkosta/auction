package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	////Keyword 테이블에 검색어를 추가 또는 검색어가 있을경우 횟수를 올려줌
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

	////////////Keyword테이블에서 검색횟수로 내림차순 정렬///////////////////
	public ArrayList<String> descKeyword() throws SQLException{
		ArrayList<String> klist = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.POPULARITY_DESC_FROM_KEYWORD);
			rs = ps.executeQuery();
			while(rs.next()){
				klist.add(rs.getString(1));
			}
		}finally{
			closeAll(rs, ps, conn);
		}

		return klist;
	}

	//////////////////////BestKeyword//////////////////////////////////////////
	public ArrayList<KeywordVO> bestKeyword() throws SQLException{
		ArrayList<KeywordVO> blist = new ArrayList<KeywordVO>();
		ArrayList<KeywordVO> clist = new ArrayList<KeywordVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try{
			conn = getConnection();
			ps = conn.prepareStatement("SELECT Name,Popularity FROM Keyword");
			rs = ps.executeQuery();
			while(rs.next()){
				clist.add(new KeywordVO(rs.getString(1), rs.getInt(2)));
			}
			for(int i =0; i < clist.size(); i++){
				if(clist.get(i).getName().equals("티셔츠")){
					ps = conn.prepareStatement("UPDATE BestKeyword set Popularity=Popularity+1 where Name ='티셔츠'");
					ps.executeUpdate();
				}else if(clist.get(i).getName().equals("티")){
					ps = conn.prepareStatement("UPDATE BestKeyword set Popularity=Popularity+1 where Name ='티셔츠'");
					ps.executeUpdate();
				}else if(clist.get(i).getName().equals("T셔츠")){
					ps = conn.prepareStatement("UPDATE BestKeyword set Popularity=Popularity+1 where Name ='티셔츠'");
					ps.executeUpdate();
				}else if(clist.get(i).getName().equals("T shirt")){
					ps = conn.prepareStatement("UPDATE BestKeyword set Popularity=Popularity+1 where Name ='티셔츠'");
					ps.executeUpdate();
				}
			}
			ps = conn.prepareStatement("SELECT Name,Popularity FROM BestKeyword");
			rs = ps.executeQuery();
			while(rs.next()){
				blist.add(new KeywordVO(rs.getString(1), rs.getInt(2)));
			}
		}finally{
			closeAll(rs, ps, conn);
		}
		return blist;
	}
}








