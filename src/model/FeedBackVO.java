package model;

public class FeedBackVO {

	private String TargetName;
	private Float Rating;
	private String Review;
	
	public FeedBackVO() {
		// TODO Auto-generated constructor stub
	}

	public FeedBackVO(String targetName, Float rating, String review) {
		super();

		TargetName = targetName;
		Rating = rating;
		Review = review;
	}
	public String getTargetName() {
		return TargetName;
	}

	public void setTargetName(String targetName) {
		TargetName = targetName;
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
		return "FeedBackVO [TargetName=" + TargetName + ", Rating=" + Rating
				+ ", Review=" + Review + "]";
	}

}
