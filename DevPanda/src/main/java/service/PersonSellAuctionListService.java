package service;

import java.util.List;
import java.util.Map;

public interface PersonSellAuctionListService {
	List<Map> personSellAuctionList(String sellerId, int limit, int offset) throws Exception;
	List<Map> personSellAuctionListByDate(String sellerId, String filterDate, int limit, int offset) throws Exception;
	List<Map> personSellAuctionListByDateRange(String sellerId, String startDate, String endDate, int limit, int offset) throws Exception;
	int countPSAuctionListBySellerId(String id) throws Exception;
}
