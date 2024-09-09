package dto;

public class Auction {
	private int auctionNum;
	private String title;
	private int minSalary;
	private int maxSalary;
	private String personImage;
	private String nickName;

	public Auction() {
	}

	public Auction(int auctionNum, String title, int minSalary, int maxSalary, String personImage, String nickName) {
		super();
		this.auctionNum = auctionNum;
		this.title = title;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.personImage = personImage;
		this.nickName = nickName;
	}

	// Getters and Setters
	public int getAuctionNum() {
		return auctionNum;
	}

	public void setAuctionNum(int auctionNum) {
		this.auctionNum = auctionNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMinSalary() {
		return minSalary;
	}

	public void setMinSalary(int minSalary) {
		this.minSalary = minSalary;
	}

	public int getMaxSalary() {
		return maxSalary;
	}

	public void setMaxSalary(int maxSalary) {
		this.maxSalary = maxSalary;
	}

	public String getPersonImage() {
		return personImage;
	}

	public void setPersonImage(String personImage) {
		this.personImage = personImage;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Auction [auctionNum=" + auctionNum + ", title=" + title + ", minSalary=" + minSalary + ", maxSalary="
				+ maxSalary + ", personImage=" + personImage + ", nickName=" + nickName + "]";
	}
}
