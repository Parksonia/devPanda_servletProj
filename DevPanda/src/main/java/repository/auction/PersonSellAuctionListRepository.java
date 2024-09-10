package repository.auction;

import java.util.List;
import java.util.Map;

public interface PersonSellAuctionListRepository {
	
	List<Map> selectPSAuctionList() throws Exception;
	List<Map> selectPSAuctionListByDate(String filterDate) throws Exception;
	List<Map> selectPSAuctionListByDateRange(String startDate, String endDate);
}
