package model;

import pagingservice.CommonConstants;

public interface StringQuery {
	
	//�뙋留� 臾쇳뭹�젙蹂�
	String SALES_MANAGER = "INSERT INTO Item (ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Category)"
			+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	
	//�쁽�옱 �떆媛꾩젙蹂� 李얘린
	String SYSDATE = "SELECT now() from dual";
	
	//ItemID�쓽 理쒕�媛� 李얘린
	String MAX_ITEMID = "SELECT MAX(ItemID) from Item";

	//�뙋留� 臾쇳뭹�쓣 ID�쑝濡� 李얘린
	String SEARCH_ITEMS_BY_ID = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country,Category FROM Item WHERE ItemID=? ";
	
	//�뙋留� 臾쇳뭹�쓣 NAME�쑝濡� 李얘린
	String SEARCH_NAME = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Category FROM Item WHERE binary Name LIKE ? ";
	
	//Name濡� 寃��깋�븳 臾쇳뭹 �젙蹂�
	String TOTAL_COUNT = "SELECT COUNT(-1) FROM Item where Name LIKE ?";
	
	//�럹�씠吏� 泥섎━�븯�뒗 荑쇰━
	String PAGE_LIST = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Category"
			+ "from Item where name like ? limit ?,"+CommonConstants.CONTENT_NUMBER_PER_PAGE+"";
	//移댄뀒怨좊━ 李얜뒗 荑쇰━
	String CATEGORY_LIST = "SELECT * From Item WHERE Category LIKE ?";
			
	
	//String SEARCH_ITEMID_LIST = "SELECT ItemID, Name, Buy_Price, First_Bid, Started, Ends, SellerID, Description, Location, Country, Latitude, Longitude FROM Item where ItemID like ? LIMIT ?,"+ CommonConstants.CONTENT_NUMBER_PER_PAGE+""; 
	//String SEARCH_NAME_LIST = "SELECT ItemID, Name, Buy_Price, First_Bid, Started, Ends, SellerID, Description, Location, Country, Latitude, Longitude FROM Item where Name like ? LIMIT ?,"+ CommonConstants.CONTENT_NUMBER_PER_PAGE+"";  
	//String SEARCH_BUY_PRICE_LIST = "SELECT ItemID, Name, Buy_Price, First_Bid, Started, Ends, SellerID, Description, Location, Country, Latitude, Longitude FROM Item where Buy_Price like ? LIMIT ?,"+ CommonConstants.CONTENT_NUMBER_PER_PAGE+"";  


}
