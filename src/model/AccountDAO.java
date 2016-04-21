package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AccountDAO {
	private static AccountDAO dao=new AccountDAO();
	private DataSource ds;
	
	private AccountDAO(){
		
		try{
			//DataSource瑜� 李얜뒗�떎...
			Context ic = new InitialContext();
			ds=(DataSource)ic.lookup("java:comp/env/jdbc/mysqlDB");
			System.out.println("DataSource Lookup......");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	public static AccountDAO getInstance(){
		return dao;
	}
	private Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}

	public void registerMember(AccountVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection();
			String sql="INSERT INTO Account VALUES(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getUserID());
			pstmt.setString(2,vo.getName());
			pstmt.setString(3,vo.getPassword());
			pstmt.setString(4,vo.getCreditCardNumber());
			pstmt.setString(5,vo.getExpiration());
			pstmt.setString(6,vo.getCsv());
			pstmt.setString(7,vo.getCardType());
					
			int result=pstmt.executeUpdate();
			System.out.println("insert ok.."+result);
		}finally{
			closeAll(pstmt,con);
		}
	}


	public AccountVO login(String userID,String password) throws SQLException{
		AccountVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql=
		   "SELECT Password, CreditCardNumber, Expiration, Csv, CardType FROM Account WHERE UserID=? and Password=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,userID);
			pstmt.setString(2,password);
			rs=pstmt.executeQuery();
			if(rs.next()){
				vo=new AccountVO(userID,password,rs.getString(1),rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5));
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return vo;
	}
	
	public ArrayList<AccountVO> getAllMember() throws SQLException{
		ArrayList<AccountVO> list=new ArrayList<AccountVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select * from Account";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				list.add(new AccountVO(rs.getString(1),rs.getString(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getString(7)));
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	//true媛� 由ы꽩�릺硫�...�빐�떦 id媛믪씠 �씠誘� �뵒鍮꾩뿉 ���옣�릺�뼱 �엳�쓬�쓣 �쓽誘�
	//true�씪�븣�뒗 id 以묐났..洹� �븘�씠�뵒瑜� �궗�슜�븷�닔 �뾾�룄濡� �쑀�룄...checkId() �옄諛붿뒪�겕由쏀듃�뿉�꽌
	public boolean isExist(String userID) throws SQLException{
		boolean result=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="SELECT count(*) from Account where UserID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			if(rs.next()){				
				if(rs.getInt(1)>0)
					result=true;
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return result;
	}
	public void updateAccount(AccountVO vo) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			
			System.out.println(vo);
			con=getConnection();
			String sql="UPDATE Account SET Name=?, Password=?, CreditCardNumber=?, Expiration=?, CSV=?, CardType=?  where UserID=?";
			pstmt=con.prepareStatement(sql);
	
			pstmt.setString(1,vo.getName());
			pstmt.setString(2,vo.getPassword());
			pstmt.setString(3,vo.getCreditCardNumber());
			pstmt.setString(4,vo.getExpiration());
			pstmt.setString(5,vo.getCsv());
			pstmt.setString(6,vo.getCardType());
			pstmt.setString(7,vo.getUserID());
			
			int result=pstmt.executeUpdate();
			System.out.println("update ok.."+result);
		}finally{
			closeAll(pstmt,con);
		}
		
	}
	
	// for debugging purpose
/*	public static void main(String[] args) throws SQLException, ClassNotFoundException{
	
		
		
		final String DRIVER_NAME = "com.mysql.jdbc.Driver";
		final String URL = "jdbc:mysql://cswiki.net:3306/auction";
		Class.forName(DRIVER_NAME);
		Connection conn = DriverManager.getConnection(URL,"user","my_password");
		
		System.out.println(conn);
		System.out.println("db server connection....");
		
		String insertSql = "INSERT INTO Account VALUES (300,'Joe','1111Joe','1234123412341234',20171010,'789', 'AMERICAN EXPRESS')";
		PreparedStatement ps = conn.prepareStatement(insertSql);
		ps.execute();
		
		
		
		
		
		String selectSql = "SELECT * from Account";
		PreparedStatement ps2 = conn.prepareStatement(selectSql);
		ResultSet rs = ps2.executeQuery();
		while(rs.next()){	
			System.out.println(rs.getString("Name"));
		}
		
	}
	*/
	
}

















