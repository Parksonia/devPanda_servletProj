package service;

import java.util.List;
import java.util.Map;

public interface PersonSellTransactionListService {
	
	List<Map> personSellTransactionList(String sellerId) throws Exception;
	List<Map> personSellTransactionListByDate(String sellerId, String filterDate) throws Exception;
	List<Map> personSellTransactionListByDateRange(String sellerId, String startDate, String endDate) throws Exception;
	
}
