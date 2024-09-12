package dto;

public class Bid {
	@Override
	public String toString() {
		return "Bid [bidNum=" + bidNum + ", buyerId=" + buyerId + ", buyPersonId=" + buyPersonId + ", auctionNum="
				+ auctionNum + ", sellerId=" + sellerId + ", bidDate=" + bidDate + ", bidPrice=" + bidPrice
				+ ", bidState=" + bidState + ", memType=" + memType + "]";
	}

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
	
	public static Bid getBidFromBidAuctionTransactionDto(BidAuctionTransactionDto bidAuctionTransactionDto) {
		Bid bid = new Bid();
		
		bid.setBuyerId(bidAuctionTransactionDto.getBuyerId());
		bid.setBuyPersonId(bidAuctionTransactionDto.getBuyPersonId());
		bid.setAuctionNum(Long.parseLong(bidAuctionTransactionDto.getAuctionNum()));
		bid.setSellerId(bidAuctionTransactionDto.getSellerId());
		bid.setBidDate(bidAuctionTransactionDto.getBidDate());
		bid.setBidPrice(Integer.parseInt(bidAuctionTransactionDto.getBidPrice()));
		bid.setBidState(Integer.parseInt(bidAuctionTransactionDto.getBidState()));
		bid.setMemType(bidAuctionTransactionDto.getMemType());
		
		return bid;
	}

	

}
