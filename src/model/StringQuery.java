package model;

public interface StringQuery {
	
	//판매원 물품정보
	String SALES_MANAGER = "INSERT INTO Item (ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude)"
			+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

	//판매 물품을 ID으로 찾기
	String SEARCH_ITEMS = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude FROM Item WHERE ItemID=? ";
	
	//판매 물품을 NAME으로 찾기
	String SEARCH_NAME = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude FROM Item WHERE Name=? ";
	
	//전체 물품 정보
	String TOTAL_COUNT = "SELECT COUNT(-1) FROM Item";

}
