package service;

import java.util.List;
import java.util.Map;

public interface PersonSellAuctionListService {
	List<Map> personSellAuctionList() throws Exception;
	List<Map> personSellAuctionListByDate(String filterDate) throws Exception;
	List<Map> personSellAuctionListByDateRange(String startDate, String endDate) throws Exception;
}
