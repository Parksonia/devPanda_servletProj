package repository.auction;

import dto.Auction;
import java.util.List;
import java.util.Map;

public interface AuctionRepository {
	// 페이징 처리된 경매 데이터 조회
	List<Auction> getAuctionsWithPagination(Map<String, Object> params);
}