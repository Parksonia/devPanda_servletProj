package repository.auction;

import dto.Auction;
import java.util.List;

public interface AuctionRepository {
	List<Auction> selectAllAuctions(); // 전체 경매 데이터 조회

	List<Auction> getAuctionsWithPagination(int offset, int limit);

}
