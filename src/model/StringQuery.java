package model;

import pagingservice.CommonConstants;

public interface StringQuery {

	////판매 물품 등록//
	String SALES_MANAGER = "INSERT INTO Item (ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Category)"
			+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)";

	//현재 시간정보//
	String SYSDATE = "SELECT now() from dual";

	//ItemID의 최대값 검색//
	String MAX_ITEMID = "SELECT MAX(ItemID) from Item";

	//ID로 상품검색//
	String SEARCH_ITEMS_BY_ID = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country,Category FROM Item WHERE ItemID=? ";

	//NAME으로 상품검색//
	String SEARCH_NAME = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Category FROM Item WHERE binary(Name) LIKE ? ";

	//Name으로 검색한 총 페이지의 수
	String TOTAL_COUNT = "SELECT COUNT(-1) FROM Item where Name LIKE ?";

	//페이징 처리를 위한 쿼리
	String PAGE_LIST = "SELECT ItemID, Name, Buy_Price, "
			+ "First_Bid, Started, Ends, SellerID, Description, "
			+ "Location, Country, Category"
			+ "from Item where name like ? limit ?,"+CommonConstants.CONTENT_NUMBER_PER_PAGE+"";

	//아이템 테이블에서 카테고리로 검색
	String CATEGORY_LIST = "SELECT * From Item WHERE Category LIKE ?";

	//Keyword 테이블에서 Name로 검색
	String SEARCH_BY_NAME_FROM_KEYWORD = "SELECT Name FROM Keyword WHERE Name = ?";

	//Keyword 테이블에 Name과 Popularity 추가
	String ADD_BY_KEYWORD_POPULARITY = "INSERT INTO Keyword (Name, Popularity) values (?,1)";

	//Keyword 테이블에 Name에 따른 Popularity 수치 증가
	String PLUS_POPULARITY_FROM_KEYWORD = "UPDATE Keyword set Popularity=Popularity+1 where Name = ?";


	//Keyword 테이블에서 Popularity로 내림차순 정렬결과 검색
	String POPULARITY_DESC_FROM_KEYWORD = "SELECT Name from Keyword order by Popularity DESC";


	//RATING, REVIEW FEEDBACK쿼리
	String FEEDBACK  = "INSERT INTO FeedBack (TargetName, Rating, Review) values(?,?,?)";

	//Keyword 테이블에서 모든정보 검색
	String SEARCH_ALL_FROM_KEYWORD = "SELECT Name,Popularity FROM Keyword";

	//상품 후기명 정보 가져오기.
	String SEARCH_FEEDBACK = "SELECT * FROM FeedBack";

	//String SEARCH_ITEMID_LIST = "SELECT ItemID, Name, Buy_Price, First_Bid, Started, Ends, SellerID, Description, Location, Country, Latitude, Longitude FROM Item where ItemID like ? LIMIT ?,"+ CommonConstants.CONTENT_NUMBER_PER_PAGE+""; 
	//String SEARCH_NAME_LIST = "SELECT ItemID, Name, Buy_Price, First_Bid, Started, Ends, SellerID, Description, Location, Country, Latitude, Longitude FROM Item where Name like ? LIMIT ?,"+ CommonConstants.CONTENT_NUMBER_PER_PAGE+"";  
	//String SEARCH_BUY_PRICE_LIST = "SELECT ItemID, Name, Buy_Price, First_Bid, Started, Ends, SellerID, Description, Location, Country, Latitude, Longitude FROM Item where Buy_Price like ? LIMIT ?,"+ CommonConstants.CONTENT_NUMBER_PER_PAGE+"";  


}
