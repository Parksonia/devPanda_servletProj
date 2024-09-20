package dto;

public class BidAuctionTransactionDto {
	
	
	private String bidNum;
	private String buyerId;
	private String buyPersonId;
	private String auctionNum;
	private String sellerId;
	private String bidDate;
	private String bidPrice;
	private String bidState;
	private String memType;
	private String bidMaxPrice;
	private String date; 			  
	private String price; 			  
	private String state;
	
	public String getBidNum() {
		return bidNum;
	}
	public void setBidNum(String bidNum) {
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
	public String getAuctionNum() {
		return auctionNum;
	}
	public void setAuctionNum(String auctionNum) {
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
	public String getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(String bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getBidState() {
		return bidState;
	}
	public void setBidState(String bidState) {
		this.bidState = bidState;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getBidMaxPrice() {
		return bidMaxPrice;
	}
	public void setBidMaxPrice(String bidMaxPrice) {
		this.bidMaxPrice = bidMaxPrice;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
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
		return "BidAuctionTransactionDto [bidNum=" + bidNum + ", buyerId=" + buyerId + ", buyPersonId=" + buyPersonId
				+ ", auctionNum=" + auctionNum + ", sellerId=" + sellerId + ", bidDate=" + bidDate + ", bidPrice="
				+ bidPrice + ", bidState=" + bidState + ", memType=" + memType + ", bidMaxPrice=" + bidMaxPrice
				+ ", date=" + date + ", price=" + price + ", state=" + state + "]";
	}

	
	
	
	
	
	
	
	
	
	


}
