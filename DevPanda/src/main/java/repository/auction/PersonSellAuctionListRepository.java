package repository.auction;

import java.util.List;
import java.util.Map;

public interface PersonSellAuctionListRepository {
	
	List<Map> selectPSAuctionList(String sellerId, int limit, int offset) throws Exception;
	List<Map> selectPSAuctionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception;
	List<Map> selectPSAuctionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset) throws Exception;
	int countPSAuctionListBySellerId(String id) throws Exception;
}
