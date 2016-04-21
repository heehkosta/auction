package model;

import java.io.UnsupportedEncodingException;
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

	//////////////////////////////// 鍮꾩��땲�뒪 濡쒖쭅 ///////////////////////////////////////////

	//////////�뙋留ㅽ븷 寃� 異붽��븯�뒗 濡쒖쭅/////////
	public void addItem(ItemVO vo)
		      throws SQLException{
		      Connection conn =null;
		      PreparedStatement ps = null;
		      ResultSet rs = null;
		      try{
		         conn = getConnection();
		         
		         String nowdate = "";
		         
		         ps = conn.prepareStatement(StringQuery.SYSDATE);
		         rs = ps.executeQuery();
		         while(rs.next()){
		        	 nowdate = rs.getString(1);
		         }
		         
		         int itemID = 0;
		         
		         ps = conn.prepareStatement(StringQuery.MAX_ITEMID);
		         rs = ps.executeQuery();
		         while(rs.next()){
		        	 itemID = rs.getInt(1)+1;
		         }
		         
		         ps = conn.prepareStatement(StringQuery.SALES_MANAGER);
		         ps.setInt(1, itemID);
		         ps.setString(2, vo.getName());
		         ps.setFloat(3, vo.getBuy_Price());
		         ps.setFloat(4, vo.getFirst_Bid());
		         ps.setString(5, nowdate);
		         ps.setString(6, vo.getEnds());
		         ps.setString(7, vo.getSellerID());
		         ps.setString(8, vo.getDescription());
		         ps.setString(9, vo.getLocation());
		         ps.setString(10, vo.getCountry());
		         ps.setString(11, vo.getCategory());
		         
		         int row = ps.executeUpdate();
		         System.out.println(row + " row OK!!");
		      }finally{
		         closeAll(ps, conn);
		         
		      }
		   }

	
	/////////ID濡� 寃��깋////////////
	public ItemVO selectByID(String id) throws SQLException{
		System.out.println("ItemDAO: 73: " + id	);
		ItemVO vo = new ItemVO();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			System.out.println("ItemDAO: 79: " + id	);

			ps = conn.prepareStatement(StringQuery.SEARCH_ITEMS_BY_ID);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
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
						rs.getString("category"));
				
			}
		}finally{
			closeAll(rs, ps, conn);
		}
		return vo;
	}

	
	/////////�긽�뭹 �씠由꾩쑝濡� 寃��깋////////////
	public ArrayList<ItemVO> selectByName(String name) throws SQLException, UnsupportedEncodingException{
		
		/*String nameEncoded = new String(name.getBytes("UTF-8"), "8859_1" );*/
		
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			System.out.println("@ItemDAO:144" + name);
			ps = conn.prepareStatement(StringQuery.SEARCH_NAME);
			ps.setString(1, "%" + name + "%");
			
			System.out.println("ItemDAO: 152" + ps);
			
			rs = ps.executeQuery();
			
			
			while(rs.next()){
					/*System.out.println("ItemDAO:158");
					System.out.println(rs.getString("name"));*/
				
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
						rs.getString("category")));
			}
		}finally{
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
	////name 寃��깋�쑝濡� �뼸�쓣�닔 �엳�뒗 �럹�씠吏� �닔
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
	
	/////////////////////pageNo �뿉 �뵲瑜� �럹�씠吏� �젙蹂�///////////////////////////
	public ArrayList<ItemVO> getPostingList(String pageNo,String name) throws SQLException{
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.PAGE_LIST);
			ps.setString(1, "%" + name + "%");
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
						rs.getString("category")));}
		}finally{
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
    /////////////////////Category�뿉 �뵲瑜� �긽�뭹 �젙蹂�///////////////////////////
	public ArrayList<ItemVO> getCategoryList(String category) throws SQLException{
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = getConnection();
			ps = conn.prepareStatement(StringQuery.CATEGORY_LIST);
			ps.setString(1, category);
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
						rs.getString("category")));}
		}finally{
			closeAll(rs, ps, conn);
		}
		return list;
	}
}

