package repository.auction;

import java.util.List;
import java.util.Map;

public interface PersonSellAuctionListRepository {
	
	List<Map> selectPSAuctionList(String sellerId) throws Exception;
	List<Map> selectPSAuctionListByDate(String sellerId, String filterDate) throws Exception;
	List<Map> selectPSAuctionListByDateRange(String sellerId, String startDate, String endDate) throws Exception;
}
