package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class FeedBackDAO {
	private DataSource ds;
	private static FeedBackDAO dao = new FeedBackDAO();
	private FeedBackDAO(){
		try{
			InitialContext ic = new InitialContext();
			ds=(DataSource) ic.lookup("java:comp/env/jdbc/mysqlDB");
		}catch(NamingException e){
			e.printStackTrace();
		}
		 
	}
	public static FeedBackDAO getInstance(){
		return dao;
	}
	
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
	
	public void posting(FeedBackVO vo)throws SQLException{
		Connection conn = null;
		java.sql.PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			//하나의 게시글을 입력하는 쿼리문을 작성...이부분을 메타데이타화
			//properties 파일-> 인터페이스 --> xml --> @annotation
			
			if(vo.getRating()>5){
				System.out.println("5보다 작은 평점을 입력해주세요.");
			}else{
			ps = conn.prepareStatement(StringQuery.FEEDBACK);
			ps.setString(1, vo.getTargetName());
			ps.setFloat(2, vo.getRating());
			ps.setString(3, vo.getReview());
			ps.executeUpdate();
			}
		}finally{
			closeAll(ps, conn);
		}
		
	}
}
