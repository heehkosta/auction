package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.sun.xml.internal.bind.CycleRecoverable.Context;

public class ItemDAO {
	private DataSource ds;
	private static ItemDAO dao = new ItemDAO();
	private ItemDAO(){
		try{
			InitialContext ic = new InitialContext();
			ds=(DataSource) ic.lookup("java:comp/env/jdbc/mysqlDB");
		}catch(NamingException e){
			e.printStackTrace();
		}
		
	}
	public static ItemDAO getInstance(){
		return dao;
	}

	///////////////////////////////////////////////////////////////////////////////////////

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

	//////////////////////////////// 비지니스 로직 ///////////////////////////////////////////

	//////////판매할 것 추가하는 로직/////////
	public void addItem(String name, int price) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;

		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.SALES_MANAGER);


		}finally{
			closeAll( ps, conn);
		}

	}

	
	/////////ID로 검색////////////
	public ItemVO selectByID(String id) throws SQLException{
		ItemVO vo = new ItemVO();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			System.out.println("연결");
			ps = conn.prepareStatement(StringQuery.SEARCH_ITEMS_BY_ID);
			ps.setString(1, "id");
			rs = ps.executeQuery();
			if(rs.next()){
				vo =new ItemVO(rs.getInt("itemID"),
						rs.getString("name"), 
						rs.getFloat("buy_Price"),
						rs.getFloat("first_Bid"), 
						rs.getString("started"), 
						rs.getString("ends"), 
						rs.getString("sellerID"), 
						rs.getString("description"), 
						rs.getString("location"),
						rs.getString("country"), 
						rs.getDouble("latitude"),
						rs.getDouble("longitude"));
			}
		}finally{
			closeAll(rs, ps, conn);
		}
		return vo;
	}

	
	
	
	
	
	
	
	
	/////////상품 이름으로 검색////////////
	public ArrayList<ItemVO> selectByName(String name) throws SQLException{
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			System.out.println("연결");
			ps = conn.prepareStatement(StringQuery.SEARCH_NAME);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();
			while(rs.next()){
				list.add(new ItemVO(rs.getInt("itemID"),
						rs.getString("name"), 
						rs.getFloat("buy_Price"),
						rs.getFloat("first_Bid"), 
						rs.getString("started"), 
						rs.getString("ends"), 
						rs.getString("sellerID"), 
						rs.getString("description"), 
						rs.getString("location"),
						rs.getString("country"), 
						rs.getDouble("latitude"),
						rs.getDouble("longitude")));
			}
		}finally{
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
	////name 검색으로 얻을수 있는 페이지 수
	public int getTotalPostingCount(String name) throws SQLException{
		int count = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.TOTAL_COUNT);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		}finally{
			closeAll(rs, ps, conn);
		}
		return count;
	}
	
	/////pageNo 에 따른 페이지 정보///////////
	public ArrayList<ItemVO> getPostingList(String pageNo,String name) throws SQLException{
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.PAGE_LIST);
			ps.setString(1, name);
			ps.setString(2, pageNo);
			rs = ps.executeQuery();
			
			while(rs.next()){
				list.add(new ItemVO(rs.getInt("itemID"),
						rs.getString("name"), 
						rs.getFloat("buy_Price"),
						rs.getFloat("first_Bid"), 
						rs.getString("started"), 
						rs.getString("ends"), 
						rs.getString("sellerID"), 
						rs.getString("description"), 
						rs.getString("location"),
						rs.getString("country"), 
						rs.getDouble("latitude"),
						rs.getDouble("longitude")));}
		}finally{
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
	public static void main(String[] args) throws SQLException {
		ItemDAO.getInstance().getPostingList("1", "bat");
	}
}








