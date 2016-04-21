package model;

public class ItemVO {
	private int ItemID;
	private String Name;
	private float Buy_Price;
	private float First_Bid;
	private String Started;
	private String Ends;
	private String SellerID;
	private String Description;
	private String Location;
	private String Country;
	private String Category;
		
	public ItemVO() {
		super();
	}

	public ItemVO(int itemID, String name, float buy_Price, float first_Bid,
			String started, String ends, String sellerID, String description,
			String location, String country, String category) {
		super();
		ItemID = itemID;
		Name = name;
		Buy_Price = buy_Price;
		First_Bid = first_Bid;
		Started = started;
		Ends = ends;
		SellerID = sellerID;
		Description = description;
		Location = location;
		Country = country;
		Category = category;
	}

	public int getItemID() {
		return ItemID;
	}

	public void setItemID(int itemID) {
		ItemID = itemID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public float getBuy_Price() {
		return Buy_Price;
	}

	public void setBuy_Price(float buy_Price) {
		Buy_Price = buy_Price;
	}

	public float getFirst_Bid() {
		return First_Bid;
	}

	public void setFirst_Bid(float first_Bid) {
		First_Bid = first_Bid;
	}

	public String getStarted() {
		return Started;
	}

	public void setStarted(String started) {
		Started = started;
	}

	public String getEnds() {
		return Ends;
	}

	public void setEnds(String ends) {
		Ends = ends;
	}

	public String getSellerID() {
		return SellerID;
	}

	public void setSellerID(String sellerID) {
		SellerID = sellerID;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	@Override
	public String toString() {
		return "ItemVO [ItemID=" + ItemID + ", Name=" + Name + ", Buy_Price="
				+ Buy_Price + ", First_Bid=" + First_Bid + ", Started="
				+ Started + ", Ends=" + Ends + ", SellerID=" + SellerID
				+ ", Description=" + Description + ", Location=" + Location
				+ ", Country=" + Country + ", Category=" + Category + "]";
	}
}
