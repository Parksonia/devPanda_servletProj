package repository.auction;

import dto.Auction;
import dto.Person;
import java.util.List;
import java.util.Map;

public interface AuctionRepository {
	 List<Map<String, Object>> getAuctionsWithPersonInfo(int pageSize, int offset);

	
	// 개인 옥션정보 상세보기 조회
	Auction selectOneAuction(Integer auctionNum) throws Exception;
}