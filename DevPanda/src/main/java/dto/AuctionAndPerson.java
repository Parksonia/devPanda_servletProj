package dto;

public class AuctionAndPerson {
	private Integer auctionNum;
	private String id;
	private String title;
	private String startDate;
	private String endDate;
	private String state;
	private Integer startPrice;
	private Integer minSalary;
	private Integer maxSalary;
	private Integer bidMaxPrice;
	private String Occupation;
	private String period;
	private String education;
	private String employmentType;
	private String stack;
	private String Certification;
	private String location;
	private String portfolio;

	private String nickName;
	private String email;
	private String password;
	private String address;
	private String sex;
	private String age;
	private String personImage;
	private String status;

	
	
	
	
	

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
		return Occupation;
	}

	public void setOccupation(String occupation) {
		this.Occupation = occupation;
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
		return Certification;
	}

	public void setCertification(String certification) {
		this.Certification = certification;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPersonImage() {
		return personImage;
	}

	public void setPersonImage(String personImage) {
		this.personImage = personImage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	@Override
	public String toString() {
		return "AuctionAndPerson [auctionNum=" + auctionNum + ", id=" + id + ", title=" + title + ", startDate="
				+ startDate + ", endDate=" + endDate + ", state=" + state + ", startPrice=" + startPrice
				+ ", minSalary=" + minSalary + ", maxSalary=" + maxSalary + ", bidMaxPrice=" + bidMaxPrice
				+ ", occupation=" + Occupation + ", period=" + period + ", education=" + education + ", employmentType="
				+ employmentType + ", stack=" + stack + ", certification=" + Certification + ", location=" + location
				+ ", portfolio=" + portfolio + ", nickName=" + nickName + ", email=" + email + ", password=" + password
				+ ", address=" + address + ", sex=" + sex + ", age=" + age + ", personImage=" + personImage
				+ ", status=" + status + "]";
	}

}
