package model;

public class FeedBackVO {

	private String TargetName;
	private int ItemID;
	private Float Rating;
	private String Review;


	public FeedBackVO() {
		super();
	}

	public FeedBackVO(String targetName, int itemID, Float rating, String review) {
		super();
		TargetName = targetName;
		ItemID = itemID;
		Rating = rating;
		Review = review;
	}

	public String getTargetName() {
		return TargetName;
	}

	public void setTargetName(String targetName) {
		TargetName = targetName;
	}

	public int getItemID() {
		return ItemID;
	}

	public void setItemID(int itemID) {
		ItemID = itemID;
	}


	public Float getRating() {
		return Rating;
	}

	public void setRating(Float rating) {
		Rating = rating;
	}

	public String getReview() {
		return Review;
	}

	public void setReview(String review) {
		Review = review;
	}

	@Override
	public String toString() {
		return "FeedBackVO [TargetName=" + TargetName + ", ItemID=" + ItemID
				+ ", Rating=" + Rating + ", Review=" + Review + "]";
	}


}
