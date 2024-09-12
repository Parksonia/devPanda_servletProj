package dto;

public class Transaction {
	
	private Integer transactionNum;   //auto_increment
	private String sellerId;		  //판매자ID (person table)
	private Integer auctionNum;       //(auction table)
	private Integer bidNum;           //(bid table)
	private String buyerId;           //(person table or company table)
	private String date; 			  //낙찰일
	private Integer price; 			  //낙찰액
	private String state; 			  //계약상태 (i : ing (계약서 검토중) f : finished (계약완료))
	private String memType;    		  //buyerId가 (person 인지 company인지)
	
	//TO-DO
	Auction auction;
	Person person;
	Company company;
	
	
	public Integer getTransactionNum() {
		return transactionNum;
	}
	public void setTransactionNum(Integer transactionNum) {
		this.transactionNum = transactionNum;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public Integer getAuctionNum() {
		return auctionNum;
	}
	public void setAuctionNum(Integer auctionNum) {
		this.auctionNum = auctionNum;
	}
	public Integer getBidNum() {
		return bidNum;
	}
	public void setBidNum(Integer bidNum) {
		this.bidNum = bidNum;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	
	public Auction getAuction() {
		return auction;
	}
	public void setAuction(Auction auction) {
		this.auction = auction;
	}
	
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	
	
	public Transaction(Integer transactionNum, String sellerId, Integer auctionNum, Integer bidNum, String buyerId,
			String date, Integer price, String state, String memType, Auction auction, Person person, Company company) {
		super();
		this.transactionNum = transactionNum;
		this.sellerId = sellerId;
		this.auctionNum = auctionNum;
		this.bidNum = bidNum;
		this.buyerId = buyerId;
		this.date = date;
		this.price = price;
		this.state = state;
		this.memType = memType;
		this.auction = auction;
		this.person = person;
		this.company = company;
	}
	public Transaction() {
		super();
	}
	
	@Override
	public String toString() {
		return "Transaction [transactionNum=" + transactionNum + ", sellerId=" + sellerId + ", auctionNum=" + auctionNum
				+ ", bidNum=" + bidNum + ", buyerId=" + buyerId + ", date=" + date + ", price=" + price + ", state="
				+ state + ", memType=" + memType + "]";
	}
	
	
	public static Transaction getAuctionFromBidAuctionTransactionDto(BidAuctionTransactionDto bidAuctionTransactionDto,Bid bid) {
		Transaction transaction = new Transaction();
		
		transaction.setSellerId(bidAuctionTransactionDto.getSellerId());
		transaction.setAuctionNum(Integer.parseInt(bidAuctionTransactionDto.getAuctionNum()));
		transaction.setBidNum(Long.valueOf(bid.getBidNum()).intValue());
		if(bidAuctionTransactionDto.getBuyerId() != null) {
			transaction.setBuyerId(bidAuctionTransactionDto.getBuyerId());
		}
		if(bidAuctionTransactionDto.getBuyPersonId() != null) {
			transaction.setBuyerId(bidAuctionTransactionDto.getBuyPersonId());
		}
		
		transaction.setDate(bidAuctionTransactionDto.getDate());
		transaction.setPrice(Integer.parseInt(bidAuctionTransactionDto.getPrice()));
		transaction.setState(bidAuctionTransactionDto.getState());
		transaction.setMemType(bidAuctionTransactionDto.getMemType());
		return transaction;
		
	}
	
	
	
}
