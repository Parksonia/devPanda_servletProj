package service;

import dto.Auction;
import java.util.List;

public interface AuctionService {
	// 페이징 처리된 경매 데이터 가져오기
	List<Auction> getAllAuctions(int page, int pageSize);
	
	Auction oneAuction(Integer auctionNum) throws Exception;
	
	 String remakeWithComma(List<String>items) throws Exception;
}
