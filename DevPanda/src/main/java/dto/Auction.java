package dto;

public class Auction {
	
	private Integer auctionNum;
	private String id;
	private String startDate;
	private String endDate;
	private Integer startPrice;
	private Integer minSalary;
	private Integer maxSalary;
	private Integer bidMaxPrice;
	private String occupation;
	private String period;
	private String education;
	private String employmentType;
	private String stack;
	private String certification;
	private String location;
	private String portfolio;
	private String title;
	private String state; //'processing' or 'success'

	
	
	
	private Person person; // Person 객체와 연관
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	
	
	
	
	public Integer getAuctionNum() {
		return auctionNum;
	}
	public void setAuctionNum(Integer auctionNum) {
		this.auctionNum = auctionNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Integer getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(Integer startPrice) {
		this.startPrice = startPrice;
	}
	public Integer getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(Integer minSalary) {
		this.minSalary = minSalary;
	}
	public Integer getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(Integer maxSalary) {
		this.maxSalary = maxSalary;
	}
	public Integer getBidMaxPrice() {
		return bidMaxPrice;
	}
	public void setBidMaxPrice(Integer bidMaxPrice) {
		this.bidMaxPrice = bidMaxPrice;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getEmploymentType() {
		return employmentType;
	}
	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}
	public String getStack() {
		return stack;
	}
	public void setStack(String stack) {
		this.stack = stack;
	}
	public String getCertification() {
		return certification;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public Auction(Integer auctionNum, String id, String startDate, String endDate, Integer startPrice,
			Integer minSalary, Integer maxSalary, Integer bidMaxPrice, String occupation, String period,
			String education, String employmentType, String stack, String certification, String location,
			String portfolio, String title, String state) {
		super();
		this.auctionNum = auctionNum;
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startPrice = startPrice;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.bidMaxPrice = bidMaxPrice;
		this.occupation = occupation;
		this.period = period;
		this.education = education;
		this.employmentType = employmentType;
		this.stack = stack;
		this.certification = certification;
		this.location = location;
		this.portfolio = portfolio;
		this.title = title;
		this.state = state;
	}
	public Auction() {
		super();
	}
	@Override
	public String toString() {
		return "Auction [auctionNum=" + auctionNum + ", id=" + id + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", startPrice=" + startPrice + ", minSalary=" + minSalary + ", maxSalary=" + maxSalary
				+ ", bidMaxPrice=" + bidMaxPrice + ", occupation=" + occupation + ", period=" + period + ", education="
				+ education + ", employmentType=" + employmentType + ", stack=" + stack + ", certification="
				+ certification + ", location=" + location + ", portfolio=" + portfolio + "]";
	}
	
	public static Auction getAuctionFromBidAuctionTransactionDto(BidAuctionTransactionDto bidAuctionTransactionDto) {
		Auction auction = new Auction();
		auction.setAuctionNum(Integer.parseInt(bidAuctionTransactionDto.getAuctionNum()));
		auction.setBidMaxPrice(Integer.parseInt(bidAuctionTransactionDto.getBidMaxPrice()));
		return auction;
		
	}
	
	

}