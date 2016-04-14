package model;

import pagingservice.CommonConstants;

public interface StringQuery {
	
	//판매원 물품정보
	String SALES_MANAGER = "INSERT INTO Item (ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude)"
			+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

	//판매 물품을 ID으로 찾기
	String SEARCH_ITEMS_BY_ID = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude FROM Item WHERE ItemID=? ";
	
	//판매 물품을 NAME으로 찾기
	String SEARCH_NAME = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude FROM Item WHERE Name LIKE ? ";
	
	//Name로 검색한 물품 정보
	String TOTAL_COUNT = "SELECT COUNT(-1) FROM Item where Name LIKE ?";
	
	//페이징 처리하는 쿼리
	String PAGE_LIST = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Latitude, Longitude"
			+ "from Item where name like ? limit ?,"+CommonConstants.CONTENT_NUMBER_PER_PAGE+"";
}
