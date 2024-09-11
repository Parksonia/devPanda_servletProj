package service;

import java.util.List;
import java.util.Map;

public interface PersonSellAuctionListService {
	List<Map> personSellAuctionList(String sellerId) throws Exception;
	List<Map> personSellAuctionListByDate(String sellerId, String filterDate) throws Exception;
	List<Map> personSellAuctionListByDateRange(String sellerId, String startDate, String endDate) throws Exception;
}
