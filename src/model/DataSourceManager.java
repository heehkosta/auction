package model;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.xml.internal.bind.CycleRecoverable.Context;


/*
 * Naming Service를 직접 여기서 구사...
 * SingleTone 방식으로 객체를 생성...
 * --> DataSource를 리턴하면 된다... / DriverManager 방식을 쓰겠다...단위테스트 때문에
 */
public class DataSourceManager {
	private DataSource ds;
	private static DataSourceManager instance = new DataSourceManager();
	private DataSourceManager(){
		try{
			InitialContext ic = new InitialContext();
			ds=(DataSource) ic.lookup("java:comp/env/jdbc/oracleDB");
			System.out.println("DataSource Lookup....");
		}catch(Exception e){
			e.printStackTrace();
		}		
	}//생성자
	
	public static DataSourceManager getInstance(){
		return instance;
	}
	
	public DataSource getConnection(){
		return ds;
	}
}

/*
 * 싱글톤 방법으로 DataSource를 하나 생성하고
 * 생성된 DataSource를 받아오도록 로직을 작성했다....
 */
















