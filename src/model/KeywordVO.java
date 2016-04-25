package model;

public class KeywordVO {
	private String name;
	private int popularity;
	
	public KeywordVO(String name, int popularity) {
		super();
		this.name = name;
		this.popularity = popularity;
	}

	public KeywordVO() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPopularity() {
		return popularity;
	}

	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}

	@Override
	public String toString() {
		return "KeywordVO [name=" + name + ", popularity=" + popularity + "]";
	}
	
}
