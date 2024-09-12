package dto;

public class BidAuctionTransactionDto {
	
	
	private Long bidNum;
	private String buyerId;
	private String buyPersonId;
	private Long auctionNum;
	private String sellerId;
	private String bidDate;
	private Integer bidPrice;
	private Integer bidState;
	private String memType;
	private Integer bidMaxPrice;
	private Integer transactionNum;   
	private String date; 			  
	private Integer price; 			  
	private String state;
	public Long getBidNum() {
		return bidNum;
	}
	public void setBidNum(Long bidNum) {
		this.bidNum = bidNum;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getBuyPersonId() {
		return buyPersonId;
	}
	public void setBuyPersonId(String buyPersonId) {
		this.buyPersonId = buyPersonId;
	}
	public Long getAuctionNum() {
		return auctionNum;
	}
	public void setAuctionNum(Long auctionNum) {
		this.auctionNum = auctionNum;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getBidDate() {
		return bidDate;
	}
	public void setBidDate(String bidDate) {
		this.bidDate = bidDate;
	}
	public Integer getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(Integer bidPrice) {
		this.bidPrice = bidPrice;
	}
	public Integer getBidState() {
		return bidState;
	}
	public void setBidState(Integer bidState) {
		this.bidState = bidState;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public Integer getBidMaxPrice() {
		return bidMaxPrice;
	}
	public void setBidMaxPrice(Integer bidMaxPrice) {
		this.bidMaxPrice = bidMaxPrice;
	}
	public Integer getTransactionNum() {
		return transactionNum;
	}
	public void setTransactionNum(Integer transactionNum) {
		this.transactionNum = transactionNum;
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
	@Override
	public String toString() {
		return "BIdAuctionTransactionDto [bidNum=" + bidNum + ", buyerId=" + buyerId + ", buyPersonId=" + buyPersonId
				+ ", auctionNum=" + auctionNum + ", sellerId=" + sellerId + ", bidDate=" + bidDate + ", bidPrice="
				+ bidPrice + ", bidState=" + bidState + ", memType=" + memType + ", bidMaxPrice=" + bidMaxPrice
				+ ", transactionNum=" + transactionNum + ", date=" + date + ", price=" + price + ", state=" + state
				+ "]";
	} 			
	
	
	
	
	
	
	
	
	
	
	


}
