package dto;

public class Bid {
	private Long bidNum;
	private String buyerId;
	private String buyPersonId;
	private Long auctionNum;
	private String sellerId;
	private String bidDate;
	private Integer bidPrice;
	private Integer bidState;
	private String memType;
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
	
	

	

}
