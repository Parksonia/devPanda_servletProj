package service;

import dto.Auction;
import dto.Person;
import java.util.List;
import java.util.Map;

public interface AuctionService {
	List<Map<String, Object>> getAllAuctionsWithPersonInfo(int page, int pageSize);

	Auction oneAuction(Integer auctionNum) throws Exception;

	String remakeWithComma(List<String> items) throws Exception;

}
